---
id: signing-documents-linux-container-fonts
url: /signature/java/use-cases/signing-documents-linux-container-fonts/
title: 6 Methods to Make Java Container Signing Work with Fonts
weight: 1
description: "Six working Java methods for signing documents inside a Linux container with GroupDocs.Signature: font inventory, family probing, resolution, option building, signing, and the read-back that proves CJK survived."
keywords: linux, sign, documents, pdf, docker, fonts, groupdocs signature, java, container, font resolution
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[sign-documents-in-docker-fonts-java](https://github.com/groupdocs-signature/sign-documents-in-docker-fonts-java)
{{< /alert >}}

## Overview

Container font provisioning is a GroupDocs.Signature capability for Java that decides whether a text signature can be written inside a Linux image at all. The library resolves a family through the platform and does not substitute a missing one: on Java the failure reads `Specified font file was not found<name>` and nothing is saved. Leaving the font unset does not help either, because GroupDocs then requests Times New Roman and fails identically.

The JVM case has a particular shape. `eclipse-temurin:17-jre` ships 8 DejaVu font files for AWT, so Latin signing works out of the box and nobody notices anything is missing. The failure arrives later, with the first Japanese or Chinese string, usually in production. This page walks through the six methods the sample uses to make that predictable instead of surprising.

**What you'll learn:**
- Which font files a JVM base image actually provides, and why that is a trap rather than a gift
- How to resolve a family by asking the library instead of scanning filenames
- How to degrade when CJK cannot be embedded, and how to prove the Latin path worked

## What This Use Case Covers

Every code block below is from a runnable Maven project that signs `documents/sample.pdf` with a Latin and a CJK text signature, reads both back, and prints what it found. The project ships two Dockerfiles - one with a font layer, one without - so the two outcomes can be produced on demand rather than described.

**Prerequisites and requirements:**
- JDK 11 or newer to build; the sample runs on Java 8 through 17 and the image is `eclipse-temurin:17-jre`
- GroupDocs.Signature for Java 26.5 from `https://releases.groupdocs.com/java/repo/`
- Docker, if you want the before-and-after comparison

## Why the JVM's Bundled Fonts Aren't Enough

A JRE image is not fontless, which is exactly the problem. The 8 DejaVu files in `eclipse-temurin:17-jre` cover Latin, Greek and Cyrillic, so a service that signs English text passes every test you are likely to write. Nothing in the API warns you that the coverage stops there.

This makes the bundled set unsuitable for:
- Any document naming a person in Chinese, Japanese or Korean
- Documents that reference Arial or Times New Roman by name and expect metric-compatible rendering
- Anything where a failed signature must fail at deploy time rather than at the first unusual customer

GroupDocs.Signature solves the resolution half: a probe tells you what the platform can use before a real document depends on it. The provisioning half is a Dockerfile layer, and no code replaces it.

## 📂 Repository Structure

```
sign-documents-in-docker-fonts-java/
│
├── pom.xml                                       # GroupDocs.Signature 26.5, compiler level 11
├── Dockerfile                                    # runtime image WITH the font layer
├── Dockerfile.nofonts                            # the same image without it
├── documents/sample.pdf                          # the input
└── src/main/java/com/groupdocs/demo/
    └── DockerFontsDemo.java                      # all six methods below
```

## Method 1: Inventory the fonts on disk

**Scope:** diagnosis | **Difficulty:** low | **Best For:** the first log line of any container run

### How It Works

The scan walks the standard Linux, Windows and macOS font directories and counts files by extension. It uses the filesystem rather than `GraphicsEnvironment`, which needs a working AWT or headless toolkit and is its own container failure.

### Implementation

```java
List<String> roots = new ArrayList<>(Arrays.asList(
        "/usr/share/fonts",
        "/usr/local/share/fonts",
        home + "/.fonts",
        home + "/.local/share/fonts",
        "/System/Library/Fonts",
        "/Library/Fonts"));
if (windir != null && !windir.isEmpty()) {
    roots.add(windir + File.separator + "Fonts");
}
```

### Considerations

Directories that do not exist are skipped, and one that cannot be read is skipped rather than ending the scan. The number this prints is the difference between "no fonts at all" and "fonts, wrong family", which need different fixes.

## Method 2: Probe one family with a throwaway signature

**Scope:** infrastructure | **Difficulty:** low | **Best For:** everything below depends on it

### How It Works

The probe signs into the temp directory with a single candidate family and converts the outcome into a return value: `null` for success, the error message for failure. The scratch file is always removed.

### Implementation

```java
Signature signature = new Signature(sourcePath);
TextSignOptions options = new TextSignOptions("probe");
options.setLeft(10);
options.setTop(10);
options.setWidth(60);
options.setHeight(20);
SignatureFont font = new SignatureFont();
font.setFamilyName(familyName);
font.setSize(10);
options.setFont(font);
signature.sign(scratch.getAbsolutePath(), options);
return null;
```

### Considerations

Cleanup falls back to `deleteOnExit` when the immediate delete fails, which happens on Windows while a handle is still open. Do not match on the exception text: the same failure is worded differently on .NET and on Java.

## Method 3: Resolve the first usable family

**Scope:** startup | **Difficulty:** low | **Best For:** picking a font without assuming an environment

### How It Works

Resolution loops the probe over an ordered candidate list. The container-installed family comes first, developer-machine families last, so the same code resolves quickly on both.

### Implementation

```java
for (String candidate : candidates) {
    if (tryFamily(sourcePath, candidate) == null) {
        return candidate;
    }
}
return null;
```

### Considerations

Returning `null` rather than throwing is what lets the caller treat missing Latin as fatal and missing CJK as a skip. The sample resolves `DejaVu Sans` first for Latin and `Noto Sans CJK JP` first for CJK.

## Method 4: Build options with an optional font

**Scope:** per signature | **Difficulty:** low | **Best For:** the one branch that prevents the exception

### How It Works

Geometry is set unconditionally; the font is attached only when a family resolved. Naming an absent family is precisely what raises the error this page is about.

### Implementation

```java
TextSignOptions options = new TextSignOptions(text);
options.setLeft(50);
options.setTop(top);
options.setWidth(280);
options.setHeight(40);
if (familyName != null) {
    SignatureFont font = new SignatureFont();
    font.setFamilyName(familyName);
    font.setSize(16);
    options.setFont(font);
}
return options;
```

### Considerations

Omitting the font is only useful when the platform has some usable font. On a genuinely fontless image it moves the failure from your family name to Times New Roman and changes nothing else.

## Method 5: Sign Latin, and CJK when possible

**Scope:** the real work | **Difficulty:** low | **Best For:** documents with mixed scripts

### How It Works

Both signatures are collected into one `List<SignOptions>` and applied in a single `sign` call. The CJK entry is added only when a CJK family resolved.

### Implementation

```java
List<SignOptions> options = new ArrayList<>();
options.add(buildTextOptions(LATIN_TEXT, latinFamily, 50));

if (cjkFamily != null) {
    options.add(buildTextOptions(CJK_TEXT, cjkFamily, 120));
}

SignResult result = signature.sign(outputPath, options);
return result.getSucceeded().size();
```

### Considerations

`getSucceeded().size()` is the number to log. Two means both scripts were written; one means the image has Latin coverage only, which on a stock JRE image is the default state.

## Method 6: Read the signatures back

**Scope:** verification | **Difficulty:** low | **Best For:** proving CJK survived

### How It Works

The signed file is reopened and searched across all pages, and the recovered strings are compared with what was signed.

### Implementation

```java
Signature signature = new Signature(signedPath);
TextSearchOptions options = new TextSearchOptions();
options.setAllPages(true);

List<TextSignature> found = signature.search(TextSignature.class, options);
```

### Considerations

In evaluation mode the trial text appears in these results too, so read the list before concluding a signature is missing. I chased a "missing" signature for twenty minutes before noticing the extra evaluation string sitting right above it.

### Do I need the font layer if the JRE image already ships DejaVu?

For Latin-only documents, no: the bundled DejaVu files resolve and signing works. For anything else, yes. No JRE image ships CJK coverage, so Japanese, Chinese and Korean text fails until fonts-noto-cjk is installed, and Liberation is what makes documents that reference Arial or Times New Roman render with the right metrics.

## Choosing the Right Method

| Situation | Method | Why |
|---|---|---|
| First run in a new image | 1 | the font count tells you which failure you have |
| Startup of a long-lived service | 2 and 3 | resolve once, cache the families |
| Mixed-script documents | 4 and 5 | attach a font per script, skip what cannot embed |
| Any pipeline that must be auditable | 6 | the read-back is the only proof |

## Common Questions

**Why does the same code fail differently on .NET and Java?**
The bindings word the error differently: .NET says `Sign document error: Font <name> was not found`, Java says `Specified font file was not found<name>`. Both mean the family did not resolve. Branch on the exception type or on your own resolution result, never on the message.

**Do I need the font layer if the base image already has DejaVu?**
For Latin-only documents, no. For anything else, yes: no JRE image ships CJK coverage, and Liberation is what makes Arial and Times New Roman references render as intended.

**Can I skip Maven and use a shaded jar?**
Not without work. The GroupDocs artifact is a signed fat jar and repackaging it triggers `NoClassDefFoundError` unless `META-INF/*.SF|RSA|DSA` are removed and `MANIFEST.MF` is truncated to its main section, which carries about 19 MB of per-entry digests. The sample sidesteps it with a plain classpath and a `dependency/` directory.

## Summary and When to Use Which Method

Run the inventory first, resolve at startup, attach fonts conditionally, sign in one call, and verify by reading back. On the JVM the important adjustment is mental rather than technical: the bundled DejaVu fonts make the problem invisible until the first non-Latin document, so treat CJK coverage as something to install and assert, not something to discover.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/signing-documents-linux-container-fonts-java/) - the business case for provisioning fonts before the first incident
- [Signing documents](https://docs.groupdocs.com/signature/java/signing/) - full reference for `TextSignOptions` and `SignatureFont`
- [Searching for signatures](https://docs.groupdocs.com/signature/java/searching/) - reference for the read-back
- [System requirements](https://docs.groupdocs.com/signature/java/system-requirements/) - supported JDKs and platforms
- [Product documentation](https://docs.groupdocs.com/signature/java/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/java/) - full API details for GroupDocs.Signature for Java
