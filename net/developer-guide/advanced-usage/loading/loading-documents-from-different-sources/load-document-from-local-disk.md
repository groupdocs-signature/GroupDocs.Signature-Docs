---
id: load-document-from-local-disk
url: signature/net/load-document-from-local-disk
title: Load document from local disk
linkTitle: → Local
weight: 4
description: "This section explains how to load document from local disk with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Signing document loaded from local disk using C#    
        description: Handling documents stored on local disk with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: Process document from local disk with C# 
        description: Learn how to sign documents stored on local disk with C#
        steps:
        - name: Load source document
          text: Create Signature instance with file path as a constructor parameter. 
        - name: Provide signing options. 
          text: Set specific properties of desired SignOptions instance.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
---
When document is located on the local disk [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) enables you to work with document over the file [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class constructor. [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) instance will open file for reading only when any method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) will be called.

Following code snippet shows how to load document from local disk.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    TextSignOptions options = new TextSignOptions("John Smith")
    {
    };
    // sign document to file
    signature.Sign("sampleSigned", options);
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