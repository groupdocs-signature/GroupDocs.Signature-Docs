---
id: features-overview
url: signature/python-net/features-overview
title: Features Overview
linkTitle: 🛠️ Features Overview
weight: 1
description: "Electronic Signature is an abstract concept that means data in electronic form associated with a certain document and expressing the consent of the signatory with the information contained in the document."
keywords: Electronic Signature, image signatures, Digital signatures, QR-code signatures, Python signature
productName: GroupDocs.Signature for Python via .NET
hideChildren: False 
toc: True
---
## Electronic signature

**Electronic Signature** is an abstract concept that means data in electronic form associated with a certain document and expressing the consent of the signatory with the information contained in the document.
GroupDocs.Signature provides various electronic signature implementations as follows:

* Native text signatures as text stamps, text labels, annotation, stickers, watermarks with big amount of settings for visualization effects, opacity, colors, fonts, etc.;
* Text as image signatures with big scope of additional options to specify how text will look, colors, and extra image effects;
* Image signatures with options to specify extra image effects, rotation etc.;
* Digital signatures based on digital certificate files, for PDF, Microsoft Word, Microsoft Excel and Microsoft PowerPoint documents;
* Barcode/QR-code signatures with variety of options;
* Generated stamp looking image signatures based on predefined lines with custom text, colors, width, etc;
* Metadata signatures to keep hidden signatures inside the document;
* Form-field signatures.

Signing documents in Python with our electronic signature (eSign) API is easy, reliable and secure. Here's a simple example of how to add a text signature:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions

with Signature("sample.pdf") as signature:
    # Create text signature options
    options = TextSignOptions("John Smith")
    options.left = 100
    options.top = 100

    # Sign the document and save the result to a new file
    signature.sign("signed.pdf", options)
```

## Search for signatures

Obtain signatures list applied to document:

* Text signatures information from all supported formats;
* Image signatures information;
* Digital signatures information from PDF, Microsoft Word, Microsoft Excel and Microsoft PowerPoint documents;
* Barcode/QR-code signatures information from all supported formats;
* Metadata signatures information from all supported formats;
* Form-field signatures information from all supported formats.

Example of searching for signatures:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSearchOptions

with Signature("signed.pdf") as signature:
    # Pass a list of search options, one per signature type to look for
    result = signature.search([TextSearchOptions()])
    for text_signature in result.signatures:
        print(f"Found text signature: {text_signature.text}")
```

## Verify signatures

Determine whether document contains signatures that meet the specified criteria.
Supported signature types are:

* Text signatures;
* Digital signatures;
* Barcode/QR-code signatures;
* Metadata signatures;
* Form-field signatures.

Example of verifying signatures:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalVerifyOptions

with Signature("signed.pdf") as signature:
    # Verify the document's digital signatures against a certificate
    options = DigitalVerifyOptions("certificate.pfx")
    options.password = "1234567890"
    result = signature.verify(options)
    print(f"Verification result: {result.is_valid}")
```

## Update and delete signatures

Signatures found by a search can be changed and saved back to the document: moved, resized, or given new text. They can also be removed, one by one, by type, or all at once. See [Update signatures in documents]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/_index.md" >}}) and [Delete signatures from documents]({{< ref "signature/python-net/developer-guide/basic-usage/delete-signatures-from-documents/_index.md" >}}).

## Document information extraction

GroupDocs.Signature allows to obtain basic information about source document - file type, size, pages count, page height and width etc.  
This may be quite useful for generating document preview and precise signature placing inside document.

Example of getting document information:

```python
from groupdocs.signature import Signature

with Signature("sample.pdf") as signature:
    info = signature.get_document_info()
    print(f"File type: {info.file_type.file_format}")
    print(f"Pages count: {info.page_count}")
    print(f"File size: {info.size} bytes")
    for page in info.pages:
        # page_number is 0-based here: 0 is the first page
        print(f"Page {page.page_number}: {page.width} x {page.height}")
```

## Preview document pages

Document preview feature allows to generate image representations of document pages. This may be helpful for better understanding about document content and its structure,  
set proper signature position inside document, apply appropriate signature styling etc. Preview can be generated for all document pages (by default) or for specific page numbers or page range.

Supported image formats for document preview are:

* PNG;
* JPG;
* BMP.

The library asks your code for a stream to write each page into, and hands the stream back when the page is done. Page numbers in previews are 0-based: `page_data.page_number` is 0 for the first page.

Example of generating document preview:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import PreviewOptions


def create_page_stream(page_data):
    # Called once per page; return a writable binary stream
    return open(f"preview_page_{page_data.page_number}.png", "wb")


def release_page_stream(page_data, stream):
    # Called when the page is written; receives the stream returned above
    stream.close()


with Signature("sample.pdf") as signature:
    options = PreviewOptions(create_page_stream, release_page_stream)
    options.page_numbers = [0, 1]  # the first two pages
    signature.generate_preview(options)
```
