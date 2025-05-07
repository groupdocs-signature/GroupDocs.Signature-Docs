---
id: electronic-signature-types
url: signature/python-net/electronic-signature-types
title: Electronic Signature Types
weight: 3
description: "This documentation section describes different types of signatures implemented for signing, updating, deleting, searching and verifying with GroupDocs.Signature for Python"
keywords: text signature, image signature, digital signature, stamp signature, barcode signature, qr-code signatures, form-field signature, metadata signature, python signature examples
productName: GroupDocs.Signature for Python
hideChildren: False
structuredData:
    showOrganization: True
---
[**GroupDocs.Signature for Python**](https://products.groupdocs.com/signature/python) supports a wide range of electronic signature types that are listed below:

* Barcode signatures
* Digital signatures based on certificate files
* Form-field signatures
* Image signatures
* Metadata signatures
* QR-code signatures
* Stamp signatures
* Text signatures

## Basic Usage Example

Here's a simple example showing how to add a text signature to a document using Python:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSignOptions
import groupdocs.signature.domain as gsd
import sys 
import os

def run():
    with signature.Signature("./sample.pdf") as sign:
        # Create text signature options
        text_options = TextSignOptions("John Smith")
        
        # Set text signature position
        text_options.left = 100
        text_options.top = 100
        
        # Set text signature font
        text_options.font = gsd.SignatureFont()
        text_options.font.size = 20
        text_options.font.family_name = "Arial"
        text_options.font.bold = True
        text_options.font.color = gsd.Color.BLUE
        
        # Sign document
        sign.sign("./SampleSigned.pdf", text_options)
```

## Supported Signature Types

The following articles contain detailed examples of how to eSign documents with each supported signature type:

1. [Text Signatures](esign-document-with-text-signature.md) - Add text-based signatures with customizable fonts and styles
2. [Image Signatures](esign-document-with-image-signature.md) - Insert image-based signatures from files or streams
3. [Digital Signatures](esign-document-with-digital-signature.md) - Apply secure digital signatures using certificates
4. [Barcode Signatures](esign-document-with-barcode-signature.md) - Add various types of barcodes as signatures
5. [QR-Code Signatures](esign-document-with-qr-code-signature.md) - Insert QR codes with custom data
6. [Stamp Signatures](esign-document-with-stamp-signature.md) - Apply stamp-like signatures with custom appearance
7. [Form Field Signatures](esign-document-with-form-field-signature.md) - Sign form fields in documents
8. [Metadata Signatures](esign-document-with-metadata-signature.md) - Add metadata information as signatures

Each signature type supports various customization options and can be used in combination with other signature types to create complex document signing solutions.

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python)
* [Document Signature for Python Web API Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-Web-API)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
