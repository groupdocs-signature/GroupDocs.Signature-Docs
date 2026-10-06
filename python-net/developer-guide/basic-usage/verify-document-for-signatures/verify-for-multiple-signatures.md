---
id: verify-for-multiple-signatures
url: signature/python-net/verify-for-multiple-signatures
title: Verify for multiple signatures
linkTitle: Multiple types
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
* Call [verify](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass filled list of [VerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/verifyoptions) to it. The `is_valid` property of the returned [VerificationResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/verificationresult) is `True` only when every options object in the list matches a valid signature; `succeeded` lists the signatures that passed.

This example shows how to verify the document for different signature types.

{{< tabs "verify_multiple_signature_types" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import TextMatchType, TextSignatureImplementation
from groupdocs.signature.options import (BarcodeVerifyOptions, DigitalVerifyOptions, QrCodeVerifyOptions,
                                         TextVerifyOptions)


def verify_multiple_signature_types():
    with Signature("signed.pdf") as signature:
        # Text signature that contains "John"
        text_options = TextVerifyOptions()
        text_options.all_pages = True  # this value is set by default
        text_options.signature_implementation = TextSignatureImplementation.NATIVE
        text_options.text = "John"
        text_options.match_type = TextMatchType.CONTAINS

        # Barcode signature that contains "12345"
        barcode_options = BarcodeVerifyOptions()
        barcode_options.text = "12345"
        barcode_options.match_type = TextMatchType.CONTAINS

        # QR code signature that contains "John"
        qr_code_options = QrCodeVerifyOptions()
        qr_code_options.text = "John"
        qr_code_options.match_type = TextMatchType.CONTAINS

        # Digital signature made with this certificate for the reason "Approved"
        digital_options = DigitalVerifyOptions("certificate.pfx")
        digital_options.password = "1234567890"
        digital_options.reason = "Approved"

        result = signature.verify([text_options, barcode_options, qr_code_options, digital_options])

        if result.is_valid:
            print("Document was verified successfully!")
        else:
            print("Document failed verification process.")
        for verified in result.succeeded:
            print(f"Verified {verified.signature_type.name} signature")


if __name__ == "__main__":
    verify_multiple_signature_types()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-for-multiple-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-for-multiple-signatures/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-multiple-signature-types.txt" >}}  
```text
Document was verified successfully!
Verified TEXT signature
Verified BARCODE signature
Verified QR_CODE signature
Verified DIGITAL signature
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/verify-document-for-signatures/verify-for-multiple-signatures/verify_multiple_signature_types/verify-multiple-signature-types.txt)
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
