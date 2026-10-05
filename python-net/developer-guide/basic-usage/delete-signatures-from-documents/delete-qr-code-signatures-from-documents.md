---
id: delete-qr-code-signatures-from-documents
url: signature/python-net/delete-qr-code-signatures-from-documents
title: Delete QR-Code signatures from documents
linkTitle: ❌ QR Code
weight: 3
description: "This article explains how to delete QR-Code electronic signatures with GroupDocs.Signature API."
keywords: delete QR-Code electronic signatures, how to delete QR-Code electronic signatures
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove QR-Codes from documents in Python    
        description: Delete QR-Codes presented in documents in convenient way with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to clear any documents from QR-Codes using Python 
        description: Information about removing QR-Codes from documents by Python
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of QR-Codes presented in document 
          text: Create an instance of QrCodeSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found QR-Codes and save result 
          text: Invoke the delete method passing the found QR-Code. The document opened by the Signature object is changed in place.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [QrCodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodesignature) class to manipulate QR-Code signatures and delete them from the documents over [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class, so the example below copies the signed document first and deletes the signature from the copy.

## How to delete QR-Code signature from the document
Here are the steps to delete QR-Code signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) object with desired properties;
* Call [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method; the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found [QrCodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodesignature) objects;
* Select from list [QrCodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it; for a single signature it returns `True` when the signature was deleted.

This example shows how to delete QR-Code signature that was found using [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

{{< tabs "delete_qr_code_signature" >}}
{{< tab "Python" >}}
```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import QrCodeSearchOptions


def delete_qr_code_signature():
    # delete() saves the changes into the opened document, so work on a copy
    shutil.copy("signed.pptx", "qr_code_signature_deleted.pptx")

    with Signature("qr_code_signature_deleted.pptx") as signature:
        signatures = signature.search([QrCodeSearchOptions()]).signatures
        print(f"Found {len(signatures)} QR-Code signature(s)")
        if not signatures:
            return

        qr_code_signature = signatures[0]
        if signature.delete(qr_code_signature):
            print(f"Deleted QR-Code '{qr_code_signature.text}' ({qr_code_signature.encode_type.type_name}) "
                  f"at ({qr_code_signature.left}, {qr_code_signature.top})")
        else:
            print(f"QR-Code '{qr_code_signature.text}' was not deleted")


if __name__ == "__main__":
    delete_qr_code_signature()
```
{{< /tab >}}
{{< tab "signed.pptx" >}}
{{< tab-text >}}
`signed.pptx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-qr-code-signatures-from-documents/signed.pptx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "qr_code_signature_deleted.pptx" >}}  
```text
Binary file (PPTX, 143 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-qr-code-signatures-from-documents/delete_qr_code_signature/qr_code_signature_deleted.pptx)
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.