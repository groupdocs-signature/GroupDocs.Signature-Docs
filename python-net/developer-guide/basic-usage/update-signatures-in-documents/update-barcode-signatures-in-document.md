---
id: update-barcode-signatures-in-document
url: signature/python-net/update-barcode-signatures-in-document
title: Update Barcode Signatures in Document
linkTitle: 📝 Barcode
weight: 1
description: "This article explains how to update Barcode electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python barcode signature, update barcode signature, python digital signature
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Update barcode signatures in documents using Python    
        description: Update barcode signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to update any barcode signatures in documents using Python 
        description: Get additional information of updating barcode signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature class by passing file path or stream as a constructor parameter.
        - name: Get list of barcode signatures
          text: Create BarcodeSearchOptions object and call the search method with it.
        - name: Update found signature
          text: Select one of found signatures and update its properties as needed.
        - name: Update document
          text: Call the update method passing the updated signature.
---
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to manipulate barcode signatures' location and size.
Please note that the [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method modifies the same document that was passed to the constructor of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class, so the example below copies the signed document first and updates the copy.

### Here are the steps to update a Barcode signature in a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter
* Instantiate the [BarcodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesearchoptions) object with desired properties
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method; the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found barcode signatures
* Select from the list the [BarcodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodesignature) object(s) that should be updated and change their position or size
* Call the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object's [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method and pass one or several signatures to it; for a single signature it returns `True` when the signature was updated

This example shows how to update a Barcode signature that was found using the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method:

{{< tabs "update_barcode_signature" >}}
{{< tab "Python" >}}
```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import BarcodeSearchOptions


def update_barcode_signature():
    # update() saves the changes into the opened document, so work on a copy
    shutil.copy("signed.docx", "updated_barcode_signature.docx")

    with Signature("updated_barcode_signature.docx") as signature:
        options = BarcodeSearchOptions()
        # Return only signatures added by GroupDocs.Signature, not barcodes that are part of the document
        options.skip_external = True
        signatures = signature.search([options]).signatures
        print(f"Found {len(signatures)} barcode signature(s)")
        if not signatures:
            return

        barcode_signature = signatures[0]
        # Change the position
        barcode_signature.left = 60
        barcode_signature.top = 700
        # Change the size. Not all document formats support resizing a signature
        barcode_signature.width = 320
        barcode_signature.height = 80

        if signature.update(barcode_signature):
            print(f"Barcode '{barcode_signature.text}' ({barcode_signature.encode_type.type_name}) "
                  f"moved to ({barcode_signature.left}, {barcode_signature.top}) "
                  f"and resized to {barcode_signature.width}x{barcode_signature.height}")
        else:
            print(f"Barcode '{barcode_signature.text}' was not updated")


if __name__ == "__main__":
    update_barcode_signature()
```
{{< /tab >}}
{{< tab "signed.docx" >}}
{{< tab-text >}}
`signed.docx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/update-signatures-in-documents/update-barcode-signatures-in-document/signed.docx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "updated_barcode_signature.docx" >}}  
```text
Binary file (DOCX, 147 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/update-signatures-in-documents/update-barcode-signatures-in-document/update_barcode_signature/updated_barcode_signature.docx)
{{< /tab >}}
{{< /tabs >}}


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate barcodes and/or sign your files with barcodes for free, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.