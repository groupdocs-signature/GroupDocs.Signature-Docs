---
id: esign-document-with-image-signature
url: signature/net/esign-document-with-image-signature
title: eSign document with Image signature
linkTitle: Image signature
weight: 4
description: "This article demonstrates how to add signature image on document page with GroupDocs.Signature."
keywords: signature image, add signature image, how to add signature image
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Sign documents with an image in C#    
        description: Sign documents with various images quickly and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign any documents with an image using C# 
        description: Learn all about signing a document with image by C#
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate the Signature object by passing file as a constructor parameter. You may provide either a file path or a file stream. 
        - name: Specify signing options 
          text: Create an instance of the ImageSignOptions class.
        - name: Sign source file and save result 
          text: Invoke the Sign method with signing options and a file path for the resulting file. File stream can be used as well.
---
## What is an Image Signature?

An **image** as a signature is an alternative way to put any presenting data in a visual form. This electronic signature type allows the creation of custom images with a company logo, sender's initials, names and so forth.

![Images](/signature/net/images/esign-document-with-image-signature.png)

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides the [ImageSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions) class to specify different settings for image signature such as image content by file or stream, location, colors and advanced effects.

Here are the steps to create an image signature on a document page:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter;
* Instantiate the [ImageSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions) object according to your requirements and specify Image signature options;
* Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass the [ImageSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions) to it.

## How to eSign document with Image signature

This example shows how to sign a PDF document with the image signature.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    ImageSignOptions options = new ImageSignOptions("signature.jpg")
    {
        // set signature position
        Left = 100,
        Top = 100,
        //
        AllPages = true
    };
    signature.Sign("SampleSigned.pdf", options);
}
```

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/net/developer-guide/advanced-usage/_index.md" >}}).

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

To generate image signatures and/or sign your files with them for free, you can use the [Generate Image](https://products.groupdocs.app/signature/generate/image) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.