---
id: verify-text-signatures-in-the-document
url: signature/python-net/verify-text-signatures-in-the-document
title: Verify Text Signatures in Document
linkTitle: 🛡️ Text Signatures
weight: 4
description: "This topic explains how to verify Text electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python text signature verification, verify text signatures, python digital signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify text signatures in signed documents using Python    
        description: Verification of text signatures in various documents using Python and GroupDocs.Signature for Python via .NET
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to verify text signatures in documents using Python
        description: Learn how to verify text signatures in documents using Python
        steps:
        - name: Load document with signatures
          text: Create an instance of the Signature class and load the document containing signatures.
        - name: Configure verification options
          text: Set up TextVerifyOptions with required parameters like text content and match type.
        - name: Verify signatures
          text: Call the verify method with the configured options to check signature validity.
---

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to verify text signatures in documents. This guide demonstrates how to verify text signatures using Python.

## Basic Usage Example

Here's a simple example showing how to verify text signatures in a document. The `is_valid` property of the returned [VerificationResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/verificationresult/) is `True` when the document contains text signatures that match the [TextVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textverifyoptions/):

{{< tabs "verify_text_signatures" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import TextMatchType
from groupdocs.signature.options import TextVerifyOptions


def verify_text_signatures():
    with Signature("signed.pdf") as signature:
        options = TextVerifyOptions()
        options.all_pages = True  # this value is set by default
        options.text = "John Smith"
        options.match_type = TextMatchType.CONTAINS

        result = signature.verify(options)

        if result.is_valid:
            print(f"Document was verified successfully: {len(result.succeeded)} matching text signature(s).")
        else:
            print("Document failed verification process.")


if __name__ == "__main__":
    verify_text_signatures()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-text-signatures-in-the-document/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-text-signatures.txt" >}}  
```text
Document was verified successfully: 1 matching text signature(s).
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/verify-document-for-signatures/verify-text-signatures-in-the-document/verify_text_signatures/verify-text-signatures.txt)
{{< /tab >}}
{{< /tabs >}}

## Advanced Usage Example

Here's an example showing more advanced verification options: an exact text match, the [TextSignatureImplementation](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignatureimplementation/) to check (`NATIVE`, `IMAGE`, `ANNOTATION`, `STICKER`, `FORM_FIELD` or `WATERMARK`; `NATIVE` is the default) and the page to verify. The `succeeded` property of the result lists the text signatures that passed verification:

{{< tabs "verify_text_signature_exact_match" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import TextMatchType, TextSignatureImplementation
from groupdocs.signature.options import TextVerifyOptions


def verify_text_signature_exact_match():
    with Signature("signed.pdf") as signature:
        options = TextVerifyOptions()
        options.text = "John Smith"
        options.match_type = TextMatchType.EXACT  # require exact match
        # Check text signatures that are part of the page content
        options.signature_implementation = TextSignatureImplementation.NATIVE
        # Verify the first page only (page numbers start at 1)
        options.all_pages = False
        options.page_number = 1

        result = signature.verify(options)

        print(f"Document is valid: {result.is_valid}")
        for text_signature in result.succeeded:
            print(f"Verified {text_signature.signature_implementation.name} text signature '{text_signature.text}'")


if __name__ == "__main__":
    verify_text_signature_exact_match()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-text-signatures-in-the-document/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-text-signature-exact-match.txt" >}}  
```text
Document is valid: True
Verified NATIVE text signature 'John Smith'
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/verify-document-for-signatures/verify-text-signatures-in-the-document/verify_text_signature_exact_match/verify-text-signature-exact-match.txt)
{{< /tab >}}
{{< /tabs >}}

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To verify PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
