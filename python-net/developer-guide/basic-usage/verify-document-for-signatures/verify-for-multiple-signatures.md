---
id: verify-for-multiple-signatures
url: signature/python-net/verify-for-multiple-signatures
title: Verify for multiple signatures
linkTitle: 🛡 Multiple types
weight: 5
description: "This topic explains how to verify electronic signatures of various types with GroupDocs.Signature API."
keywords: verify multiple signatures, verify different signature types
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify electronic signatures in signed documents via Python    
        description: Verification of electronic signatures in various documents in convenient way with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to check are electronic signatures valid in particular document using Python 
        description: Get additional information of electronic signatures validation for any documents in Python
        steps:
        - name: Load particular file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide verification options. 
          text: Set properties of demanded VerifyOptions such as BarcodeVerifyOptions or DigitalVerifyOptions. Various properties like text or BarcodeType depends on options type.
        - name: Get verification result
          text: Call method Verify passing options. Obtain verification result whose property IsValid must be true if verification succeed.
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) supports verification of documents for different signature types. This approach requires to add all required verification options to list.

Here are the steps to verify document for multiple signatures with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required several [VerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/verifyoptions) objects ([BarcodeVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodeverifyoptions), [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodeverifyoptions), [DigitalVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalverifyoptions), [TextVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textverifyoptions)) and add instances to list of [VerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/verifyoptions).
* Call [Verify](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass filled list of [VerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/verifyoptions) to it.

This example shows how to search for different signature types in the document.

```python
import groupdocs.signature as signature
from groupdocs.signature.options import (
    TextVerifyOptions,
    BarcodeVerifyOptions,
    QrCodeVerifyOptions,
    DigitalVerifyOptions
)
from groupdocs.signature.domain.enums import TextMatchType, TextSignatureImplementation

# Initialize signature
with signature.Signature("sampleSigned.pdf") as sign:
    # Create text verification options
    text_verify_options = TextVerifyOptions()
    text_verify_options.all_pages = True  # this value is set by default
    text_verify_options.signature_implementation = TextSignatureImplementation.STAMP
    text_verify_options.text = "John"
    text_verify_options.match_type = TextMatchType.CONTAINS

    # Create barcode verification options
    barcode_verify_options = BarcodeVerifyOptions()
    barcode_verify_options.all_pages = True  # this value is set by default
    barcode_verify_options.text = "John"
    barcode_verify_options.match_type = TextMatchType.CONTAINS

    # Create QR code verification options
    qrcode_verify_options = QrCodeVerifyOptions()
    qrcode_verify_options.all_pages = True  # this value is set by default
    qrcode_verify_options.text = "John"
    qrcode_verify_options.match_type = TextMatchType.CONTAINS

    # Create digital verification options
    digital_verify_options = DigitalVerifyOptions("certificate.pdf")
    digital_verify_options.comments = "Test comment"

    # Create list of verification options
    verify_options = [
        text_verify_options,
        barcode_verify_options,
        qrcode_verify_options,
        digital_verify_options
    ]

    # Verify document signatures
    result = sign.verify(verify_options)
    
    if result.is_valid:
        print("\nDocument was verified successfully!")
    else:
        print("\nDocument failed verification process.")
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
