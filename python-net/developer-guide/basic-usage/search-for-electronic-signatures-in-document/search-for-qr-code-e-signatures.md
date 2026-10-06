---
id: search-for-qr-code-e-signatures
url: signature/python-net/search-for-qr-code-e-signatures
title: How to Search for QR Code Signatures
linkTitle: QR Codes
weight: 3
description: "This article explains how to search for QR-code electronic signatures using GroupDocs.Signature for Python via .NET API."
keywords: qr code signature search, python qr code signature, search qr code signatures
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for QR-code signatures in documents using Python    
        description: Search QR-code signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to search any QR-code signatures in documents using Python 
        description: Get additional information of searching QR-code signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature object by passing file path or stream as a constructor parameter.
        - name: Get list of QR-code signatures 
          text: Call the search method providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found QR-code signatures.
---
When you search for electronic signatures of QR-Code type inside a document with [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net), you only need to pass a list with a [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) object to the search method.

Here's a quick guide on how to search for QR-code signatures:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) object according to your requirements and specify search options.
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass a list with the [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) to it. The `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult) holds the found [QrCodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodesignature) objects.

The code snippet below demonstrates how to search for QR-code signatures in a document using Python:

{{< tabs "search_qr_codes" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import QrCodeSearchOptions


def search_qr_codes():
    with Signature("signed.pdf") as signature:
        result = signature.search([QrCodeSearchOptions()])

        print(f"Found {len(result.signatures)} QR code signature(s)")
        for qr_code in result.signatures:
            print(f"QR code signature found at page {qr_code.page_number} "
                  f"with type {qr_code.encode_type.type_name} and text '{qr_code.text}'")


if __name__ == "__main__":
    search_qr_codes()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-qr-code-e-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-qr-codes.txt" >}}  
```text
Found 1 QR code signature(s)
QR code signature found at page 1 with type QR and text 'John Smith'
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-qr-code-e-signatures/search_qr_codes/search-qr-codes.txt)
{{< /tab >}}
{{< /tabs >}}

### Advanced Search Options

Here's an example showing how to use more advanced search options for QR codes: a page to search, the QR code type ([QrCodeTypes](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/qrcodetypes)) and the text to match.

{{< tabs "search_qr_codes_with_filters" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import QrCodeTypes, TextMatchType
from groupdocs.signature.options import QrCodeSearchOptions


def search_qr_codes_with_filters():
    with Signature("signed.pdf") as signature:
        options = QrCodeSearchOptions()
        # Search the first page only (page numbers start at 1)
        options.all_pages = False
        options.page_number = 1
        # Return only QR codes of the QR type...
        options.encode_type = QrCodeTypes.QR
        # ...whose text contains "John"
        options.text = "John"
        options.match_type = TextMatchType.CONTAINS

        result = signature.search([options])

        print(f"Found {len(result.signatures)} matching QR code signature(s)")
        for qr_code in result.signatures:
            print(f"Text: {qr_code.text}")
            print(f"Page number: {qr_code.page_number}")
            print(f"Position: X={qr_code.left}, Y={qr_code.top}")
            print(f"Size: {qr_code.width}x{qr_code.height}")
            print(f"Encode type: {qr_code.encode_type.type_name}")


if __name__ == "__main__":
    search_qr_codes_with_filters()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-qr-code-e-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-qr-codes-with-filters.txt" >}}  
```text
Found 1 matching QR code signature(s)
Text: John Smith
Page number: 1
Position: X=270, Y=370
Size: 100x100
Encode type: QR
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-qr-code-e-signatures/search_qr_codes_with_filters/search-qr-codes-with-filters.txt)
{{< /tab >}}
{{< /tabs >}}


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
