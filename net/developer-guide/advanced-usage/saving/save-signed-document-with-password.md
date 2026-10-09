---
id: save-signed-document-with-password
url: signature/net/save-signed-document-with-password
title: How to save document with password
weight: 1
description: "This article explains how to save document with password protection."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
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
        description: This article explains how to protected signed document with password using C#
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

## Passwords of a PDF document

A protected PDF document has two passwords:

* the open (user) password, set with [Password](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/saveoptions/password). It is needed to open the document;
* the owner password, set with [PermissionsPassword](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions/permissionspassword) of [PdfSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions). It is needed to change the document permissions.

When `PermissionsPassword` is not set, GroupDocs.Signature uses a random owner password. The document then opens only with the open password, and nobody can change its permissions later. Set `PermissionsPassword` when you need to change the permissions yourself; see [How to protect a signed PDF document]({{< ref "signature/net/developer-guide/advanced-usage/saving/protect-pdf-documents.md" >}}).

`Password` applies to digital signatures as well: the document is protected before it is signed, so the signature stays valid. A PDF document that already carries digital signatures keeps its current protection when you add only digital signatures, because changing the protection would invalidate the existing signatures.

{{< alert style="warning" >}}
GroupDocs.Signature for .NET 26.9 and earlier wrote an empty owner password when `PermissionsPassword` was not set, so many PDF readers opened the document without any password. These versions also ignored `Password` for digital signatures. With them, always set `PermissionsPassword` together with `Password`, and protect digitally signed PDF documents in a separate step.
{{< /alert >}}

The following example protects a signed PDF document with an open password and keeps the owner password:

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    TextSignOptions signOptions = new TextSignOptions("John Smith");
    PdfSaveOptions saveOptions = new PdfSaveOptions()
    {
        // needed to open the document
        Password = "1234567890",
        // needed to change the permissions; when it is not set, a random one is used
        PermissionsPassword = "owner-password",
        UseOriginalPassword = false
    };
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

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
