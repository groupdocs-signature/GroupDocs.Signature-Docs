---
id: how-to-generate-qrcode-and-sign-document-using-python
url: signature/python-net/how-to-generate-qrcode-and-sign-document-using-python
title: How to generate QR Code and sign document using Python
weight: 3
description: "This guide describes how to improve your document with generated QR code using Python. Sign your documents with a QR Code and various standard QR code elements like Event QR Code, contact QR Code as VCard or MeCard, SEPA payment QR Code using GroupDocs.Signature Python API by GroupDocs."
keywords: QR Code creation, generate QR Code, add QR Code to document in Python, Sign document with QR Event in Python, VCard, or MeCard QR Code.
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate a QR Code and sign a document with it using Python    
        description: Creating QR Code signature and adding it to document with Python language by GroupDocs.Signature for Python APIs
        productCode: signature
        productPlatform: python
    showVideo: True
    howTo:
        name: How to add QR code to various documents with Python 
        description: Get known how to create QR and add it to the document using Python
        steps:
        - name: Load source document
          text: Creating the Signature instance with file path or stream as a constructor parameter will load the document. 
        - name: Provide QR Code options. 
          text: Set specific properties of the QRCodeSignOption instance like a QR Code type, QR code text, and signature appearance settings.
        - name: Sign source and obtain result 
          text: Invoke method sign with passing created options and output file data. You can save signed files using a file path or a stream.
---

The generated QR Code can be downloaded and used to add to the business contracts and official documents. Any QR Code contains unique textual information that confirms the identity of the signer or authorizes the business document. QR Code verification could be performed automatically by reading the contents of the QR Code embedded data. These signatures could be scanned automatically. The QR Code allows keeping over 2 Kilobytes of data.

## Python API for Electronic Signatures

[GroupDocs.Signature for Python via .NET](https://products.groupdocs.com/signature/python-net) provides API for signing a wide range of document formats. Moreover, API includes special abilities for additional document content processing. Supported formats are PDF, Microsoft Word, Microsoft PowerPoint, Microsoft Excel, PNG, JPEG, and [many others](/signature/python-net/supported-document-formats/).

Use pip to install the package:

```bash
pip install groupdocs-signature
```

## Signing a document with an Event QR-code in Python

Sometimes it is needed to inform coworkers about business events. In such cases, an Event QR code can provide all the required information in a very effective way. This topic describes how to sign a PDF document with the generated Event QR code.

* Instantiate the `Signature` class providing the path to the source document or document stream.
* Set event data in the `Event` object instance.
* Create the `QrCodeSignOptions` object and set up all demanded fields.
* Invoke the `sign` method to process the document, providing output file path and sign options.

```python
import groupdocs.signature as signature
from datetime import datetime

# Initialize signature handler
signature_handler = signature.Signature("source.pdf")

# Provide event data
event_qr = signature.Event()
event_qr.title = "Meeting"
event_qr.description = "Productivity issues"
event_qr.location = "room 408"
event_qr.start_date = datetime(2022, 6, 19, 15, 30, 0)
event_qr.end_date = datetime(2022, 6, 19, 17, 0, 0)

# Setup QR code signature options
qr_options = signature.QrCodeSignOptions()
qr_options.horizontal_alignment = signature.HorizontalAlignment.RIGHT
qr_options.vertical_alignment = signature.VerticalAlignment.BOTTOM
qr_options.encode_type = signature.QrCodeTypes.QR
qr_options.text = ""
qr_options.data = event_qr

# Sign document
signature_handler.sign("signed_event.pdf", qr_options)
```

The result of signing a document may look like the picture below. Such QR codes can be very useful for organizing events.

![Document signed with an Event QR code](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/signed_event.png)

To try signing documents with QR codes for free, you may use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) Online App.

## QR Code image generation in Python

Another way to improve documents is to generate the QR code first and then add it to documents using third-party tools. For this case, it is possible to generate code as an image.

* Create the `QrCodeSignOptions` instance and set up all demanded fields.
* Instantiate the `PreviewSignatureOptions` object providing the methods for creation and releasing.
* Invoke the `generate_signature_preview` method to obtain the QR code image as a stream.
* Use the resultant QR Code stream in any possible way.

```python
import groupdocs.signature as signature
from io import BytesIO

# Create a memory stream to store the QR code image
result = BytesIO()

# Setup QR code signature options
qr_options = signature.QrCodeSignOptions()
qr_options.encode_type = signature.QrCodeTypes.CODE93
qr_options.text = "Case 148.01"

# Create preview options
preview_options = signature.PreviewSignatureOptions(
    qr_options,
    lambda options: result,  # Create page stream
    lambda options, stream: None  # Release page stream
)

# Generate image to stream
signature.Signature.generate_signature_preview(preview_options)
```

An image with the generated QR Code may look as below:

![Generated QR Code](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/textqrcode.png)

## Get a Free API License
To use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

To sum up, some useful ways of processing documents with QR codes were discussed in this article. Using Python improves the productivity of such actions dramatically.
In addition, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) Online App to generate QR codes and/or sign your files with QR codes for free.

Read the [documentation](https://docs.groupdocs.com/signature/python-net/) to learn how to use GroupDocs.Signature in your Python applications. Also, you may discuss any questions or issues at the [GroupDocs forum](https://forum.groupdocs.com/).

## See also

* [How to sign documents with barcodes using Python](/signature/python-net/how-to-generate-barcode-and-sign-document-using-python)
* [How to sign Excel spreadsheets and their macros using Python](/signature/python-net/how-to-sign-excel-macros-using-python) 