---
id: get-document-information
url: signature/python-net/get-document-information
title: Get document information
weight: 2
description: "This article explains how to detect document file type, obtain document details, retrieve list of existing form fields and added signatures, calculate pages count when processing document file with GroupDocs.Signature for Python via .NET."
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

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) allows you to get document information which includes:

* [FileType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentinfo/filetype) - Document format and extension
* [Size](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentinfo/size) - File size in bytes
* [PageCount](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentinfo/pagecount) - Total number of pages
* Pages dimensions - [Height](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/pageinfo/height) and [Width](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/pageinfo/width) for each page in a document [Pages](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/idocumentinfo/pages) collection.

## Get document information from file on local disk

The following code snippet demonstrates how to obtain information about a document stored on local disk:

```python
import os
import groupdocs.signature as signature

try:
    # Initialize signature handler
    signature_handler = signature.Signature("sample.pdf")
    
    # Get document information
    document_info = signature_handler.get_document_info()
    
    # Print document properties
    print(f"Document properties {os.path.basename('sample.pdf')}:")
    print(f" - Format: {document_info.file_type.file_format}")
    print(f" - Extension: {document_info.file_type.extension}")
    print(f" - Size: {document_info.size} bytes")
    print(f" - Page count: {document_info.page_count}")
    
    # Print page dimensions
    for page_info in document_info.pages:
        print(f" - Page {page_info.page_number}: Width {page_info.width}, Height {page_info.height}")
        
except Exception as e:
    print(f"An error occurred: {str(e)}")
finally:
    # Ensure resources are released
    if 'signature_handler' in locals():
        signature_handler.dispose()
```

## Get document information from a stream

The following code snippet demonstrates how to obtain information about a document provided as a stream:

```python
import os
import groupdocs.signature as signature

try:
    # Open document stream
    with open("sample.pdf", "rb") as stream:
        # Initialize signature handler
        signature_handler = signature.Signature(stream)
        
        # Get document information
        document_info = signature_handler.get_document_info()
        
        # Print document properties
        print(f"Document properties {os.path.basename('sample.pdf')}:")
        print(f" - Format: {document_info.file_type.file_format}")
        print(f" - Extension: {document_info.file_type.extension}")
        print(f" - Size: {document_info.size} bytes")
        print(f" - Page count: {document_info.page_count}")
        
        # Print page dimensions
        for page_info in document_info.pages:
            print(f" - Page {page_info.page_number}: Width {page_info.width}, Height {page_info.height}")
            
except Exception as e:
    print(f"An error occurred: {str(e)}")
finally:
    # Ensure resources are released
    if 'signature_handler' in locals():
        signature_handler.dispose()
```

## Additional Properties

The `document_info` object provides additional properties that you can access:

* `file_type.file_format` - Gets the file format (e.g., PDF, DOCX, XLSX)
* `file_type.extension` - Gets the file extension (e.g., .pdf, .docx, .xlsx)
* `size` - Gets the file size in bytes
* `page_count` - Gets the total number of pages
* `pages` - Collection of page information objects, each containing:
  * `page_number` - Page number (1-based)
  * `width` - Page width in pixels
  * `height` - Page height in pixels

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
