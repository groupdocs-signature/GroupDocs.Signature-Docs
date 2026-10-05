---
id: how-to-run-examples
url: signature/python-net/how-to-run-examples
title: How to Run Examples
linkTitle: How to Run Examples
weight: 3
description: "Clone the GitHub examples repository, install dependencies into a virtual environment, optionally apply a license, and run every documented GroupDocs.Signature example: locally, inside Docker, or on GitHub Actions."
keywords: run examples, examples repository, github, docker, dockerfile, CI, GitHub Actions, venv, virtual environment, run_all_examples, GROUPDOCS_LIC_PATH, GroupDocs.Signature, python
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

Every code example shown on this documentation site is also available in runnable form in the [GroupDocs.Signature-for-Python-via-.NET](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET) repository on GitHub. Each example comes with its input sample files, so you can clone the repository and run any of them with a single command.

## Prerequisites

Before running the examples, make sure you have:

1. **A supported platform and Python version.** See [System Requirements]({{< ref "signature/python-net/system-requirements" >}}). Windows, Linux, and macOS (Intel and Apple Silicon) are supported. Linux and macOS need a few system packages. The examples need Python 3.6 or newer.
2. **Git**, or download the repository as a ZIP from GitHub.
3. **A license file** (optional but recommended). Without one, the library runs in evaluation mode: documents of more than two pages are refused, signed pages carry an evaluation line, and found signatures report masked values, so verification fails. See [Licensing]({{< ref "signature/python-net/licensing" >}}) for how to obtain a free temporary license.

## Get the Code

Clone the repository and navigate into it:

```bash
git clone https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET.git
cd GroupDocs.Signature-for-Python-via-.NET
```

## Project Structure

The repository mirrors this documentation tree. Every documentation page maps to a folder under `Examples/`, and every tabbed code example on a page maps to a `.py` file inside that folder. Input sample files live next to the script that reads them.

```md
📂 GroupDocs.Signature-for-Python-via-.NET
├── README.md
├── LICENSE
├── AGENTS.md                          ← extracted from the pip package for AI tools
├── Dockerfile                         ← runs the whole suite on Linux
├── .github/workflows/run-examples.yml ← CI: runs all examples on every push
└── Examples
    ├── requirements.txt
    ├── run_all_examples.py
    ├── getting-started
    │   └── quick-start-guide
    │       ├── sign_pdf_with_text_signature.py
    │       ├── search_document_for_signatures.py
    │       ├── verify_text_signature.py
    │       ├── sample.pdf
    │       └── signed.pdf
    ├── developer-guide
    │   └── basic-usage
    │       ├── electronic-signature-types/            (text, image, barcode, QR code, stamp, digital, form-field, metadata)
    │       ├── search-for-electronic-signatures-in-document/
    │       ├── verify-document-for-signatures/
    │       ├── update-signatures-in-documents/
    │       ├── delete-signatures-from-documents/
    │       ├── generate-document-pages-preview/
    │       ├── generate-signatures-preview/
    │       └── signature-use-cases/
    ├── use-cases
    │   ├── sign-password-protected-pdf/
    │   └── signing-documents-linux-container-fonts/
    └── licensing
        ├── set_license_from_file.py
        ├── set_license_from_stream.py
        └── set_metered_license.py
```

## Setup

1. **Create and activate a virtual environment**:

   Create:

   {{< tabs "venv-create">}}
   {{< tab "Windows" >}}
   ```ps
   py -m venv .venv
   ```
   {{< /tab >}}
   {{< tab "Linux" >}}
   ```bash
   python3 -m venv .venv
   ```
   {{< /tab >}}
   {{< tab "macOS" >}}
   ```bash
   python3 -m venv .venv
   ```
   {{< /tab >}}
   {{< /tabs >}}

   Activate:

   {{< tabs "venv-activate">}}
   {{< tab "Windows" >}}
   ```ps
   .venv\Scripts\activate
   ```
   {{< /tab >}}
   {{< tab "Linux" >}}
   ```bash
   source .venv/bin/activate
   ```
   {{< /tab >}}
   {{< tab "macOS" >}}
   ```bash
   source .venv/bin/activate
   ```
   {{< /tab >}}
   {{< /tabs >}}

2. **Install dependencies** from `Examples/requirements.txt`:

   {{< tabs "install-deps">}}
   {{< tab "Windows" >}}
   ```ps
   py -m pip install -r Examples/requirements.txt
   ```
   {{< /tab >}}
   {{< tab "Linux" >}}
   ```bash
   python3 -m pip install -r Examples/requirements.txt
   ```
   {{< /tab >}}
   {{< tab "macOS" >}}
   ```bash
   python3 -m pip install -r Examples/requirements.txt
   ```
   {{< /tab >}}
   {{< /tabs >}}

3. **Configure a license** (optional). The suite honours the `GROUPDOCS_LIC_PATH` environment variable. Set it in your shell before running `run_all_examples.py`:

   {{< tabs "license-env">}}
   {{< tab "Windows (PowerShell)" >}}
   ```ps
   $env:GROUPDOCS_LIC_PATH = "C:\path\to\GroupDocs.Signature.lic"
   ```
   {{< /tab >}}
   {{< tab "Linux" >}}
   ```bash
   export GROUPDOCS_LIC_PATH="/path/to/GroupDocs.Signature.lic"
   ```
   {{< /tab >}}
   {{< tab "macOS" >}}
   ```bash
   export GROUPDOCS_LIC_PATH="/path/to/GroupDocs.Signature.lic"
   ```
   {{< /tab >}}
   {{< /tabs >}}

   {{< alert style="info" >}}
   Learn more about licensing, evaluation limits, and how to obtain a free 30-day temporary license in the [Licensing]({{< ref "signature/python-net/licensing" >}}) topic.
   {{< /alert >}}

## Run the Examples

### Run the Full Suite

From the repository root, run `run_all_examples.py`. It runs every example in its own process, prints a status line per file, and ends with a pass/fail summary. Without a license, an example that hits an evaluation limit, such as a sample document of more than two pages, prints a note instead of failing.

{{< tabs "run-all">}}
{{< tab "Windows" >}}
```ps
py Examples\run_all_examples.py
```
{{< /tab >}}
{{< tab "Linux" >}}
```bash
python3 Examples/run_all_examples.py
```
{{< /tab >}}
{{< tab "macOS" >}}
```bash
python3 Examples/run_all_examples.py
```
{{< /tab >}}
{{< /tabs >}}

### Run a Single Example

Change into the folder that contains the script and run it directly. Input sample files live next to each script, so relative paths resolve correctly.

```bash
cd Examples/getting-started/quick-start-guide
python sign_pdf_with_text_signature.py
```

Examples that sign or change a document write the result into the same folder as the script. Where an example is documented on this site, the result it produces is also linked from an output tab next to the code; click it to download the file.

## Run with Docker

The repository includes a `Dockerfile` based on `python:3.13-slim`. It installs the system packages the library needs on Linux (ICU, fontconfig, `libgdiplus` and the Microsoft core fonts) and every Python dependency, then runs the full suite. Use it when you want a clean, reproducible Linux environment without touching your host machine:

```bash
docker build -t groupdocs-signature-examples .
docker run --rm \
    -e GROUPDOCS_LIC_PATH=/license/GroupDocs.Signature.lic \
    -v /path/to/your/license:/license:ro \
    groupdocs-signature-examples
```

Drop the `-e` and `-v` flags to run in evaluation mode. On Windows with Git Bash, run `export MSYS_NO_PATHCONV=1` first so that the mounted license path is not rewritten.

## Continuous Integration

Every push triggers `.github/workflows/run-examples.yml`, which installs the same system packages and runs the entire example suite on `ubuntu-latest` with Python 3.13. Fork the repository and open a pull request: the workflow runs for free on GitHub-hosted runners and is a quick way to check local changes in a clean environment.

## Troubleshooting

- **"The type initializer for 'Gdip' threw an exception"** on Linux or macOS: install `libgdiplus` (Linux) or `mono-libgdiplus` (macOS). Stamp signatures, text rendered as an image, barcode, QR code and image signatures with a border or transparency, signatures on PowerPoint and image files, and signature previews need it. See [System Requirements]({{< ref "signature/python-net/system-requirements" >}}).
- **"Font Times New Roman was not found"** or **"Font Arial was not found"** on Linux: install the Microsoft core fonts (`ttf-mscorefonts-installer`).
- **"Couldn't find a valid ICU package"**, with the Python process ending abruptly: install ICU (`libicu-dev` on Debian and Ubuntu).
- **"The number of pages cannot exceed 2 in a trial version"**, or searches that report an evaluation notice instead of the signature's text: you are running unlicensed. Set `GROUPDOCS_LIC_PATH` to a valid license file and re-run. See [Licensing]({{< ref "signature/python-net/licensing" >}}).
- **Anything else**: post on the [free support forum](https://forum.groupdocs.com/c/signature) or visit the [Technical Support]({{< ref "signature/python-net/technical-support" >}}) page.

## Contribute

If you would like to add or improve an example, we encourage you to contribute. All examples in this repository are open source and can be freely used in your own applications. Fork the repository, edit the example, and create a pull request; we will review the changes and include them if found helpful.
