---
id: esign-pdf-with-metadata-signature
url: signature/python-net/esign-pdf-with-metadata-signature
title: eSign PDF with Metadata signature
linktitle: ✍️ eSign PDF
weight: 2
description: "This article explains how to add metadata signatures to PDF document meta info layer with GroupDocs.Signature"
keywords: Pdf metadata, Pdf metadata signatures
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Pdf documents metadata changing in Python    
        description: Update metadata of pdf document with Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to append new metadata to pdf document using Python 
        description: Learn all about signing pdf documents by metadata and Python
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Create needed PdfMetadataSignature class instances and add them to array.
        - name: Sign source file and save result 
          text: Invoke Sign method with array of signing options and output file path or stream.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [PdfMetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/pdfmetadatasignature) class to specify different Metadata signature objects for [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) instance.
PDF document metadata is hidden attributes, some of them are visible only over viewing standard document properties like Author, Creation Date, Producer, Entry, Keywords etc.  
PDF document metadata contains 3 fields: Name, Value and TagPrefix, combination of Name and Tag prefix should be unique.

PDF document metadata could keep big amount of data that provides ability to keep serialized custom objects with additional encryption in there. 

### Here are the steps to add metadata signatures into PDF document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) object according to your requirements.
* Instantiate one or several [PdfMetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/pdfmetadatasignature) objects and add them to the options with the [add](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions/add) method, or to its [signatures](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions/signatures) collection with the [append](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/append) or [add_range](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/add_range) method.
* Call [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) to it.

## How to eSign PDF with Metadata signature

This example shows how to sign PDF document with several e-signatures as metadata.

{{< tabs "sign_pdf" >}}
{{< tab "Python" >}}
```python
from datetime import datetime

from groupdocs.signature import Signature
from groupdocs.signature.options import MetadataSignOptions
from groupdocs.signature.domain import PdfMetadataSignature


def sign_pdf():
    with Signature("sample.pdf") as signature:
        options = MetadataSignOptions()

        # Add metadata signatures with values of different types
        options.add(PdfMetadataSignature("Author", "Mr.Scherlock Holmes"))  # text
        options.add(PdfMetadataSignature("CreatedOn", datetime.now()))      # date and time
        options.add(PdfMetadataSignature("DocumentId", 123456))             # whole number
        options.add(PdfMetadataSignature("SignatureId", 123.456))           # floating-point number

        # Sign the document and save the result
        result = signature.sign("signed.pdf", options)
        print(f"Signed with {len(result.succeeded)} metadata signature(s):")
        for item in result.succeeded:
            print(f"  {item.name}")


if __name__ == "__main__":
    sign_pdf()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-pdf-with-metadata-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed.pdf" >}}  
```text
Binary file (PDF, 36 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-pdf-with-metadata-signature/sign_pdf/signed.pdf)
{{< /tab >}}
{{< /tabs >}}

## How to eSign PDF with standard metadata signatures

This example shows how to sign PDF document with standard embedded PDF document metadata signatures. If PDF metadata signature already exists with same name its value will be overwritten.

{{< tabs "sign_pdf_standard" >}}
{{< tab "Python" >}}
```python
from datetime import datetime, timedelta

from groupdocs.signature import Signature
from groupdocs.signature.options import MetadataSignOptions
from groupdocs.signature.domain import PdfMetadataSignatures


def sign_pdf_standard():
    with Signature("sample.pdf") as signature:
        options = MetadataSignOptions()

        # Copy the standard PDF metadata signatures with new values
        now = datetime.now()
        signatures = [
            PdfMetadataSignatures.AUTHOR.clone("Mr.Scherlock Holmes"),
            PdfMetadataSignatures.CREATE_DATE.clone(now - timedelta(days=1)),
            PdfMetadataSignatures.METADATA_DATE.clone(now - timedelta(days=2)),
            PdfMetadataSignatures.CREATOR_TOOL.clone("GD.Signature-Test"),
            PdfMetadataSignatures.MODIFY_DATE.clone(now - timedelta(days=13)),
            PdfMetadataSignatures.PRODUCER.clone("GroupDocs-Producer"),
            PdfMetadataSignatures.ENTRY.clone("Signature"),
            PdfMetadataSignatures.KEYWORDS.clone("GroupDocs, Signature, Metadata, Creation Tool"),
            PdfMetadataSignatures.TITLE.clone("Metadata Example"),
            PdfMetadataSignatures.SUBJECT.clone("Metadata Test Example"),
            PdfMetadataSignatures.DESCRIPTION.clone("Metadata Test example description"),
            PdfMetadataSignatures.CREATOR.clone("GroupDocs.Signature"),
        ]

        # Add all of them to the options at once
        options.signatures.add_range(signatures)

        # Sign the document and save the result
        result = signature.sign("signed_standard.pdf", options)
        print(f"Signed with {len(result.succeeded)} metadata signature(s)")


if __name__ == "__main__":
    sign_pdf_standard()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-pdf-with-metadata-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_standard.pdf" >}}  
```text
Binary file (PDF, 36 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-pdf-with-metadata-signature/sign_pdf_standard/signed_standard.pdf)
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.