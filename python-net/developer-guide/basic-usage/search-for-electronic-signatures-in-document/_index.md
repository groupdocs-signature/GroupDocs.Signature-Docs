---
id: search-for-electronic-signatures-in-document
url: signature/python-net/search-for-electronic-signatures-in-document
title: Search for Electronic Signatures in Document
linkTitle: 🔍 Search
weight: 4
description: "This topic explains how to search for document electronic signatures and their details using Python"
keywords: electronic signature, search for document electronic signature, python signature search
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
structuredData:
    showOrganization: True
    application:    
        name: Search for electronic signatures in Python    
        description: Search and find electronic signatures in documents using Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to search for electronic signatures in documents using Python 
        description: Learn how to find and analyze electronic signatures in documents using Python
        steps:
        - name: Load document for searching
          text: Create an instance of the Signature object by passing file path or stream as a constructor parameter.
        - name: Set up search options 
          text: Create appropriate search options based on the type of signature you want to find.
        - name: Search for signatures and process results 
          text: Call the search method with search options and process the returned signatures.
---
Electronically signed documents can be searched for specific signatures for different purposes, such as signature properties review, verification, and analysis.

[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) API allows you to search signatures within documents based on various search filters and returns a list of electronic signatures that match the search criteria.

Here's a basic example of how to search for signatures in a document using Python:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSearchOptions

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create search options
    search_options = TextSearchOptions()
    
    # Search for signatures
    result = sign.search(search_options)
    
    # Process found signatures
    for text_signature in result:
        print(f"Found text signature: {text_signature.text}")
        print(f"Page number: {text_signature.page_number}")
        print(f"Position: X={text_signature.left}, Y={text_signature.top}")
```

The following articles discover how to find e-signatures of different types inside documents:
