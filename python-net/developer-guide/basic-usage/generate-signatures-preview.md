---
id: generate-signatures-preview
url: signature/python-net/generate-signatures-preview
title: Generate signatures preview
weight: 5
description: "This topic explains how to generate document signature preview in Python with various options by GroupDocs.Signature for Python via .NET."
keywords: preview, generate signature preview, signature preview
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate signatures preview using Python    
        description: Getting previews of signatures using Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to generate previews of signatures with Python 
        description: Get images with signature content of various document types in Python
        steps:
        - name: Implement functions to create and release image stream for each signature.
          text: We don't know how you are going to process and release images, so you need to provide create_signature_stream and, optionally, release_signature_stream functions. 
        - name: Describe the signature.
          text: Create the sign options of the signature to preview, for example TextSignOptions or QrCodeSignOptions. No document is needed.
        - name: Provide preview options. 
          text: Pass the sign options and the functions to a PreviewSignatureOptions instance and set type of result image.
        - name: Get signature images
          text: Invoke the static Signature.generate_signature_preview method passing options and save signature images by method from create_signature_stream function.
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [PreviewSignatureOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/previewsignatureoptions/) class to generate an image of a signature before it is placed on a document - for example, to show a user what a text, barcode or QR code signature will look like.

Here are the steps to generate signature preview with GroupDocs.Signature:

* Create the sign options that describe the signature, for example [TextSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions/) or [QrCodeSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesignoptions/). No document is needed.
* Instantiate the [PreviewSignatureOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/previewsignatureoptions/) object with:
* the sign options;
* a function that creates the stream for the signature image (see [CreateSignatureStream](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/createsignaturestream/));
* image preview format - PNG / JPEG / BMP / GIF / SVG (PNG by default),
* an optional `signature_id` that tells the functions which signature they are handling.
{{< alert style="info" >}}
The stream returned by the create function is closed automatically as soon as the signature image is written: a file is closed, and an `io.BytesIO` already holds the complete image. If you need to process the finished image or clean up resources yourself, pass a release function as an additional argument (see [ReleaseSignatureStream](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/releasesignaturestream/)).
{{< /alert >}}
* Call the static `generate_signature_preview` method of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass [PreviewSignatureOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/previewsignatureoptions/) to it.

## CreateSignatureStream delegate implementation

GroupDocs.Signature calls the create function with the [PreviewSignatureOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/previewsignatureoptions/) object and writes the signature image into the stream it returns: a writable file object, an `io.BytesIO`, or a .NET stream.

```python
def create_signature_stream(preview_options):
    # Name the image after the signature_id set on the preview options
    return open(f"{preview_options.signature_id}.png", "wb")
```

## ReleaseSignatureStream delegate implementation

The release function receives the same preview options and the same object the create function returned. By the time it is called, the image is complete.

```python
def release_signature_stream(preview_options, signature_stream):
    # signature_stream is the object create_signature_stream returned
    print(f"Image file {signature_stream.name} is ready for preview")
```

## Generate signature preview to an image file

{{< tabs "generate_signature_preview_to_file" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.pydrawing import Color
from groupdocs.signature.domain import SignatureFont
from groupdocs.signature.options import PreviewSignatureOptions, TextSignOptions


def create_signature_stream(preview_options):
    # Name the image after the signature_id set below
    return open(f"{preview_options.signature_id}.png", "wb")


def release_signature_stream(preview_options, signature_stream):
    print(f"Image file {signature_stream.name} is ready for preview")


def generate_signature_preview_to_file():
    # Describe the signature exactly as you would for signing
    sign_options = TextSignOptions("John Smith")
    sign_options.width = 200
    sign_options.height = 50
    sign_options.fore_color = Color.dark_blue
    font = SignatureFont()
    font.family_name = "Arial"
    font.size = 24
    sign_options.font = font

    # Create preview options object
    preview_options = PreviewSignatureOptions(sign_options, create_signature_stream, release_signature_stream)
    preview_options.signature_id = "text_signature"
    preview_options.preview_format = PreviewSignatureOptions.PreviewFormats.PNG

    # Generate preview; no document is involved
    Signature.generate_signature_preview(preview_options)


if __name__ == "__main__":
    generate_signature_preview_to_file()
```
{{< /tab >}}
{{< tab "text_signature.png" >}}  
```text
Binary file (PNG, 983 bytes)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/generate-signatures-preview/generate_signature_preview_to_file/text_signature.png)
{{< /tab >}}
{{< /tabs >}}

## Generate signature preview to a memory stream

The create function can return an `io.BytesIO`. When `generate_signature_preview` returns, the buffer holds the whole image, ready to be stored or sent elsewhere.

{{< tabs "generate_signature_preview_to_memory" >}}
{{< tab "Python" >}}
```python
import io

from groupdocs.signature import Signature
from groupdocs.signature.domain import QrCodeTypes
from groupdocs.signature.options import PreviewSignatureOptions, QrCodeSignOptions


def generate_signature_preview_to_memory():
    image = io.BytesIO()

    def create_signature_stream(preview_options):
        # Write the image into the buffer instead of a file
        return image

    sign_options = QrCodeSignOptions("https://www.groupdocs.com/", QrCodeTypes.QR)
    sign_options.width = 120
    sign_options.height = 120

    preview_options = PreviewSignatureOptions(sign_options, create_signature_stream)
    Signature.generate_signature_preview(preview_options)

    data = image.getvalue()
    is_png = data.startswith(b"\x89PNG")
    print(f"QR code preview: {len(data)} bytes, PNG image: {is_png}")


if __name__ == "__main__":
    generate_signature_preview_to_memory()
```
{{< /tab >}}
{{< tab "generate-signature-preview-to-memory.txt" >}}  
```text
QR code preview: 918 bytes, PNG image: True
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/generate-signatures-preview/generate_signature_preview_to_memory/generate-signature-preview-to-memory.txt)
{{< /tab >}}
{{< /tabs >}}

## Generate previews of several signatures in different formats

One pair of functions can serve any number of previews: `signature_id` tells them which signature they are handling, and `preview_format` chooses the image type. Without a license, the SVG format is available only for Code39 barcodes.

{{< tabs "generate_signature_previews_in_different_formats" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import BarcodeTypes, QrCodeTypes
from groupdocs.signature.options import BarcodeSignOptions, PreviewSignatureOptions, QrCodeSignOptions

FORMATS = PreviewSignatureOptions.PreviewFormats


def create_signature_stream(preview_options):
    extension = preview_options.preview_format.name.lower()
    return open(f"{preview_options.signature_id}.{extension}", "wb")


def release_signature_stream(preview_options, signature_stream):
    print(f"{preview_options.signature_id}: {signature_stream.name}")


def generate_signature_previews_in_different_formats():
    signatures = [
        ("barcode", BarcodeSignOptions("123456789012", BarcodeTypes.CODE128), FORMATS.JPEG),
        ("qr_code", QrCodeSignOptions("https://www.groupdocs.com/", QrCodeTypes.QR), FORMATS.GIF),
        ("barcode_vector", BarcodeSignOptions("GROUPDOCS", BarcodeTypes.CODE39), FORMATS.SVG),
    ]
    for signature_id, sign_options, preview_format in signatures:
        preview_options = PreviewSignatureOptions(sign_options, create_signature_stream, release_signature_stream)
        preview_options.signature_id = signature_id
        preview_options.preview_format = preview_format
        Signature.generate_signature_preview(preview_options)


if __name__ == "__main__":
    generate_signature_previews_in_different_formats()
```
{{< /tab >}}
{{< tab "generate-signature-previews-in-different-formats-outputs.zip" >}}  
```text
barcode.jpeg (8 KB)
barcode_vector.svg (3 KB)
qr_code.gif (4 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/generate-signatures-preview/generate_signature_previews_in_different_formats/generate-signature-previews-in-different-formats-outputs.zip)
{{< /tab >}}
{{< /tabs >}}



## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python)



### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
