---
id: esign-word-processing-document-with-metadata-signature
url: signature/python-net/esign-word-processing-document-with-metadata-signature
title: eSign Word Processing document with Metadata signature
linktitle: ✍️ eSign Words
weight: 5
description: "This article explains how to sign Word Processing document with metadata signatures by GroupDocs.Signature."
keywords: 
productName: GroupDocs.Signature for Python via .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Sign Word Processing documents with metadata updating in Python    
        description: Update metadata in Word Processing documents with Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How change metadata in Word Processing documents using Python 
        description: Learn all about signing Word Processing documents by metadata and Python
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Create demanded WordProcessingMetadataSignature class instances and add them to array.
        - name: Sign source file and save result 
          text: Invoke Sign method with array of signing options and output file path or stream.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [WordProcessingMetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/wordprocessingmetadatasignature) class to specify different Metadata signature objects for [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) instance to sign Word Processing document files.
Word Processing document metadata is hidden attributes, some of them are visible only over viewing standard document properties like Author, Creation Date, Producer, Entry, Keywords etc.  
Word Processing document metadata contains pair of Name and Value, Name should be unique within the document.  
Word Processing document metadata could keep big amount of data that allows provides ability to keep serialized custom objects with additional encryption in there.

### Here are the steps to add metadata signatures into Word Processing document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) object according to your requirements.
* Instantiate one or several [WordProcessingMetadataSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/wordprocessingmetadatasignature) objects and add them into [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) to metadata signatures collection ([Signatures](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions/signatures)) via [Add](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/add) or [AddRange](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/metadatasignaturecollection/addrange) method.
* Call [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass [MetadataSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/metadatasignoptions) to it.

## How to eSign Word Processing document with Metadata signature

This example shows how to sign Word Processing document with Metadata e-signature.

```python
import groupdocs.signature as signature
from groupdocs.signature.options import MetadataSignOptions
from groupdocs.signature.domain import WordProcessingMetadataSignature
from datetime import datetime

# Initialize signature
with signature.Signature("sample.docx") as sign:
    # Create metadata options
    options = MetadataSignOptions()
    
    # Create few WordProcessing Metadata signatures
    signatures = [
        WordProcessingMetadataSignature("Author", "Mr.Scherlock Holmes"),
        WordProcessingMetadataSignature("DateCreated", datetime.now()),
        WordProcessingMetadataSignature("DocumentId", 123456),
        WordProcessingMetadataSignature("SignatureId", 123.456)
    ]
    
    # Add signatures to options
    options.signatures.extend(signatures)
    
    # Sign document
    sign.sign("SampleSigned.docx", options)
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
