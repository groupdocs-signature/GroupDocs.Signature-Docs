---
id: update-text-signatures-in-document
url: signature/python-net/update-text-signatures-in-document
title: Update Text Signatures in Document
linkTitle: 📝 Text
weight: 4
description: "This article explains how to update Text electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python text signature, update text signature, python digital signature
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Update text signatures in documents using Python    
        description: Update text signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to update any text signatures in documents using Python 
        description: Get additional information of updating text signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature class by passing file path or stream as a constructor parameter.
        - name: Get list of text signatures
          text: Create TextSearchOptions object and call the search method with it.
        - name: Update found signature
          text: Select one of found signatures and update its properties as needed.
        - name: Update document
          text: Call the update method passing the updated signature.
---
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to manipulate text signatures' location, size, and textual content.  
Please note that the [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method modifies the same document that was passed to the constructor of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

Here are the steps to update a Text signature in a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter
* Instantiate the [TextSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsearchoptions) object with desired properties
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain a list of text signatures
* Select from the list the [TextSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignature) object(s) that should be updated
* Call the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object's [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method and pass one or several signatures to it

This example shows how to update a Text signature that was found using the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSearchOptions

# Initialize signature
with signature.Signature("sample_signed.pdf") as sign:
    # Create search options
    options = TextSearchOptions()
    
    # Search for text signatures in document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        # Get first text signature
        text_signature = signatures[0]
        
        # Change text property
        text_signature.text = "John Walkman"
        
        # Change position
        text_signature.left = text_signature.left + 10
        text_signature.top = text_signature.top + 10
        
        # Change size. Please note not all documents support changing signature size
        text_signature.width = 200
        text_signature.height = 100
        
        # Update the signature
        result = sign.update(text_signature)
        
        if result.updated_count > 0:
            print(f"Signature with text '{text_signature.text}' was updated in the document")
        else:
            print(f"Signature was not updated in the document! "
                  f"Signature with text '{text_signature.text}' was not found!")
```


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.