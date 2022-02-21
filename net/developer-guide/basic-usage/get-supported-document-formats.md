---
id: get-supported-document-formats
url: signature/net/get-supported-document-formats
title: Get supported file formats
weight: 1
description: "This article explains how to obtain supported file formats list for PDF, Words, Spreadsheet or Presentation document types when working with GroupDocs.Signature within your .NET applications."
keywords: GroupDocs.Signature supported files, GroupDocs.Signature supported documents, GroupDocs.Signature PDF files, GroupDocs.Signature Words files, GroupDocs.Signature Presentation files, GroupDocs.Signature Spreadsheet files
productName: GroupDocs.Signature for .NET
hideChildren: False
---

With [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) you can get the [list of file formats]({{< ref "signature/net/getting-started/supported-document-formats.md" >}}) that allow adding electronic signatures by following the below steps:

* Call static function [GetSupportedFileTypes](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/filetype/methods/getsupportedfiletypes) of [FileType](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/filetype) class;
* Enumerate through the collection of [FileType](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/filetype) objects.

The following code sample demonstrates how to get supported file formats list.

```csharp
IEnumerable<FileType> supportedFileTypes = FileType
    .GetSupportedFileTypes()
    .OrderBy(f => f.Extension);

foreach (FileType fileType in supportedFileTypes)
    Console.WriteLine(fileType);
```

