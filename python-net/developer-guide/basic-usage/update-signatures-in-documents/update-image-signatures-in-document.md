---
id: update-image-signatures-in-document
url: signature/python-net/update-image-signatures-in-document
title: Update Image Signatures in Document
linkTitle: ✎ Image
weight: 2
description: "This article explains how to update Image electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python image signature, update image signature, python digital signature
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Update images in documents using Python    
        description: Update image signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to update any images in documents using Python 
        description: Get additional information of updating image signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature class by passing file path or stream as a constructor parameter.
        - name: Get list of images
          text: Create ImageSearchOptions object and call the search method with it.
        - name: Update found signature
          text: Select one of found signatures and update its properties as needed.
        - name: Update document
          text: Call the update method passing the updated signature.
---
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to manipulate image signatures' location, size, and other properties.
Please note that the [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method modifies the same document that was passed to the constructor of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

Here are the steps to update an Image signature in a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter
* Instantiate the [ImageSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesearchoptions) object with desired properties
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain a list of image signatures
* Select from the list the [ImageSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagesignature) object(s) that should be updated
* Call the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object's [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method and pass one or several signatures to it

This example shows how to update an Image signature that was found using the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import ImageSearchOptions

# Initialize signature
with signature.Signature("sample_signed.pdf") as sign:
    # Create search options
    options = ImageSearchOptions()
    
    # Search for image signatures in document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        # Get first image signature
        image_signature = signatures[0]
        
        # Change image properties
        image_signature.top = 200
        image_signature.left = 200
        image_signature.width = 300
        image_signature.height = 150
        
        # Update the signature
        result = sign.update(image_signature)
        
        if result.updated_count > 0:
            print(f"Signature with top position '{image_signature.top}' was updated in the document")
        else:
            print(f"Signature was not updated in the document! "
                  f"Signature with top position '{image_signature.top}' was not found!")
```

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/python-net/developer-guide/advanced-usage/_index.md" >}}).

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [Document Signature for Python Web API Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Web-API)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate image signatures and/or sign your files with them for free, you can use the [Generate Image](https://products.groupdocs.app/signature/generate/image) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.