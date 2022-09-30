---
id: save-signed-spreadsheet-with-different-output-file-type
url: signature/net/save-signed-spreadsheet-with-different-output-file-type
title: Save signed Spreadsheet with different output file type
weight: 4
description: "This article explains how to save signed Spreadsheet document with various file formats by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Save signed Spreadsheet in different format using C#    
        description: This article explains how to save signed Spreadsheet document in differnt output format using C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to save signed Spreadsheet with different output format file using C# 
        description: This topic explains how to save Spreadsheet documents with specific file format using C#
        steps:
        - name: Load Spreadsheet document for signing from the local file or stream.
          text: Create Signature class instance by passing either local or network file path or stream. 
        - name: Provide with the signature options the specific SpreadsheetSaveOptions in. 
          text: Set the instance of SpreadsheetSaveOptions with FileFormat and Overwrite properties to setup the saving policy.
        - name: Run signing process and retrieve output Spreadsheet in desired format 
          text: Call the Sign method with passing in the signature options and the Spreadsheet save options.
        - name: Obtain signed Spreadsheet document in required format
          text: Get the output document in requested format.
---
[Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class supports saving of Spreadsheet signed documents with different output file types. Each document type has list of compatible saving type. These values are listed in enum [SpreadsheetSaveFileFormat.](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/spreadsheetsavefileformat)

Here are the steps to save signed Spreadsheet document to different output type with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net):

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required signature options.
* Instantiate the [SpreadsheetSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/spreadsheetsaveoptions) object according to your requirements and specify [FileFormat](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/spreadsheetsaveoptions/fileformat) as one of predefined values from [SpreadsheetSaveFileFormat](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/spreadsheetsavefileformat).  

* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass signatureoptions and [SpreadsheetSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/spreadsheetsaveoptions) object to it.

Following example demonstrates how to save signed Spreadsheet document with different output type

```csharp
using (Signature signature = new Signature("sample.xlsx"))
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
    SpreadsheetSaveOptions saveOptions = new SpreadsheetSaveOptions()
    {
        FileFormat = SpreadsheetSaveFileFormat.Pdf,
        OverwriteExistingFiles = true
    };
    // sign document to file
    signature.Sign("SignedXlsx.pdf", signOptions, saveOptions);
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

### Free Online App

Along with full-featured .NET library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
