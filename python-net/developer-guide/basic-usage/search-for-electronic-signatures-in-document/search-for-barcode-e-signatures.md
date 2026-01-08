---
id: search-for-barcode-e-signatures
url: signature/python-net/search-for-barcode-e-signatures
title: Search for Barcode e-Signatures
linkTitle: 🔍 Barcodes
weight: 1
description: "This article explains how to search for barcode electronic signatures within document pages using GroupDocs.Signature for Python via .NET API"
keywords: barcode signature search, python barcode signature, search barcode signatures
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
---

[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to search for barcode signatures in documents. Barcode signatures can be used to store various types of information in a compact format.

## What is a Barcode Signature?

A barcode signature is a visual representation of data that can be scanned and read by machines. It typically consists of parallel black lines and white spaces of varying widths. Barcodes are commonly used for:
- Product identification
- Inventory tracking
- Document verification
- Data encoding

## How to Search for Barcode Signatures

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for barcode signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Instantiate the [BarcodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesearchoptions/) object with the required options.
3. Call the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass the [BarcodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesearchoptions/) to it.
4. Process the search results.

Here's an example of how to search for barcode signatures in a document:

{{< tabs "example-1" >}}
{{< tab "Python" >}}

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import BarcodeSearchOptions
from groupdocs.signature.domain import BarcodeSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    options = BarcodeSearchOptions()
    
    # Search for signatures
    result = signature.search(options)
    
    print(f"Found {len(result)} signatures")
    
    # Process found signatures
    for barcode_signature in result:
        print(f"Barcode type: {barcode_signature.barcode_type}")
        print(f"Barcode text: {barcode_signature.text}")
        print(f"Page number: {barcode_signature.page_number}")
        print(f"Position: X={barcode_signature.left}, Y={barcode_signature.top}")
        print(f"Size: Width={barcode_signature.width}, Height={barcode_signature.height}")
```

{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
The following sample file is used in this example: [sample.pdf](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-barcode-e-signatures/sample.pdf)
{{< /tab-text >}}
{{< /tab >}}
{{< /tabs >}}

## Advanced Search Options

The [BarcodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesearchoptions/) class provides various properties to customize the search process:

{{< tabs "example-2" >}}
{{< tab "Python" >}}

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import BarcodeSearchOptions
from groupdocs.signature.domain import BarcodeSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options
    options = BarcodeSearchOptions()
    
    # Specify pages to search
    options.pages = [1, 2]  # Search only on pages 1 and 2
    
    # Specify barcode types to search for
    options.barcode_type = "Code128"  # Search only for Code128 barcodes
    
    # Search for signatures
    result = signature.search(options)
    
    print(f"Found {len(result)} signatures")
    
    # Process found signatures
    for barcode_signature in result:
        print(f"Barcode type: {barcode_signature.barcode_type}")
        print(f"Barcode text: {barcode_signature.text}")
        print(f"Page number: {barcode_signature.page_number}")
        print(f"Position: X={barcode_signature.left}, Y={barcode_signature.top}")
        print(f"Size: Width={barcode_signature.width}, Height={barcode_signature.height}")
```

{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
The following sample file is used in this example: [sample.pdf](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-barcode-e-signatures/sample.pdf)
{{< /tab-text >}}
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

You are welcome to search for barcode signatures in documents with our free online apps:

* [Search for Barcode Signatures Online](https://products.groupdocs.app/signature/family)
