---
id: verify-barcode-signatures-in-the-document
url: signature/python-net/verify-barcode-signatures-in-the-document
title: Verify Barcode Signatures in Document
linkTitle: 🛡 Barcode Signatures
weight: 4
description: "This topic explains how to verify Barcode electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python barcode signature verification, verify barcode signatures, python digital signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify barcode signatures in signed documents using Python    
        description: Verification of barcode signatures in various documents using Python and GroupDocs.Signature for Python via .NET
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to verify barcode signatures in documents using Python
        description: Learn how to verify barcode signatures in documents using Python
        steps:
        - name: Load document with signatures
          text: Create an instance of the Signature class and load the document containing signatures.
        - name: Configure verification options
          text: Set up BarcodeVerifyOptions with required parameters like barcode text and match type.
        - name: Verify signatures
          text: Call the verify method with the configured options to check signature validity.
---

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to verify barcode signatures in documents. This guide demonstrates how to verify barcode signatures using Python.

## Basic Usage Example

Here's a simple example showing how to verify barcode signatures in a document:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import BarcodeVerifyOptions

# Initialize signature
with signature.Signature("sample_signed.pdf") as sign:
    # Create verification options
    options = BarcodeVerifyOptions()
    options.text = "123456789"
    options.match_type = signature.TextMatchType.Contains
    options.all_pages = True  # verify on all pages
    
    # Verify signatures
    result = sign.verify(options)
    
    if result.is_valid:
        print("Document was verified successfully!")
    else:
        print("Document failed verification process.")
```

## Advanced Usage Example

Here's an example showing more advanced verification options:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import BarcodeVerifyOptions

# Initialize signature
with signature.Signature("sample_signed.pdf") as sign:
    # Create verification options with advanced settings
    options = BarcodeVerifyOptions()
    options.text = "123456789"
    options.match_type = signature.TextMatchType.Exact  # require exact match
    options.barcode_type = signature.BarcodeType.Code128  # specify barcode type
    options.all_pages = False  # verify only on specific pages
    options.page_numbers = [1, 2]  # verify on pages 1 and 2
    
    # Verify signatures
    result = sign.verify(options)
    
    if result.is_valid:
        print("Document was verified successfully!")
        # Print verification details
        for signature in result.succeeded:
            print(f"Found valid barcode: {signature.text}")
    else:
        print("Document failed verification process.")
        # Print failed verification details
        for signature in result.failed:
            print(f"Invalid barcode: {signature.text}")
```

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To verify PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
