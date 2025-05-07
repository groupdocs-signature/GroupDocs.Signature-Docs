---
id: delete-qr-code-signatures-from-documents
url: signature/python-net/delete-qr-code-signatures-from-documents
title: Delete QR-Code signatures from documents
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
          text: Invoke Delete method passing found QR-Codes and file path for signed file. File stream can be used as well.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [QrCodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodesignature) class to manipulate QR-Code signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

## How to delete QR-Code signature from the document
Here are the steps to delete QR-Code signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain list of [QrCodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodesignature);
* Select from list [QrCodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.  

This example shows how to delete QR-Code signature that was found using [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

```python
import groupdocs.signature as signature
from groupdocs.signature.options import QrCodeSearchOptions

# Initialize signature
with signature.Signature("signed.pptx") as sign:
    # Create search options
    options = QrCodeSearchOptions()
    
    # Search for QR-Code signatures in the document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        qr_code_signature = signatures[0]
        result = sign.delete(qr_code_signature)
        
        if result:
            print(
                f"QR-Code signature at location {qr_code_signature.left}x{qr_code_signature.top} "
                f"and size {qr_code_signature.size} was deleted from document ['{fileName}']."
            )
        else:
            print(
                f"Signature was not deleted from the document! "
                f"Signature at location {qr_code_signature.left}x{qr_code_signature.top} "
                f"and size {qr_code_signature.size} was not found!"
            )
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.