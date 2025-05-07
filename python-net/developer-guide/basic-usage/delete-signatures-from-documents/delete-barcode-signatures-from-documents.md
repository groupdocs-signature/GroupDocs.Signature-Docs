---
id: delete-barcode-signatures-from-documents
url: signature/python-net/delete-barcode-signatures-from-documents
title: Delete Barcode signatures from documents
linkTitle: ❌ Barcode
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
          text: Invoke Delete method passing found barcode and file path for signed file. File stream can be used as well.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [BarcodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodesignature) class to manipulate barcode signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

## How to delete Barcode signature from the document
Here are the steps to delete Barcode signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [BarcodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain list of [BarcodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodesignature);
* Select from list [BarcodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.

This example shows how to delete Barcode signature that was found using [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

```python
import groupdocs.signature as signature
from groupdocs.signature.options import BarcodeSearchOptions

# Initialize signature
with signature.Signature("signed.docx") as sign:
    # Create search options
    options = BarcodeSearchOptions()
    
    # Search for barcode signatures in document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        barcode_signature = signatures[0]
        result = sign.delete(barcode_signature)
        
        if result:
            print(
                f"Signature with Barcode '{barcode_signature.text}' and "
                f"encode type '{barcode_signature.encode_type.type_name}' "
                f"was deleted from document ['{fileName}']."
            )
        else:
            print(
                f"Signature was not deleted from the document! "
                f"Signature with Barcode '{barcode_signature.text}' and "
                f"encode type '{barcode_signature.encode_type.type_name}' "
                f"was not found!"
            )
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
