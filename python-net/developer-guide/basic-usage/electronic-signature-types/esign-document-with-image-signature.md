---
id: esign-document-with-image-signature
url: signature/python-net/esign-document-with-image-signature
title: eSign Document with Image Signature
linkTitle: Image Signature
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

```python
import groupdocs.signature as signature
from groupdocs.signature.options import ImageSignOptions
import groupdocs.signature.domain as gsd
import sys 
import os

def run():
    with signature.Signature("./sample.pdf") as sign:
        # Create image signature options
        image_options = ImageSignOptions("./signature.jpg")
        
        # Set signature position
        image_options.left = 100
        image_options.top = 100
        
        # Set signature size
        image_options.width = 100
        image_options.height = 100
        
        # Set signature opacity
        image_options.opacity = 0.8
        
        # Set signature rotation angle
        image_options.rotation_angle = 45
        
        # Set signature alignment
        image_options.horizontal_alignment = gsd.HorizontalAlignment.CENTER
        image_options.vertical_alignment = gsd.VerticalAlignment.CENTER
        
        # Set signature border
        image_options.border_visiblity = True
        image_options.border_dash_style = gsd.DashStyle.DASH
        image_options.border_color = gsd.Color.BLACK
        image_options.border_weight = 2
        
        # Sign document
        sign.sign("./SampleSigned.pdf", image_options)
```

### Advanced Image Signature Options

You can customize the image signature further with additional options:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import ImageSignOptions

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create image signature options
    image_options = ImageSignOptions("signature.jpg")
    
    # Set signature position and size
    image_options.left = 100
    image_options.top = 100
    image_options.width = 200
    image_options.height = 100
    
    # Set advanced options
    image_options.opacity = 0.8
    image_options.rotation_angle = 45
    
    # Set image alignment
    image_options.horizontal_alignment = signature.HorizontalAlignment.CENTER
    image_options.vertical_alignment = signature.VerticalAlignment.CENTER
    
    # Add border
    image_options.border_color = signature.Color.BLACK
    image_options.border_style = signature.DashStyle.SOLID
    image_options.border_width = 2
    
    # Sign document
    sign.sign("SampleSigned.pdf", image_options)
```

### Loading Image from Stream

You can also load the signature image from a stream:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import ImageSignOptions

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Load image from stream
    with open("signature.jpg", "rb") as image_stream:
        # Create image signature options
        image_options = ImageSignOptions(image_stream)
        
        # Set signature position
        image_options.left = 100
        image_options.top = 100
        
        # Sign document
        sign.sign("SampleSigned.pdf", image_options)
```

### Summary
This guide demonstrates how to use [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) to add image-based signatures to documents. It covers loading a document, configuring the image signature's properties (such as size, position, and opacity), and saving the signed document. Advanced customization options, like adjusting image appearance and aligning the signature, are also discussed. For further insights, explore related document signing resources.


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [Document Signature for Python Web API Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Web-API)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate image signatures and/or sign your files with them for free, you can use the [Generate Image](https://products.groupdocs.app/signature/generate/image) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.