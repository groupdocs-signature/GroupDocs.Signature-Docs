---
id: search-for-form-field-e-signatures
url: signature/python-net/search-for-form-field-e-signatures
title: Search for Form Field e-Signatures
linkTitle: Form Fields
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

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for form field signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create an instance of [FormFieldSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsearchoptions/) class.
3. Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass a list with the search options to it.
4. Process the search results: the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found [FormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/formfieldsignature/) objects.

Here's an example of how to search for form field signatures in a document. A PDF digital signature is kept in a signature form field, so it is listed too, with the `DIGITAL_SIGNATURE` type:

{{< tabs "search_form_fields" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import FormFieldSearchOptions


def search_form_fields():
    with Signature("signed.pdf") as signature:
        result = signature.search([FormFieldSearchOptions()])

        print(f"Found {len(result.signatures)} form field signature(s)")
        for field in result.signatures:
            print(f"Page {field.page_number}: {field.type.name} field {field.name!r}, value: {field.value!r}")


if __name__ == "__main__":
    search_form_fields()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-form-field-e-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-form-fields.txt" >}}  
```text
Found 3 form field signature(s)
Page 1: TEXT field 'ApprovedBy', value: 'John Smith'
Page 1: CHECKBOX field 'Confirmed', value: True
Page 1: DIGITAL_SIGNATURE field None, value: None
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-form-field-e-signatures/search_form_fields/search-form-fields.txt)
{{< /tab >}}
{{< /tabs >}}

## Advanced Search Options

You can customize the search process with the `name`, `type` ([FormFieldType](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/formfieldtype/)) and `value` properties of [FormFieldSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsearchoptions/):

{{< tabs "search_form_fields_by_name" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import FormFieldType
from groupdocs.signature.options import FormFieldSearchOptions


def search_form_fields_by_name():
    with Signature("signed.pdf") as signature:
        options = FormFieldSearchOptions()
        # Return only text fields named "ApprovedBy"
        options.type = FormFieldType.TEXT
        options.name = "ApprovedBy"

        result = signature.search([options])

        print(f"Found {len(result.signatures)} matching form field signature(s)")
        for field in result.signatures:
            print(f"Field '{field.name}' on page {field.page_number}, value: {field.value}")


if __name__ == "__main__":
    search_form_fields_by_name()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-form-field-e-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-form-fields-by-name.txt" >}}  
```text
Found 1 matching form field signature(s)
Field 'ApprovedBy' on page 1, value: John Smith
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-form-field-e-signatures/search_form_fields_by_name/search-form-fields-by-name.txt)
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

You are welcome to search for form field signatures in documents with our free online apps:

* [Search for Form Field Signatures Online](https://products.groupdocs.app/signature/family)
