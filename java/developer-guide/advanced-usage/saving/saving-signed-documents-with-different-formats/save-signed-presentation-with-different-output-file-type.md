---
id: save-signed-presentation-with-different-output-file-type
url: signature/java/save-signed-presentation-with-different-output-file-type
title: Save signed Presentation with different output file type
weight: 3
description: "This article explains how to save signed Presentation documents with various file formats by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class supports saving of Presentation signed documents with different formats. Each of document type has list of compatible saving type. These values are listed in enum [PresentationSaveFileFormat](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/PresentationSaveFileFormat).

Here are the steps to save signed Presentation document to different output type with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java):

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path or stream as a constructor parameter.    
*   Instantiate required signature options.    
*   Instantiate the [PresentationSaveOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/PresentationSaveOptions) object according to your requirements and specify [setFileFormat](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/PresentationSaveOptions#setFileFormat(int)) as one of predefined values from [PresentationSaveFileFormat](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/PresentationSaveFileFormat). 
*   Call [sign](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass signatureoptions and [PresentationSaveOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/PresentationSaveOptions) object to it.
    

Following example demonstrates how to save signed Presentation document with different output type

```java
Signature signature = new Signature("sample.ppsx");
// create QRCode option with predefined QRCode text
QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith");
signOptions.setEncodeType(QrCodeTypes.QR);
signOptions.setLeft(100);
signOptions.setTop(100);
 
PresentationSaveOptions saveOptions = new PresentationSaveOptions();
saveOptions.setFileFormat(PresentationSaveFileFormat.Tiff);
saveOptions.setOverwriteExistingFiles(true);
// sign document to file
signature.sign("SignedPPsx.tiff", signOptions, saveOptions);
```

