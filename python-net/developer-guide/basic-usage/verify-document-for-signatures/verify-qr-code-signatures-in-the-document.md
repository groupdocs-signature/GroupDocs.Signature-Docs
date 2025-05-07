---
id: verify-qr-code-signatures-in-the-document
url: signature/python-net/verify-qr-code-signatures-in-the-document
title: Verify QR Code Signatures in Document
linkTitle: 🛡 QR Code Signatures
weight: 5
description: "This topic explains how to verify QR Code electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python qr code signature verification, verify qr code signatures, python digital signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify QR code signatures in signed documents using Python    
        description: Verification of QR code signatures in various documents using Python and GroupDocs.Signature for Python via .NET
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to verify QR code signatures in documents using Python
        description: Learn how to verify QR code signatures in documents using Python
        steps:
        - name: Load document with signatures
          text: Create an instance of the Signature class and load the document containing signatures.
        - name: Configure verification options
          text: Set up QrCodeVerifyOptions with required parameters like QR code text and match type.
        - name: Verify signatures
          text: Call the verify method with the configured options to check signature validity.
---

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to verify QR code signatures in documents. This guide demonstrates how to verify QR code signatures using Python.

## Basic Usage Example

Here's a simple example showing how to verify QR code signatures in a document:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import QrCodeVerifyOptions

# Initialize signature
with signature.Signature("sample_signed.pdf") as sign:
    # Create verification options
    options = QrCodeVerifyOptions()
    options.text = "https://www.example.com"
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
from groupdocs.signature.options import QrCodeVerifyOptions

# Initialize signature
with signature.Signature("sample_signed.pdf") as sign:
    # Create verification options with advanced settings
    options = QrCodeVerifyOptions()
    options.text = "https://www.example.com"
    options.match_type = signature.TextMatchType.Exact  # require exact match
    options.qr_code_type = signature.QrCodeType.QR  # specify QR code type
    options.all_pages = False  # verify only on specific pages
    options.page_numbers = [1, 2]  # verify on pages 1 and 2
    
    # Verify signatures
    result = sign.verify(options)
    
    if result.is_valid:
        print("Document was verified successfully!")
        # Print verification details
        for signature in result.succeeded:
            print(f"Found valid QR code: {signature.text}")
    else:
        print("Document failed verification process.")
        # Print failed verification details
        for signature in result.failed:
            print(f"Invalid QR code: {signature.text}")
```

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To verify PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
