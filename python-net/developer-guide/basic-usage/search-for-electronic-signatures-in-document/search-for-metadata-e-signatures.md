---
id: search-for-metadata-e-signatures
url: signature/python-net/search-for-metadata-e-signatures
title: Search for Metadata e-Signatures
linkTitle: 🔍 Metadata
weight: 5
description: "This article explains how to search for metadata electronic signatures within document pages using GroupDocs.Signature for Python via .NET API."
keywords: metadata signature search, python metadata signature, search metadata signatures
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for metadata signatures in documents using Python    
        description: Search metadata signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to search any metadata signatures in documents using Python 
        description: Get additional information of searching metadata signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature object by passing file path or stream as a constructor parameter.
        - name: Get list of metadata signatures 
          text: Call the search method providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found metadata signatures.
hideChildren: False
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to search for metadata electronic signatures in documents. Metadata signatures allow you to add custom metadata properties to your documents, which can be used to store additional information about the document or its signatures.

## How to Search for Metadata Signatures

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for metadata signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create an instance of [MetadataSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasearchoptions/) class.
3. Call the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass the search options to it.
4. Process the search results.

Here's an example of how to search for metadata signatures in a document:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import MetadataSearchOptions
from groupdocs.signature.domain import MetadataSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    search_options = MetadataSearchOptions()
    
    # Search for signatures
    result = signature.search(search_options)
    
    # Process found signatures
    print(f"Found {len(result)} metadata signatures")
    for metadata_signature in result:
        print(f"Name: {metadata_signature.name}")
        print(f"Value: {metadata_signature.value}")
```

## Advanced Search Options

You can customize the search process by setting specific options:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import MetadataSearchOptions
from groupdocs.signature.domain import MetadataSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    search_options = MetadataSearchOptions()
    
    # Set search criteria
    search_options.name = "Author"  # Search for specific metadata name
    search_options.value = "John Doe"  # Search for specific metadata value
    
    # Search for signatures
    result = signature.search(search_options)
    
    # Process found signatures
    print(f"Found {len(result)} metadata signatures")
    for metadata_signature in result:
        print(f"Name: {metadata_signature.name}")
        print(f"Value: {metadata_signature.value}")
```

## Additional Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our examples:

* [GroupDocs.Signature for Python via .NET Examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [GroupDocs.Signature for Python via .NET Plugins](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Plugins)
* [GroupDocs.Signature for Python via .NET Showcase Apps](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Showcase)

### Free Online Apps

Along with full Python library we provide simple but powerful free Apps.

You are welcome to search for metadata signatures in documents with our free online apps:

* [Search for Metadata Signatures Online](https://products.groupdocs.app/signature/search/family)