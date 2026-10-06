---
id: sign-document-with-digital-signature
url: signature/python-net/sign-document-with-digital-signature
title:  Sign Document with Digital Signature
linktitle: Digital Signature
weight: 2
description: "Learn about the benefits of using digital signatures to sign documents securely. Discover how to add programmatically digital signatures in Python with step-by-step instructions."
keywords: document, signature, certificate, digitally, sign, pfx, python, python digital signature
productName: GroupDocs.Signature for Python via .NET
toc: True
---

## Introduction

In today's digital age, ensuring the authenticity and integrity of electronic documents is crucial. One highly effective method for achieving this is through the use of digital signatures. In this guide, we will explore the world of digital signatures, explaining what they are, why they are essential, and how you can utilize GroupDocs.Signature for Python via .NET to seamlessly eSign your documents.

## What is a Digital Signature?

A digital signature is a cryptographic mechanism for verifying the authenticity and integrity of electronic documents. It provides strong assurance that the document originated from a known sender and has not been tampered with by unauthorized sources. Digital signatures are typically represented by certificates containing private (for signing) and public (for verification) keys. Various public key cryptography standards, such as PFX format, are commonly used for this purpose.
The picture below shows how a digital signature looks on a PDF document page by default.

![Digital](/signature/python-net/images/esign-document-with-digital-signature.png)

## Why Use Digital Signatures?

- **Enhanced Security:** Digital signatures provide a higher level of document security, making it extremely challenging for unauthorized parties to alter the content.
- **Authentication:** They offer a reliable way to verify the identity of the document sender.
- **Non-repudiation:** Digital signatures prevent senders from denying the authenticity of the signed document.

## How to Sign a Document with a Digital Signature

**[GroupDocs.Signature for Python via .NET](https://products.groupdocs.com/signature/python-net)** supports the creation of digital signatures based on existing PFX certificates. To specify various settings the library provides the [DigitalSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/) class that allows adjusting digital signature properties in the document:

* The [certificate_file_path](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/certificate_file_path/) or [certificate_stream](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/certificate_stream/) properties define the certificate source;
* The [password](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/password/) property specifies the certificate password;
* The [contact](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/contact/), [reason](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/reason/) and [location](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/location/) properties specify additional descriptions;
* The [visible](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/visible/) property specifies whether the signature should be visible on the document page or not;
* The [xad_es_type](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/xad_es_type/) property defines whether the e-signature should be of an XML Advanced Electronic Signature type (supported for spreadsheet documents).

{{< alert style="info" >}}
Expired and not-yet-valid certificates are rejected: `sign` raises `GroupDocsSignatureException` with a message such as "The signing certificate expired on ...". To sign with such a certificate anyway, set `allow_expired` or `allow_not_yet_valid` to `True`.
{{< /alert >}}

### Follow these steps to sign your documents with a digital signature

1. Install the GroupDocs.Signature package using pip:
```bash
pip install groupdocs-signature-net
```

2. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
3. Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/) object with the required certificate and its password.
4. Call the [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [DigitalSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/) to it.

The example below shows how to sign a PDF document with a digital e-signature using Python. We can sign any other supported document format in the same way.

{{< tabs "sign_with_digital_signature" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalSignOptions


def sign_with_digital_signature():
    with Signature("sample.pdf") as signature:
        # Create digital signature options with the certificate file
        options = DigitalSignOptions("certificate.pfx")

        # Set the certificate password
        options.password = "1234567890"

        # Optional: an image that shows the signature on the page
        options.image_file_path = "signature.jpg"

        # Set signature position
        options.left = 100
        options.top = 400

        # Sign the document and save the result
        result = signature.sign("signed_digital.pdf", options)
        print(f"Signed with {len(result.succeeded)} digital signature(s)")


if __name__ == "__main__":
    sign_with_digital_signature()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample certificate used in this example (password `1234567890`). Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signature.jpg" >}}
{{< tab-text >}}
`signature.jpg` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/signature.jpg) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_digital.pdf" >}}  
```text
Binary file (PDF, 616 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/sign_with_digital_signature/signed_digital.pdf)
{{< /tab >}}
{{< /tabs >}}

### Advanced Digital Signature Options

You can customize the digital signature further with additional options: the signature's size on the page, and the contact, reason and location stored in it:

{{< tabs "sign_with_digital_signature_advanced" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalSignOptions


def sign_with_digital_signature_advanced():
    with Signature("sample.pdf") as signature:
        # Pass the certificate and the appearance image to the constructor
        options = DigitalSignOptions("certificate.pfx", "signature.jpg")
        options.password = "1234567890"

        # Show the signature on the page, at this position and size
        options.visible = True
        options.left = 100
        options.top = 400
        options.width = 200
        options.height = 100

        # Information stored in the signature
        options.contact = "John Smith"
        options.reason = "Approval"
        options.location = "New York"

        result = signature.sign("signed_digital_advanced.pdf", options)
        print(f"Signed with {len(result.succeeded)} digital signature(s)")


if __name__ == "__main__":
    sign_with_digital_signature_advanced()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample certificate used in this example (password `1234567890`). Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signature.jpg" >}}
{{< tab-text >}}
`signature.jpg` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/signature.jpg) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_digital_advanced.pdf" >}}  
```text
Binary file (PDF, 616 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/sign_with_digital_signature_advanced/signed_digital_advanced.pdf)
{{< /tab >}}
{{< /tabs >}}

### Loading Certificate from Stream

You can also load the certificate from a stream. Keep the stream open until `sign` returns:

{{< tabs "sign_with_certificate_from_stream" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalSignOptions


def sign_with_certificate_from_stream():
    with Signature("sample.pdf") as signature:
        # Load the certificate from a stream
        with open("certificate.pfx", "rb") as certificate_stream:
            options = DigitalSignOptions(certificate_stream)
            options.password = "1234567890"

            # Set signature position and size
            options.left = 100
            options.top = 400
            options.width = 200
            options.height = 60

            result = signature.sign("signed_digital_stream.pdf", options)
            print(f"Signed with {len(result.succeeded)} digital signature(s)")


if __name__ == "__main__":
    sign_with_certificate_from_stream()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample certificate used in this example (password `1234567890`). Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_digital_stream.pdf" >}}  
```text
Binary file (PDF, 612 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-digital-signature/sign_with_certificate_from_stream/signed_digital_stream.pdf)
{{< /tab >}}
{{< /tabs >}}

### Summary
This guide demonstrates how to use [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) to sign documents with digital signatures. It explains how to load documents, configure certificate-based signatures, and save signed files securely. Advanced features, such as the signature appearance and the information stored in the signature, are also covered. Refer to related resources for additional details on digital signing workflows.


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)


### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
