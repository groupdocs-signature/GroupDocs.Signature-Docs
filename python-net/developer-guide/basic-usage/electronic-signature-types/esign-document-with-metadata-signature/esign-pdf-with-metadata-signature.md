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
* Instantiate one or several [PdfMetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/pdfmetadatasignature) objects and add them into [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) to metadata signatures collection ([Signatures](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions/signatures)) via [Add](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/add) or [AddRange](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/addrange) method.
* Call [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) to it.

## How to eSign PDF with Metadata signature

This example shows how to sign PDF document with several e-signatures as metadata.

{{< tabs "example-1" >}}
{{< tab "Python" >}}

```python
import groupdocs.signature as signature
from groupdocs.signature.options import MetadataSignOptions
from groupdocs.signature.domain import PdfMetadataSignature
from datetime import datetime

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create metadata options
    options = MetadataSignOptions()
    
    # Add metadata signatures
    options.add(PdfMetadataSignature("Author", "Mr.Scherlock Holmes"))  # String value
    options.add(PdfMetadataSignature("CreatedOn", datetime.now()))      # DateTime values
    options.add(PdfMetadataSignature("DocumentId", 123456))            # Integer value
    options.add(PdfMetadataSignature("SignatureId", 123.456))          # Double value
    options.add(PdfMetadataSignature("Amount", 123.456))               # Decimal value
    options.add(PdfMetadataSignature("Total", 123.456))                # Float value
    
    # Sign document
    sign.sign("SampleSigned.pdf", options)
```

{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
The following sample file is used in this example: [sample.pdf](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-pdf-with-metadata-signature/sample.pdf)
{{< /tab-text >}}
{{< /tab >}}
{{< /tabs >}}

## How to eSign PDF with standard metadata signatures

This example shows how to sign PDF document with standard embedded PDF document metadata signatures. If PDF metadata signature already exists with same name its value will be overwritten.

{{< tabs "example-2" >}}
{{< tab "Python" >}}

```python
import groupdocs.signature as signature
from groupdocs.signature.options import MetadataSignOptions
from groupdocs.signature.domain import PdfMetadataSignature, PdfMetadataSignatures
from datetime import datetime, timedelta

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create metadata options
    options = MetadataSignOptions()
    
    # Using standard Pdf Metadata Signatures with new values
    signatures = [
        PdfMetadataSignatures.AUTHOR.clone("Mr.Scherlock Holmes"),
        PdfMetadataSignatures.CREATE_DATE.clone(datetime.now() - timedelta(days=1)),
        PdfMetadataSignatures.METADATA_DATE.clone(datetime.now() - timedelta(days=2)),
        PdfMetadataSignatures.CREATOR_TOOL.clone("GD.Signature-Test"),
        PdfMetadataSignatures.MODIFY_DATE.clone(datetime.now() - timedelta(days=13)),
        PdfMetadataSignatures.PRODUCER.clone("GroupDocs-Producer"),
        PdfMetadataSignatures.ENTRY.clone("Signature"),
        PdfMetadataSignatures.KEYWORDS.clone("GroupDocs, Signature, Metadata, Creation Tool"),
        PdfMetadataSignatures.TITLE.clone("Metadata Example"),
        PdfMetadataSignatures.SUBJECT.clone("Metadata Test Example"),
        PdfMetadataSignatures.DESCRIPTION.clone("Metadata Test example description"),
        PdfMetadataSignatures.CREATOR.clone("GroupDocs.Signature")
    ]
    
    # Add signatures to options
    options.signatures.extend(signatures)
    
    # Sign document
    sign.sign("sample_signed.pdf", options)
```

{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
The following sample file is used in this example: [sample.pdf](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-pdf-with-metadata-signature/sample.pdf)
{{< /tab-text >}}
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.