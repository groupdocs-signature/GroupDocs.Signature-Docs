---
id: esign-document-with-image-signature
url: signature/python-net/esign-document-with-image-signature
title:  eSign Document with Image Signature
linktitle: ✍️ Image Signature
weight: 4
description: "This article demonstrates how to add signature image on document page with GroupDocs.Signature for Python via .NET."
keywords: signature image, add signature image, how to add signature image, python image signature, python digital signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Sign documents with an image in Python    
        description: Sign documents with various images quickly and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to sign any documents with an image using Python 
        description: Learn all about signing a document with image by Python
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate the Signature object by passing file as a constructor parameter. You may provide either a file path or a file stream. 
        - name: Specify signing options 
          text: Create an instance of the ImageSignOptions class.
        - name: Sign source file and save result 
          text: Invoke the Sign method with signing options and a file path for the resulting file. File stream can be used as well.
---
## What is an Image Signature?

An **image** as a signature is an alternative way to put any presenting data in a visual form. This electronic signature type allows the creation of custom images with a company logo, sender's initials, names and so forth.

![Images](/signature/python-net/images/esign-document-with-image-signature.png)

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides the [ImageSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesignoptions) class to specify different settings for image signature such as image content by file or stream, location, colors and advanced effects.

Here are the steps to create an image signature on a document page:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter;
* Instantiate the [ImageSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesignoptions) object according to your requirements and specify Image signature options;
* Call the [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [ImageSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesignoptions) to it.

## How to eSign Document with Image Signature

This example shows how to sign a PDF document with the image signature using Python:

{{< tabs "sign_with_image_signature" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import ImageSignOptions


def sign_with_image_signature():
    with Signature("sample.pdf") as signature:
        # Create image signature options with the image file
        options = ImageSignOptions("signature.jpg")

        # Set signature position and size
        options.left = 100
        options.top = 400
        options.width = 120
        options.height = 100

        # Sign the document and save the result
        result = signature.sign("signed_image.pdf", options)
        print(f"Signed with {len(result.succeeded)} image signature(s)")


if __name__ == "__main__":
    sign_with_image_signature()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signature.jpg" >}}
{{< tab-text >}}
`signature.jpg` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature/signature.jpg) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_image.pdf" >}}  
```text
Binary file (PDF, 40 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature/sign_with_image_signature/signed_image.pdf)
{{< /tab >}}
{{< /tabs >}}

### Advanced Image Signature Options

You can customize the image signature further with additional options: alignment and margins, rotation, transparency and a border. When an alignment is set, it replaces the `left` or `top` coordinate, and the `margin` offsets the signature from the page edge.

{{< tabs "sign_with_image_signature_advanced" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import ImageSignOptions
from groupdocs.signature.domain import (
    Border, DashStyle, HorizontalAlignment, Padding, VerticalAlignment)
from groupdocs.pydrawing import Color


def sign_with_image_signature_advanced():
    with Signature("sample.pdf") as signature:
        options = ImageSignOptions("signature.jpg")

        # Put the signature in the bottom right corner of the page
        options.width = 160
        options.height = 136
        options.horizontal_alignment = HorizontalAlignment.RIGHT
        options.vertical_alignment = VerticalAlignment.BOTTOM
        options.margin = Padding(right=40, bottom=60)

        # Rotate the image and make it 20% transparent
        options.rotation_angle = 10
        options.transparency = 0.2

        # Draw a dashed border around the image
        border = Border()
        border.color = Color.dark_green
        border.dash_style = DashStyle.DASH
        border.weight = 2
        border.visible = True
        options.border = border

        result = signature.sign("signed_image_advanced.pdf", options)
        print(f"Signed with {len(result.succeeded)} image signature(s)")


if __name__ == "__main__":
    sign_with_image_signature_advanced()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signature.jpg" >}}
{{< tab-text >}}
`signature.jpg` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature/signature.jpg) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_image_advanced.pdf" >}}  
```text
Binary file (PDF, 55 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature/sign_with_image_signature_advanced/signed_image_advanced.pdf)
{{< /tab >}}
{{< /tabs >}}

### Loading Image from Stream

You can also load the signature image from a stream. Keep the stream open until `sign` returns:

{{< tabs "sign_with_image_from_stream" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import ImageSignOptions


def sign_with_image_from_stream():
    with Signature("sample.pdf") as signature:
        # Load the signature image from a stream
        with open("signature.jpg", "rb") as image_stream:
            options = ImageSignOptions(image_stream)
            options.left = 100
            options.top = 400
            options.width = 120
            options.height = 100

            result = signature.sign("signed_image_stream.pdf", options)
            print(f"Signed with {len(result.succeeded)} image signature(s)")


if __name__ == "__main__":
    sign_with_image_from_stream()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signature.jpg" >}}
{{< tab-text >}}
`signature.jpg` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature/signature.jpg) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_image_stream.pdf" >}}  
```text
Binary file (PDF, 40 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-image-signature/sign_with_image_from_stream/signed_image_stream.pdf)
{{< /tab >}}
{{< /tabs >}}

### Summary
This guide demonstrates how to use [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) to add image-based signatures to documents. It covers loading a document, configuring the image signature's properties (such as size, position, and transparency), and saving the signed document. Advanced customization options, like adjusting image appearance and aligning the signature, are also discussed. For further insights, explore related document signing resources.


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate image signatures and/or sign your files with them for free, you can use the [Generate Image](https://products.groupdocs.app/signature/generate/image) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.