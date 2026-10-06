---
id: verify-barcode-signatures-in-the-document
url: signature/python-net/verify-barcode-signatures-in-the-document
title: Verify Barcode Signatures in Document
linkTitle: Barcode Signatures
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

Here's a simple example showing how to verify barcode signatures in a document. The `is_valid` property of the returned [VerificationResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/verificationresult/) is `True` when the document contains barcode signatures that match the [BarcodeVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodeverifyoptions/):

{{< tabs "verify_barcode_signatures" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import TextMatchType
from groupdocs.signature.options import BarcodeVerifyOptions


def verify_barcode_signatures():
    with Signature("signed.pdf") as signature:
        options = BarcodeVerifyOptions()
        options.all_pages = True  # this value is set by default
        options.text = "12345"
        options.match_type = TextMatchType.CONTAINS

        result = signature.verify(options)

        if result.is_valid:
            print(f"Document was verified successfully: {len(result.succeeded)} matching barcode signature(s).")
        else:
            print("Document failed verification process.")


if __name__ == "__main__":
    verify_barcode_signatures()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-barcode-signatures-in-the-document/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-barcode-signatures.txt" >}}  
```text
Document was verified successfully: 1 matching barcode signature(s).
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/verify-document-for-signatures/verify-barcode-signatures-in-the-document/verify_barcode_signatures/verify-barcode-signatures.txt)
{{< /tab >}}
{{< /tabs >}}

## Advanced Usage Example

Here's an example showing more advanced verification options: an exact text match, the barcode type ([BarcodeTypes](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodetypes/)) and the page to verify. The `succeeded` property of the result lists the barcode signatures that passed verification:

{{< tabs "verify_code128_barcode_signature" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import BarcodeTypes, TextMatchType
from groupdocs.signature.options import BarcodeVerifyOptions


def verify_code128_barcode_signature():
    with Signature("signed.pdf") as signature:
        options = BarcodeVerifyOptions()
        options.text = "123456789012"
        options.match_type = TextMatchType.EXACT  # require exact match
        # If the encode type is not set, any barcode type is accepted
        options.encode_type = BarcodeTypes.CODE128
        # Verify the first page only (page numbers start at 1)
        options.all_pages = False
        options.page_number = 1

        result = signature.verify(options)

        print(f"Document is valid: {result.is_valid}")
        for barcode in result.succeeded:
            print(f"Verified {barcode.encode_type.type_name} barcode '{barcode.text}'")


if __name__ == "__main__":
    verify_code128_barcode_signature()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-barcode-signatures-in-the-document/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-code128-barcode-signature.txt" >}}  
```text
Document is valid: True
Verified Code128 barcode '123456789012'
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/verify-document-for-signatures/verify-barcode-signatures-in-the-document/verify_code128_barcode_signature/verify-code128-barcode-signature.txt)
{{< /tab >}}
{{< /tabs >}}

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To verify PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
