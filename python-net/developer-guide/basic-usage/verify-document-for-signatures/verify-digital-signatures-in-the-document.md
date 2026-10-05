---
id: verify-digital-signatures-in-the-document
url: signature/python-net/verify-digital-signatures-in-the-document
title: Verify Digital Signatures in Document
linkTitle: 🛡️ Digital Signatures
weight: 5
description: "This article explains how to verify digital electronic signatures with GroupDocs.Signature for Python via .NET API"
keywords: python digital signature verification, verify digital signatures, python digital signature
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
---
# Verify Digital Signatures in Document

[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to verify digital signatures in documents. Digital signatures provide a secure way to verify the authenticity and integrity of documents.

## What is a Digital Signature?

A digital signature is a mathematical scheme for demonstrating the authenticity of digital messages or documents. It provides:
- Authentication: Confirms the identity of the signer
- Integrity: Ensures the document hasn't been modified
- Non-repudiation: Prevents the signer from denying they signed the document

## How to Verify Digital Signatures

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [verify](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/verify/) method which allows you to verify digital signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Instantiate the [DigitalVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalverifyoptions/) object with the required options.
3. Call the [verify](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/verify/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass the [DigitalVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalverifyoptions/) to it.
4. Check the `is_valid` property of the returned [VerificationResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/verificationresult/).

Here's an example of how to verify digital signatures in a document. The sample certificate `certificate.pfx` is protected with the password `1234567890`:

{{< tabs "verify_digital_signatures" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalVerifyOptions


def verify_digital_signatures():
    with Signature("signed.pdf") as signature:
        options = DigitalVerifyOptions("certificate.pfx")
        options.password = "1234567890"
        # The subject of the signing certificate must contain this text
        options.subject_name = "ProfJamesMoriarty"
        # The signing reason stored in the PDF signature must be equal to this text
        options.reason = "Approved"

        result = signature.verify(options)

        if result.is_valid:
            print(f"Document was verified successfully: {len(result.succeeded)} valid digital signature(s).")
        else:
            print("Document failed verification process.")


if __name__ == "__main__":
    verify_digital_signatures()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-digital-signatures-in-the-document/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-digital-signatures-in-the-document/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-digital-signatures.txt" >}}  
```text
Document was verified successfully: 1 valid digital signature(s).
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/verify-document-for-signatures/verify-digital-signatures-in-the-document/verify_digital_signatures/verify-digital-signatures.txt)
{{< /tab >}}
{{< /tabs >}}

{{< alert style="info" >}}
Verification performs two independent checks. First the signature itself is verified cryptographically: if the document was altered after signing, the result is not valid regardless of any other option. Then any criteria you set on `DigitalVerifyOptions` - certificate, subject name, issuer name, signing time, reason, contact or location - are matched. Both must pass for `is_valid` to be `True`. For PDF documents the cryptographic check was added in GroupDocs.Signature for Python via .NET 26.10; earlier versions compared only the criteria.
{{< /alert >}}

### Verification criteria by document format

Not every property of `DigitalVerifyOptions` applies to every document format. A property that does not apply is ignored, so it can neither reject nor accept a signature. For example, `comments` has no effect on a PDF document, because PDF signatures have no comment field: use `reason` instead.

| Property | PDF | Word Processing | Spreadsheet | Presentation |
| --- | --- | --- | --- | --- |
| The certificate (`certificate_file_path` or `certificate_stream`): serial number and thumbprint | yes | yes | yes | yes |
| `subject_name`, `issuer_name` | yes | yes | no | no |
| `sign_date_time_from`, `sign_date_time_to` | yes | yes | yes | yes |
| `reason`, `contact`, `location` | yes | no | no | no |
| `comments` | no | yes | yes | yes |

`subject_name` and `issuer_name` match when the subject or issuer of the signing certificate contains the value, case-sensitive. `reason`, `contact` and `location` must be equal to the values stored in the PDF signature.

## Advanced Usage

### Detect changes made after signing

Because the signature is checked cryptographically, any change to a signed PDF document makes its digital signature invalid. This example adds a text signature to a copy of the signed document and then verifies both files:

{{< tabs "verify_document_modified_after_signing" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalVerifyOptions, TextSignOptions


def verify_document_modified_after_signing():
    # Change a copy of the digitally signed document
    with Signature("signed.pdf") as signature:
        signature.sign("modified.pdf", TextSignOptions("Changed after signing"))

    for file_name in ("signed.pdf", "modified.pdf"):
        with Signature(file_name) as signature:
            options = DigitalVerifyOptions("certificate.pfx")
            options.password = "1234567890"
            result = signature.verify(options)
            print(f"{file_name}: valid = {result.is_valid}")


if __name__ == "__main__":
    verify_document_modified_after_signing()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-digital-signatures-in-the-document/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/verify-document-for-signatures/verify-digital-signatures-in-the-document/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "modified.pdf" >}}  
```text
Binary file (PDF, 210 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/verify-document-for-signatures/verify-digital-signatures-in-the-document/verify_document_modified_after_signing/modified.pdf)
{{< /tab >}}
{{< /tabs >}}

## Additional Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our examples:

* [GroupDocs.Signature for Python via .NET Examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [GroupDocs.Signature for Python via .NET Plugins](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Plugins)
* [GroupDocs.Signature for Python via .NET Showcase Apps](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Showcase)

### Free Online Apps

Along with full Python library we provide simple but powerful free Apps.

You are welcome to verify digital signatures in documents with our free online apps:

* [Verify Digital Signatures Online](https://products.groupdocs.app/signature/verify)
