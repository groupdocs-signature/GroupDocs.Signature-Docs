---
id: save-signed-document-with-password
url: signature/net/save-signed-document-with-password
title: How to save document with password
weight: 1
description: "This article explains how to save document with password protection."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Save document with password using C#    
        description: This article explains how to save signed document with password using C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to save document with password using C# 
        description: This article explains how to ptotected signed document with password using C#
        steps:
        - name: Load document for signing from the local file or stream.
          text: Create Signature class instance by passing either local or network file path or stream. 
        - name: Provide with the signature options the SaveOptions. 
          text: Set the instance of SaveOptions (or derived specific one that is specific to Document type like PdfSaveOptions) with Password and UseOriginalPassword properties to setup the saving policy.
        - name: Run signing process and retrieve output protected document 
          text: Call the Sign method with passing in the signature options and the document save options.
        - name: Obtain protected document
          text: Get the protected signed document with password.
---
[Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class supports saving signed document with password protection. This ability is supported over [Password](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/saveoptions/password) property of [SaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/saveoptions) class that should be passed to [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method.

Here are the steps to protect signed document with password with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net):

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required signature options.
* Instantiate the [SaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/saveoptions) object and specify [Password](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/saveoptions/password) property with required password string.  
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass signatureoptions and [SaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/saveoptions) object to it.

Following example demonstrates how to save signed document with password.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // create QRCode option with predefined QRCode text
    QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith")
    {
        // setup QRCode encoding type
        EncodeType = QrCodeTypes.QR,
        // set signature position
        Left = 100,
        Top = 100
    };
    SaveOptions saveOptions = new SaveOptions()
    {
        Password = "1234567890",
        UseOriginalPassword = false
    };
    // sign document to file
    signature.Sign("SignedProtected.pdf", signOptions, saveOptions);
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
