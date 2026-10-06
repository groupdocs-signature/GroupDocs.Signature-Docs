---
id: delete-barcode-signatures-from-documents
url: signature/python-net/delete-barcode-signatures-from-documents
title: Delete Barcode signatures from documents
linkTitle: Barcode
weight: 1
description: "This article explains how to delete Barcode electronic signatures with GroupDocs.Signature API."
keywords: delete Barcode,delete Barcode electronic signatures, how to delete Barcode electronic signatures
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove Barcodes from documents in Python    
        description: Delete Barcodes presented in documents in convenient way with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to clear any documents from barcodes using Python 
        description: Information about removing barcodes from documents by Python
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of barcodes presented in document 
          text: Create an instance of BarcodeSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found barcodes and save result 
          text: Invoke the delete method passing the found barcode. The document opened by the Signature object is changed in place.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [BarcodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodesignature) class to manipulate barcode signatures and delete them from the documents over [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class, so the example below copies the signed document first and deletes the signature from the copy.

## How to delete Barcode signature from the document
Here are the steps to delete Barcode signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [BarcodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesearchoptions) object with desired properties;
* Call [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method; the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found [BarcodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodesignature) objects;
* Select from list [BarcodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it; for a single signature it returns `True` when the signature was deleted.

This example shows how to delete Barcode signature that was found using [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

{{< tabs "delete_barcode_signature" >}}
{{< tab "Python" >}}
```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import BarcodeSearchOptions


def delete_barcode_signature():
    # delete() saves the changes into the opened document, so work on a copy
    shutil.copy("signed.docx", "barcode_signature_deleted.docx")

    with Signature("barcode_signature_deleted.docx") as signature:
        options = BarcodeSearchOptions()
        # Return only signatures added by GroupDocs.Signature, not barcodes that are part of the document
        options.skip_external = True
        signatures = signature.search([options]).signatures
        print(f"Found {len(signatures)} barcode signature(s)")
        if not signatures:
            return

        barcode_signature = signatures[0]
        if signature.delete(barcode_signature):
            print(f"Deleted barcode '{barcode_signature.text}' ({barcode_signature.encode_type.type_name})")
        else:
            print(f"Barcode '{barcode_signature.text}' was not deleted")


if __name__ == "__main__":
    delete_barcode_signature()
```
{{< /tab >}}
{{< tab "signed.docx" >}}
{{< tab-text >}}
`signed.docx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-barcode-signatures-from-documents/signed.docx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "barcode_signature_deleted.docx" >}}  
```text
Binary file (DOCX, 146 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-barcode-signatures-from-documents/delete_barcode_signature/barcode_signature_deleted.docx)
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
