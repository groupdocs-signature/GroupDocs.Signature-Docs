---
id: search-for-image-e-signatures
url: signature/net/search-for-image-e-signatures
title: Search for Image e-signatures
weight: 7
description: "This article explains how to search for Image electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [ImageSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesearchoptions) class to specify different options to search for Image e-signatures.

 Here are the steps to search for Image signatures within the document with GroupDocs.Signature API:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [ImageSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesearchoptions) object according to your requirements and specify additional search options (if needed);
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [ImageSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesearchoptions) to it.

The code snippet below demonstrates how to search for Image electronic signature in the document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // search document
    List<ImageSignature> signatures = signature.Search<ImageSignature>(SignatureType.Image);
    Console.WriteLine($"\nSource document ['{fileName}'] contains following image signature(s).");
    // output signatures
    foreach (ImageSignature imageSignature in signatures)
    {
        Console.WriteLine($"Image signature found at page {imageSignature.PageNumber} with size {imageSignature.Size}. Created {imageSignature.CreatedOn}, modified {imageSignature.ModifiedOn}");
    }
}
```


