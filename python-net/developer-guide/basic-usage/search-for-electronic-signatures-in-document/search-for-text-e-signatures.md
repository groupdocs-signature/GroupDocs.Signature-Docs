---
id: search-for-text-e-signatures
url: signature/python-net/search-for-text-e-signatures
title: Search for Text e-Signatures
linkTitle: 🔍 Texts
weight: 6
description: "This topic explains how to search for text electronic signatures within document pages using GroupDocs.Signature for Python via .NET API."
keywords: text signature search, python text signature, search text signatures
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for text signatures in documents using Python    
        description: Search text signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to search any text signatures in documents using Python 
        description: Get additional information of searching text signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature object by passing file path or stream as a constructor parameter.
        - name: Get list of text signatures 
          text: Call the search method providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found text signatures.
---
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides the [TextSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsearchoptions) class to specify different options for searching Text electronic signatures within documents.

Here are the steps to search for Text e-signatures using GroupDocs.Signature API:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [TextSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsearchoptions) object according to your requirements and specify additional search options (if needed).
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [TextSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsearchoptions) to it.

This example shows how to search for Text e-signatures in a document using Python:

{{< tabs "example-1" >}}
{{< tab "Python" >}}

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSearchOptions
from groupdocs.signature.domain import TextMatchType

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Setup search options
    search_options = TextSearchOptions()
    
    # Search only page with specified number (None for all pages)
    search_options.page_number = None
    
    # Specify as True to search all pages of a document
    search_options.all_pages = True
    
    # Specify text to search
    search_options.text = "JS_"
    
    # Specify text match type
    search_options.match_type = TextMatchType.CONTAINS
    
    # Search document
    signatures = sign.search(search_options)
    
    # Output signatures
    for text_signature in signatures:
        print(f"Found Text signature: {text_signature.signature_implementation} "
              f"with text {text_signature.text}.")
        print(f"Location at {text_signature.left}-{text_signature.top}. "
              f"Size is {text_signature.width}x{text_signature.height}.")
```

{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
The following sample file is used in this example: [sample.pdf](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-text-e-signatures/sample.pdf)
{{< /tab-text >}}
{{< /tab >}}
{{< /tabs >}}

### Advanced Search Options

Here's an example showing how to use more advanced search options:

{{< tabs "example-2" >}}
{{< tab "Python" >}}

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSearchOptions
from groupdocs.signature.domain import TextMatchType

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Setup search options
    search_options = TextSearchOptions()
    
    # Search on specific pages
    search_options.page_number = 1
    search_options.all_pages = False
    
    # Search for text with specific match type
    search_options.text = "John"
    search_options.match_type = TextMatchType.EXACT
    
    # Search with specific signature implementation
    search_options.signature_implementation = signature.TextSignatureImplementation.NATIVE
    
    # Search document
    signatures = sign.search(search_options)
    
    # Process found signatures
    for text_signature in signatures:
        print(f"Found Text signature: {text_signature.text}")
        print(f"Page number: {text_signature.page_number}")
        print(f"Position: X={text_signature.left}, Y={text_signature.top}")
        print(f"Size: {text_signature.width}x{text_signature.height}")
        print(f"Font: {text_signature.font.family_name}, Size: {text_signature.font.size}")
        print(f"Color: {text_signature.fore_color}")
```

{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
The following sample file is used in this example: [sample.pdf](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-text-e-signatures/sample.pdf)
{{< /tab-text >}}
{{< /tab >}}
{{< /tabs >}}


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.