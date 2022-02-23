---
id: save-signed-spreadsheet-with-different-output-file-type
url: signature/java/save-signed-spreadsheet-with-different-output-file-type
title: Save signed Spreadsheet with different output file type
weight: 4
description: "This article explains how to save signed Spreadsheet document with various file formats by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class supports saving of Spreadsheet signed documents with different output file types. Each document type has list of compatible saving type. These values are listed in enum [SpreadsheetSaveFileFormat.](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/SpreadsheetSaveFileFormat)

Here are the steps to save signed Spreadsheet document to different output type with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java):

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path or stream as a constructor parameter.    
*   Instantiate required signature options.    
*   Instantiate the [SpreadsheetSaveOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/SpreadsheetSaveOptions) object according to your requirements and specify [setFileFormat](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/SpreadsheetSaveOptions#setFileFormat(int)) as one of predefined values from [SpreadsheetSaveFileFormat](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/SpreadsheetSaveFileFormat).
*   Call [sign](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass signatureoptions and [SpreadsheetSaveOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/SpreadsheetSaveOptions) object to it.
    

Following example demonstrates how to save signed Spreadsheet document with different output type

```java
Signature signature = new Signature("sample.xlsx");
// create QRCode option with predefined QRCode text
QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith");
signOptions.setEncodeType(QrCodeTypes.QR);
signOptions.setLeft(100);
signOptions.setTop(100);
 
SpreadsheetSaveOptions saveOptions = new SpreadsheetSaveOptions();
saveOptions.setFileFormat(SpreadsheetSaveFileFormat.Pdf);
saveOptions.setOverwriteExistingFiles(true);
// sign document to file
signature.sign("SignedXlsx.pdf", signOptions, saveOptions);
```


