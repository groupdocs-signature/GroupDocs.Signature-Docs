---
id: esign-document-with-barcode-signature
url: signature/python-net/esign-document-with-barcode-signature
title: eSign Document with Barcode Signature
linkTitle: Barcode Signature
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

```python
import groupdocs.signature as signature
from groupdocs.signature.options import BarcodeSignOptions
from groupdocs.signature.domain import BarcodeTypes

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create barcode signature options
    options = BarcodeSignOptions("JohnSmith")
    
    # Setup Barcode encoding type
    options.encode_type = BarcodeTypes.CODE_128
    
    # Set signature position
    options.left = 100
    options.top = 100
    
    # Sign document
    sign.sign("SampleSigned.pdf", options)
```

### Advanced Barcode Signature Options

You can customize the barcode signature further with additional options:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import BarcodeSignOptions
from groupdocs.signature.domain import BarcodeTypes

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create barcode signature options
    options = BarcodeSignOptions("JohnSmith")
    
    # Setup Barcode encoding type
    options.encode_type = BarcodeTypes.QR
    
    # Set signature position and size
    options.left = 100
    options.top = 100
    options.width = 200
    options.height = 100
    
    # Set advanced options
    options.fore_color = signature.Color.BLUE
    options.back_color = signature.Color.WHITE
    options.opacity = 0.8
    options.rotation_angle = 45
    
    # Set barcode alignment
    options.horizontal_alignment = signature.HorizontalAlignment.CENTER
    options.vertical_alignment = signature.VerticalAlignment.CENTER
    
    # Add border
    options.border_color = signature.Color.BLACK
    options.border_style = signature.DashStyle.SOLID
    options.border_width = 2
    
    # Sign document
    sign.sign("SampleSigned.pdf", options)
```

### Different Barcode Types

GroupDocs.Signature supports various barcode types. Here's an example showing how to use different barcode types:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import BarcodeSignOptions
from groupdocs.signature.domain import BarcodeTypes

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create barcode signature options
    options = BarcodeSignOptions("1234567890")
    
    # Setup different Barcode encoding types
    # For numeric data
    options.encode_type = BarcodeTypes.EAN_13
    
    # For alphanumeric data
    # options.encode_type = BarcodeTypes.CODE_128
    
    # For QR codes
    # options.encode_type = BarcodeTypes.QR
    
    # For 2D barcodes
    # options.encode_type = BarcodeTypes.DATA_MATRIX
    
    # Set signature position
    options.left = 100
    options.top = 100
    
    # Sign document
    sign.sign("SampleSigned.pdf", options)
```

### Summary
This guide demonstrates how to use [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) to add barcode-based signatures to documents. It covers creating, configuring, and applying barcode signatures with support for various barcode types and customization options. For further exploration, refer to related guides on document information and advanced signing techniques.

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/python-net/developer-guide/advanced-usage/_index.md" >}}).

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [Document Signature for Python Web API Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Web-API)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate barcodes and/or sign your files with barcodes for free, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
