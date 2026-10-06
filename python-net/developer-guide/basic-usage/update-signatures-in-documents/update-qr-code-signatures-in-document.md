---
id: update-qr-code-signatures-in-document
url: signature/python-net/update-qr-code-signatures-in-document
title: Update QR Code Signatures in Document
linkTitle: QR Code
weight: 3
description: "This article explains how to update QR code electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python qr code signature, update qr code signature, python digital signature
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Update QR code signatures in documents using Python    
        description: Update QR code signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to update any QR code signatures in documents using Python 
        description: Get additional information of updating QR code signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature class by passing file path or stream as a constructor parameter.
        - name: Get list of QR code signatures
          text: Create QrCodeSearchOptions object and call the search method with it.
        - name: Update found signature
          text: Select one of found signatures and update its properties as needed.
        - name: Update document
          text: Call the update method passing the updated signature.
---
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to manipulate QR code signatures' location and size.
Please note that the [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method modifies the same document that was passed to the constructor of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class, so the example below copies the signed document first and updates the copy.

Here are the steps to update a QR code signature in a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter
* Instantiate the [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) object with desired properties
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method; the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found QR code signatures
* Select from the list the [QrCodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodesignature) object(s) that should be updated and change their position or size
* Call the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object's [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method and pass one or several signatures to it; for a single signature it returns `True` when the signature was updated

This example shows how to update a QR code signature that was found using the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method:

{{< tabs "update_qr_code_signature" >}}
{{< tab "Python" >}}
```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import QrCodeSearchOptions


def update_qr_code_signature():
    # update() saves the changes into the opened document, so work on a copy
    shutil.copy("signed.docx", "updated_qr_code_signature.docx")

    with Signature("updated_qr_code_signature.docx") as signature:
        signatures = signature.search([QrCodeSearchOptions()]).signatures
        print(f"Found {len(signatures)} QR code signature(s)")
        if not signatures:
            return

        qr_code_signature = signatures[0]
        # Change the position
        qr_code_signature.left = 440
        qr_code_signature.top = 600
        # Change the size. Not all document formats support resizing a signature
        qr_code_signature.width = 140
        qr_code_signature.height = 140

        if signature.update(qr_code_signature):
            print(f"QR code '{qr_code_signature.text}' ({qr_code_signature.encode_type.type_name}) "
                  f"moved to ({qr_code_signature.left}, {qr_code_signature.top}) "
                  f"and resized to {qr_code_signature.width}x{qr_code_signature.height}")
        else:
            print(f"QR code '{qr_code_signature.text}' was not updated")


if __name__ == "__main__":
    update_qr_code_signature()
```
{{< /tab >}}
{{< tab "signed.docx" >}}
{{< tab-text >}}
`signed.docx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/update-signatures-in-documents/update-qr-code-signatures-in-document/signed.docx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "updated_qr_code_signature.docx" >}}  
```text
Binary file (DOCX, 147 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/update-signatures-in-documents/update-qr-code-signatures-in-document/update_qr_code_signature/updated_qr_code_signature.docx)
{{< /tab >}}
{{< /tabs >}}


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate QR codes and/or sign your files with QR codes for free, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.