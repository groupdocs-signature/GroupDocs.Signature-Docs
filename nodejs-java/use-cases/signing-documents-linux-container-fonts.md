---
id: signing-documents-linux-container-fonts
url: /signature/nodejs-java/use-cases/signing-documents-linux-container-fonts/
title: 6 Container Signing Methods for Node.js - Complete Comparison Guide
weight: 1
description: "Compare six methods for signing PDFs inside a Linux container with GroupDocs.Signature for Node.js via Java: font inventory, probing, resolution, option building, two-stage signing, and verification."
keywords: linux, sign, documents, pdf, docker, fonts, groupdocs signature, nodejs via java, container, comparison
productName: GroupDocs.Signature for Node.js via Java
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[nodejs-docker-signing-with-fonts](https://github.com/groupdocs-signature/nodejs-docker-signing-with-fonts)
{{< /alert >}}

## Introduction

Container font provisioning is a GroupDocs.Signature requirement for Node.js via Java that decides whether a text signature can be written inside a Linux image. The library does not substitute a missing family: name one that is not installed and the call raises, producing no document. Clearing the font does not help either, because the library then requests its own default and fails the same way.

Node.js adds a second dimension. The binding runs a JVM in process through node-java, so the image needs a JDK, the node-gyp toolchain, and `LD_LIBRARY_PATH` pointing at `libjvm.so` before fonts are even a question. `node:18-bookworm` ships 6 DejaVu font files, which is enough for Latin and nothing else.

This guide compares the six methods the sample uses, what each one costs, and which binding limits shape them.

## What This Guide Covers

Each method below is a real function from a project that runs end to end in two images, one with a font layer and one without. The comparison tables are about applicability and cost, not benchmarks: every figure quoted is a count of file operations or a documented binding behaviour.

**Prerequisites:**
- Node 18 (the native bridge does not build on Node 20 or 22) and JDK 8 through 17
- `@groupdocs/groupdocs.signature` 24.12.0, plus `build-essential` and `python3` for the bridge build

## Quick Decision Matrix

| Scenario | Recommended Method | Why |
|---|---|---|
| First run in an unfamiliar image | Font inventory | separates "no fonts" from "wrong family" before any signing |
| Choosing a family at run time | Probe plus resolution | asks the library instead of trusting file names |
| Signing Latin text only | Option builder plus single sign | one call, no staging file |
| Signing Latin and CJK | Two-stage signing | a JS array does not marshal to `java.util.List` |
| Proving the result | Verification | works on other platforms; reports unavailable here |

## Method Comparison Overview

| Method | Complexity | Cost per call | Flexibility | Best For |
|---|---|---|---|---|
| **Font inventory** | low | one directory walk | reports files, not families | diagnosis and logging |
| **Family probe** | low | one PDF write, then delete | definitive per family | answering "can I use this font" |
| **Family resolution** | low | up to one probe per candidate | ordered preference list | startup, once per process |
| **Option builder** | low | none | font attached conditionally | every signature |
| **Two-stage signing** | medium | one extra file write when CJK applies | works around the array limit | mixed-script documents |
| **Verification** | low | one file open | unavailable through this binding | other platforms, or a future release |

## Detailed Method Analysis

### Method 1: Font inventory

Walks the standard Linux, Windows and macOS font directories with `fs`, filtered by extension. It deliberately avoids anything that needs a graphics toolkit, since a headless container is where this runs.

```javascript
const roots = [
  '/usr/share/fonts',
  '/usr/local/share/fonts',
  path.join(home, '.fonts'),
  path.join(home, '.local', 'share', 'fonts'),
  '/System/Library/Fonts',
  '/Library/Fonts',
];
```

What it cannot tell you is which families are available: `fonts-noto-cjk` installs `NotoSansCJK-Regular.ttc`, whose family name is `Noto Sans CJK JP`. The count is a diagnosis aid, not a resolution mechanism.

### Method 2: Family probe

Signs into a temp file with one candidate family and converts the outcome to a value. The error handling is the part specific to this binding:

```javascript
const stack = err.stack || '';
const match = stack.match(/com\.groupdocs\.signature\.exception\.[^\n]*/);
return match ? match[0].trim() : (err.message || String(err));
```

node-java surfaces every failure as `Error running instance method`, so without pulling the Java exception line out of the stack, a missing font and a broken bridge look identical in the logs. I added that regex after debugging the wrong layer for an hour, and it is the single change that made this binding's container failures readable.

### Method 3: Family resolution

A loop over the probe, ordered most portable first.

```javascript
for (const candidate of candidates) {
  if (tryFamily(sourcePath, candidate) === null) {
    return candidate;
  }
}
return null;
```

Run it once at startup. Each probe writes a real PDF, so the Latin list costs up to four writes and the CJK list up to eight; per-request resolution turns that into steady overhead for no gain.

### Method 4: Option builder

Geometry unconditionally, font only when a family resolved. Every call here is a bridge call into Java, which is why the setters look nothing like idiomatic JavaScript.

```javascript
const options = new signatureLib.TextSignOptions(text);
options.setLeft(50);
options.setTop(top);
options.setWidth(280);
options.setHeight(40);
if (familyName) {
  const font = new signatureLib.SignatureFont();
  font.setFamilyName(familyName);
  font.setSize(16);
  options.setFont(font);
}
```

### Method 5: Two-stage signing

The Java API takes a list of options, but a JavaScript array does not marshal to `java.util.List`; passing one produces `Could not find method "sign(java.lang.String, [Ljava.lang.Object;)"`. The sample chains the single-option overload instead:

```javascript
new signatureLib.Signature(sourcePath)
  .sign(firstOutput, buildTextOptions(LATIN_TEXT, latinFamily, 50));
applied += 1;

if (stageTwo) {
  new signatureLib.Signature(firstOutput)
    .sign(outputPath, buildTextOptions(CJK_TEXT, cjkFamily, 120));
  applied += 1;
}
```

When no CJK family resolved, `firstOutput` is the final path and there is no staging file at all. When it did, the intermediate is written to the temp directory and deleted afterwards.

### Method 6: Verification

Written as it should work, wrapped so a binding failure is reported rather than thrown:

```javascript
const options = new signatureLib.TextVerifyOptions(expectedText);
options.setAllPages(true);
const result = signature.verify(options);
return sizeOf(result.getSucceeded());
```

Through this package `verify` raises `Error running instance method`, so the sample returns `-1` and prints `unavailable (binding limitation - see README)`. The npm package is versioned 24.12.0, published in December 2024, and bundles a 23.6.1 engine while .NET is at 26.6 and Java at 26.5.

### Is the missing read-back a problem in production?

It depends on what you are signing. Latin-only workflows can rely on the signing call, since a missing font raises rather than degrading. Mixed-script workflows lose their only check that CJK glyphs embedded rather than rendering as boxes, so on this binding the practical answer is to validate output on another platform, or to keep a small .NET or Java verifier in the pipeline.

### How much does the two-stage signing actually cost?

One extra file write, and only when a CJK family resolved. With Latin alone the first output path is the final one and nothing
is staged. When both apply, the intermediate PDF goes to the temp directory and is deleted after the second call, so the visible
cost is a single additional write per document rather than anything structural.

## Common Pitfalls

Building on Node 20 or 22 fails at install with `'AccessorSignature' is not a member of 'v8'` - the bridge needs Node 18. Forgetting `LD_LIBRARY_PATH` gives a JVM load error that mentions nothing about Java. Running on JDK 25 produces `Cannot open an image. The image size can not be 0!` from the imaging layer, so keep to 8 through 17. And a fontless image fails on the first signature with the GroupDocs exception buried in a bridge error, which is exactly what Method 2's regex exists to surface.

## Summary

Six methods, two of which exist only because of the bridge: the stack-trace regex and the two-stage signing. Provision the JDK and the fonts, resolve a family at startup, sign one option at a time, and treat the read-back as unavailable on this binding rather than assuming it failed. The sample repository builds both images so the fontless case can be reproduced in a single command.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/signing-documents-linux-container-fonts-nodejs-java/) - the JVM-in-process angle in full
- [Installation](https://docs.groupdocs.com/signature/nodejs-java/installation/) - package name, Node versions and native build requirements
- [System requirements](https://docs.groupdocs.com/signature/nodejs-java/system-requirements/) - supported platforms and JDKs
- [Product documentation](https://docs.groupdocs.com/signature/nodejs-java/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/nodejs-java/) - full API details for GroupDocs.Signature for Node.js via Java
