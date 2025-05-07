---
id: delete-digital-signatures-from-documents
url: signature/python-net/delete-digital-signatures-from-documents
title: Delete Digital signatures from documents
linkTitle: ❌ Digital
weight: 6
description: "This article explains how to delete Digital electronic signatures with GroupDocs.Signature API."
keywords: delete Digital electronic signatures, how to delete Digital electronic signatures
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove Digital signatures from documents in Python    
        description: Delete Digital signatures presented in documents in convenient way with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to clear any documents from Digital signatures using Python 
        description: Information about removing Digital signatures from documents by Python
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of Digital signatures presented in document 
          text: Create an instance of DigitalSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found Digital signatures and save result 
          text: Invoke Delete method passing found Digital signatures and file path for signed file. File stream can be used as well.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [DigitalSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/digitalsignature) class to manipulate digital signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

*Important information*. Please be aware that digitally signed documents with valid certificates (pfx files) are secured and verified. Changing digitally signed document makes them untrusted from the digital verification perspective. At this moment only Pdf documents support deletion of the specific digital signatures in case of many ones were added. Most documents support deletion of all digital signatures at once without separate certificates removal. It's strongly recommened to use deletion of electronic digital signatures by signature type Digital. See example [Delete Signatures of the certain type]

## How to delete Digital signature from the document
Here are the steps to delete Digital signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [DigitalSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain list of [DigitalSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/digitalsignature);
* Select from list [DigitalSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/digitalsignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.  

This example shows how to delete Digital signature that was found using [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

```python
import groupdocs.signature as signature
from groupdocs.signature.options import DigitalSearchOptions

# Initialize signature
with signature.Signature("signed.pdf") as sign:
    # Create search options
    options = DigitalSearchOptions()
    
    # Search for digital signatures in the document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        digital_signature = signatures[0]
        result = sign.delete(digital_signature)
        
        if result:
            print(
                f"Digital signature with certificate subject {digital_signature.certificate.subject} "
                f"was deleted from document ['{fileName}']."
            )
        else:
            print(
                f"Signature was not deleted from the document! "
                f"Digital signature with certificate subject {digital_signature.certificate.subject} "
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
