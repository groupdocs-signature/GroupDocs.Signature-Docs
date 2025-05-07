---
id: update-qr-code-signatures-in-document
url: signature/python-net/update-qr-code-signatures-in-document
title: Update QR Code Signatures in Document
linkTitle: ✎ QR Code
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
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to manipulate QR code signatures' location, size, encode type, and textual content.
Please note that the [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method modifies the same document that was passed to the constructor of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

Here are the steps to update a QR code signature in a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter
* Instantiate the [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) object with desired properties
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain a list of QR code signatures
* Select from the list the [QrCodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodesignature) object(s) that should be updated
* Call the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object's [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method and pass one or several signatures to it

This example shows how to update a QR code signature that was found using the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import QrCodeSearchOptions

# Initialize signature
with signature.Signature("signed.pdf") as sign:
    # Create search options
    options = QrCodeSearchOptions()
    
    # Search for QR code signatures in document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        # Get first QR code signature
        qr_code_signature = signatures[0]
        
        # Change position
        qr_code_signature.left = 100
        qr_code_signature.top = 100
        
        # Update the signature
        result = sign.update(qr_code_signature)
        
        if result.updated_count > 0:
            print(f"Signature with QR code '{qr_code_signature.text}' was updated in the document")
        else:
            print("Signature was not updated in the document!")
```


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [Document Signature for Python Web API Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Web-API)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate QR codes and/or sign your files with QR codes for free, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.