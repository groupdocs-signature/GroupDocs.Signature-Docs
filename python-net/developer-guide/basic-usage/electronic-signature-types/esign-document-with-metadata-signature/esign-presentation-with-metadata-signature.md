---
id: esign-presentation-with-metadata-signature
url: signature/python-net/esign-presentation-with-metadata-signature
title: eSign Presentation with Metadata signature
linktitle: eSign Presentation
weight: 3
description: "This article explains how to add metadata signatures to Presentation document with GroupDocs.Signature"
keywords: Presentation metadata, Presentation metadata signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Signing presentations with metadata in Python    
        description: Adding new metadata to presentations with Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to create new metadata in presentations using Python 
        description: Learn all about signing a presentation by metadata and Python
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Create demanded PresentationMetadataSignature class instances and add them to array.
        - name: Sign source file and save result 
          text: Invoke Sign method with array of signing options and output file path or stream.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [PresentationMetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/presentationmetadatasignature) class to specify different Metadata signature objects for [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) instance to sign Presentation document files.
Presentation document metadata is hidden attributes, some of them are visible only over viewing standard document properties like Author, Creation Date, Producer, Entry, Keywords etc.  
Presentation document metadata contains pair of Name and Value, Name should be unique within the document.  
Presentation document metadata could keep big amount of data that allows provides ability to keep serialized custom objects with additional encryption in there.

### Here are the steps to add metadata signatures into Presentation document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) object according to your requirements.
* Instantiate one or several [PresentationMetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/presentationmetadatasignature) objects and add them to the [signatures](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions/signatures) collection of [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) with the [append](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/append) or [add_range](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/add_range) method.
* Call [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) to it.

## How to eSign Presentation with Metadata signature

This example shows how to add Metadata signature to Presentation document.

{{< tabs "sign_ppsx" >}}
{{< tab "Python" >}}
```python
from datetime import datetime

from groupdocs.signature import Signature
from groupdocs.signature.options import MetadataSignOptions
from groupdocs.signature.domain import PresentationMetadataSignature


def sign_ppsx():
    with Signature("sample.ppsx") as signature:
        options = MetadataSignOptions()

        # Create a few Presentation Metadata signatures
        signatures = [
            PresentationMetadataSignature("Author", "Mr.Scherlock Holmes"),
            PresentationMetadataSignature("DateCreated", datetime.now()),
            PresentationMetadataSignature("DocumentId", 123456),
            PresentationMetadataSignature("SignatureId", 123.456),
        ]

        # Add them to the options
        options.signatures.add_range(signatures)

        # Sign the presentation and save the result
        result = signature.sign("signed.ppsx", options)
        print(f"Signed with {len(result.succeeded)} metadata signature(s):")
        for item in result.succeeded:
            print(f"  {item.name}")


if __name__ == "__main__":
    sign_ppsx()
```
{{< /tab >}}
{{< tab "sample.ppsx" >}}
{{< tab-text >}}
`sample.ppsx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-presentation-with-metadata-signature/sample.ppsx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed.ppsx" >}}  
```text
Binary file (PPSX, 67 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-presentation-with-metadata-signature/sign_ppsx/signed.ppsx)
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
