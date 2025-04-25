---
id: verify-document-for-signatures
url: signature/python-net/verify-document-for-signatures
title: Verify Document for Signatures
weight: 5
description: "This topic explains how to verify documents for various electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python signature verification, verify signatures, python digital signature verification
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
structuredData:
    showOrganization: True
    application:    
        name: Verify signatures in documents using Python    
        description: Verify various types of signatures in documents using Python and GroupDocs.Signature for Python via .NET
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to verify signatures in documents using Python
        description: Learn how to verify different types of signatures in documents using Python
        steps:
        - name: Load document with signatures
          text: Create an instance of the Signature class and load the document containing signatures.
        - name: Create verification options
          text: Configure verification options for the specific signature type you want to verify.
        - name: Verify signatures
          text: Call the verify method with the configured options to check signature validity.
---

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to verify various types of signatures in documents. This section demonstrates how to verify different types of signatures using Python.

## Basic Usage Example

Here's a simple example showing how to verify signatures in a document:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextVerifyOptions

# Initialize signature
with signature.Signature("sample_signed.pdf") as sign:
    # Create verification options
    options = TextVerifyOptions()
    options.text = "John Smith"
    options.match_type = signature.TextMatchType.Contains
    
    # Verify signatures
    result = sign.verify(options)
    
    if result.is_valid:
        print("Document is valid! All signatures are valid.")
    else:
        print("Document is invalid! Some signatures are invalid.")
```

The following articles in this section provide detailed examples for verifying specific types of signatures:

* [Verify Text Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/verify-text-signatures-in-the-document.md" >}})
* [Verify Digital Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/verify-digital-signatures-in-the-document.md" >}})
* [Verify Barcode Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/verify-barcode-signatures-in-the-document.md" >}})
* [Verify QR Code Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/verify-qr-code-signatures-in-the-document.md" >}})
* [Verify Multiple Signatures]({{< ref "signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/verify-for-multiple-signatures.md" >}})
