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
pip install groupdocs-signature-net
```

## Signing a document with an Event QR-code in Python

Sometimes it is needed to inform coworkers about business events. In such cases, an Event QR code can provide all the required information in a very effective way. This topic describes how to sign a PDF document with the generated Event QR code.

* Instantiate the `Signature` class providing the path to the source document or document stream.
* Set event data in the [Event](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain.extensions/event/) object instance.
* Create the [QrCodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesignoptions/) object and set up all demanded fields. The event goes into the `data` property; the QR code then carries it in the iCalendar `VEVENT` format.
* Invoke the `sign` method to process the document, providing output file path and sign options.

{{< tabs "sign_pdf_with_event_qr_code" >}}
{{< tab "Python" >}}
```python
from datetime import datetime

from groupdocs.signature import Signature
from groupdocs.signature.domain import HorizontalAlignment, QrCodeTypes, VerticalAlignment
from groupdocs.signature.domain.extensions import Event
from groupdocs.signature.options import QrCodeSignOptions


def sign_pdf_with_event_qr_code():
    # Initialize signature handler
    with Signature("sample.pdf") as signature:
        # Provide event data
        event_qr = Event()
        event_qr.title = "Meeting"
        event_qr.description = "Productivity issues"
        event_qr.location = "room 408"
        event_qr.start_date = datetime(2022, 6, 19, 15, 30, 0)
        event_qr.end_date = datetime(2022, 6, 19, 17, 0, 0)

        # Setup QR code signature options
        qr_options = QrCodeSignOptions()
        qr_options.horizontal_alignment = HorizontalAlignment.RIGHT
        qr_options.vertical_alignment = VerticalAlignment.BOTTOM
        qr_options.encode_type = QrCodeTypes.QR
        qr_options.data = event_qr

        # Sign document
        result = signature.sign("signed_event.pdf", qr_options)
        print(f"QR codes added: {len(result.succeeded)}")


if __name__ == "__main__":
    sign_pdf_with_event_qr_code()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/signature-use-cases/how-to-generate-qrcode-and-sign-document-using-python/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_event.pdf" >}}  
```text
Binary file (PDF, 122 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/signature-use-cases/how-to-generate-qrcode-and-sign-document-using-python/sign_pdf_with_event_qr_code/signed_event.pdf)
{{< /tab >}}
{{< /tabs >}}

The result of signing a document may look like the picture below. Such QR codes can be very useful for organizing events.

![Document signed with an Event QR code](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/signed_event.png)

To try signing documents with QR codes for free, you may use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) Online App.

## QR Code image generation in Python

Another way to improve documents is to generate the QR code first and then add it to documents using third-party tools. For this case, it is possible to generate code as an image.

* Create the `QrCodeSignOptions` instance and set up all demanded fields.
* Instantiate the [PreviewSignatureOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/previewsignatureoptions/) object providing the methods for creation and releasing of the image stream.
* Invoke the static `Signature.generate_signature_preview` method to obtain the QR code image as a stream.
* Use the resultant QR Code stream in any possible way.

{{< tabs "generate_qr_code_image" >}}
{{< tab "Python" >}}
```python
import io

from groupdocs.signature import Signature
from groupdocs.signature.domain import QrCodeTypes
from groupdocs.signature.options import PreviewSignatureOptions, QrCodeSignOptions


def generate_qr_code_image():
    # Create a memory stream to store the QR code image
    result = io.BytesIO()

    # Setup QR code signature options
    qr_options = QrCodeSignOptions()
    qr_options.encode_type = QrCodeTypes.QR
    qr_options.text = "Case 148-01"

    # Create preview options
    preview_options = PreviewSignatureOptions(
        qr_options,
        lambda options: result,  # Create the image stream
        lambda options, stream: None,  # Release the image stream
    )

    # Generate image to stream; no document is needed
    Signature.generate_signature_preview(preview_options)

    # Use the QR code image, for example save it for a third-party tool
    with open("qr_code_result.png", "wb") as image_file:
        image_file.write(result.getvalue())
    print(f"QR code image: {len(result.getvalue())} bytes")


if __name__ == "__main__":
    generate_qr_code_image()
```
{{< /tab >}}
{{< tab "qr_code_result.png" >}}  
```text
Binary file (PNG, 2 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/signature-use-cases/how-to-generate-qrcode-and-sign-document-using-python/generate_qr_code_image/qr_code_result.png)
{{< /tab >}}
{{< /tabs >}}

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