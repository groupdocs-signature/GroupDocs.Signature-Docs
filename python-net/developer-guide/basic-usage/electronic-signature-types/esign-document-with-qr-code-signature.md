---
id: esign-document-with-qr-code-signature
url: signature/python-net/esign-document-with-qr-code-signature
title:  eSign Document with QR Code Signature
linktitle: ✍️ QR Code Signature
weight: 6
description: "This article explains how to sign documents with electronic signature as QR code on document page with GroupDocs.Signature for Python via .NET API."
keywords: electronic signature, QR code, python qr code signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Sign documents with QR code using Python    
        description: Add a QR code on any document with Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to add generated QR code to any document using Python 
        description: Learn how to sign any document with QR code and Python
        steps:
        - name: Provide source file
          text: Create an instance of the Signature object by passing file as a constructor parameter. You may provide either a file path or a file stream. 
        - name: Specify signing options 
          text: Instantiate QrCodeSignOptions class. Set up all needed data.
        - name: Sign file and get result 
          text: Call Sign method with signing options and file path for result file. You also may use a stream as output.
---
## What is a QR Code?

QR code (or Quick Response code) is a sort of two-dimensional [barcode]({{< ref "signature/python-net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-barcode-signature.md" >}}) that consists of black squares arranged in a square grid on a white background. QR codes can be read by smartphone cameras or specialized devices that are dedicated to QR reading - hand-held scanners, handy terminals, desktop scanners, embedded scanners, and so on. Usually QR codes contain data that points to a website or application, emails, or phone numbers, product identifiers, or trackers. Therefore, the scope of QR code applications extends from general marketing and item identification to document management.

![QR code](/signature/python-net/images/esign-document-with-qr-code-signature.png)

## How to eSign Document with QR-Code Signature

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) can sign the documents with QR codes of the following types. 

| |Aztec code | DataMatrix code | GS1 DataMatrix | GS1 QR code | QR |
| --- | --- | --- | --- | --- | --- |
| **Application** | * transport and ticketing;<br> * in airline industry for electronic boarding passes;<br> * in rail for tickets sold online and printed out by customers or displayed on mobile phone screens. Code is scanned by a handheld scanner by on-train staff or at the turnstile to validate the ticket.<br> * medicine - patient identification wristbands and labels for unit-of-use medications etc. | * printed media such as labels and letters;<br> * industrial engineering purposes - marking components etc;<br>  * food industry - to prevent food products being packaged and dated incorrectly; | Used in<br> * Healthcare;<br> * Government;<br> * Industrial.<br> Encodes item additional information, such as:<br> * weight;<br> * expiration date;<br> * batch number;<br> * date of manufacture;<br> * etc.| Used in marketing to encode additional item information on the package | Widely used in automotive industry and mobile applications. Useful for encoding large amount of data characters and specific URLs.| 
| **Length** | 3067 alphanumeric,<br> 3832 numeric,<br> 1914 bytes | 2335 alphanumeric,<br> 3116 numeric | 2335 alphanumeric,<br> 3116 numeric,<br> 1556 bytes | 7089 alphanumeric,<br> 4296 numeric,<br> 2953 bytes | 4296 alphanumeric,<br> 7089 numeric,<br> 2953 bytes |
| **Example** | ![Aztec](/signature/python-net/images/esign-document-with-qr-code-signature_1.png) | ![DataMatrix](/signature/python-net/images/esign-document-with-qr-code-signature_2.png) | ![GS1 DataMatrix](/signature/python-net/images/esign-document-with-qr-code-signature_3.png) | ![GS1 QR code](/signature/python-net/images/esign-document-with-qr-code-signature_4.png) | ![QR](/signature/python-net/images/esign-document-with-qr-code-signature_5.png)

When adding QR code electronic signature to a document, the main settings are the text to be encoded and the [type of the QR code](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodetypes/#fields) which should be specified via the [QrCodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesignoptions) class.  

Here are the steps to eSign a document with the QR code signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.

* Instantiate the [QrCodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesignoptions) object according to your requirements and specify the [encode_type](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesignoptions/encode_type) and [text](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions/text) properties.
  
* Call the [sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [QrCodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesignoptions) to it.

The code snippet below demonstrates how to sign a PDF document with the QR code signature using Python:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import QrCodeSignOptions
from groupdocs.signature.domain import QrCodeTypes
import groupdocs.signature.domain as gsd
import sys 
import os

def run():
    with signature.Signature("./sample.pdf") as sign:
        # Create QR code signature options
        options = QrCodeSignOptions()
        
        # Set QR code text
        options.text = "John Smith"
        
        # Set QR code type
        options.encode_type = QrCodeTypes.QR
        
        # Set QR code position
        options.left = 100
        options.top = 100
        
        # Set QR code size
        options.width = 100
        options.height = 100
        
        # Set QR code colors
        options.foreground_color = gsd.Color.BLUE
        options.background_color = gsd.Color.WHITE
        
        # Sign document
        sign.sign("./SampleSigned.pdf", options)
```

### Advanced QR Code Options

Here's an example showing how to create a more complex QR code signature with additional customization:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import QrCodeSignOptions
from groupdocs.signature.domain import QrCodeTypes
import groupdocs.signature.domain as gsd
import sys 
import os

def run():
    with signature.Signature("./sample.pdf") as sign:
        # Create QR code options
        options = QrCodeSignOptions("https://www.example.com/verify-document")
        
        # Setup QR code encoding type
        options.encode_type = QrCodeTypes.QR
        
        # Set signature position and size
        options.left = 100
        options.top = 100
        options.width = 200
        options.height = 200
        
        # Set QR code appearance
        options.foreground_color = gsd.Color.BLUE
        options.background_color = gsd.Color.WHITE
        
        # Set QR code error correction level (L, M, Q, H)
        options.error_correction_level = gsd.QrCodeErrorCorrectionLevel.H
        
        # Sign document
        sign.sign("./SampleSigned.pdf", options)
```

### Summary
This guide demonstrates how to add QR code signatures to documents using [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net). It includes steps for generating a QR code signature, configuring its properties like size and encoding, and applying it to a document. QR code signatures can be used for quick verification of the signed document.


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate QR codes and/or sign your files with QR codes for free, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.