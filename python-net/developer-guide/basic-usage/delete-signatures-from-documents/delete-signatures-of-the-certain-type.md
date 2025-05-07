---
id: delete-signatures-of-the-certain-type
url: signature/python-net/delete-signatures-of-the-certain-type
title: Delete signatures of the certain type
linkTitle: ❌ Certain Type
weight: 5
description: "This article explains how to delete electronic signatures of the certain type with GroupDocs.Signature API."
keywords: delete signatures of the certain type, how to delete signatures of the certain type
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove signatures of the certain type from documents in Python    
        description: Delete signatures of the certain type presented in documents in convenient way with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to clear any documents from signatures of the certain type using Python 
        description: Information about removing signatures of the certain type from documents by Python
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of signatures of the certain type presented in document 
          text: Create an instance of SearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found signatures and save result 
          text: Invoke Delete method passing found signatures and file path for signed file. File stream can be used as well.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides ability to delete signatures of the certain type from the documents over [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

## How to delete signatures of the certain type from the document
Here are the steps to delete signatures of the certain type from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [SearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/searchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain list of signatures;
* Select from list signature object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.  

This example shows how to delete signatures of the certain type that was found using [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

```python
import groupdocs.signature as signature
from groupdocs.signature.options import SearchOptions

# Initialize signature
with signature.Signature("signed.docx") as sign:
    # Create search options
    options = SearchOptions()
    
    # Search for signatures in the document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        # Get first signature
        signature_to_delete = signatures[0]
        result = sign.delete(signature_to_delete)
        
        if result:
            print(
                f"Signature of type {signature_to_delete.signature_type} "
                f"was deleted from document ['{fileName}']."
            )
        else:
            print(
                f"Signature was not deleted from the document! "
                f"Signature of type {signature_to_delete.signature_type} "
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