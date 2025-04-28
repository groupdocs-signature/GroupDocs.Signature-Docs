---
id: get-supported-document-formats
url: signature/python-net/get-supported-document-formats
title: Get supported file formats
weight: 1
description: "This article explains how to obtain supported file formats list for PDF, Words, Spreadsheet or Presentation document types when working with GroupDocs.Signature for Python via .NET within your Python applications."
keywords: GroupDocs.Signature supported files, GroupDocs.Signature supported documents, GroupDocs.Signature PDF files, GroupDocs.Signature Words files, GroupDocs.Signature Presentation files, GroupDocs.Signature Spreadsheet files
productName: GroupDocs.Signature for Python via .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Get list of supported file types with Python    
        description: Getting list of document types which can be processed using Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to obtain file types for signing with Python 
        description: Collecting list of various document types which are suitable for signing in Python
        steps:
        - name: Get supported file types.
          text: Invoke method GetSupportedFileTypes. 
        - name: Process file types.
          text: Process all selected file types in demanded way. 
---

## Overview

With [**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) you can get the [list of file formats]({{< ref "signature/net/getting-started/supported-document-formats.md" >}}) that allow adding electronic signatures by following the below steps:

* Call static function [GetSupportedFileTypes](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/filetype/getsupportedfiletypes) of [FileType](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/filetype) class;
* Enumerate through the collection of [FileType](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/filetype) objects.

The following code sample demonstrates how to get supported file formats list.

```python
import groupdocs.signature as signature

supported_file_types = signature.FileType.get_supported_file_types()
for file_type in sorted(supported_file_types, key=lambda x: x.extension):
    print(file_type)
```

<!-- ### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/net/developer-guide/advanced-usage/_index.md" >}}). -->

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python)
* [Document Signature for Python Django UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-Django)
* [Document Signature for Python Flask UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-Flask)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
