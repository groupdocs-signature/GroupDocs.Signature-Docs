---
id: search-for-image-e-signatures
url: signature/python-net/search-for-image-e-signatures
title: Search for Image e-Signatures
weight: 5
description: "This article explains how to search for image electronic signatures within document pages using GroupDocs.Signature for Python via .NET API"
keywords: image signature search, python signature search, search image signatures
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
---
# Search for Image e-Signatures

[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to search for image electronic signatures in documents. Image signatures allow you to add visual elements like logos, stamps, or handwritten signatures to your documents.

## What is an Image Signature?

An image signature is a graphical element that can be added to a document to represent a signature. It can be:
- A scanned handwritten signature
- A company logo
- A stamp or seal
- Any other graphical element used for signing

## How to Search for Image Signatures

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for image signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create an instance of [ImageSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesearchoptions/) class.
3. Call the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass the search options to it.
4. Process the search results.

Here's an example of how to search for image signatures in a document:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import ImageSearchOptions
from groupdocs.signature.domain import ImageSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    search_options = ImageSearchOptions()
    
    # Search for signatures
    result = signature.search(search_options)
    
    # Process found signatures
    print(f"Found {len(result)} image signatures")
    for image_signature in result:
        print(f"Page: {image_signature.page_number}")
        print(f"Position: X={image_signature.left}, Y={image_signature.top}")
        print(f"Size: Width={image_signature.width}, Height={image_signature.height}")
```

## Advanced Search Options

You can customize the search process by setting specific options:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import ImageSearchOptions
from groupdocs.signature.domain import ImageSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    search_options = ImageSearchOptions()
    
    # Set search criteria
    search_options.page_number = 1  # Search on specific page
    search_options.all_pages = False  # Search only on specified page
    
    # Search for signatures
    result = signature.search(search_options)
    
    # Process found signatures
    print(f"Found {len(result)} image signatures")
    for image_signature in result:
        print(f"Page: {image_signature.page_number}")
        print(f"Position: X={image_signature.left}, Y={image_signature.top}")
        print(f"Size: Width={image_signature.width}, Height={image_signature.height}")
```

## Additional Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our examples:

* [GroupDocs.Signature for Python via .NET Examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [GroupDocs.Signature for Python via .NET Plugins](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Plugins)
* [GroupDocs.Signature for Python via .NET Showcase Apps](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Showcase)

### Free Online Apps

Along with full Python library we provide simple but powerful free Apps.

You are welcome to search for image signatures in documents with our free online apps:

* [Search for Image Signatures Online](https://products.groupdocs.app/signature/search/image)
