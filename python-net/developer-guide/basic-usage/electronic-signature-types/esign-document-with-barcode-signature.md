---
id: esign-document-with-barcode-signature
url: signature/python-net/esign-document-with-barcode-signature
title: eSign Document with Barcode Signature
linktitle: ✍️ Barcode Signature
weight: 1
description: "This article explains how to add Barcode signature on document page with various options like barcode type, barcode text, positioning, alignment and other visual settings with GroupDocs.Signature for Python via .NET"
keywords: barcode, barcode signature, GroupDocs.Signature barcode, GroupDocs.Signature barcode signature, python barcode signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Sign documents with Barcode and Python    
        description: Adding Barcode to any document page with Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to add Barcode to various documents with Python 
        description: Find out ways of signing documents with the Barcode using Python
        steps:
        - name: Load source document
          text: Creating Signature instance with file path or stream as a constructor parameter will load the document. 
        - name: Provide barcode options. 
          text: Set specific properties of the BarcodeSignOptions instance like a Barcode type, barcode text, and signature appearance settings.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed files using a file path or a stream.
---
## What is a Barcode?

A **barcode** or **bar code** is a way of presenting data in a visual, machine-readable form. Generally speaking, barcode is an image of a rectangular form that consists of parallel black lines and white spaces of different widths.  
Barcodes are used in various areas where quick identification is necessary - as part of the purchase process in retail stores, in warehouses to track inventory, and on invoices to assist in accounting, among many other uses.

![Barcode](/signature/python-net/images/esign-document-with-barcode-signature.gif)

Barcodes allow storing of product-related data like manufacturing and expiry dates, manufacturer name, country of origin, and product price. There are plenty of barcode types nowadays because different companies use different combinations of numbers and bars in their barcodes depending on their needs. From the document signature perspective, Barcode may contain different characters (letters, digits, or symbols) and may have various lengths and sizes depending on the type and settings to keep signature information, title, subject, or short encrypted data.  

## How to eSign Document with Barcode Signature

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) supports a wide range of Barcode types that can be used to create electronic signatures within the documents. Please refer to the [BarcodeTypes](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodetypes/#fields) description to get the full list of supported barcodes.  
To specify different options for Barcode signature GroupDocs.Signature for Python via .NET provides [BarcodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesignoptions) class. The main fields are:

* [encode_type](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesignoptions/encode_type) - specifies the Barcode type (AustralianPost, Codabar, EAN13, OPC, etc.);
* [text](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions/text) - specifies the Barcode text.

Here are the steps to eSign a document with the Barcode signature using GroupDocs.Signature for Python via .NET API:
* Create a new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [BarcodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesignoptions) object according to your requirements and specify the Barcode type by setting the [encode_type](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesignoptions/encode_type) property with one of the predefined supported types. Set the [text](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions/text) property value.
* Call the [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [BarcodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesignoptions) to it.

This example shows how to sign a PDF document with a Barcode signature using Python:

{{< tabs "sign_with_barcode_signature" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import BarcodeSignOptions
from groupdocs.signature.domain import BarcodeTypes


def sign_with_barcode_signature():
    with Signature("sample.pdf") as signature:
        # Create barcode signature options with the text to encode
        options = BarcodeSignOptions("John Smith")

        # Set the barcode type
        options.encode_type = BarcodeTypes.CODE128

        # Set barcode position and size
        options.left = 100
        options.top = 400
        options.width = 300
        options.height = 100

        # Sign the document and save the result
        result = signature.sign("signed_barcode.pdf", options)
        print(f"Signed with {len(result.succeeded)} barcode signature(s)")


if __name__ == "__main__":
    sign_with_barcode_signature()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-barcode-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_barcode.pdf" >}}  
```text
Binary file (PDF, 49 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-barcode-signature/sign_with_barcode_signature/signed_barcode.pdf)
{{< /tab >}}
{{< /tabs >}}

### Advanced Barcode Signature Options

You can customize the barcode signature further with additional options: alignment and margins, bar color, the position of the encoded text, inner margins, background, border and transparency:

{{< tabs "sign_with_barcode_signature_advanced" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import BarcodeSignOptions
from groupdocs.signature.domain import (
    Background, BarcodeTypes, Border, CodeTextAlignment, DashStyle,
    HorizontalAlignment, Padding, VerticalAlignment)
from groupdocs.pydrawing import Color


def sign_with_barcode_signature_advanced():
    with Signature("sample.pdf") as signature:
        # Pass the text and the barcode type to the constructor
        options = BarcodeSignOptions("JohnSmith", BarcodeTypes.CODE128)

        # Put the barcode in the bottom right corner of the page
        options.width = 220
        options.height = 80
        options.horizontal_alignment = HorizontalAlignment.RIGHT
        options.vertical_alignment = VerticalAlignment.BOTTOM
        options.margin = Padding(right=40, bottom=60)

        # Bar color, encoded text below the bars, space inside the border
        options.fore_color = Color.dark_blue
        options.code_text_alignment = CodeTextAlignment.BELOW
        options.inner_margins = Padding(5)

        # Background, border and transparency
        background = Background()
        background.color = Color.light_yellow
        options.background = background
        border = Border()
        border.color = Color.dark_blue
        border.dash_style = DashStyle.DASH
        border.weight = 2
        border.visible = True
        options.border = border
        options.transparency = 0.2

        result = signature.sign("signed_barcode_advanced.pdf", options)
        print(f"Signed with {len(result.succeeded)} barcode signature(s)")


if __name__ == "__main__":
    sign_with_barcode_signature_advanced()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-barcode-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_barcode_advanced.pdf" >}}  
```text
Binary file (PDF, 58 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-barcode-signature/sign_with_barcode_signature_advanced/signed_barcode_advanced.pdf)
{{< /tab >}}
{{< /tabs >}}

### Different Barcode Types

GroupDocs.Signature supports various barcode types. Each type accepts its own set of characters and lengths, so pick the text to match the type. This example signs a document with four barcodes of different types in one call:

{{< tabs "sign_with_different_barcode_types" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import BarcodeSignOptions
from groupdocs.signature.domain import BarcodeTypes


def sign_with_different_barcode_types():
    barcodes = [
        (BarcodeTypes.EAN13, "123456789012"),            # 12 digits, check digit added
        (BarcodeTypes.CODE39, "JOHN SMITH"),             # upper-case letters, digits
        (BarcodeTypes.CODE128, "John Smith"),            # any ASCII text
        (BarcodeTypes.PDF417, "John Smith, approved"),   # 2D barcode for longer text
    ]

    # One sign options object per barcode, placed one below another
    options_list = []
    for index, (encode_type, text) in enumerate(barcodes):
        options = BarcodeSignOptions(text, encode_type)
        options.left = 100
        options.top = 340 + index * 100
        options.width = 240
        options.height = 80
        options_list.append(options)

    with Signature("sample.pdf") as signature:
        result = signature.sign("signed_barcode_types.pdf", options_list)
        for barcode in result.succeeded:
            print(f"{barcode.encode_type.type_name}: {barcode.text}")


if __name__ == "__main__":
    sign_with_different_barcode_types()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-barcode-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_barcode_types.pdf" >}}  
```text
Binary file (PDF, 78 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-barcode-signature/sign_with_different_barcode_types/signed_barcode_types.pdf)
{{< /tab >}}
{{< /tabs >}}

### Summary
This guide demonstrates how to use [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) to add barcode-based signatures to documents. It covers creating, configuring, and applying barcode signatures with support for various barcode types and customization options. For further exploration, refer to related guides on document information and advanced signing techniques.




## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)


### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate barcodes and/or sign your files with barcodes for free, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
