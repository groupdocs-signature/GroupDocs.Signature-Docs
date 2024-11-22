---
id: search-for-metadata-e-signatures
url: signature/net/search-for-metadata-e-signatures
title: How to search for Metadata signatures
linkTitle: 🔍 Metadata
weight: 4
description: "This topic explains how to search for metadata signatures within the documents with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for metadata in documents in C#    
        description: Search metadata in various documents fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search any metadata in documents using C# 
        description: Get additional information of searching metadata in documents with C#
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of metadata 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found metadata.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides a [MetadataSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions) class to search Metadata electronic signatures within document.  
Here are the steps to search for Metadata signatures using GroupDocs.Signature API:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [MetadataSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions) object according to your requirements and specify additional search options (if needed);
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [MetadataSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions) to it.

This code snippet demonstrates how to search for Metadata e-signature in the document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    MetadataSearchOptions options = new MetadataSearchOptions();
    // search for signatures in document
    List<MetadataSignature> signatures = signature.Search<MetadataSignature>(options);
    foreach (var metadataSignature in signatures)
    {
        Console.WriteLine("Metadata signature found. Name : {0}. Value: {1}. Type: {2}", metadataSignature.Name, metadataSignature.Value,metadataSignature.Type);
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