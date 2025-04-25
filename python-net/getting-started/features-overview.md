---
id: features-overview
url: signature/python-net/features-overview
title: Features Overview
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
* Digital signatures based on digital certificate files and ability to support digital signature by document type (PDF, Microsoft Word documents and Microsoft Excel spreadsheets);
* Barcode/QR-code signatures with variety of options;
* Generated stamp looking image signatures based on predefined lines with custom text, colors, width, etc;
* Metadata signatures to keep hidden signatures inside the document;
* Form-field signatures.

Signing documents in Python with our electronic signature (eSign) API is easy, reliable and secure. Here's a simple example of how to add a text signature:

```python
import groupdocs.signature as signature

# Initialize signature handler
signature_handler = signature.Signature("sample.pdf")

# Create text signature options
text_options = signature.TextSignOptions("John Smith")
text_options.set_left(100)
text_options.set_top(100)

# Sign document with text signature
signature_handler.sign("output.pdf", text_options)
```

## Search for signatures

Obtain signatures list applied to document:

* Text signatures information from all supported formats;
* Image signatures information;
* Digital signatures information from PDF, Microsoft Word documents and Microsoft Excel spreadsheets;
* Barcode/QR-code signatures information from all supported formats;
* Metadata signatures information from all supported formats;
* Form-field signatures information from all supported formats.

Example of searching for signatures:

```python
import groupdocs.signature as signature

# Initialize signature handler
signature_handler = signature.Signature("signed.pdf")

# Search for text signatures
text_signatures = signature_handler.search(signature.TextSearchOptions())
for text_signature in text_signatures:
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
import groupdocs.signature as signature

# Initialize signature handler
signature_handler = signature.Signature("signed.pdf")

# Verify digital signatures
verify_options = signature.DigitalVerifyOptions("certificate.pfx", "password")
verify_result = signature_handler.verify(verify_options)
print(f"Verification result: {verify_result.is_valid}")
```

## Document information extraction

GroupDocs.Signature allows to obtain basic information about source document - file type, size, pages count, page height and width etc.  
This may be quite useful for generating document preview and precise signature placing inside document.

Example of getting document information:

```python
import groupdocs.signature as signature

# Initialize signature handler
signature_handler = signature.Signature("sample.pdf")

# Get document info
document_info = signature_handler.get_document_info()
print(f"Pages count: {document_info.page_count}")
print(f"File size: {document_info.file_size} bytes")
```

## Preview document pages

Document preview feature allows to generate image representations of document pages. This may be helpful for better understanding about document content and its structure,  
set proper signature position inside document, apply appropriate signature styling etc. Preview can be generated for all document pages (by default) or for specific page numbers or page range.

Supported image formats for document preview are:

* PNG;
* JPG;
* BMP.

Example of generating document preview:

```python
import groupdocs.signature as signature

# Initialize signature handler
signature_handler = signature.Signature("sample.pdf")

# Create preview options
preview_options = signature.PreviewOptions(lambda page_number: f"preview_{page_number}.png")
preview_options.set_page_numbers([1, 2])  # Generate preview for pages 1 and 2

# Generate preview
signature_handler.generate_preview(preview_options)
```
