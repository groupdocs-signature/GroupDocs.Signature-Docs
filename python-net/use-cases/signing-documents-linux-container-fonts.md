---
id: signing-documents-linux-container-fonts
url: /signature/python-net/use-cases/signing-documents-linux-container-fonts/
title: How to Sign PDFs in a Linux Container with Python - 4 Practical Tutorials
weight: 1
description: "Four tutorials for signing PDFs from Python inside a Linux container with GroupDocs.Signature: provisioning fonts and .NET dependencies, probing families, signing Latin and CJK text, and verifying the result."
keywords: linux, sign, documents, pdf, docker, fonts, groupdocs signature, python via net, container, tutorial
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[python-linux-container-pdf-signing](https://github.com/groupdocs-signature/python-linux-container-pdf-signing)
{{< /alert >}}

## Getting Started

Container font provisioning is a GroupDocs.Signature requirement for Python via .NET that decides whether a text signature can be applied inside a Linux image at all. A PDF text signature needs the font family it names, and the library does not substitute a missing family: it raises `Font <name> was not found`, and no document is written. Clearing the font does not help, because the library then requests its own default - PDF text and digital signatures default to Times New Roman and Arial - and fails the same way when those are missing.

These four tutorials build the working version in the order a real deployment hits the problems: get the image to run the binding at all, find out which fonts exist, sign with a family that resolves, and verify the result. Every Python example on this page is a complete script.

## What This Tutorial Covers

By the end you will know which two dependency layers a Python signing image needs, why filename-based font detection misleads, how to pick a family at run time, and what a verification of a CJK signature does and does not prove.

## Prerequisites

- Python 3.6 or newer for the examples (the wheel itself supports 3.5 to 3.14); the images on this page use `python:3.11-slim`
- `groupdocs-signature-net==26.10.0`, whose Linux wheel needs an x86-64 distribution with glibc 2.27 or newer
- Docker, to build the two images this page compares

## Understanding the Problem

### Why Native Solutions Fall Short

There is no native option here. The document is a PDF, the signature is text rendered into it, and the rendering needs a font family the platform can resolve. A slim Python image is missing pieces at two levels. Without ICU the embedded .NET runtime cannot start: `import` succeeds, and the first call aborts the Python process with "Couldn't find a valid ICU package". Without the fonts a signature names, signing raises `GroupDocsSignatureException` with `Font Times New Roman was not found`. Neither message says "install this package".

### How GroupDocs.Signature Solves This

The library gives you the probe. A signature attempt against a candidate family answers, definitively, whether the platform can use it, and that answer is available before any real document depends on it. Everything else on this page is arranging that probe into a startup check.

## Tutorial 1: Provision the image

### What You'll Learn

Which layers a Python signing container needs, and in what order.

### Step 1: .NET dependencies

The wheel bundles its own .NET runtime, which needs the distribution's ICU (`libicu-dev`, any version) and `libfontconfig1`. `libgdiplus` is needed for stamp signatures and text-as-image signatures, for barcode, QR code and image signatures with a border or transparency, for any signature on PowerPoint and image files, and for text and stamp signature previews; other text, barcode, QR code, image and digital signatures on PDF documents work without it.

```dockerfile
RUN apt-get update \
    && apt-get install -y libicu-dev libfontconfig1 libgdiplus \
    && rm -rf /var/lib/apt/lists/*
```

No `libssl1.1` and no Debian snapshot repository are needed. Versions up to 26.1 required both; 26.10 runs on the ICU and OpenSSL the distribution ships.

### Step 2: fonts

PDF text and digital signatures use Times New Roman and Arial by default, so the font layer installs the Microsoft core fonts. The package lives in Debian's `contrib` component and asks you to accept a license, so the layer enables the component and pre-accepts the license first - the same commands as on the [System Requirements](/signature/python-net/system-requirements/) page. Metric-compatible substitutes such as `fonts-liberation` are not picked up in place of Times New Roman and Arial, so they do not replace this layer.

The font layer is separate on purpose, so it can be commented out to reproduce the failure:

```dockerfile
RUN sed -i '/^Components:/s/main/main contrib/' /etc/apt/sources.list.d/debian.sources \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && apt-get update \
    && apt-get install -y ttf-mscorefonts-installer fontconfig \
    && fc-cache -f \
    && rm -rf /var/lib/apt/lists/*
```

Add a CJK font package, such as `fonts-noto-cjk`, to the same layer if you sign East Asian text.

### Common Issues and Solutions

If the process dies on its first call with "Couldn't find a valid ICU package", the ICU layer is missing; do not work around it with `DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1`. If signing raises `Font Times New Roman was not found` or `Font Arial was not found`, it is fonts. If it raises "The type initializer for 'Gdip' threw an exception", the feature you use needs `libgdiplus`. Keeping the layers separate is what makes that distinction quick.

## Tutorial 2: Find out what the image actually has

### What You'll Learn

How to inventory fonts without depending on a graphics toolkit.

### Step 1: Implementation

{{< tabs "count_font_files" >}}
{{< tab "Python" >}}
```python
import os

FONT_EXTENSIONS = (".ttf", ".otf", ".ttc")


def font_roots():
    home = os.path.expanduser("~")
    roots = [
        "/usr/share/fonts",
        "/usr/local/share/fonts",
        os.path.join(home, ".fonts"),
        os.path.join(home, ".local", "share", "fonts"),
        "/System/Library/Fonts",
        "/Library/Fonts",
    ]
    windir = os.environ.get("WINDIR")
    if windir:
        roots.append(os.path.join(windir, "Fonts"))
    return roots


def count_font_files():
    count = 0
    for root in font_roots():
        for _, _, files in os.walk(root):
            count += sum(1 for name in files if name.lower().endswith(FONT_EXTENSIONS))
    print(f"Font files found: {count}")


if __name__ == "__main__":
    count_font_files()
```
{{< /tab >}}
{{< tab "count-font-files.txt" >}}  
```text
Font files found: 191
```
[Download full output](/signature/python-net/_output_files/use-cases/signing-documents-linux-container-fonts/count_font_files/count-font-files.txt)
{{< /tab >}}
{{< /tabs >}}

### Step 2: Read the number, not the names

A count of zero and a count of 24 need different fixes, which is the whole reason this runs first. What the count cannot tell you is which *families* are available, because file names and family names differ, and the library looks fonts up by the names a font declares, never by its file name. On Windows, for example, `times.ttf` holds the family `Times New Roman`: asking for `times` raises `Font times was not found`. Even family names can surprise: the font in `YuGothR.ttc` resolves as `Yu Gothic Regular`, while `Yu Gothic` is not found.

### Troubleshooting

`fc-list : family` inside the container prints the families fontconfig knows about. If `fc-list` is missing, the `fontconfig` package was not installed.

## Tutorial 3: Resolve a family and sign

### What You'll Learn

How to pick a font at run time.

### Step 1: Probe a single family

{{< tabs "probe_font_family" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import GroupDocsSignatureException, Signature
from groupdocs.signature.domain import SignatureFont
from groupdocs.signature.options import TextSignOptions


def try_family(source_path, family_name):
    """Return None when the family can be used, otherwise the reason it cannot."""
    try:
        with Signature(source_path) as signature:
            options = TextSignOptions("probe")
            options.left = 10
            options.top = 10
            options.width = 60
            options.height = 20
            font = SignatureFont()
            font.family_name = family_name
            font.size = 10
            options.font = font
            signature.sign("font_probe.pdf", [options])
        return None
    except GroupDocsSignatureException as error:
        # The first line is the engine's message; the rest is the .NET stack trace
        return str(error).splitlines()[0]


def probe_font_family():
    for family_name in ("Times New Roman", "No Such Font"):
        reason = try_family("sample.pdf", family_name)
        print(f"{family_name}: {'usable' if reason is None else reason}")


if __name__ == "__main__":
    probe_font_family()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/use-cases/signing-documents-linux-container-fonts/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "font_probe.pdf" >}}  
```text
Binary file (PDF, 123 KB)
```
[Download full output](/signature/python-net/_output_files/use-cases/signing-documents-linux-container-fonts/probe_font_family/font_probe.pdf)
{{< /tab >}}
{{< /tabs >}}

`font.size` takes an int or a float. Version 26.1 rejected an int with `numeric argument expected, got 'int'`, and since the error appeared inside the probe, every candidate looked unusable; 26.10 accepts both.

### Step 2: Loop the probe

```python
def resolve_family(source_path, candidates):
    for candidate in candidates:
        if try_family(source_path, candidate) is None:
            return candidate
    return None
```

The probe answers whether the library can find a family, not whether the family covers your script. That is why the CJK candidate list below contains CJK families only.

### Step 3: Sign what resolved

{{< tabs "sign_with_resolved_fonts" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import GroupDocsSignatureException, Signature
from groupdocs.signature.domain import SignatureFont
from groupdocs.signature.options import TextSignOptions

LATIN_TEXT = "John Smith"
CJK_TEXT = "山田太郎"
LATIN_CANDIDATES = ["Arial", "Times New Roman", "DejaVu Sans", "Liberation Sans"]
CJK_CANDIDATES = ["Noto Sans CJK JP", "Noto Sans CJK SC", "MS Gothic", "SimSun", "Microsoft YaHei", "Malgun Gothic"]


def build_text_options(text, family_name, top):
    options = TextSignOptions(text)
    options.left = 100
    options.top = top
    options.width = 200
    options.height = 40
    font = SignatureFont()
    font.family_name = family_name
    font.size = 14
    options.font = font
    return options


def try_family(source_path, family_name):
    try:
        with Signature(source_path) as signature:
            signature.sign("font_probe.pdf", [build_text_options("probe", family_name, 10)])
        return None
    except GroupDocsSignatureException as error:
        return str(error).splitlines()[0]


def resolve_family(source_path, candidates):
    for candidate in candidates:
        if try_family(source_path, candidate) is None:
            return candidate
    return None


def sign_with_resolved_fonts():
    latin_family = resolve_family("sample.pdf", LATIN_CANDIDATES)
    cjk_family = resolve_family("sample.pdf", CJK_CANDIDATES)
    print(f"Latin family: {latin_family}, CJK family: {cjk_family}")
    if latin_family is None:
        print("No usable Latin font: install the Microsoft core fonts")
        return
    with Signature("sample.pdf") as signature:
        options = [build_text_options(LATIN_TEXT, latin_family, 500)]
        if cjk_family:
            options.append(build_text_options(CJK_TEXT, cjk_family, 560))
        result = signature.sign("signed_fonts.pdf", options)
        print(f"Signatures added: {len(result.succeeded)}")


if __name__ == "__main__":
    sign_with_resolved_fonts()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/use-cases/signing-documents-linux-container-fonts/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "sign-with-resolved-fonts-outputs.zip" >}}  
```text
font_probe.pdf (140 KB)
signed_fonts.pdf (254 KB)
```
[Download full output](/signature/python-net/_output_files/use-cases/signing-documents-linux-container-fonts/sign_with_resolved_fonts/sign-with-resolved-fonts-outputs.zip)
{{< /tab >}}
{{< /tabs >}}

### Best Practices

Resolve once at startup and cache both family names. Each probe writes a real PDF, so per-request probing is waste: the Latin list costs up to four writes and the CJK list up to six, all against a one-page document. Doing that once per process is invisible; doing it per request shows up in latency graphs. Log the resolved families next to the font count; together they explain any later failure without a shell in the container.

## Tutorial 4: Verify instead of assuming

### What You'll Learn

What a verification proves about the signed document, and what it cannot.

### Step 1: Implementation

`signed.pdf` is `sample.pdf` signed by the previous example, with a Latin and a CJK text signature.

{{< tabs "verify_text_signatures" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextVerifyOptions


def verify_text_signatures():
    with Signature("signed.pdf") as signature:
        for label, text in (("Latin", "John Smith"), ("CJK", "山田太郎")):
            options = TextVerifyOptions(text)
            options.all_pages = True
            result = signature.verify(options)
            print(f"{label} signature verified: {result.is_valid} ({len(result.succeeded)} match)")


if __name__ == "__main__":
    verify_text_signatures()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/use-cases/signing-documents-linux-container-fonts/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-text-signatures.txt" >}}  
```text
Latin signature verified: True (1 match)
CJK signature verified: True (1 match)
```
[Download full output](/signature/python-net/_output_files/use-cases/signing-documents-linux-container-fonts/verify_text_signatures/verify-text-signatures.txt)
{{< /tab >}}
{{< /tabs >}}

### Step 2: Read the result honestly

`len(result.succeeded)` above zero means a text signature with exactly that text is in the document. It does not mean the text renders: verification compares the signature's text, not the glyphs drawn for it, so it cannot tell a correctly rendered CJK name from one drawn with a font that lacks the glyphs. To see what a reader will see, render the signed page with [generate_preview](/signature/python-net/generate-document-pages-preview/) and look at it.

### Security Considerations

The example uses the default exact match. Without a license, verification finds no matches at all - the evaluation build reports its own evaluation text in place of your signatures, so no match type helps - and a zero count from an unlicensed run says nothing about the document. Apply a license before you rely on the check.

### Do I need every font package, or just one?

For text and digital signatures that keep the default fonts, the Microsoft core fonts are the requirement: the defaults are Times New Roman and Arial, and metric-compatible substitutes are not picked up in their place. If you set `SignatureFont.family_name` to another installed family, that family is enough for the text it covers. Add a CJK font package only if you sign East Asian text. `libfontconfig1` is not optional in any combination.

## Frequently Asked Questions

**Is Signature for Python actually supported on Linux?**
Yes. `groupdocs-signature-net` 26.10 ships a `manylinux_2_27_x86_64` wheel for any x86-64 distribution with glibc 2.27 or newer, with ICU and fontconfig installed. See [System Requirements](/signature/python-net/system-requirements/) for the full list.

**Why does every font fail when I know the fonts are installed?**
Check the names first: the library finds a font by the names it declares, not by its file name, so `times` fails where `Times New Roman` works. Then check that `fontconfig` is installed. The 26.1 trap of an int in `SignatureFont.size` is gone: 26.10 accepts it.

**Can I skip the .NET dependency layer on a different base image?**
Only if the image already provides ICU and fontconfig. No OpenSSL 1.1 is needed: 26.10 runs on the OpenSSL the distribution ships, so the old pinned Debian snapshot is not needed either.

## Summary and Next Steps

Two provisioning layers, one probe, one conditional font, one verification call. Build the fontless image once to see the failure, then the real one, and keep both around: when someone changes the base image next year, the comparison is a single build away rather than an incident.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/signing-documents-linux-container-fonts-python-net/) - the same script built step by step
- [Running in Docker](https://docs.groupdocs.com/signature/python-net/getting-started/running-in-docker/) - the .NET dependency layer in detail
- [Installation](https://docs.groupdocs.com/signature/python-net/installation/) - package names and supported Python versions
- [System requirements](https://docs.groupdocs.com/signature/python-net/system-requirements/) - platform support notes
- [Product documentation](https://docs.groupdocs.com/signature/python-net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/python-net/) - full API details for GroupDocs.Signature for Python via .NET
