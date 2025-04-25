---
id: esign-document-with-multiple-signatures
url: signature/python-net/esign-document-with-multiple-signatures
title: eSign Document with Multiple Signatures
linkTitle: Multiple Types eSign
weight: 9
description: "This article explains how to sign a document with multiple signatures of various types by GroupDocs.Signature for Python via .NET API"
keywords: multiple signatures, sign document, how to sign document with multiple signatures, python multiple signatures
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Documents signing with multiple signatures in Python    
        description: Sign documents with many signatures simultaneously and Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to sign any documents with various signatures simultaneously using Python 
        description: Learn all about signing a document by using multiple signatures and Python
        steps:
        - name: Load file which is planned to be signed
          text: Create the Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Instantiate and set up BarcodeSignOptions, QrCodeSignOptions and DigitalSignOptions objects and add them to the List.
        - name: Sign the source file with form fields and save the result 
          text: Invoke the Sign method with signing options and output file path or stream.
---
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) allows signing a document with several signatures simultaneously and even apply signatures of different types to the same document.

Doing this is as simple as:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path or stream as a constructor parameter.
* Instantiate all required sign options objects depending on signature type:
    * [BarcodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesignoptions) - for Barcode signatures;
    * [DigitalSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/) - for Digital signatures;
    * [FormFieldSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsignoptions) - for Form-field signatures;
    * [ImageSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesignoptions) - for Image signatures;
    * [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) - for Metadata signatures;
    * [QrCodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesignoptions) - for QR-code signatures
    * [StampSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/stampsignoptions) - for Stamp signatures;
    * [TextSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions) - for Text signatures.
* Fill the collection with sign options from the previous step.  
* Call the [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the collection of sign options to it.

This code snippet below demonstrates how to eSign a PDF document with multiple signatures at the same time using Python:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSignOptions, BarcodeSignOptions, QrCodeSignOptions, DigitalSignOptions
from groupdocs.signature.domain import BarcodeTypes, QrCodeTypes

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Define text signature options
    text_options = TextSignOptions("This is test message")
    text_options.vertical_alignment = signature.VerticalAlignment.TOP
    text_options.horizontal_alignment = signature.HorizontalAlignment.LEFT
    
    # Define barcode signature options
    barcode_options = BarcodeSignOptions("123456")
    barcode_options.encode_type = BarcodeTypes.CODE_128
    barcode_options.left = 100
    barcode_options.top = 100
    
    # Define QR code signature options
    qrcode_options = QrCodeSignOptions("JohnSmith")
    qrcode_options.encode_type = QrCodeTypes.QR
    qrcode_options.left = 100
    qrcode_options.top = 200
    
    # Define digital signature options
    digital_options = DigitalSignOptions("certificate.pfx")
    digital_options.image_file_path = "signature.jpg"
    digital_options.vertical_alignment = signature.VerticalAlignment.CENTER
    digital_options.horizontal_alignment = signature.HorizontalAlignment.CENTER
    digital_options.password = "1234567890"
    
    # Define list of signature options
    list_options = [text_options, barcode_options, qrcode_options, digital_options]
    
    # Sign document
    sign.sign("signed.pdf", list_options)
```

### Advanced Multiple Signatures Example

Here's a more advanced example showing how to add multiple signatures with different styles and positions:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSignOptions, ImageSignOptions, QrCodeSignOptions
from groupdocs.signature.domain import QrCodeTypes

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create text signature options
    text_options = TextSignOptions("Approved by John Smith")
    text_options.font = signature.SignatureFont(size=20, family_name="Arial", bold=True)
    text_options.fore_color = signature.Color.BLUE
    text_options.vertical_alignment = signature.VerticalAlignment.TOP
    text_options.horizontal_alignment = signature.HorizontalAlignment.RIGHT
    text_options.margin = signature.Padding(10, 10, 0, 0)
    
    # Create image signature options
    image_options = ImageSignOptions("signature.jpg")
    image_options.width = 200
    image_options.height = 100
    image_options.vertical_alignment = signature.VerticalAlignment.BOTTOM
    image_options.horizontal_alignment = signature.HorizontalAlignment.LEFT
    image_options.margin = signature.Padding(0, 0, 10, 10)
    
    # Create QR code signature options
    qrcode_options = QrCodeSignOptions("https://www.example.com/verify")
    qrcode_options.encode_type = QrCodeTypes.QR
    qrcode_options.width = 100
    qrcode_options.height = 100
    qrcode_options.vertical_alignment = signature.VerticalAlignment.CENTER
    qrcode_options.horizontal_alignment = signature.HorizontalAlignment.CENTER
    
    # Define list of signature options
    list_options = [text_options, image_options, qrcode_options]
    
    # Sign document
    sign.sign("signed.pdf", list_options)
```

### Summary
This guide demonstrates how to apply multiple types of electronic signatures (e.g., text, barcode, image) to a document using [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net). It explains how to combine different signature types, configure each one, and save the signed document with multiple signature styles.

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/python-net/developer-guide/advanced-usage/_index.md" >}}).

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [Document Signature for Python Web API Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Web-API)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.