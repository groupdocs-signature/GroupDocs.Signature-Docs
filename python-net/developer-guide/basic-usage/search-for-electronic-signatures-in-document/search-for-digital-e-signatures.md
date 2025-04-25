---
id: search-for-digital-e-signatures
url: signature/python-net/search-for-digital-e-signatures
title: Search for Digital e-Signatures
weight: 7
description: "This article explains how to search for digital electronic signatures within document pages using GroupDocs.Signature for Python via .NET API"
keywords: digital signature search, python signature search, search digital signatures
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
---
# Search for Digital e-Signatures

[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to search for digital electronic signatures in documents. Digital signatures provide a way to verify the authenticity and integrity of a document by using cryptographic techniques.

## How to Search for Digital Signatures

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for digital signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create an instance of [DigitalSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsearchoptions/) class.
3. Call the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass the search options to it.
4. Process the search results.

Here's an example of how to search for digital signatures in a document:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalSearchOptions
from groupdocs.signature.domain import DigitalSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    search_options = DigitalSearchOptions()
    
    # Search for signatures
    result = signature.search(search_options)
    
    # Process found signatures
    print(f"Found {len(result)} digital signatures")
    for digital_signature in result:
        print(f"Subject: {digital_signature.subject}")
        print(f"Issuer: {digital_signature.issuer}")
        print(f"Valid From: {digital_signature.valid_from}")
        print(f"Valid To: {digital_signature.valid_to}")
```

## Advanced Search Options

You can customize the search process by setting specific options:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalSearchOptions
from groupdocs.signature.domain import DigitalSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    search_options = DigitalSearchOptions()
    
    # Set search criteria
    search_options.subject = "John Doe"  # Search for specific subject
    search_options.issuer = "Certificate Authority"  # Search for specific issuer
    
    # Search for signatures
    result = signature.search(search_options)
    
    # Process found signatures
    print(f"Found {len(result)} digital signatures")
    for digital_signature in result:
        print(f"Subject: {digital_signature.subject}")
        print(f"Issuer: {digital_signature.issuer}")
        print(f"Valid From: {digital_signature.valid_from}")
        print(f"Valid To: {digital_signature.valid_to}")
```

## Additional Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our examples:

* [GroupDocs.Signature for Python via .NET Examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [GroupDocs.Signature for Python via .NET Plugins](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Plugins)
* [GroupDocs.Signature for Python via .NET Showcase Apps](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Showcase)

### Free Online Apps

Along with full Python library we provide simple but powerful free Apps.

You are welcome to search for digital signatures in documents with our free online apps:

* [Search for Digital Signatures Online](https://products.groupdocs.app/signature/search/digital)
