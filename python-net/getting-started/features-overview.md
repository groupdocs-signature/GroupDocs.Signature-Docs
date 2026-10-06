---
id: features-overview
url: signature/python-net/features-overview
title: Features Overview
linkTitle: Features Overview
weight: 1
description: "Key features of GroupDocs.Signature for Python via .NET: sign documents with text, image, digital, barcode, QR code, stamp, form-field and metadata signatures; search, verify, update and delete them; generate previews; and run it all on-premise."
keywords: features, electronic signature, e-signature, digital signature, text signature, image signature, barcode signature, QR code signature, stamp signature, metadata signature, form field, verify signatures, python
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

## Overview

GroupDocs.Signature for Python via .NET adds, finds, verifies, updates, and removes electronic signatures in **PDF, Word, Excel, PowerPoint, OpenDocument, and image files**. It supports eight signature types, from a plain text label to a certificate-based digital signature, and works with all of them through one API: the `Signature` class and an options object per operation. It runs entirely on-premise, needs no Microsoft Office or Adobe Acrobat installation, and ships as a pre-built wheel for Windows, Linux, and macOS.

See the full list of [supported formats]({{< ref "signature/python-net/getting-started/supported-file-formats.md" >}}) or browse the [Developer Guide]({{< ref "signature/python-net/developer-guide/_index.md" >}}) for runnable examples of every feature.

## Signing Documents

Add a signature by passing a sign-options object to `Signature.sign()`. Each signature type has its own options class that controls the content, appearance, and position of the signature.

- [Text signature]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-text-signature.md" >}}): text labels, stamps, annotations, stickers, and watermarks, with fonts, colors, opacity, and borders. Text can also be rendered as an image.
- [Image signature]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature.md" >}}): a scanned handwritten signature or any picture, with rotation, transparency, and borders.
- [Digital signature]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature.md" >}}): certificate-based signatures for PDF, Word, Excel, and PowerPoint documents.
- [Barcode signature]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-barcode-signature.md" >}}): a wide range of barcode types, such as Code 128, EAN-13, and Codabar.
- [QR code signature]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-qr-code-signature.md" >}}): QR codes that carry text, links, emails, or phone numbers.
- [Stamp signature]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-stamp-signature.md" >}}): round or square stamp images built from lines of custom text, colors, and widths.
- [Form-field signature]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-form-field-signature.md" >}}): add form fields to PDF documents and fill existing ones.
- [Metadata signature]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/_index.md" >}}): hidden signatures stored in the document's metadata.
- [Multiple signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-multiple-signatures.md" >}}): several signatures of different types in one call.

## Searching for Signatures

List the signatures a document already carries. `Signature.search()` takes one search-options object per signature type and returns what it finds, with each signature's position, size, and content.

- [Search for signatures]({{< ref "signature/python-net/developer-guide/basic-usage/search-for-electronic-signatures-in-document/_index.md" >}}): text, image, digital, barcode, QR code, metadata, and form-field signatures, alone or [several types at once]({{< ref "signature/python-net/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-multiple-e-signature-types.md" >}}).

## Verifying Signatures

Check that a document carries the signatures you expect. `Signature.verify()` reports whether the document matches the given criteria, such as the text of a signature or the certificate of a digital signature.

- [Verify signatures]({{< ref "signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/_index.md" >}}): text, digital, barcode, and QR code signatures, alone or [several types at once]({{< ref "signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/verify-for-multiple-signatures.md" >}}).

## Updating and Deleting Signatures

Signatures found by a search can be changed and saved back to the document: moved, resized, or given new text. They can also be removed one by one, by type, or all at once.

- [Update signatures]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/_index.md" >}}): text, image, barcode, and QR code signatures.
- [Delete signatures]({{< ref "signature/python-net/developer-guide/basic-usage/delete-signatures-from-documents/_index.md" >}}): text, image, digital, barcode, and QR code signatures, or [every signature of a given type]({{< ref "signature/python-net/developer-guide/basic-usage/delete-signatures-from-documents/delete-signatures-of-the-certain-type.md" >}}).

## Previews and Document Information

Render pages to images to show users where a signature goes, and read basic facts about a document (file type, size, page count, and page sizes) to place signatures precisely.

- [Generate document pages preview]({{< ref "signature/python-net/developer-guide/basic-usage/generate-document-pages-preview.md" >}}): PNG, JPG, or BMP images of every page or of selected pages.
- [Generate signatures preview]({{< ref "signature/python-net/developer-guide/basic-usage/generate-signatures-preview.md" >}}): an image of a signature before it is added to a document.
- [Basic usage]({{< ref "signature/python-net/developer-guide/basic-usage/_index.md" >}}): read document information with `Signature.get_document_info()`.

{{< alert style="info" >}}
Without a license the library runs in evaluation mode: it processes documents of up to two pages, adds an evaluation line to every page it signs, and masks the values of found signatures. See [Evaluation Limitations and Licensing]({{< ref "signature/python-net/getting-started/evaluation-limitations-and-licensing.md" >}}).
{{< /alert >}}

## Practical Scenarios

Complete walkthroughs that combine several API calls:

- [Generate a barcode and sign a document]({{< ref "signature/python-net/developer-guide/basic-usage/signature-use-cases/how-to-generate-barcode-and-sign-document-using-python.md" >}})
- [Generate a QR code and sign a document]({{< ref "signature/python-net/developer-guide/basic-usage/signature-use-cases/how-to-generate-qrcode-and-sign-document-using-python.md" >}})
- [Sign Excel spreadsheets and their macros]({{< ref "signature/python-net/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python.md" >}})
- [Sign a password-protected PDF]({{< ref "signature/python-net/use-cases/sign-password-protected-pdf.md" >}})
- [Sign documents in a Linux container]({{< ref "signature/python-net/use-cases/signing-documents-linux-container-fonts.md" >}})

## AI and LLM Integration

The `groupdocs-signature-net` pip package ships an `AGENTS.md` file inside the wheel so that AI coding assistants can discover the API surface automatically, and GroupDocs runs a public [MCP server](https://docs.groupdocs.com/mcp) for on-demand documentation lookups. See [Agents and LLM Integration]({{< ref "signature/python-net/agents-and-llm-integration.md" >}}).

## On-Premise Deployment

No cloud calls and no outbound network traffic: documents never leave your environment. The wheel bundles the .NET runtime it needs, so nothing else is required on Windows. Linux and macOS need a few system packages; see [System Requirements]({{< ref "signature/python-net/getting-started/system-requirements.md" >}}) and [Running in Docker]({{< ref "signature/python-net/getting-started/running-in-docker.md" >}}).
