---
id: search-for-digital-e-signatures
url: signature/python-net/search-for-digital-e-signatures
title: Search for Digital e-Signatures
linkTitle: Digital
weight: 6
description: "This article explains how to search for digital electronic signatures within document pages using GroupDocs.Signature for Python via .NET API."
keywords: digital signature search, python digital signature, search digital signatures
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for digital signatures in documents using Python    
        description: Search digital signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to search any digital signatures in documents using Python 
        description: Get additional information of searching digital signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature object by passing file path or stream as a constructor parameter.
        - name: Get list of digital signatures 
          text: Call the search method providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found digital signatures.
hideChildren: False
---

[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to search for digital electronic signatures in documents. Digital signatures provide a way to verify the authenticity and integrity of a document by using cryptographic techniques.

## How to Search for Digital Signatures

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for digital signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create an instance of [DigitalSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsearchoptions/) class.
3. Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass a list with the search options to it.
4. Process the search results: the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found [DigitalSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/digitalsignature/) objects. Their `is_valid` property tells whether the signature still matches the document content.

Here's an example of how to search for digital signatures in a document:

{{< tabs "search_digital" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalSearchOptions


def search_digital():
    with Signature("signed.pdf") as signature:
        result = signature.search([DigitalSearchOptions()])

        print(f"Found {len(result.signatures)} digital signature(s)")
        for digital in result.signatures:
            print(f"Signed on {digital.sign_time} with the certificate of {digital.certificate.subject}")
            print(f"Valid: {digital.is_valid}")


if __name__ == "__main__":
    search_digital()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-digital-e-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-digital.txt" >}}  
```text
Found 1 digital signature(s)
Signed on 2026-10-05 08:08:35 with the certificate of E=moriarty@ex.ex, CN=ProfJamesMoriarty, O=ProfMoriarty, C=AS
Valid: True
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-digital-e-signatures/search_digital/search-digital.txt)
{{< /tab >}}
{{< /tabs >}}

## Advanced Search Options

You can narrow the search with the properties of [DigitalSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsearchoptions/): `sign_date_time_from` and `sign_date_time_to` set the signing time range, and `comments` returns only signatures whose comment is equal to the given text. This example searches a Word document:

{{< tabs "search_digital_by_criteria" >}}
{{< tab "Python" >}}
```python
from datetime import datetime

from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalSearchOptions


def search_digital_by_criteria():
    with Signature("signed.docx") as signature:
        options = DigitalSearchOptions()
        # Return only signatures made in 2026...
        options.sign_date_time_from = datetime(2026, 1, 1)
        options.sign_date_time_to = datetime(2026, 12, 31)
        # ...whose comment is equal to this text
        options.comments = "Approved by John Smith"

        result = signature.search([options])

        print(f"Found {len(result.signatures)} matching digital signature(s)")
        for digital in result.signatures:
            print(f"Signed on {digital.sign_time}, comment: '{digital.comments}', valid: {digital.is_valid}")


if __name__ == "__main__":
    search_digital_by_criteria()
```
{{< /tab >}}
{{< tab "signed.docx" >}}
{{< tab-text >}}
`signed.docx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-digital-e-signatures/signed.docx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-digital-by-criteria.txt" >}}  
```text
Found 1 matching digital signature(s)
Signed on 2026-10-05 08:21:06+00:00, comment: 'Approved by John Smith', valid: True
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-digital-e-signatures/search_digital_by_criteria/search-digital-by-criteria.txt)
{{< /tab >}}
{{< /tabs >}}

{{< alert style="info" >}}
The search criteria are applied to Word Processing and Spreadsheet documents. For PDF documents, `search` returns every digital signature regardless of them. To check a PDF signature against a certificate, signer, signing time or reason, verify it with [DigitalVerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalverifyoptions/) as described in [Verify Digital Signatures in Document]({{< ref "signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/verify-digital-signatures-in-the-document.md" >}}).
{{< /alert >}}

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
