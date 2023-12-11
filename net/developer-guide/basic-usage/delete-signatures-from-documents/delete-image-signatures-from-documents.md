---
id: delete-image-signatures-from-documents
url: signature/net/delete-image-signatures-from-documents
title: Delete Image signatures from documents
linkTitle: ✖ Image
weight: 2
description: "This article explains how to delete Image electronic signatures with GroupDocs.Signature API."
keywords: delete Image electronic signatures, how to delete Image electronic signatures
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Remove Images from documents in C#    
        description: Delete Images presented in documents in convenient way with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to clear any documents from images using C# 
        description: Information about removing images from documents by C#
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of images presented in document 
          text: Create an instance of ImageSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found images and save result 
          text: Invoke Delete method passing found images and file path for signed file. File stream can be used as well.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [ImageSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/imagesignature) class to manipulate image signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class.

Here are the steps to delete Image signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [ImageSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method to obtain list of [ImageSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/imagesignature);
* Select from list [ImageSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/imagesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.  

This example shows how to delete Image signature that was found using [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method.

```csharp
using (Signature signature = new Signature("signed.pptx"))
{
    ImageSearchOptions options = new ImageSearchOptions();
    // search for image signatures in document
    List<ImageSignature> signatures = signature.Search<ImageSignature>(options);
    if (signatures.Count > 0)
    {
        ImageSignature imageSignature = signatures[3];
        bool result = signature.Delete(imageSignature);
        if (result)
        {
            Console.WriteLine($"Image signature at location {imageSignature.Left}x{imageSignature.Top} and Size {imageSignature.Size}' was deleted from document ['{fileName}'].");
        }
        else
        {
            Console.WriteLine($"Signature was not deleted from the document! Signature at location {imageSignature.Left}x{imageSignature.Top} and Size {imageSignature.Size} was not found!");
        }
    }
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

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.