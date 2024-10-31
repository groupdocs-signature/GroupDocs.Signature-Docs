---
id: save-signed-word-processing-with-different-output-file-type
url: signature/net/save-signed-word-processing-with-different-output-file-type
title: Save signed Word Processing with different output file type
linkTitle: Words → format
weight: 5
description: "This article explains how to save signed Word Processing documents with various file formats by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Save signed Words in different format using C#    
        description: This article explains how to save signed Words document in differnt output format using C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to save signed Words with different output format file using C# 
        description: This topic explains how to save Words documents with specific file format using C#
        steps:
        - name: Load Words document for signing from the local file or stream.
          text: Create Signature class instance by passing either local or network file path or stream. 
        - name: Provide with the signature options the specific WordProcessingSaveOptions in. 
          text: Set the instance of WordProcessingSaveOptions with FileFormat and Overwrite properties to setup the saving policy.
        - name: Run signing process and retrieve output Words in desired format 
          text: Call the Sign method with passing in the signature options and the Words save options.
        - name: Obtain signed Words document in required format
          text: Get the output document in requested format.
---
[Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class supports saving of Word Processing signed documents with different formats. Each of document type has list of compatible saving type. These values are listed in enum [WordProcessingSaveFileFormat](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/wordprocessingsavefileformat).

Here are the steps to save signed Word Processing document to different output type with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net):

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required signature options.
* Instantiate the [WordProcessingSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/wordprocessingsaveoptions) object according to your requirements and specify [FileFormat](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/wordprocessingsaveoptions/fileformat) as one of predefined values from [WordProcessingSaveFileFormat](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/wordprocessingsavefileformat).
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass signatureoptions and [WordProcessingSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/wordprocessingsaveoptions) object to it.

Following example demonstrates how to save signed Word processing document with different output type

```csharp
using (Signature signature = new Signature("sample.docx"))
{
    // create QRCode option with predefined QRCode text
    QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith")
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

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
