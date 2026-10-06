---
id: troubleshooting
url: signature/python-net/getting-started/troubleshooting
title: Troubleshooting
weight: 9
description: "Common issues you may face while signing documents with GroupDocs.Signature for Python via .NET, and how to solve them: ICU, libgdiplus, fonts, evaluation limits, licensing, and installation."
keywords: GroupDocs.Signature, troubleshooting, known issues, errors, ICU, libgdiplus, Gdip, fonts, Times New Roman, ttf-mscorefonts-installer, evaluation, license, pip, docker
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---
This page describes issues you may face while signing documents with GroupDocs.Signature for Python via .NET, and their solutions.

## Platform dependencies (Linux and macOS)

**The Python process ends abruptly with "Couldn't find a valid ICU package"** (Linux): the .NET runtime bundled in the wheel cannot start without ICU. Install it (`sudo apt-get install -y libicu-dev` on Debian and Ubuntu); any ICU version your distribution ships works. Do not set `DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1` to work around it.

**"The type initializer for 'Gdip' threw an exception"**: `libgdiplus` is missing. Install `libgdiplus` on Linux or `mono-libgdiplus` on macOS (`brew install mono-libgdiplus`). It is needed for:

- stamp signatures and text signatures rendered as an image, in any format;
- barcode, QR code, and image signatures that set a border or transparency;
- every signature on PowerPoint and image (PNG, JPG, WEBP) files;
- text and stamp signature previews.

Text, barcode, QR code, image, and digital signatures on PDF and Office documents work without it.

**"Font Times New Roman was not found" or "Font Arial was not found"** (Linux): PDF text and digital signatures use these fonts by default. Install the Microsoft core fonts (`ttf-mscorefonts-installer`) and run `fc-cache -f`, or set the signature's font to a font that is installed. Metric-compatible substitutes such as Liberation are not picked up. [How to Sign PDFs in a Linux Container]({{< ref "signature/python-net/use-cases/signing-documents-linux-container-fonts.md" >}}) covers fonts in depth.

**"Package 'ttf-mscorefonts-installer' has no installation candidate"**: the package is not in the default repositories. Enable the `contrib` component on Debian, or `multiverse` on Ubuntu (`sudo add-apt-repository -y multiverse`), and accept the license agreement first. The exact commands are in [System Requirements]({{< ref "signature/python-net/getting-started/system-requirements.md" >}}).

## Evaluation mode and licensing

**"The number of pages cannot exceed 2 in a trial version"**: you are running without a license, and the document has more than two pages. Apply a license or set the `GROUPDOCS_LIC_PATH` environment variable.

**Signed pages carry "Created with evaluation version of GroupDocs.Signature"**, **search reports an evaluation notice instead of a signature's text**, or **verification returns `is_valid = False` for a document that carries the expected signature**: these are the other evaluation limits. Apply a license to remove them.

**The license is set, but outputs still carry the evaluation line**: the license was not applied, and no error tells you so.

- A missing or unreadable file in `GROUPDOCS_LIC_PATH` does not raise an error, because a license problem must not break the import. Check the path, and in Docker check the volume mount.
- `License().set_license(path)` raises `GroupDocsSignatureException` ("License file not found") only when the file does not exist. A damaged or wrong license file is accepted without an error.

To confirm that a license works, sign a test document and check that no evaluation line appears on its pages. See [Evaluation Limitations and Licensing]({{< ref "signature/python-net/getting-started/evaluation-limitations-and-licensing.md" >}}).

## Installation

**`is not a supported wheel on this platform` or `No matching distribution found`**: check that the system meets the [System Requirements]({{< ref "signature/python-net/getting-started/system-requirements.md" >}}):

- Linux needs x86-64 with glibc 2.27 or newer, and macOS needs version 12 or newer.
- pip must be 20.3 or newer to recognize the wheel tags: run `python -m pip install --upgrade pip` (on Python 3.5, `python -m pip install "pip==20.3.4"`).
- On Windows, use a 64-bit Python: there is no 32-bit wheel.
- On an Intel Mac, a Python built against a pre-11 macOS SDK reports its system as macOS 10.16. Use pip 24.1 or newer, or run `SYSTEM_VERSION_COMPAT=0 pip install groupdocs-signature-net`.

**`pip install groupdocs_signature_net-*.whl` fails in PowerShell**: PowerShell does not expand a `*` wildcard for a native command. Name the wheel file explicitly.

## Docker

**The mounted license or output path is wrong when running `docker run` from Git Bash on Windows**: Git Bash rewrites container paths. Run `export MSYS_NO_PATHCONV=1` before `docker run`.

See [Running in Docker]({{< ref "signature/python-net/getting-started/running-in-docker.md" >}}) for a complete Dockerfile with every package the library needs.

## Related articles

- [System requirements]({{< ref "signature/python-net/getting-started/system-requirements.md" >}}): supported systems, pip, and the Linux and macOS packages (ICU, fontconfig, `libgdiplus`, Microsoft core fonts).
- [Evaluation limitations and licensing]({{< ref "signature/python-net/getting-started/evaluation-limitations-and-licensing.md" >}}): trial limits and every way to apply a license.
- [Running in Docker]({{< ref "signature/python-net/getting-started/running-in-docker.md" >}}): a minimal image that signs a PDF.
- [Technical Support]({{< ref "signature/python-net/technical-support.md" >}}): ask on the forum when your issue is not listed here.
