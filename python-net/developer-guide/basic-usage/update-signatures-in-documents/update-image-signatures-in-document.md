---
id: update-image-signatures-in-document
url: signature/python-net/update-image-signatures-in-document
title: Update Image Signatures in Document
linkTitle: 📝 Image
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
Please note that the [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method modifies the same document that was passed to the constructor of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class, so the example below copies the signed document first and updates the copy.

Here are the steps to update an Image signature in a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter
* Instantiate the [ImageSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesearchoptions) object with desired properties
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method; the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found image signatures
* Select from the list the [ImageSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagesignature) object(s) that should be updated and change their properties
* Call the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object's [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method and pass one or several signatures to it; for a single signature it returns `True` when the signature was updated

This example shows how to update an Image signature that was found using the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method:

{{< tabs "update_image_signature" >}}
{{< tab "Python" >}}
```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import ImageSearchOptions


def update_image_signature():
    # update() saves the changes into the opened document, so work on a copy
    shutil.copy("signed.docx", "updated_image_signature.docx")

    with Signature("updated_image_signature.docx") as signature:
        options = ImageSearchOptions()
        # Return only signatures added by GroupDocs.Signature, not the document's own images
        options.skip_external = True
        signatures = signature.search([options]).signatures
        print(f"Found {len(signatures)} image signature(s)")
        if not signatures:
            return

        image_signature = signatures[0]
        # Change the position
        image_signature.left = 240
        image_signature.top = 450
        # Change the size. Not all document formats support resizing a signature
        image_signature.width = 150
        image_signature.height = 125

        if signature.update(image_signature):
            print(f"Image signature moved to ({image_signature.left}, {image_signature.top}) "
                  f"and resized to {image_signature.width}x{image_signature.height}")
        else:
            print("Image signature was not updated")


if __name__ == "__main__":
    update_image_signature()
```
{{< /tab >}}
{{< tab "signed.docx" >}}
{{< tab-text >}}
`signed.docx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/update-signatures-in-documents/update-image-signatures-in-document/signed.docx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "updated_image_signature.docx" >}}  
```text
Binary file (DOCX, 147 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/update-signatures-in-documents/update-image-signatures-in-document/update_image_signature/updated_image_signature.docx)
{{< /tab >}}
{{< /tabs >}}


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate image signatures and/or sign your files with them for free, you can use the [Generate Image](https://products.groupdocs.app/signature/generate/image) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.