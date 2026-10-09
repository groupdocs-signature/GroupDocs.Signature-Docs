---
id: signing-documents-linux-container-fonts
url: /signature/net/use-cases/signing-documents-linux-container-fonts/
title: "Signing Documents in a Linux Container with .NET: Integration Guide"
weight: 1
description: "Make GroupDocs.Signature work inside a Linux container: which base images ship fonts, why a missing family fails instead of falling back, how to resolve a family at run time, and the Dockerfile layer that fixes it."
keywords: linux, sign, documents, pdf, docker, fonts, groupdocs signature, dotnet, container, font resolution
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[sign-pdf-in-linux-container-fonts-dotnet](https://github.com/groupdocs-signature/sign-pdf-in-linux-container-fonts-dotnet)
{{< /alert >}}

## Overview

Container font provisioning is a GroupDocs.Signature requirement for .NET that decides whether text signatures in PDF documents work at all once your service leaves a developer machine. The library looks a font family up by its name: naming one that is not installed raises `Sign document error: Font <name> was not found` and no document is written. The Microsoft core families are the exception. When Arial, Times New Roman or Courier New is missing, an installed Liberation or DejaVu font takes its place, and a warning in the log names it. Omitting `SignatureFont` asks for the default, Times New Roman, so it works once Liberation or DejaVu is installed, and fails on an image without fonts.

{{< alert style="warning" >}}
GroupDocs.Signature for .NET 26.9 and earlier made no exception for the Microsoft core families. The defaults, Times New Roman for text signatures and Arial for the appearance of digital signatures, had to be installed under those names, for example with `ttf-mscorefonts-installer`; Liberation and DejaVu did not stand in for them. With these versions, set `SignatureFont.FamilyName` (and `PdfDigitalSignatureAppearance.FontFamilyName` for digital signatures) to a family that is installed.
{{< /alert >}}

That matters because base images are not desktops. Measured on the images this guide's sample runs in: `mcr.microsoft.com/dotnet/runtime:8.0` ships **zero** font files, `eclipse-temurin:17-jre` ships 8 (DejaVu), `node:18-bookworm` ships 6, and `python:3.11-slim` ships zero. On the .NET runtime image, a text signature therefore fails outright until you add a font layer. There is no code-level workaround.

This guide covers the integration side of that: what to install, how to pick a family at run time instead of hard-coding one, how to degrade when a script has no font, and how to prove the result rather than assume it.

## Quickstart

**Step 1: add the package**

```bash
dotnet add package GroupDocs.Signature --version 26.6.0
```

**Step 2: add the font layer to your image**

This is the part that is not optional on a .NET runtime image:

```dockerfile
RUN apt-get update && apt-get install -y --no-install-recommends \
        fontconfig \
        fonts-dejavu-core \
        fonts-liberation \
        fonts-noto-cjk \
    && fc-cache -f \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
```

**Step 3: sign with a family you resolved, not one you assumed**

```csharp
var options = new TextSignOptions(text)
{
    Left = 50,
    Top = top,
    Width = 280,
    Height = 40,
};

if (familyName is not null)
{
    options.Font = new SignatureFont { FamilyName = familyName, Size = 16 };
}

return options;
```

Run the same image twice, once with the font layer and once without, and compare the log. The sample repository ships both Dockerfiles for exactly that reason.

## Prerequisites

The sample targets `net8.0` and runs on `mcr.microsoft.com/dotnet/runtime:8.0`, with GroupDocs.Signature 26.6.0 or later. A licence is optional for following along: without one the run still signs, in evaluation mode, and adds trial text to the page.

## Core Concepts

A **family name** is what `SignatureFont.FamilyName` takes, and it is not the file name. Debian's `fonts-noto-cjk` package installs `NotoSansCJK-Regular.ttc`, whose family is `Noto Sans CJK JP`. Detecting fonts by scanning `/usr/share/fonts` for file names therefore both misses fonts that are present and reports families that will not resolve.

**Resolution by probing** is the portable alternative: attempt a throwaway signature per candidate family and keep the first that does not throw. It asks the library the same question the real call will ask, so the answer cannot be wrong for the reason above.

**Two failure classes** need different handling. No Latin font at all means the image cannot sign, which is fatal. No CJK font means non-Latin text cannot be embedded, which is a skip plus a warning, not a crash.

### Which fonts do I actually need to install?

One is the minimum: `fonts-dejavu-core` makes Latin, Greek and Cyrillic signing work. Add `fonts-liberation` when your signatures use Arial, Times New Roman or Courier New, the defaults included: for a missing Microsoft core family the library takes Liberation Sans, Liberation Serif or Liberation Mono, which keep the text widths of the originals, and falls back to DejaVu, which does not. In 26.9 and earlier these names resolved only when the Microsoft fonts themselves were installed, for example with `ttf-mscorefonts-installer`. Add `fonts-noto-cjk` for Chinese, Japanese or Korean text. Install `fontconfig` alongside them for the resolver itself and for `fc-list` when debugging.

## Integration Patterns

### Pattern 1: Inventory first, resolve second

Log what the image has before asking for anything. The inventory turns "font not found" into a diagnosis, because a count of zero and a count of 24 point at completely different fixes. The scan deliberately avoids `System.Drawing`: `System.Drawing.Common` is Windows-only from .NET 7 onward and throws on Linux, which is its own common container failure.

```csharp
string home = Environment.GetFolderPath(Environment.SpecialFolder.UserProfile);
string[] roots =
{
    "/usr/share/fonts",
    "/usr/local/share/fonts",
    Path.Combine(home, ".fonts"),
    Path.Combine(home, ".local/share/fonts"),
    Environment.GetFolderPath(Environment.SpecialFolder.Fonts),
    "/System/Library/Fonts",
    "/Library/Fonts",
};
```

Resolution then walks a candidate list, most portable first, and returns `null` when nothing works:

```csharp
foreach (string candidate in candidates)
{
    if (TryFamily(sourcePath, candidate).Ok)
    {
        return candidate;
    }
}

return null;
```

The sample uses `DejaVu Sans`, `Liberation Sans`, `Arial`, `Verdana` for Latin and puts `Noto Sans CJK JP` first for CJK, so a container resolves on the first probe and a Windows developer box falls through to `Arial`.

### Pattern 2: Probe with a throwaway signature

The probe is a real `Sign` call into a temporary file, which is why its answer is trustworthy. The scratch file is always deleted, so probing never touches your output directory.

```csharp
string scratch = Path.Combine(Path.GetTempPath(), $"gd-font-probe-{Guid.NewGuid():N}.pdf");
try
{
    using var signature = new Signature(sourcePath);
    var options = new TextSignOptions("probe")
    {
        Left = 10,
        Top = 10,
        Width = 60,
        Height = 20,
        Font = new SignatureFont { FamilyName = familyName, Size = 10 },
    };

    signature.Sign(scratch, options);
    return (true, "ok");
}
```

The catch narrows to the library's own exception and returns the message instead of rethrowing, which is what lets the caller print the real reason:

```csharp
catch (GroupDocsSignatureException ex)
{
    return (false, ex.Message);
}
finally
{
    if (File.Exists(scratch))
    {
        File.Delete(scratch);
    }
}
```

Do this once at startup and cache the result. Probing per request costs one PDF write per candidate.

### Pattern 3: Sign what you can, verify what you signed

Both signatures go through a single `Sign` call, and the CJK one is added only when a CJK family resolved:

```csharp
using var signature = new Signature(sourcePath);

var options = new List<SignOptions>
{
    BuildTextOptions(LatinText, latinFamily, top: 50),
};

if (cjkFamily is not null)
{
    options.Add(BuildTextOptions(CjkText, cjkFamily, top: 120));
}

SignResult result = signature.Sign(outputPath, options);
return result.Succeeded.Count;
```

Then read the file back. Rendering CJK as empty boxes is not an exception, so the search is the only step that distinguishes a real signature from a visually broken one:

```csharp
using var signature = new Signature(signedPath);

var options = new TextSearchOptions { AllPages = true };
List<TextSignature> found = signature.Search<TextSignature>(options);
```

## Error Handling

| Symptom | Cause | Fix |
|---|---|---|
| `Sign document error: Font <name> was not found` | family not installed in the image | install the font layer; resolve the family at run time instead of hard-coding |
| Same error with no font set | the default, Times New Roman, is absent and no Liberation or DejaVu font is installed to take its place | install `fonts-dejavu-core` or `fonts-liberation`; with 26.9 and earlier, which required Times New Roman itself, also set `SignatureFont.FamilyName` to an installed family |
| `Sign document error: Font Arial was not found` when signing a PDF digitally | the appearance font, Arial by default, is absent; in 26.9 and earlier also for an invisible signature | install `fonts-dejavu-core` or `fonts-liberation`; with 26.9 and earlier, set `PdfDigitalSignatureAppearance.FontFamilyName` to an installed family |
| Warning `Font Arial was not found; Liberation Sans is used instead.` in the log | a Microsoft core family is absent and an installed font took its place | nothing to fix; install `ttf-mscorefonts-installer` if the signature must use the original font |
| `CultureNotFoundException: ... en-US is an invalid culture identifier` | `InvariantGlobalization=true` in the csproj | keep globalization on and install ICU in the image; `SignatureSettings` builds `CultureInfo("en-US")` |
| CJK signature written but shows as boxes | Latin font resolved, CJK font missing | install `fonts-noto-cjk` and check the read-back, not the return value |

Treat a fatal font failure as an exit code, not a warning. The sample catches `GroupDocsSignatureException` around the real signing call, prints the minimum fix (`apt-get install -y fonts-dejavu-core`), and returns 3.

## Production Readiness Checklist

- [ ] The runtime image installs at least `fontconfig` and `fonts-dejavu-core`
- [ ] Font resolution runs once at startup, logs the resolved families, and fails the container when no Latin family resolves
- [ ] Non-Latin text has `fonts-noto-cjk` installed and the read-back is asserted
- [ ] `InvariantGlobalization` is not set to true, and the licence is mounted rather than baked in

## Frequently Asked Questions

**Q: Can I ship a font file with the application instead of installing packages?**
A: You can put font files in a directory the image reads, but the family still has to resolve through the platform, so `fc-cache` and a font directory the resolver knows about are what make it work. Installing the Debian packages is simply the shortest path to that.

**Q: Why probe at all, when I know which fonts my Dockerfile installs?**
A: Because the same code also runs on a developer machine, in CI, and on the next base image someone bumps. I kept a hard-coded `DejaVu Sans` for a while and it worked until a colleague ran the same service on Windows, where that family is not installed and the run died at the first signature.

**Q: Does this apply to image and barcode signatures too?**
A: No. The font requirement is specific to text-based signatures, which is where a family name is resolved. Image, barcode and QR signatures do not need a font installed, though a stamp signature with a text label does, and so does a visible digital signature in a PDF document, whose appearance prints its labels in Arial by default.

## Conclusion

Install one font at minimum, resolve the family by asking the library, skip what cannot be embedded, and read the result back before calling the job successful. The sample repository builds both images so the difference is reproducible in two commands rather than a claim in a document.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/signing-documents-linux-container-fonts-net/) - the fontless image walkthrough and the packages that fix it
- [Signing documents](https://docs.groupdocs.com/signature/net/signing/) - the full option surface behind `TextSignOptions` and `SignatureFont`
- [Searching for signatures](https://docs.groupdocs.com/signature/net/searching/) - reference for the read-back step
- [System requirements](https://docs.groupdocs.com/signature/net/system-requirements/) - supported runtimes and Linux notes
- [Product documentation](https://docs.groupdocs.com/signature/net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/net/) - full API details for GroupDocs.Signature for .NET
