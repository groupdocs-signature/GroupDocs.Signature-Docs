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

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [Verify](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/verify/) method which allows you to verify digital signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Instantiate the [DigitalVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalverifyoptions/) object with the required options.
3. Call the [Verify](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/verify/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass the [DigitalVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalverifyoptions/) to it.
4. Process the verification results.

Here's an example of how to verify digital signatures in a document:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalVerifyOptions
from groupdocs.signature.domain import DigitalSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create verification options
    options = DigitalVerifyOptions()
    
    # Verify document signatures
    result = signature.verify(options)
    
    if result.is_valid:
        print("Document was verified successfully!")
        print(f"Document contains {len(result.succeeded)} valid signatures")
        
        # Process verified signatures
        for digital_signature in result.succeeded:
            print(f"Signature found on page {digital_signature.page_number}")
            print(f"Signature time: {digital_signature.signed_on}")
            print(f"Signature is valid: {digital_signature.is_valid}")
    else:
        print("Document verification failed!")
        print(f"Document contains {len(result.failed)} invalid signatures")
```

## Advanced Usage

The [DigitalVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalverifyoptions/) class provides various properties to customize the verification process:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalVerifyOptions
from groupdocs.signature.domain import DigitalSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create verification options
    options = DigitalVerifyOptions()
    
    # Specify pages to verify
    options.pages = [1, 2]  # Verify only pages 1 and 2
    
    # Verify document signatures
    result = signature.verify(options)
    
    if result.is_valid:
        print("Document was verified successfully!")
        print(f"Document contains {len(result.succeeded)} valid signatures")
        
        # Process verified signatures
        for digital_signature in result.succeeded:
            print(f"Signature found on page {digital_signature.page_number}")
            print(f"Signature time: {digital_signature.signed_on}")
            print(f"Signature is valid: {digital_signature.is_valid}")
            print(f"Signature type: {digital_signature.signature_type}")
            print(f"Signature provider: {digital_signature.provider_name}")
    else:
        print("Document verification failed!")
        print(f"Document contains {len(result.failed)} invalid signatures")
```

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
