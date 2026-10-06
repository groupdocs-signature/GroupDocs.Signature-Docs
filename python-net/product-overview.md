---
id: product-overview
url: signature/python-net/product-overview
aliases:
    - /signature/python-net/introducing/
title: GroupDocs.Signature for Python via .NET Overview
linkTitle: Product overview
weight: 1
description: "GroupDocs.Signature for Python via .NET adds, searches, verifies, updates and deletes electronic signatures (text, image, digital, barcode, QR code, stamp, form-field and metadata) in PDF, Word, Excel, PowerPoint, OpenDocument and image files through one API."
keywords: electronic signature, e-signature, digital signature, sign pdf, text signature, image signature, barcode, QR code, stamp, metadata signature, verify signature, python, groupdocs-signature-net
productName: GroupDocs.Signature for Python via .NET
toc: True
---

## What is GroupDocs.Signature?

GroupDocs.Signature for Python via .NET is a native Python library that adds electronic signatures to **PDF, Word, Excel, PowerPoint, OpenDocument, and image files**, and finds, verifies, updates, and removes the signatures those files already carry. It supports eight signature types, from a visible text label to a certificate-based digital signature, and handles them all through one API: the `Signature` class and an options object per operation. It runs entirely on-premise, needs no Microsoft Office or Adobe Acrobat installation, and ships as a pre-built wheel for Windows, Linux, and macOS.

Typical uses include:

- **Approval and contract workflows**: stamp a name, a date, or an approval mark on documents as they move through a business process.
- **Certificate-based signing**: sign PDF, Word, Excel, and PowerPoint documents with a digital certificate, and check those signatures later.
- **Tracking and labelling**: put barcodes and QR codes on invoices, shipping documents, and forms so that they can be scanned and matched.
- **Inbound document checks**: search incoming documents for signatures and verify that they carry the ones you expect.
- **Hidden markers**: store metadata signatures inside a document for audit trails, without changing how it looks.
- **AI pipelines**: let an agent sign approved documents or report the signatures a document carries. See [Agents and LLM Integration]({{< ref "signature/python-net/agents-and-llm-integration.md" >}}).

With its API, you can:

*   Sign documents with text, image, digital, barcode, QR code, stamp, form-field, and metadata signatures.
*   Add several signatures of different types in a single call.
*   Customize how signatures look and where they appear: position, size, alignment, fonts, colors, borders, and transparency.
*   Search a document for existing signatures of one or several types.
*   Verify text, digital, barcode, and QR code signatures against the values you expect.
*   Update or delete signatures found by a search.
*   Read document information such as file type, size, page count, and page sizes.
*   Render document pages and signatures to images for previews.
*   Open password-protected documents.

GroupDocs.Signature runs on **Windows, Linux, and macOS** (Intel and Apple Silicon) with Python 3.5 to 3.14.

## Key Capabilities

| Capability | Description |
|---|---|
| **Sign documents** | Add [text, image, digital, barcode, QR code, stamp, form-field, and metadata signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/_index.md" >}}), one at a time or several at once. |
| **Search for signatures** | [Find the signatures a document carries]({{< ref "signature/python-net/developer-guide/basic-usage/search-for-electronic-signatures-in-document/_index.md" >}}), with their position, size, and content. |
| **Verify signatures** | [Check that a document carries the signatures you expect]({{< ref "signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/_index.md" >}}), including certificate-based digital signatures. |
| **Update and delete** | [Move, resize, or change]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/_index.md" >}}) existing signatures, or [remove them]({{< ref "signature/python-net/developer-guide/basic-usage/delete-signatures-from-documents/_index.md" >}}) one by one or by type. |
| **Previews** | Render [document pages]({{< ref "signature/python-net/developer-guide/basic-usage/generate-document-pages-preview.md" >}}) and [signatures]({{< ref "signature/python-net/developer-guide/basic-usage/generate-signatures-preview.md" >}}) to images. |
| **Protected documents** | [Sign password-protected PDF files]({{< ref "signature/python-net/use-cases/sign-password-protected-pdf.md" >}}). |
| **One API for every format** | The same code signs [PDF, Word, Excel, PowerPoint, OpenDocument, and image files]({{< ref "signature/python-net/getting-started/supported-file-formats.md" >}}); the library detects the format from the file. |
| **On-premise** | No cloud calls and no network traffic: documents never leave your environment. |

## Quick Example

{{< tabs "quick-example">}}
{{< tab "Sign a document" >}}
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
{{< tab "Verify a signature" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextVerifyOptions


def verify_text_signature():
    with Signature("signed.pdf") as signature:
        # Verification succeeds when a text signature with exactly this text is found
        options = TextVerifyOptions("John Smith")
        result = signature.verify(options)
        print(f"Document is signed by John Smith: {result.is_valid}")


if __name__ == "__main__":
    verify_text_signature()
```
{{< /tab >}}
{{< /tabs >}}

## Where to Next

1. **Install the package**: [Installation]({{< ref "signature/python-net/getting-started/installation.md" >}}) covers PyPI and offline wheel installation for Windows, Linux, and macOS.
2. **Run your first example**: the [Quick Start Guide]({{< ref "signature/python-net/getting-started/quick-start-guide.md" >}}) signs, searches, and verifies a PDF in a few minutes.
3. **Explore the examples**: [How to Run Examples]({{< ref "signature/python-net/getting-started/how-to-run-examples.md" >}}) clones the runnable repository and runs every documented scenario locally or in Docker.
4. **Use it in depth**: the [Developer Guide]({{< ref "signature/python-net/developer-guide/_index.md" >}}) covers every signature type and operation.
5. **Plug it into AI pipelines**: [Agents and LLM Integration]({{< ref "signature/python-net/agents-and-llm-integration.md" >}}) explains the MCP servers and the `AGENTS.md` shipped inside the wheel.

## Technical Support

If you encounter an issue while using GroupDocs.Signature or have a technical question, feel free to create a post in our [Free Support Forum](https://forum.groupdocs.com/c/signature). If free support is not sufficient, you can submit a ticket to our [Paid Support Helpdesk](https://helpdesk.groupdocs.com/).
