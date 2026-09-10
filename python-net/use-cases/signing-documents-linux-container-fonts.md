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

Container font provisioning is a GroupDocs.Signature requirement for Python via .NET that decides whether a text signature can be applied inside a Linux image at all. `python:3.11-slim` ships zero font files, and the library does not substitute a missing family: it raises, and no document is written. Clearing the font does not help, because the library then requests its own default and fails the same way.

These four tutorials build the working version in the order a real deployment hits the problems: get the image to run the binding at all, find out which fonts exist, sign with a family that resolves, and verify the result. Every snippet comes from a script that runs end to end in both a fonts image and a fontless one.

## What This Tutorial Covers

By the end you will know which two dependency layers a Python signing image needs, why filename-based font detection misleads, how to keep an int out of `SignatureFont.size`, and how to prove a CJK signature survived rather than assuming it.

## Prerequisites

- Python 3.11, matching the `python:3.11-slim` base image; the wheel caps below CPython 3.14
- `groupdocs-signature-net==26.1`
- Docker, to build the two images this page compares

## Understanding the Problem

### Why Native Solutions Fall Short

There is no native option here. The document is a PDF, the signature is text rendered into it, and the rendering needs a font family the platform can resolve. A slim Python image has no fonts, no `fontconfig`, and until the .NET dependencies are installed it cannot even import the binding. Nothing about that surfaces as "install fonts" - it surfaces as a signing error deep in a proxy exception.

### How GroupDocs.Signature Solves This

The library gives you the probe. A signature attempt against a candidate family answers, definitively, whether the platform can use it, and that answer is available before any real document depends on it. Everything else on this page is arranging that probe into a startup check.

## Tutorial 1: Provision the image

### What You'll Learn

Which layers a Python signing container needs, and in what order.

### Step 1: .NET dependencies

The binding runs on .NET, so `libicu` and `libssl1.1` come first. `libssl1.1` is not in bookworm, so it is pulled from a pinned Debian snapshot - the approach the [Running in Docker](https://docs.groupdocs.com/signature/python-net/getting-started/running-in-docker/) guide documents:

```dockerfile
ENV SNAPSHOT_DATE=20220328T000000Z
RUN echo "deb [trusted=yes] http://snapshot.debian.org/archive/debian/${SNAPSHOT_DATE} bullseye main" \
        > /etc/apt/sources.list.d/debian-archive.list \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get install -y --no-install-recommends \
        libicu67 \
        libssl1.1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
```

### Step 2: fonts

The font layer is separate on purpose, so it can be commented out to reproduce the failure:

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

### Common Issues and Solutions

If the import itself fails, the .NET layer is missing or the snapshot date is unreachable. If the import works and signing fails, it is fonts. Keeping the layers separate is what makes that distinction quick.

## Tutorial 2: Find out what the image actually has

### What You'll Learn

How to inventory fonts without depending on a graphics toolkit.

### Step 1: Implementation

```python
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
```

### Step 2: Read the number, not the names

A count of zero and a count of 24 need different fixes, which is the whole reason this runs first. What the count cannot tell you is which *families* are available, because file names and family names differ: Debian's `fonts-noto-cjk` installs `NotoSansCJK-Regular.ttc`, whose family is `Noto Sans CJK JP`.

### Troubleshooting

If `fc-list` is missing inside the container, `fontconfig` was not installed and family lookups are running blind even when font files are present.

## Tutorial 3: Resolve a family and sign

### What You'll Learn

How to pick a font at run time, and the one type detail that wastes an afternoon.

### Step 1: Probe a single family

```python
with signature.Signature(source_path) as sign:
    options = TextSignOptions()
    options.text = "probe"
    options.left = 10
    options.top = 10
    options.width = 60
    options.height = 20
    font = SignatureFont()
    font.family_name = family_name
    font.size = 10.0
    options.font = font
    sign.sign(scratch, [options])
return None
```

`font.size = 10.0` is not a style choice. The binding maps size to a .NET float and rejects an int with `numeric argument expected, got 'int'`, and since the error appears inside the probe, every candidate looks unusable. I spent an afternoon adding font packages to an image that already had them because of that one literal.

### Step 2: Loop the probe

```python
for candidate in candidates:
    if try_family(source_path, candidate) is None:
        return candidate
return None
```

### Step 3: Sign what resolved

```python
with signature.Signature(source_path) as sign:
    options = [build_text_options(LATIN_TEXT, latin_family, 50)]
    if cjk_family:
        options.append(build_text_options(CJK_TEXT, cjk_family, 120))
    result = sign.sign(output_path, options)
    return len(result.succeeded)
```

### Best Practices

Resolve once at startup and cache both family names. Each probe writes a real PDF, so per-request probing is waste: the Latin list costs up to four writes and the CJK list up to eight, all against a one-page document. Doing that once per process is invisible; doing it per request shows up in latency graphs. Log the resolved families next to the font count; together they explain any later failure without a shell in the container.

## Tutorial 4: Verify instead of assuming

### What You'll Learn

Why the Python sample verifies rather than searches, and what `match_type` has to do with licensing.

### Step 1: Implementation

```python
with signature.Signature(signed_path) as sign:
    options = TextVerifyOptions()
    options.text = expected_text
    options.match_type = gsd.TextMatchType.CONTAINS
    options.all_pages = True
    result = sign.verify(options)
    return len(result.succeeded)
```

### Step 2: Read the result honestly

`len(result.succeeded)` above zero means the text is really in the document. A CJK signature written without CJK coverage can render as empty boxes without raising anything at all, so this step is the only one that separates "signed" from "signed correctly".

### Security Considerations

`CONTAINS` is used rather than an exact match because evaluation mode adds trial text to the page, and an exact match would report a correct document as failed. In production with a licence applied, tighten it if you need the stricter check.

### Do I need every font package, or just one?

One is the minimum: `fonts-dejavu-core` makes Latin, Greek and Cyrillic signing work, and without it nothing renders at all. Add `fonts-liberation` when your documents reference Arial or Times New Roman by name, and `fonts-noto-cjk` only if you sign East Asian text, since it is much the largest of the four. `fontconfig` is not optional in any combination.

## Frequently Asked Questions

**Is Signature for Python actually supported on Linux?**
The docs list Linux-ready Python packages and omit Signature, but on `groupdocs-signature-net==26.1` this sample signed and verified inside `python:3.11-slim`, CJK included. Test your own version rather than trusting either the list or this page; the behaviour is version-specific.

**Why does every font fail when I know the fonts are installed?**
Check the size literal first. An int in `SignatureFont.size` raises `numeric argument expected, got 'int'` from inside the probe, which looks exactly like universal font failure. Then check that `fontconfig` is installed.

**Can I skip the .NET dependency layer on a different base image?**
Only if the image already provides `libicu` and an OpenSSL 1.1 compatible library. On `python:3.11-slim` you cannot, and the pinned snapshot in the sample's Dockerfile is the documented way to get `libssl1.1` on bookworm.

## Summary and Next Steps

Two provisioning layers, one probe, one conditional font, one verification call. Build the fontless image once to see the failure, then the real one, and keep both around: when someone changes the base image next year, the comparison is a single build away rather than an incident.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/signing-documents-linux-container-fonts-python-net/) - the same script built step by step
- [Running in Docker](https://docs.groupdocs.com/signature/python-net/getting-started/running-in-docker/) - the .NET dependency layer in detail
- [Installation](https://docs.groupdocs.com/signature/python-net/installation/) - package names and supported Python versions
- [System requirements](https://docs.groupdocs.com/signature/python-net/system-requirements/) - platform support notes
- [Product documentation](https://docs.groupdocs.com/signature/python-net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/python-net/) - full API details for GroupDocs.Signature for Python via .NET
