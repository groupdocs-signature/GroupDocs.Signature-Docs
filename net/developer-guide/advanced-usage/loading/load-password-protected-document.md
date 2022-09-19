---
id: load-password-protected-document
url: signature/net/load-password-protected-document
title: How to load password-protected document
weight: 2
description: "This article explains how to load password protected document with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Signing password protected document using C#    
        description: Processing documents which are encrypted with password with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to handle with password protected document via C# 
        description: Get information about ways of handling password protected documents with C#
        steps:
        - name: Set up document password
          text: Instantiate LoadOptions object, providing password data. 
        - name: Pass file to Signature. 
          text: Instantiate Signature object by passing file and LoadOptions as constructor parameters.
        - name: Provide signing options. 
          text: Set specific properties of desired SignOptions instance.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) supports processing documents that are protected with a password.

The following are the steps to work with password protected documents.

*   Instantiate the [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions) object;
*   Set password in [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions) the [Password](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions/password)property;
*   Create [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object and call any method.

The following code sample shows how to process password protected documents.

```csharp
LoadOptions loadOptions = new LoadOptions()
{
    Password = "1234567890"
};
using (Signature signature = new Signature("sampleProtected.pdf", loadOptions))
{
    QRCodeSignOptions options = new QRCodeSignOptions("JohnSmith")
    {
        EncodeType = QRCodeTypes.QR,
        Left = 100,
        Top = 100
    };
    // sign document to file
    signature.Sign("SignedSampleProtected", options);
}
```

## More resources
### GitHub Examples
You may easily run the code above and see the feature in action in our GitHub examples:
*   [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)    
*   [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)    
*   [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)     
*   [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)    
*   [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)    
*   [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)    

### Free Online App 
Along with full-featured .NET library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.