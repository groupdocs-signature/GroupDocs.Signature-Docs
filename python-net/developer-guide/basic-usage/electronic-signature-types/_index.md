---
id: electronic-signature-types
url: signature/python-net/electronic-signature-types
title: Electronic Signature Types
linktitle: Electronic Signature Types
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
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions
from groupdocs.signature.domain import SignatureFont
from groupdocs.pydrawing import Color


def sign_with_text():
    with Signature("sample.pdf") as signature:
        # Create text signature options
        options = TextSignOptions("John Smith")

        # Set text signature position and size
        options.left = 100
        options.top = 100
        options.width = 200
        options.height = 50

        # Set text signature font and color
        font = SignatureFont()
        font.family_name = "Arial"
        font.size = 20
        font.bold = True
        options.font = font
        options.fore_color = Color.blue

        # Sign the document and save the result
        result = signature.sign("signed.pdf", options)
        print(f"Signed with {len(result.succeeded)} signature(s)")


if __name__ == "__main__":
    sign_with_text()
```

## Supported Signature Types

The following articles contain detailed examples of how to eSign documents with each supported signature type:

1. [Text Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-text-signature.md" >}}) - Add text-based signatures with customizable fonts and styles
2. [Image Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature.md" >}}) - Insert image-based signatures from files or streams
3. [Digital Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature.md" >}}) - Apply secure digital signatures using certificates
4. [Barcode Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-barcode-signature.md" >}}) - Add various types of barcodes as signatures
5. [QR-Code Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-qr-code-signature.md" >}}) - Insert QR codes with custom data
6. [Stamp Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-stamp-signature.md" >}}) - Apply stamp-like signatures with custom appearance
7. [Form Field Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-form-field-signature.md" >}}) - Add form fields to PDF documents and fill existing ones
8. [Metadata Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/_index.md" >}}) - Add metadata information as signatures
9. [Multiple Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-multiple-signatures.md" >}}) - Sign a document with several signatures of different types at once

Each signature type supports various customization options and can be used in combination with other signature types to create complex document signing solutions.

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python)


### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
