---
id: verify-qr-code-signatures-in-the-document
url: signature/python-net/verify-qr-code-signatures-in-the-document
title: Verify QR Code Signatures in Document
linkTitle: QR Code Signatures
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

Here's a simple example showing how to verify QR code signatures in a document. The `is_valid` property of the returned [VerificationResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/verificationresult/) is `True` when the document contains QR code signatures that match the [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodeverifyoptions/):

{{< tabs "verify_qr_codes" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import TextMatchType
from groupdocs.signature.options import QrCodeVerifyOptions


def verify_qr_codes():
    with Signature("signed.pdf") as signature:
        options = QrCodeVerifyOptions()
        options.all_pages = True  # this value is set by default
        options.text = "John"
        options.match_type = TextMatchType.CONTAINS

        result = signature.verify(options)

        if result.is_valid:
            print(f"Document was verified successfully: {len(result.succeeded)} matching QR code signature(s).")
        else:
            print("Document failed verification process.")


if __name__ == "__main__":
    verify_qr_codes()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-qr-code-signatures-in-the-document/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-qr-codes.txt" >}}  
```text
Document was verified successfully: 1 matching QR code signature(s).
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/verify-document-for-signatures/verify-qr-code-signatures-in-the-document/verify_qr_codes/verify-qr-codes.txt)
{{< /tab >}}
{{< /tabs >}}

## Advanced Usage Example

Here's an example showing more advanced verification options: an exact text match, the QR code type ([QrCodeTypes](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodetypes/)) and the page to verify. The `succeeded` property of the result lists the QR code signatures that passed verification:

{{< tabs "verify_qr_codes_exact_match" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import QrCodeTypes, TextMatchType
from groupdocs.signature.options import QrCodeVerifyOptions


def verify_qr_codes_exact_match():
    with Signature("signed.pdf") as signature:
        options = QrCodeVerifyOptions()
        options.text = "John Smith"
        options.match_type = TextMatchType.EXACT  # require exact match
        # If the encode type is not set, any QR code type is accepted
        options.encode_type = QrCodeTypes.QR
        # Verify the first page only (page numbers start at 1)
        options.all_pages = False
        options.page_number = 1

        result = signature.verify(options)

        print(f"Document is valid: {result.is_valid}")
        for qr_code in result.succeeded:
            print(f"Verified {qr_code.encode_type.type_name} code '{qr_code.text}'")


if __name__ == "__main__":
    verify_qr_codes_exact_match()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-qr-code-signatures-in-the-document/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-qr-codes-exact-match.txt" >}}  
```text
Document is valid: True
Verified QR code 'John Smith'
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/verify-document-for-signatures/verify-qr-code-signatures-in-the-document/verify_qr_codes_exact_match/verify-qr-codes-exact-match.txt)
{{< /tab >}}
{{< /tabs >}}

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To verify PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
