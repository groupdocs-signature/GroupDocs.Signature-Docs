---
id: save-signed-word-processing-with-different-output-file-type
url: signature/net/save-signed-word-processing-with-different-output-file-type
title: Save signed Word Processing with different output file type
weight: 5
description: "This article explains how to save signed Word Processing documents with various file formats by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class supports saving of Word Processing signed documents with different formats. Each of document type has list of compatible saving type. These values are listed in enum [WordProcessingSaveFileFormat](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/wordprocessingsavefileformat).

Here are the steps to save signed Word Processing document to different output type with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net):

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required signature options.
* Instantiate the [WordProcessingSaveOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/wordprocessingsaveoptions) object according to your requirements and specify [FileFormat](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/wordprocessingsaveoptions/properties/fileformat) as one of predefined values from [WordProcessingSaveFileFormat](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/wordprocessingsavefileformat).
* Call [Sign](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/sign) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass signatureoptions and [WordProcessingSaveOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/wordprocessingsaveoptions) object to it.

Following example demonstrates how to save signed Word processing document with different output type

```csharp
using (Signature signature = new Signature("sample.docx"))
{
    // create QRCode option with predefined QRCode text
    QRCodeSignOptions signOptions = new QRCodeSignOptions("JohnSmith")
    {
        // setup QRCode encoding type
        EncodeType = QRCodeTypes.QR,
        // set signature position
        Left = 100,
        Top = 100
    };
    WordProcessingSaveOptions saveOptions = new WordProcessingSaveOptions()
    {
        FileFormat = WordProcessingSaveFileFormat.Odt,
        OverwriteExistingFiles = true
    };
    // sign document to file
    signature.Sign("SignedDocx.odt", signOptions, saveOptions);
}
```


