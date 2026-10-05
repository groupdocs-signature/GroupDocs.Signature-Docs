---
id: update-signatures-in-documents
url: signature/python-net/update-signatures-in-documents
title: Update Signatures in Documents
weight: 7
description: "This section shows how to update electronic signatures in documents using GroupDocs.Signature for Python via .NET."
keywords: python signature update, update signatures, python digital signature
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
structuredData:
    showOrganization: True
    application:    
        name: Update signatures in documents using Python    
        description: Learn how to update various types of signatures in documents using Python and GroupDocs.Signature for Python via .NET
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to update signatures in documents using Python
        description: Learn how to update different types of signatures in documents using Python
        steps:
        - name: Load document with signatures
          text: Create an instance of the Signature class and load the document containing signatures.
        - name: Find signatures
          text: Call the search method with search options for the signature type you want to update.
        - name: Update signatures
          text: Change properties of the found signatures and pass them to the update method.
---

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to update existing signatures in documents. This section demonstrates how to update different types of signatures using Python.

## Basic Usage Example

Here's a simple example showing how to update signatures in a document: find them with the `search` method, change their properties, and pass them to the `update` method. Like `update` itself, the example changes the document it opens, so it works on a copy:

```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import TextSearchOptions

# update() saves the changes into the opened document, so work on a copy
shutil.copy("signed.docx", "updated.docx")

with Signature("updated.docx") as signature:
    # Find the text signatures that GroupDocs.Signature added to the document
    options = TextSearchOptions()
    options.skip_external = True
    signatures = signature.search([options]).signatures

    if signatures:
        # Change a found signature, then pass it to update()
        text_signature = signatures[0]
        text_signature.text = "Updated Signature Text"
        if signature.update(text_signature):
            print(f"Updated 1 of {len(signatures)} text signature(s)")
    else:
        print("No text signatures were found")
```

The following articles in this section provide detailed examples for updating specific types of signatures:

* [Update Text Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/update-text-signatures-in-document.md" >}})
* [Update Image Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/update-image-signatures-in-document.md" >}})
* [Update Barcode Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/update-barcode-signatures-in-document.md" >}})
* [Update QR Code Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/update-qr-code-signatures-in-document.md" >}})
