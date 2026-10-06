---
id: system-requirements
url: signature/python-net/system-requirements
title: System Requirements
linkTitle: System Requirements
weight: 4
description: "System requirements for GroupDocs.Signature for Python via .NET — supported operating systems, Python versions, pip, and the Linux and macOS packages it needs."
keywords: GroupDocs.Signature for Python via .NET, system requirements, Windows, Linux, macOS, Python 3.5, Python 3.14, glibc, ICU, fontconfig, libgdiplus, fonts
productName: GroupDocs.Signature for Python via .NET
hideChildren: false
toc: true
---

{{< alert style="info" >}}
GroupDocs.Signature for Python via .NET ships as a self-contained wheel that bundles the .NET runtime it needs. No Microsoft Office, Adobe software, .NET install or Mono install is required.
{{< /alert >}}

## Supported Operating Systems

### Windows

- Windows 10 and Windows 11 (x64)
- Windows Server 2012 and later (x64)

The Windows wheel is 64-bit only: use a 64-bit Python. There is no 32-bit (x86) wheel; versions up to 26.1 shipped one.

### Linux

- Any **x86-64** distribution with **glibc 2.27 or newer** — for example Ubuntu 18.04+, Debian 10+, RHEL 8+. The embedded .NET runtime needs glibc 2.27, and the wheel's `manylinux_2_27_x86_64` tag says so, so pip refuses an older system.

### macOS

- macOS 12 (Monterey) and later, **Intel** (x86_64) and **Apple Silicon** (arm64 / M-series). Every binary of the embedded .NET runtime requires macOS 12, and the wheels are tagged `macosx_12_0_*` accordingly. Microsoft supports .NET 10 on macOS 14 and later.

## Python Version

GroupDocs.Signature for Python via .NET supports every Python release from **3.5** through **3.14** (`python_requires = ">=3.5,<3.15"`). Download Python from the [official website](https://www.python.org/downloads/).

## Package Manager

The library is distributed on [PyPI](https://pypi.org/project/groupdocs-signature-net/) as **`groupdocs-signature-net`**, in four platform-specific wheels per release:

| Platform | Wheel suffix |
|---|---|
| Windows x86-64 | `win_amd64` |
| Linux x86-64 | `manylinux_2_27_x86_64` |
| macOS Apple Silicon (ARM64) | `macosx_12_0_arm64` |
| macOS Intel (x86-64) | `macosx_12_0_x86_64` |

`pip` 20.3 or newer picks the right wheel for your platform; older versions do not recognise these tags, so upgrade with `python -m pip install --upgrade pip` (on Python 3.5, `python -m pip install "pip==20.3.4"`). On an Intel Mac, a Python built against a pre-11 macOS SDK reports its system as macOS 10.16 — there use pip 24.1 or newer, or run `SYSTEM_VERSION_COMPAT=0 pip install groupdocs-signature-net`.

## Platform Dependencies

### Linux

Install **ICU**, **fontconfig**, **`libgdiplus`** and the **Microsoft core fonts**:

```bash
# Debian: enable the contrib component first (ttf-mscorefonts-installer lives there)
sudo sed -i '/^Components:/s/main/main contrib/' /etc/apt/sources.list.d/debian.sources
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get update
sudo apt-get install -y libicu-dev libfontconfig1 libgdiplus ttf-mscorefonts-installer fontconfig
sudo fc-cache -f

# Ubuntu: the same packages; ttf-mscorefonts-installer is in multiverse
sudo add-apt-repository -y multiverse
sudo apt-get install -y libicu-dev libfontconfig1 libgdiplus ttf-mscorefonts-installer fontconfig
```

What each package is for, measured on the 26.9 engine:

- **ICU** (`libicu-dev`, any version your distribution ships) — without it the runtime cannot start: the first call aborts the Python process with "Couldn't find a valid ICU package". Do not set `DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1` to work around it.
- **fontconfig** — the bundled SkiaSharp library loads `libfontconfig.so.1`.
- **`libgdiplus`** — needed for stamp signatures and text-as-image signatures in any format, for barcode, QR code and image signatures that set a border or transparency, for every signature on PowerPoint and image (PNG, JPG, WEBP) files, and for text and stamp signature previews. Without it these fail with "The type initializer for 'Gdip' threw an exception". Text, barcode, QR code, image and digital signatures on PDF and Office documents work without it, including with a background, rotation, colors or margins.
- **Microsoft core fonts** — PDF text and digital signatures use Times New Roman and Arial by default and fail with "Font Times New Roman was not found" / "Font Arial was not found" when the fonts are missing. Metric-compatible substitutes such as Liberation are not picked up; alternatively, set the signature's font to a font that is installed.

Versions up to 26.1 also needed `libssl1.1` and an old ICU (`libicu67`) from a Debian snapshot. 26.10 does not: it runs on the ICU and OpenSSL your distribution ships.

### macOS

Install `mono-libgdiplus` for the same features as on Linux:

```bash
brew install mono-libgdiplus
```

### Windows

No additional system libraries are required.
