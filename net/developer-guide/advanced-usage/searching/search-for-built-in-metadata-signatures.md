---
id: search-for-built-in-metadata-signatures
url: signature/net/search-for-built-in-metadata-signatures
title: Search for built-in Metadata signatures
weight: 6
description: " This article explains how to provide advanced search for metadata electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [MetadataSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions) class to specify different options to search for Metadata signatures.

Most document types such as Word Processing, Spreadsheet and Presentation contains built-in metadata properties. Using property [IncludeBuiltinProperties](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions/properties/includebuiltinproperties) of [MetadataSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions) allows to collect all supported built-in metadata properties of document. These properties are like document author, creation date, document keywords, titles, etc.

Here are the steps to search for metadata signatures within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [MetadataSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions) object according to your requirements and specify [IncludeBuiltinProperties](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions/properties/includebuiltinproperties) to true  
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [MetadataSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions) to it.

This example shows how to get built in Metadata signatures.

```csharp
using (Signature signature = new Signature("sample.xlsx"))
{
    MetadataSearchOptions options = new MetadataSearchOptions()
    {
        Name = "Producer",
        IncludeBuiltinProperties = true,
        NameMatchType = TextMatchType.Contains
    };
    // search for signatures in document
    List<SpreadsheetMetadataSignature> signatures = signature.Search<SpreadsheetMetadataSignature>(options);
    Console.WriteLine("\nSource document contains following signatures.");
    foreach (var metadataSignature in signatures)
    {
        Console.WriteLine("Metadata signature found. Name : {0}. Value: {1}", metadataSignature.Name, metadataSignature.Value);
    }
}
```


