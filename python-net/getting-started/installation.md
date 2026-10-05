---
id: installation
url: signature/python-net/installation
title: Installation
linkTitle: Installation
weight: 1
description: "Install GroupDocs.Signature for Python via .NET from PyPI, pin it in requirements.txt, or install a pre-downloaded wheel for offline environments — then verify the installation."
keywords: install, installation, pip, pypi, requirements.txt, offline install, wheel, whl, groupdocs-signature-net, python
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

GroupDocs.Signature for Python via .NET is distributed as a self-contained wheel that bundles the embedded .NET runtime. A single `py3-none-{platform}` wheel works across Python **3.5 – 3.14** on Windows, Linux, and macOS (Intel and Apple Silicon). Nothing else is needed on Windows; Linux and macOS need a few system packages, listed below.

{{< alert style="info" >}}
Before you install, review the [System Requirements]({{< ref "signature/python-net/system-requirements" >}}). The wheels need Linux with glibc 2.27 or newer, or macOS 12 or newer, and pip 20.3 or newer to install. On Linux, install ICU, fontconfig, `libgdiplus` and the Microsoft core fonts; on macOS, install `mono-libgdiplus`.
{{< /alert >}}

## Install Package from PyPI

All packages are hosted at [PyPI](https://pypi.org/project/groupdocs-signature-net/). Install the latest version with `pip`:

{{< tabs "install-from-pypi">}}
{{< tab "Windows" >}}
```ps
py -m pip install groupdocs-signature-net
```
{{< /tab >}}
{{< tab "Linux" >}}
```bash
python3 -m pip install groupdocs-signature-net
```
{{< /tab >}}
{{< tab "macOS" >}}
```bash
python3 -m pip install groupdocs-signature-net
```
{{< /tab >}}
{{< /tabs >}}

To upgrade an existing installation to the newest release, add the `--upgrade` flag:

```bash
python3 -m pip install --upgrade groupdocs-signature-net
```

{{< alert style="info" >}}
Using a [virtual environment](https://docs.python.org/3/library/venv.html) is recommended so the package and its dependencies stay isolated from your system Python. See the [Quick Start Guide]({{< ref "signature/python-net/getting-started/quick-start-guide.md" >}}) for the `venv` setup steps.
{{< /alert >}}

## Add the Package to `requirements.txt`

For reproducible builds, pin the version in your project's `requirements.txt`:

```text
groupdocs-signature-net==26.10.0
```

Then install every dependency at once:

```bash
python3 -m pip install -r requirements.txt
```

## Install from a Pre-Downloaded Wheel

In environments without access to PyPI (for example, an air-gapped CI runner or a locked-down server), download the wheel for your platform and install it from a local file.

Download the wheel that matches your operating system and CPU architecture from the [GroupDocs.Signature releases](https://releases.groupdocs.com/signature/python-net/) page:

| Platform | Wheel file name ends with | Oldest system |
| --- | --- | --- |
| Windows 64-bit | `py3-none-win_amd64.whl` | — |
| Linux x64 (glibc) | `py3-none-manylinux_2_27_x86_64.whl` | glibc 2.27 (Ubuntu 18.04, Debian 10, RHEL 8) |
| macOS Apple Silicon (M-series) | `py3-none-macosx_12_0_arm64.whl` | macOS 12 |
| macOS Intel | `py3-none-macosx_12_0_x86_64.whl` | macOS 12 |

Since 26.10 the file names state the oldest system each wheel runs on, so pip 20.3 or newer refuses an older one up front instead of installing a runtime that cannot start. Wheels up to 26.1 were tagged `manylinux1_x86_64`, `macosx_10_14_x86_64` and `macosx_11_0_arm64`, and included a 32-bit Windows wheel (`win32`); there is no 32-bit wheel any more, so use a 64-bit Python on Windows.

Install the downloaded file with `pip` (replace the file name with the wheel you downloaded):

{{< tabs "install-from-wheel">}}
{{< tab "Windows (64-bit)" >}}
```ps
py -m pip install .\groupdocs_signature_net-26.10.0-py3-none-win_amd64.whl
```
{{< /tab >}}
{{< tab "Linux (glibc)" >}}
```bash
python3 -m pip install ./groupdocs_signature_net-26.10.0-py3-none-manylinux_2_27_x86_64.whl
```
{{< /tab >}}
{{< tab "macOS (Apple Silicon)" >}}
```bash
python3 -m pip install ./groupdocs_signature_net-26.10.0-py3-none-macosx_12_0_arm64.whl
```
{{< /tab >}}
{{< tab "macOS (Intel)" >}}
```bash
python3 -m pip install ./groupdocs_signature_net-26.10.0-py3-none-macosx_12_0_x86_64.whl
```
{{< /tab >}}
{{< /tabs >}}

Name the wheel file explicitly: PowerShell does not expand a `*` wildcard for a native command, so `pip install groupdocs_signature_net-*.whl` fails there.

## Verify the Installation

Confirm the package is installed and importable:

```bash
python3 -c "from groupdocs.signature import Signature; print('GroupDocs.Signature is ready')"
```

You can also check the installed version with `pip`:

```bash
python3 -m pip show groupdocs-signature-net
```

## Next Steps

- Follow the [Quick Start Guide]({{< ref "signature/python-net/getting-started/quick-start-guide.md" >}}) to sign your first document.
- Clone the [examples repository](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET) and read [How to Run Examples]({{< ref "signature/python-net/getting-started/how-to-run-examples.md" >}}).
- Set up a [license]({{< ref "signature/python-net/licensing" >}}) to remove the evaluation limitations.
