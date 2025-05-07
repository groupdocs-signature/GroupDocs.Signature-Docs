---
id: delete-image-signatures-from-documents
url: signature/python-net/delete-image-signatures-from-documents
title: Delete Image signatures from documents
linkTitle: ❌ Image
weight: 2
description: "This article explains how to delete Image electronic signatures with GroupDocs.Signature API."
keywords: delete Image electronic signatures, how to delete Image electronic signatures
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove Images from documents in Python    
        description: Delete Images presented in documents in convenient way with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to clear any documents from images using Python 
        description: Information about removing images from documents by Python
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of images presented in document 
          text: Create an instance of ImageSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found images and save result 
          text: Invoke Delete method passing found images and file path for signed file. File stream can be used as well.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [ImageSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagesignature) class to manipulate image signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

## How to delete Image signature from the document
Here are the steps to delete Image signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [ImageSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain list of [ImageSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagesignature);
* Select from list [ImageSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.  

This example shows how to delete Image signature that was found using [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

```python
import groupdocs.signature as signature
from groupdocs.signature.options import ImageSearchOptions

# Initialize signature
with signature.Signature("signed.pptx") as sign:
    # Create search options
    options = ImageSearchOptions()
    
    # Search for image signatures in the document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        image_signature = signatures[3]
        result = sign.delete(image_signature)
        
        if result:
            print(
                f"Image signature at location {image_signature.left}x{image_signature.top} "
                f"and size {image_signature.size} was deleted from document ['{fileName}']."
            )
        else:
            print(
                f"Signature was not deleted from the document! "
                f"Signature at location {image_signature.left}x{image_signature.top} "
                f"and size {image_signature.size} was not found!"
            )
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.