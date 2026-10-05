---
id: quick-start-guide
url: signature/python-net/getting-started/quick-start-guide
title: Quick Start Guide
linkTitle: Quick Start Guide
second_title: A simple example of how to use GroupDocs.Signature for Python via .NET
weight: 2
keywords: quick start, hello world, get started, sign pdf, text signature, search signatures, verify signatures, pip install, venv, virtual environment, GroupDocs.Signature, python
description: "Set up a virtual environment, install groupdocs-signature-net, and run three minimal examples: sign a PDF with a text signature, search it for signatures, and verify them."
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

This guide gives a quick overview of how to set up and start using GroupDocs.Signature for Python via .NET. The library adds, finds, verifies, updates and removes electronic signatures in PDF, Word, Excel, PowerPoint, OpenDocument and image files with a few lines of code.

## Prerequisites

To proceed, make sure you have:

1. A configured environment as described in the [System Requirements]({{< ref "signature/python-net/system-requirements" >}}) topic. On Linux and macOS this includes a few system packages.
2. Optionally, a [Temporary License](https://purchase.groupdocs.com/temporary-license/) to test all the product features. Without a license the library works in evaluation mode: it processes documents of up to two pages and adds an evaluation line to every page it signs. See [Licensing]({{< ref "signature/python-net/licensing" >}}).

## Set Up Your Development Environment

For best practices, use a virtual environment to manage dependencies. Learn more in the [Create and Use Virtual Environments](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#create-and-use-virtual-environments) guide.

### Create and Activate a Virtual Environment

Create a virtual environment:

{{< tabs "create-venv">}}
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

Activate it:

{{< tabs "activate-venv">}}
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

### Install the `groupdocs-signature-net` Package

{{< tabs "install-package">}}
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

See [Installation]({{< ref "signature/python-net/getting-started/installation.md" >}}) for pinning a version and for installing without access to PyPI.

## Example 1: Sign a PDF with a Text Signature

Open a document, describe the signature with [TextSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions/), and save the signed copy.

{{< tabs "sign_pdf_with_text_signature">}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions


def sign_pdf_with_text_signature():
    # Open the document; the with-block releases the file when it ends
    with Signature("sample.pdf") as signature:
        # A text signature 100 pixels from the left and top edges of the first page
        options = TextSignOptions("John Smith")
        options.left = 100
        options.top = 100

        # Sign and save the result to a new file; the source stays unchanged
        result = signature.sign("signed_sample.pdf", options)
        print(f"Signatures added: {len(result.succeeded)}")


if __name__ == "__main__":
    sign_pdf_with_text_signature()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/getting-started/quick-start-guide/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_sample.pdf" >}}  
```text
Binary file (PDF, 125 KB)
```
[Download full output](/signature/python-net/_output_files/getting-started/quick-start-guide/sign_pdf_with_text_signature/signed_sample.pdf)
{{< /tab >}}
{{< /tabs >}}

## Example 2: Search a Document for Signatures

Find the signatures a document already carries. `search` takes a list of search options, one per signature type to look for, and returns them in `result.signatures`.

{{< tabs "search_document_for_signatures">}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSearchOptions


def search_document_for_signatures():
    with Signature("signed.pdf") as signature:
        # Look for text signatures on every page
        result = signature.search([TextSearchOptions()])
        for found in result.signatures:
            print(f"Text signature '{found.text}' on page {found.page_number}")


if __name__ == "__main__":
    search_document_for_signatures()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/getting-started/quick-start-guide/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-document-signatures.txt" >}}  
```text
Text signature 'John Smith' on page 1
```
[Download full output](/signature/python-net/_output_files/getting-started/quick-start-guide/search_document_for_signatures/search-document-signatures.txt)
{{< /tab >}}
{{< /tabs >}}

## Example 3: Verify a Signature

Check that a document carries the signature you expect. Verification succeeds when a text signature with exactly this text is found.

{{< tabs "verify_text_signature">}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextVerifyOptions


def verify_text_signature():
    with Signature("signed.pdf") as signature:
        options = TextVerifyOptions("John Smith")
        result = signature.verify(options)
        print(f"Document is signed by John Smith: {result.is_valid}")


if __name__ == "__main__":
    verify_text_signature()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/getting-started/quick-start-guide/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-text-signature.txt" >}}  
```text
Document is signed by John Smith: True
```
[Download full output](/signature/python-net/_output_files/getting-started/quick-start-guide/verify_text_signature/verify-text-signature.txt)
{{< /tab >}}
{{< /tabs >}}

## Run the Examples

Save each example to its own `.py` file next to the sample files. Your folder should look similar to this:

```Directory
📂 demo-app
 ├──sign_pdf_with_text_signature.py
 ├──search_document_for_signatures.py
 ├──verify_text_signature.py
 ├──sample.pdf
 └──signed.pdf
```

Run an example from that folder:

{{< tabs "run-the-app">}}
{{< tab "Windows" >}}
```ps
py sign_pdf_with_text_signature.py
```
{{< /tab >}}
{{< tab "Linux" >}}
```bash
python3 sign_pdf_with_text_signature.py
```
{{< /tab >}}
{{< tab "macOS" >}}
```bash
python3 sign_pdf_with_text_signature.py
```
{{< /tab >}}
{{< /tabs >}}

When you are done, deactivate the virtual environment by running `deactivate` or closing your shell.

## Apply a License

Set the `GROUPDOCS_LIC_PATH` environment variable to the full path of your license file, and the license is applied automatically when `groupdocs.signature` is imported. No code is needed. Alternatively, apply it in code once, before any other call:

```python
from groupdocs.signature import License

License().set_license("/path/to/GroupDocs.Signature.lic")
```

The [Licensing]({{< ref "signature/python-net/licensing" >}}) topic covers both ways and the metered license.

## Next Steps

After completing the basics, explore additional resources:
- [Developer Guide]({{< ref "signature/python-net/developer-guide/_index.md" >}}): runnable examples for every signature type and operation.
- [Supported File Formats]({{< ref "signature/python-net/supported-file-formats" >}}): review the full list of supported file types.
- [Licensing]({{< ref "signature/python-net/licensing" >}}): details on licensing and evaluation.
- [Technical Support]({{< ref "signature/python-net/technical-support" >}}): contact support if you run into issues.
