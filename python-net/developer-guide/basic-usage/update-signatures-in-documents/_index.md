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
        - name: Create update options
          text: Configure update options for the specific signature type you want to update.
        - name: Update signatures
          text: Call the update method with the configured options to modify existing signatures.
---

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to update existing signatures in documents. This section demonstrates how to update different types of signatures using Python.

## Basic Usage Example

Here's a simple example showing how to update signatures in a document:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSignOptions

# Initialize signature
with signature.Signature("sample_signed.pdf") as sign:
    # Create update options
    options = TextSignOptions()
    options.text = "Updated Signature Text"
    
    # Update signatures
    result = sign.update(options)
    
    if result.updated_count > 0:
        print(f"Updated {result.updated_count} signatures")
    else:
        print("No signatures were updated")
```

The following articles in this section provide detailed examples for updating specific types of signatures:

* [Update Text Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/update-text-signatures-in-document.md" >}})
* [Update Image Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/update-image-signatures-in-document.md" >}})
* [Update Barcode Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/update-barcode-signatures-in-document.md" >}})
* [Update QR Code Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/update-qr-code-signatures-in-document.md" >}})
