---
id: how-to-generate-barcode-and-sign-document-using-python
url: signature/python-net/how-to-generate-barcode-and-sign-document-using-python
title: How to generate barcode and sign document using Python
weight: 2
description: "This guide describes how to improve your document with generated barcodes using Python. Sign your documents with Codabar, Event or Code39Extended using GroupDocs.Signature Python API by GroupDocs."
keywords: Barcode Signature in Python, Sign document with Codabar in Python, Sign document with Event in Python, Sign document with Code39Extended in Python
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate a Barcode and sign a document with it using Python    
        description: Creating Barcode signature and adding it to document with Python language by GroupDocs.Signature for Python APIs
        productCode: signature
        productPlatform: python
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
          text: Invoke method sign with passing created options and output file data. You can save signed files using a file path or a stream.
---

Barcodes represent textual information as a quite small image that could be automatically scanned. Such an approach brings new opportunities in the computer processing of documents like sorting or moving through a business workflow. In this article, we will discuss useful ways to sign electronic documents with data encrypted in Bar or QR codes using Python.

## Python API for Electronic Signatures

[GroupDocs.Signature for Python via .NET](https://products.groupdocs.com/signature/python-net) provides API for signing a wide range of document formats. Moreover, API includes special abilities for additional document content processing. Supported formats are PDF, Microsoft Word, Microsoft PowerPoint, Microsoft Excel, PNG, JPEG, and [many others](/signature/python-net/supported-document-formats/).

Use pip to install the package:

```bash
pip install groupdocs-signature
```

## How to sign PDF files with a barcode

It is a common problem to add additional data to various types of business documents. Such a document may look as in the picture below. One of the most useful ways is to place a barcode directly on the document page.

![Source PDF document preview](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/source_doc_preview.png)

### Signing a document with a Codabar in Python

To generate a barcode and sign a particular document with it:

* Instantiate the `Signature` class providing a path to the source document or document stream.
* Create the `BarcodeSignOptions` instance and set up all demanded fields.
* Invoke the `sign` method to process the document, providing the output file path and sign options.

```python
import groupdocs.signature as signature

# Initialize signature handler
signature_handler = signature.Signature("source.pdf")

# Create barcode signature options
barcode_options = signature.BarcodeSignOptions()
barcode_options.horizontal_alignment = signature.HorizontalAlignment.RIGHT
barcode_options.top = 150
barcode_options.encode_type = signature.BarcodeTypes.CODABAR
barcode_options.text = "Approved_19/06/2022"

# Sign document
signature_handler.sign("signed_codabar.pdf", barcode_options)
```

A document signed with a Codabar might look like in the picture below. The Codabar format was developed for printed documents and might be useful in office document flow.

![A document signed with a Codabar](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/signed_codabar.png)

The [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) Online App provides an opportunity to try document signing with barcodes for free.

## Barcode and image generation in Python

Another way to improve documents is to generate the barcode first and then add it to documents using third-party tools. For this case, it is possible to generate code as an image.

* Create the `BarcodeSignOptions` class instance and set up all the demanded fields.
* Instantiate the `PreviewSignatureOptions` object providing the methods for creation and releasing.
* Invoke the `generate_signature_preview` method to obtain the barcode image as a stream.
* Use the resultant barcode stream in any possible way.

```python
import groupdocs.signature as signature
from io import BytesIO

# Create a memory stream to store the barcode image
result = BytesIO()

# Setup barcode signature options
barcode_options = signature.BarcodeSignOptions()
barcode_options.encode_type = signature.BarcodeTypes.CODE93
barcode_options.text = "Case 148.01"

# Create preview options
preview_options = signature.PreviewSignatureOptions(
    barcode_options,
    lambda options: result,  # Create page stream
    lambda options, stream: None  # Release page stream
)

# Generate image to stream
signature.Signature.generate_signature_preview(preview_options)
```

An image containing the generated barcode might look in this way:

![Generated barcode](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/code93extended.png)

## Get a Free API License

In order to use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

To sum up, some useful ways of processing documents and barcodes were discussed in this article. Using Python improves the productivity of such actions dramatically.
In addition, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) Online App to generate barcodes and/or sign your files with barcodes for free.

Read the [documentation](https://docs.groupdocs.com/signature/python-net/) to learn how to use GroupDocs.Signature in your Python applications. Also, you may discuss any questions or issues at the [GroupDocs forum](https://forum.groupdocs.com/).

## See also

* [How to sign documents with QR codes using Python](/signature/python-net/how-to-generate-qrcode-and-sign-document-using-python/)
* [How to sign Excel spreadsheets and their macros using Python](/signature/python-net/how-to-sign-excel-macros-using-python) 