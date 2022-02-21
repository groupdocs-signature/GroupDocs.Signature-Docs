---
id: search-for-metadata-e-signatures
url: signature/net/search-for-metadata-e-signatures
title: Search for Metadata e-signatures
weight: 4
description: "This topic explains how to search for metadata signatures within the documents with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides a [MetadataSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions) class to search Metadata electronic signatures within document.  
Here are the steps to search for Metadata signatures using GroupDocs.Signature API:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [MetadataSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions) object according to your requirements and specify additional search options (if needed);
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [MetadataSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions) to it.

This code snippet demonstrates how to search for Metadata e-signature in the document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    MetadataSearchOptions options = new MetadataSearchOptions();
    // search for signatures in document
    List<MetadataSignature> signatures = signature.Search<MetadataSignature>(options);
    foreach (var metadataSignature in signatures)
    {
        Console.WriteLine("Metadata signature found. Name : {0}. Value: {1}", metadataSignature.Name, metadataSignature.Value);
    }
}
```


