---
id: load-document-from-stream
url: signature/net/load-document-from-stream
title: Load document from Stream
linkTitle: → Stream
weight: 5
description: "This section explains how to load document from stream with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Signing document loaded from stream using C#    
        description: Handling documents stored in memory stream with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: Process document from memory stream with C# 
        description: Learn how to sign documents stored in memory stream with C#
        steps:
        - name: Load source document
          text: Create file stream and provide Signature instance with it as a constructor parameter. 
        - name: Provide signing options. 
          text: Set specific properties of desired SignOptions instance.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
---
There might be the case when your document is not physically located on the disk. Instead, you have the document in the form of a stream. In this case, to avoid the overhead of saving stream as a file on disk, [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) enables you to work with document from streams directly. Please be aware that [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object does not dispose passed stream.

The following are the steps to be followed:

* Obtain document stream;
* Pass opened stream to [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class constructor.

Following code snippet serves this purpose.

```csharp
using (Stream stream = File.OpenRead("sample.pdf"))
{
    using (Signature signature = new Signature(stream))
    {
        QRCodeSignOptions options = new QRCodeSignOptions("JohnSmith")
        {
            EncodeType = QRCodeTypes.QR,
            Left = 100,
            Top = 100
        };
        // sign document to file
        signature.Sign("SampleSigned", options);
    }
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