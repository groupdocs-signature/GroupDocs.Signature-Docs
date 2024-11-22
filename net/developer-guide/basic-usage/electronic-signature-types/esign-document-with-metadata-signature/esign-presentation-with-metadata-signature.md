---
id: esign-presentation-with-metadata-signature
url: signature/net/esign-presentation-with-metadata-signature
title: eSign Presentation with Metadata signature
linkTitle: eSign Presentation
weight: 3
description: "This article explains how to add metadata signatures to Presentation document with GroupDocs.Signature"
keywords: Presentation metadata, Presentation metadata signature
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Signing presentations with metadata in C#    
        description: Adding new metadata to presentations with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to create new metadata in presentations using C# 
        description: Learn all about signing a presentation by metadata and C#
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Create demanded PresentationMetadataSignature class instances and add them to array.
        - name: Sign source file and save result 
          text: Invoke Sign method with array of signing options and output file path or stream.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [PresentationMetadataSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/presentationmetadatasignature) class to specify different Metadata signature objects for [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) instance to sign Presentation document files.
Presentation document metadata is hidden attributes, some of them are visible only over viewing standard document properties like Author, Creation Date, Producer, Entry, Keywords etc.  
Presentation document metadata contains pair of Name and Value, Name should be unique within the document.  
Presentation document metadata could keep big amount of data that allows provides ability to keep serialized custom objects with additional encryption in there.

### Here are the steps to add metadata signatures into Presentation document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) object according to your requirements.
* Instantiate one or several[PresentationMetadataSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/presentationmetadatasignature) objects and add them into  [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) to metadata signatures collection ([Signatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions/signatures)) via [Add](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignaturecollection/add) or [AddRange](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignaturecollection/addrange) method.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) to it.

## How to eSign Presentation with Metadata signature

This example shows how to add Metadata signature to Presentation document.

```csharp
using (Signature signature = new Signature("sample.ppsx"))
{
    MetadataSignOptions options = new MetadataSignOptions();

    // Create few Presentation Metadata signatures
    PresentationMetadataSignature[] signatures = new PresentationMetadataSignature[]
    {
        new PresentationMetadataSignature("Author", "Mr.Scherlock Holmes"),
        new PresentationMetadataSignature("DateCreated", DateTime.Now),
        new PresentationMetadataSignature("DocumentId", 123456),
        new PresentationMetadataSignature("SignatureId", 123.456M)
    };
    options.Signatures.AddRange(signatures);
    signature.Sign("SampleSigned.ppsx", options);
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
