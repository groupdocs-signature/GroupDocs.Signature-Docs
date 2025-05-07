---
id: esign-image-with-metadata-signature
url: signature/python-net/esign-image-with-metadata-signature
title: eSign Image with Metadata signature
linktitle: ✍️ eSign Image
weight: 1
description: "This article shows how to add metadata signatures to the image exif metadata layer with various data types"
keywords: image exif, image metadata, image meta exif, image exif signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Images metadata updating in Python    
        description: Change metadata of images with Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to add metadata to images using Python 
        description: Learn all about signing an image by metadata and Python
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Create demanded ImageMetadataSignature class instances and add them to array.
        - name: Sign source file and save result 
          text: Invoke Sign method with array of signing options and output file path or stream.
---
## Overview 
Metadata signature for Image document is an electronic signature based on image metadata standard. Most image formats support metadata specification or [EXIF](https://en.wikipedia.org/wiki/Exif). Image metadata is dictionary map with unique whole short identifier in range 0-65535, Some identifiers are reserved by [EXIF specification.](https://www.exiv2.org/tags.html) From signature perspective image metadata may content any hidden value of standard (int,char, string) or custom type (user defined class), be encrypted and decrypted back by known key over Search method.

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [ImageMetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagemetadatasignature) class to specify Metadata e-signature for image documents. Image document metadata contains pair with unique identifier Id and its Value.  
Image document metadata could keep big amount of data that provides ability to keep serialized custom objects with additional encryption in there.

### Here are the steps to add metadata signatures into Image with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) object according to your requirements.
* Instantiate one or several [ImageMetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagemetadatasignature) objects and add them into [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) to metadata signatures collection ([Signatures](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions/signatures)) via [Add](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/add) or [AddRange](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/addrange) method.
* Call [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) to it.

## How to eSign Image with Metadata signature

This example shows how to sign png image with metadata e-signatures

```python
import groupdocs.signature as signature
from groupdocs.signature.options import MetadataSignOptions
from groupdocs.signature.domain import ImageMetadataSignature
from datetime import datetime

# Initialize signature
with signature.Signature("sample.png") as sign:
    # Create metadata options
    options = MetadataSignOptions()
    
    # Specify different Metadata Signatures and add them to options signature collection
    imgs_metadata_id = 41996
    
    # Create several Image Metadata signatures with different types
    options.add(ImageMetadataSignature(imgs_metadata_id, "Mr.Scherlock Holmes"))  # String value
    imgs_metadata_id += 1
    options.add(ImageMetadataSignature(imgs_metadata_id, datetime.now()))         # Date Time value
    imgs_metadata_id += 1
    options.add(ImageMetadataSignature(imgs_metadata_id, 123456))                 # Integer value
    imgs_metadata_id += 1
    options.add(ImageMetadataSignature(imgs_metadata_id, 123.456))                # Double value
    imgs_metadata_id += 1
    options.add(ImageMetadataSignature(imgs_metadata_id, 123.456))                # Decimal value
    imgs_metadata_id += 1
    options.add(ImageMetadataSignature(imgs_metadata_id, 123.456))                # Float value
    
    # Sign document
    sign.sign("SampleSigned.png", options)
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
