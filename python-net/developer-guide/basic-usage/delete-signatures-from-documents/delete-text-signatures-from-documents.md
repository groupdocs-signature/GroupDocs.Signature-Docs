---
id: delete-text-signatures-from-documents
url: signature/python-net/delete-text-signatures-from-documents
title: Delete Text signatures from documents
linkTitle: ❌ Text
weight: 4
description: "This article explains how to delete Text electronic signatures with GroupDocs.Signature API."
keywords: delete Text electronic signatures, how to delete Text electronic signatures
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove Text from documents in Python    
        description: Delete Text presented in documents in convenient way with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to clear any documents from text using Python 
        description: Information about removing text from documents by Python
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of text presented in document 
          text: Create an instance of TextSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found text and save result 
          text: Invoke Delete method passing found text and file path for signed file. File stream can be used as well.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [TextSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignature) class to manipulate text signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

## How to delete Text signature from the document
Here are the steps to delete Text signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [TextSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain list of [TextSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignature);
* Select from list [TextSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.  

This example shows how to delete Text signature that was found using [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

{{< tabs "example-1" >}}
{{< tab "Python" >}}

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSearchOptions

# Initialize signature
with signature.Signature("signed.docx") as sign:
    # Create search options
    options = TextSearchOptions()
    
    # Search for text signatures in the document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        text_signature = signatures[0]
        result = sign.delete(text_signature)
        
        if result:
            print(
                f"Text signature at location {text_signature.left}x{text_signature.top} "
                f"and size {text_signature.size} was deleted from document ['{fileName}']."
            )
        else:
            print(
                f"Signature was not deleted from the document! "
                f"Signature at location {text_signature.left}x{text_signature.top} "
                f"and size {text_signature.size} was not found!"
            )
```

{{< /tab >}}
{{< tab "signed.docx" >}}
{{< tab-text >}}
The following sample file is used in this example: [signed.docx](/signature/python-net/_sample_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-text-signatures-from-documents/signed.docx)
{{< /tab-text >}}
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.