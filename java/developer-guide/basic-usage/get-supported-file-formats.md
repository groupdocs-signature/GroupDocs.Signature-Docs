---
id: get-supported-file-formats
url: signature/java/get-supported-file-formats
title: Get supported file formats
weight: 1
description: "This article explains how to obtain supported file formats list for PDF, Words, Spreadsheet or Presentation document types when working with GroupDocs.Signature within your .NET applications."
keywords: GroupDocs.Signature supported files, GroupDocs.Signature supported documents, GroupDocs.Signature PDF files, GroupDocs.Signature Words files, GroupDocs.Signature Presentation files, GroupDocs.Signature Spreadsheet files
productName: GroupDocs.Signature for Java
hideChildren: False

---
With [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) you can get the [list of file formats]({{< ref "signature/java/getting-started/supported-document-formats.md" >}}) that allow adding electronic signatures by following the below steps:

*   Call static function [getSupportedFileTypes](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/FileType#getSupportedFileTypes()) of [FileType](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/FileType) class;
*   Enumerate through the collection of [FileType](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/FileType) objects.

The following code sample demonstrates how to get supported file formats list.

```java
java.util.List<FileType> supportedFileTypes = FileType.getSupportedFileTypes();
for(FileType fileType : supportedFileTypes){
    System.out.print(fileType.getExtension());
}
```


