---
id: delete-image-signatures-from-documents
url: signature/python-net/delete-image-signatures-from-documents
title: Delete Image signatures from documents
linkTitle: Image
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
          text: Invoke the delete method passing the found image. The document opened by the Signature object is changed in place.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [ImageSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagesignature) class to manipulate image signatures and delete them from the documents over [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class, so the example below copies the signed document first and deletes the signature from the copy.

## How to delete Image signature from the document
Here are the steps to delete Image signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [ImageSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesearchoptions) object with desired properties;
* Call [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method; the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found [ImageSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagesignature) objects;
* Select from list [ImageSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it; for a single signature it returns `True` when the signature was deleted.

This example shows how to delete Image signature that was found using [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.
The sample presentation also has a picture of its own. With `skip_external` set to `True`, the search returns only the image signatures added by GroupDocs.Signature, so that picture is never passed to `delete`.

{{< tabs "delete_image_signature" >}}
{{< tab "Python" >}}
```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import ImageSearchOptions


def delete_image_signature():
    # delete() saves the changes into the opened document, so work on a copy
    shutil.copy("signed.pptx", "image_signature_deleted.pptx")

    with Signature("image_signature_deleted.pptx") as signature:
        options = ImageSearchOptions()
        # Return only signatures added by GroupDocs.Signature, not the slide's own pictures
        options.skip_external = True
        signatures = signature.search([options]).signatures
        print(f"Found {len(signatures)} image signature(s)")
        if not signatures:
            return

        image_signature = signatures[0]
        if signature.delete(image_signature):
            print(f"Deleted image signature at ({image_signature.left}, {image_signature.top}), "
                  f"{image_signature.size} bytes")
        else:
            print("Image signature was not deleted")


if __name__ == "__main__":
    delete_image_signature()
```
{{< /tab >}}
{{< tab "signed.pptx" >}}
{{< tab-text >}}
`signed.pptx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-image-signatures-from-documents/signed.pptx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "image_signature_deleted.pptx" >}}  
```text
Binary file (PPTX, 142 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-image-signatures-from-documents/delete_image_signature/image_signature_deleted.pptx)
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.