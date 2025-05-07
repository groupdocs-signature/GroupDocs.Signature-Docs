---
id: search-for-form-field-e-signatures
url: signature/python-net/search-for-form-field-e-signatures
title: Search for Form Field e-Signatures
linkTitle: 🔍 Form Fields
weight: 2
description: "This article explains how to search for form field electronic signatures within document pages using GroupDocs.Signature for Python via .NET API."
keywords: form field signature search, python form field signature, search form field signatures
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for form field signatures in documents using Python    
        description: Search form field signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to search any form field signatures in documents using Python 
        description: Get additional information of searching form field signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature object by passing file path or stream as a constructor parameter.
        - name: Get list of form field signatures 
          text: Call the search method providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found form field signatures.
hideChildren: False
---

[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to search for form field electronic signatures in documents. Form field signatures allow you to add interactive form elements like text boxes, checkboxes, and radio buttons to your documents.

## How to Search for Form Field Signatures

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for form field signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create an instance of [FormFieldSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsearchoptions/) class.
3. Call the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass the search options to it.
4. Process the search results.

Here's an example of how to search for form field signatures in a document:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import FormFieldSearchOptions
from groupdocs.signature.domain import FormFieldSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    search_options = FormFieldSearchOptions()
    
    # Search for signatures
    result = signature.search(search_options)
    
    # Process found signatures
    print(f"Found {len(result)} form field signatures")
    for form_field_signature in result:
        print(f"Page: {form_field_signature.page_number}")
        print(f"Field Name: {form_field_signature.name}")
        print(f"Field Type: {form_field_signature.field_type}")
        print(f"Field Value: {form_field_signature.value}")
```

## Advanced Search Options

You can customize the search process by setting specific options:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import FormFieldSearchOptions
from groupdocs.signature.domain import FormFieldSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    search_options = FormFieldSearchOptions()
    
    # Set search criteria
    search_options.page_number = 1  # Search on specific page
    search_options.all_pages = False  # Search only on specified page
    search_options.field_name = "signature"  # Search for specific field name
    
    # Search for signatures
    result = signature.search(search_options)
    
    # Process found signatures
    print(f"Found {len(result)} form field signatures")
    for form_field_signature in result:
        print(f"Page: {form_field_signature.page_number}")
        print(f"Field Name: {form_field_signature.name}")
        print(f"Field Type: {form_field_signature.field_type}")
        print(f"Field Value: {form_field_signature.value}")
```

## Additional Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our examples:

* [GroupDocs.Signature for Python via .NET Examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [GroupDocs.Signature for Python via .NET Plugins](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Plugins)
* [GroupDocs.Signature for Python via .NET Showcase Apps](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Showcase)

### Free Online Apps

Along with full Python library we provide simple but powerful free Apps.

You are welcome to search for form field signatures in documents with our free online apps:

* [Search for Form Field Signatures Online](https://products.groupdocs.app/signature/family)
