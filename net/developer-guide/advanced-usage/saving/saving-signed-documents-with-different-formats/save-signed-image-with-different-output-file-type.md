---
id: save-signed-image-with-different-output-file-type
url: signature/net/save-signed-image-with-different-output-file-type
title: How to save signed Image with different output file type
linkTitle: Image → format
weight: 1
description: "This article explains how to save signed image with various image formats by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Save signed images in different format using C#    
        description: This article explains how to save signed images in differnt output format using C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to save signed Image with different output format file using C# 
        description: This topic explains how to save image documents with specific file format using C#
        steps:
        - name: Load image document for signing from the local file or stream.
          text: Create Signature class instance by passing either local or network file path or stream. 
        - name: Provide with the signature options the specific ImageSaveOptions in. 
          text: Set the instance of ImageSaveOptions with FileFormat and Overwrite properties to setup the saving policy.
        - name: Run signing process and retrieve output image in desired format 
          text: Call the Sign method with passing in the signature options and the image save options.
        - name: Obtain signed image document in required format
          text: Get the output document in requested format.
---
[Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class supports saving of Image signed documents with different formats. Each of document type has list of compatible saving type. These values are listed in enum [ImageSaveFileFormat](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/imagesavefileformat).

Here are the steps to save signed Image document to different output type with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net):

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required signature options.
* Instantiate the [ImageSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesaveoptions) object according to your requirements and specify [FileFormat](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesaveoptions/fileformat) as one of predefined values from [ImageSaveFileFormat](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/imagesavefileformat).  
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass signatureoptions and object [ImageSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesaveoptions) to it.

Following example demonstrates how to save signed Image document with different output type

```csharp
using (Signature signature = new Signature("sample.jpg"))
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
    ImageSaveOptions saveOptions = new ImageSaveOptions()
    {
        FileFormat = ImageSaveFileFormat.Svg,
        OverwriteExistingFiles = true
    };
    // sign document to file
    signature.Sign("signed.svg", signOptions, saveOptions);
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