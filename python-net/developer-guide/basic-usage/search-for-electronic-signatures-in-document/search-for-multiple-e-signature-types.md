---
id: search-for-multiple-e-signature-types
url: signature/python-net/search-for-multiple-e-signature-types
title: Search for Multiple e-Signature Types
linkTitle: 🔍 Multiple Types
weight: 4
description: "This article explains how to search for multiple electronic signature types within document pages using GroupDocs.Signature for Python via .NET API."
keywords: multiple signature search, python multiple signatures, search multiple signatures
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for multiple signature types in documents using Python    
        description: Search multiple signature types in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to search any multiple signature types in documents using Python 
        description: Get additional information of searching multiple signature types in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature object by passing file path or stream as a constructor parameter.
        - name: Get list of multiple signature types 
          text: Call the search method providing appropriate signature types.
        - name: Process list of found signatures
          text: Loop through list of found signatures of different types.
hideChildren: False
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to search for multiple types of electronic signatures in documents simultaneously. This allows you to find different types of signatures like text, image, digital, barcode, QR code, and form field signatures in a single search operation.

## How to Search for Multiple Signature Types

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for multiple types of signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create search options for each type of signature you want to search for.
3. Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass the list of search options to it.
4. Process the search results: the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the signatures of all requested types. The `signature_type` property of each one tells its [SignatureType](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/signaturetype/).

Here's an example of how to search for multiple types of signatures in a document:

{{< tabs "search_types" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import (BarcodeSearchOptions, FormFieldSearchOptions, ImageSearchOptions,
                                         QrCodeSearchOptions, TextSearchOptions)


def search_types():
    with Signature("signed.pdf") as signature:
        # One search call with options for every signature type to find
        options = [
            TextSearchOptions(),
            ImageSearchOptions(),
            BarcodeSearchOptions(),
            QrCodeSearchOptions(),
            FormFieldSearchOptions(),
        ]
        result = signature.search(options)

        print(f"Found {len(result.signatures)} signature(s)")
        for found in result.signatures:
            print(f"{found.signature_type.name} signature on page {found.page_number} "
                  f"at ({found.left}, {found.top})")


if __name__ == "__main__":
    search_types()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-multiple-e-signature-types/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-types.txt" >}}  
```text
Found 10 signature(s)
TEXT signature on page 1 at (50, 480)
TEXT signature on page 1 at (50, 530)
TEXT signature on page 1 at (50, 379)
IMAGE signature on page 1 at (50, 415)
BARCODE signature on page 1 at (400, 375)
BARCODE signature on page 1 at (400, 430)
QR_CODE signature on page 1 at (270, 370)
FORM_FIELD signature on page 1 at (50, 530)
FORM_FIELD signature on page 1 at (270, 532)
[TRUNCATED]
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-multiple-e-signature-types/search_types/search-types.txt)
{{< /tab >}}
{{< /tabs >}}

## Advanced Search Options

You can customize the search process for each signature type by setting the properties of its search options:

{{< tabs "search_types_with_filters" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import BarcodeTypes, QrCodeTypes, SignatureType, TextMatchType
from groupdocs.signature.options import BarcodeSearchOptions, MetadataSearchOptions, QrCodeSearchOptions


def search_types_with_filters():
    with Signature("signed.pdf") as signature:
        # Code 128 barcodes only
        barcode_options = BarcodeSearchOptions()
        barcode_options.encode_type = BarcodeTypes.CODE128
        # QR codes whose text contains "John"
        qr_code_options = QrCodeSearchOptions()
        qr_code_options.encode_type = QrCodeTypes.QR
        qr_code_options.text = "John"
        qr_code_options.match_type = TextMatchType.CONTAINS
        # The "Author" metadata property
        metadata_options = MetadataSearchOptions()
        metadata_options.name = "Author"

        result = signature.search([barcode_options, qr_code_options, metadata_options])

        print(f"Found {len(result.signatures)} signature(s)")
        for found in result.signatures:
            if found.signature_type == SignatureType.METADATA:
                print(f"METADATA: {found.name} = {found.value}")
            else:
                print(f"{found.signature_type.name} on page {found.page_number}: {found.text}")


if __name__ == "__main__":
    search_types_with_filters()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-multiple-e-signature-types/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-types-with-filters.txt" >}}  
```text
Found 3 signature(s)
BARCODE on page 1: 123456789012
QR_CODE on page 1: John Smith
METADATA: Author = John Smith
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-multiple-e-signature-types/search_types_with_filters/search-types-with-filters.txt)
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

You are welcome to search for multiple types of signatures in documents with our free online apps:

* [Search for Multiple Signature Types Online](https://products.groupdocs.app/signature/family)
