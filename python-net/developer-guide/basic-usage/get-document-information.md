---
id: get-document-information
url: signature/python-net/get-document-information
title: Get document information
weight: 2
description: "This article explains how to detect document file type, obtain document details,  retrieve list of existing form fields and added signatures, calculate pages count when processing document file with GroupDocs.Signature for Python via .NET."
keywords: document properties, document information, document details, get document information
productName: GroupDocs.Signature for Python via .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Get document extended information using Python    
        description: Gaining information about particular document using Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to collect document information using Python 
        description: Getting detailed information about documents of various document types in Python
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) allows to get document information which includes:

* [FileType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentinfo/filetype)
* [Size](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentinfo/size)
* [PageCount](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentinfo/pagecount)
* Pages dimensions - [Height](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/pageinfo/height) and [Width](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/pageinfo/width) for each page in a document [Pages](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/idocumentinfo/pages) collection.

## Get document information from file on local disk

The following code snippet demonstrates how to obtain information about document stored on local disk.

```python
import os
import groupdocs.signature as signature

with signature.Signature("sample.pdf") as sign:
    document_info = sign.get_document_info()
    print(f"Document properties {os.path.basename('sample.pdf')}:")
    print(f" - format : {document_info.file_type.file_format}")
    print(f" - extension : {document_info.file_type.extension}")
    print(f" - size : {document_info.size}")
    print(f" - page count : {document_info.page_count}")
    for page_info in document_info.pages:
        print(f" - page-{page_info.page_number} Width {page_info.width}, Height {page_info.height}")
```

## Get document information from a stream

The following code snippet demonstrates how to obtain information about document provided as a stream.

```python
import os
import groupdocs.signature as signature

with open("sample.pdf", "rb") as stream:
    with signature.Signature(stream) as sign:
        document_info = sign.get_document_info()
        print(f"Document properties {os.path.basename('sample.pdf')}:")
        print(f" - format : {document_info.file_type.file_format}")
        print(f" - extension : {document_info.file_type.extension}")
        print(f" - size : {document_info.size}")
        print(f" - page count : {document_info.page_count}")
        for page_info in document_info.pages:
            print(f" - page-{page_info.page_number} Width {page_info.width}, Height {page_info.height}")
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python)



### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
