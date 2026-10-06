---
id: esign-document-with-multiple-signatures
url: signature/python-net/esign-document-with-multiple-signatures
title:  eSign Document with Multiple Signatures
linktitle: Multiple Types eSign
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
        - name: Sign the source file and save the result 
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

{{< tabs "sign_with_multiple_signatures" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import (
    BarcodeSignOptions, DigitalSignOptions, QrCodeSignOptions, TextSignOptions)
from groupdocs.signature.domain import BarcodeTypes, QrCodeTypes


def sign_with_multiple_signatures():
    with Signature("sample.pdf") as signature:
        # Define text signature options
        text_options = TextSignOptions("This is test message")
        text_options.left = 100
        text_options.top = 360
        text_options.width = 200
        text_options.height = 30

        # Define barcode signature options
        barcode_options = BarcodeSignOptions("123456")
        barcode_options.encode_type = BarcodeTypes.CODE128
        barcode_options.left = 100
        barcode_options.top = 420
        barcode_options.width = 200
        barcode_options.height = 60

        # Define QR code signature options
        qrcode_options = QrCodeSignOptions("JohnSmith")
        qrcode_options.encode_type = QrCodeTypes.QR
        qrcode_options.left = 100
        qrcode_options.top = 520
        qrcode_options.width = 100
        qrcode_options.height = 100

        # Define digital signature options with a certificate and an appearance image
        digital_options = DigitalSignOptions("certificate.pfx")
        digital_options.password = "1234567890"
        digital_options.image_file_path = "signature.jpg"
        digital_options.left = 350
        digital_options.top = 520
        digital_options.width = 160
        digital_options.height = 100

        # Sign the document with the list of signature options
        list_options = [text_options, barcode_options, qrcode_options, digital_options]
        result = signature.sign("signed_multiple.pdf", list_options)
        print(f"Signed with {len(result.succeeded)} signatures:")
        for item in result.succeeded:
            print(f"  {item.signature_type.name}")


if __name__ == "__main__":
    sign_with_multiple_signatures()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-multiple-signatures/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample certificate used in this example (password `1234567890`). Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-multiple-signatures/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signature.jpg" >}}
{{< tab-text >}}
`signature.jpg` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-multiple-signatures/signature.jpg) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_multiple.pdf" >}}  
```text
Binary file (PDF, 740 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-multiple-signatures/sign_with_multiple_signatures/signed_multiple.pdf)
{{< /tab >}}
{{< /tabs >}}

### Advanced Multiple Signatures Example

Here's a more advanced example showing how to add multiple signatures with different styles and positions. Each signature is placed with an alignment and a margin from the page edges:

{{< tabs "sign_with_multiple_signatures_advanced" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import ImageSignOptions, QrCodeSignOptions, TextSignOptions
from groupdocs.signature.domain import (
    HorizontalAlignment, Padding, QrCodeTypes, SignatureFont, VerticalAlignment)


def sign_with_multiple_signatures_advanced():
    with Signature("sample.pdf") as signature:
        # Bold text signature at the top right, below the page header
        text_options = TextSignOptions("Approved by John Smith")
        font = SignatureFont()
        font.family_name = "Arial"
        font.size = 20
        font.bold = True
        text_options.font = font
        text_options.width = 280
        text_options.height = 40
        text_options.vertical_alignment = VerticalAlignment.TOP
        text_options.horizontal_alignment = HorizontalAlignment.RIGHT
        text_options.margin = Padding(top=170, right=20)

        # Stamp image in the bottom left corner
        image_options = ImageSignOptions("stamp.png")
        image_options.width = 100
        image_options.height = 100
        image_options.vertical_alignment = VerticalAlignment.BOTTOM
        image_options.horizontal_alignment = HorizontalAlignment.LEFT
        image_options.margin = Padding(left=20, bottom=20)

        # QR code in the bottom right corner
        qrcode_options = QrCodeSignOptions("https://www.example.com/verify")
        qrcode_options.encode_type = QrCodeTypes.QR
        qrcode_options.width = 100
        qrcode_options.height = 100
        qrcode_options.vertical_alignment = VerticalAlignment.BOTTOM
        qrcode_options.horizontal_alignment = HorizontalAlignment.RIGHT
        qrcode_options.margin = Padding(right=20, bottom=20)

        # Sign the document with the list of signature options
        list_options = [text_options, image_options, qrcode_options]
        result = signature.sign("signed_multiple_advanced.pdf", list_options)
        print(f"Signed with {len(result.succeeded)} signatures:")
        for item in result.succeeded:
            print(f"  {item.signature_type.name}")


if __name__ == "__main__":
    sign_with_multiple_signatures_advanced()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-multiple-signatures/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "stamp.png" >}}
{{< tab-text >}}
`stamp.png` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-multiple-signatures/stamp.png) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_multiple_advanced.pdf" >}}  
```text
Binary file (PDF, 178 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-multiple-signatures/sign_with_multiple_signatures_advanced/signed_multiple_advanced.pdf)
{{< /tab >}}
{{< /tabs >}}

### Summary
This guide demonstrates how to apply multiple types of electronic signatures (e.g., text, barcode, image) to a document using [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net). It explains how to combine different signature types, configure each one, and save the signed document with multiple signature styles.


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)


### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.