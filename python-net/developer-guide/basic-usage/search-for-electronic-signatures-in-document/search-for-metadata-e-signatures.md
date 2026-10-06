---
id: search-for-metadata-e-signatures
url: signature/python-net/search-for-metadata-e-signatures
title: Search for Metadata e-Signatures
linkTitle: Metadata
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

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for metadata signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create an instance of [MetadataSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasearchoptions/) class.
3. Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass a list with the search options to it.
4. Process the search results: the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found [MetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignature/) objects, each with a `name`, a `value` and a value `type`.

Here's an example of how to search for metadata signatures in a document. The result includes the document's standard properties, such as `Producer` and `CreateDate`, as well as the custom ones:

{{< tabs "search_metadata" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import MetadataSearchOptions


def search_metadata():
    with Signature("signed.pdf") as signature:
        result = signature.search([MetadataSearchOptions()])

        print(f"Found {len(result.signatures)} metadata signature(s)")
        for metadata in result.signatures:
            print(f"{metadata.name} = {metadata.value} ({metadata.type.name})")


if __name__ == "__main__":
    search_metadata()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-metadata-e-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-metadata.txt" >}}  
```text
Found 10 metadata signature(s)
Producer = Microsoft® Word 2016 (STRING)
creator = DrNasmork (STRING)
CreatorTool = Microsoft® Word 2016 (STRING)
CreateDate = 2020-08-03 20:04:25+03:00 (DATE_TIME)
ModifyDate = 2020-08-03 20:04:25+03:00 (DATE_TIME)
Author = John Smith (STRING)
DocumentId = DOC-2026-0042 (STRING)
Department = Sales (STRING)
DocumentID = uuid:D7DC5B44-D1CC-453B-BC66-B0362EAE6617 (STRING)
[TRUNCATED]
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-metadata-e-signatures/search_metadata/search-metadata.txt)
{{< /tab >}}
{{< /tabs >}}

## Advanced Search Options

You can search for metadata signatures by name: set the `name` property of [MetadataSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasearchoptions/) and choose how it is compared with `name_match_type` ([TextMatchType](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textmatchtype/)):

{{< tabs "search_metadata_by_name" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import TextMatchType
from groupdocs.signature.options import MetadataSearchOptions


def search_metadata_by_name():
    with Signature("signed.pdf") as signature:
        options = MetadataSearchOptions()
        # Return only the metadata signature named "Author"
        options.name = "Author"
        options.name_match_type = TextMatchType.EXACT

        result = signature.search([options])

        print(f"Found {len(result.signatures)} matching metadata signature(s)")
        for metadata in result.signatures:
            print(f"{metadata.name} = {metadata.value}")


if __name__ == "__main__":
    search_metadata_by_name()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-metadata-e-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-metadata-by-name.txt" >}}  
```text
Found 1 matching metadata signature(s)
Author = John Smith
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-metadata-e-signatures/search_metadata_by_name/search-metadata-by-name.txt)
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

You are welcome to search for metadata signatures in documents with our free online apps:

* [Search for Metadata Signatures Online](https://products.groupdocs.app/signature/search/family)
