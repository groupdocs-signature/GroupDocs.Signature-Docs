---
id: basic-usage
url: signature/python-net/basic-usage
title: Basic Usage
weight: 1
description: "Quick Start section about main features of GroupDocs.Signature for Python via .NET, describes how to sign documents with just a few lines of Python code."
keywords: GroupDocs.Signature Quick Start, GroupDocs.Signature Python Basic Usage, GroupDocs.Signature Quick Start Python, GroupDocs.Signature Get Started, Python signature examples
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
structuredData:
    showOrganization: True
---  
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides a powerful API for working with different electronic signature types such as Text, Image, Digital, Barcode, QR-code, Stamp, Form Field, and Metadata. These e-signatures can be added to documents, updated, deleted, verified, or searched within already signed documents. Our product also provides information about document type and structure - file type, size, pages count, etc. and generates document pages preview based on provided options.  

## Main Concepts

* The `Signature` class is the main entry point that contains all required methods for manipulating document e-signatures.
* Most methods expect different options objects for signing documents, verifying and searching electronic signatures.
* The `Signature` class implements proper resource management to ensure all document streams are safely closed when operations are completed.

## Installation

Install the package using pip:

```bash
pip install groupdocs-signature
```

## Required Imports

The following code shows how to include required imports for all code examples:

```python
import groupdocs.signature as signature
from groupdocs.signature.domain import *
from groupdocs.signature.options import *
from groupdocs.signature.domain.extensions import *
```  

## Basic Usage Example

The following code shows the most common pattern to define a `Signature` object and call its methods:

```python
# Sign document with text signature
with signature.Signature("sample.docx") as sign:
    text_sign_options = signature.TextSignOptions("John Smith")
    sign.sign("SampleSigned.docx", text_sign_options)
```

## Key Features

1. **Document Signing**: Add various types of signatures to your documents
2. **Signature Search**: Find existing signatures in documents
3. **Signature Verification**: Verify the authenticity of signatures
4. **Signature Update**: Modify existing signatures
5. **Signature Deletion**: Remove signatures from documents
6. **Document Information**: Get details about document structure
7. **Document Preview**: Generate previews of document pages

Please check the detailed examples in the following guides to learn how to:
* Sign documents with different signature types
* Search and verify document signatures
* Update and delete signatures
* Generate document previews
* Get document information

Here are main GroupDocs Signature API concepts:

* [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) is the main class that contains all required methods for manipulating with document e-signatures.
* Most part of methods expects different options to eSign document, verify and search electronic signatures inside document.
* [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class implements [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable) interface to correctly release used resources - like safely closing document streams when all operations completed.

## Referencing required namespaces

The following code shows how to include required namespace for all code examples.

```python
import groupdocs.signature as signature
from groupdocs.signature.domain import *
from groupdocs.signature.options import *
from groupdocs.signature.domain.extensions import *
```  

## Signature object definition

The following code shows most used code pattern to define [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object and call its methods.  

```python
# Sign document with text signature.
with signature.Signature("sample.docx") as sign:
   text_sign_options = signature.TextSignOptions("John Smith")
   sign.sign("SampleSigned.docx", text_sign_options)
```

Please check detailed examples of how to eSign documents, search and verify document signatures in the following guides:
