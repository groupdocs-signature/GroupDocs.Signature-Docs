---
id: search-for-text-e-signatures
url: signature/net/search-for-text-e-signatures
title: Search for Text e-signatures
weight: 6
description: "This topic explains how to search for text electronic signatures within the document pages by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textsearchoptions) class to specify different options to search for Text electronic signatures within document.

Here are the steps to search for Text e-signatures using GroupDocs.Signature API:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [TextSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textsearchoptions) object according to your requirements and specify additional search options (if needed);  
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature)  class instance and pass [TextSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textsearchoptions) to it.

This example shows how to search for Text e-signature in the document.

```csharp
using (Signature signature = new Signature(sample.pdf))
{
    // setup search options
    TextSearchOptions searchOptions = new TextSearchOptions()
    {
        // search only page with specified number
        PageNumber = null,
        // specify as true to search all pages of a document
        AllPages = true,
        // specify text to search
        Text = "JS_",
        // specify text math type
        MatchType = TextMatchType.Contains
    };
    // search document
    List<TextSignature> signatures = signature.Search<TextSignature>(searchOptions);
    // output signatures
    foreach (TextSignature textSignature in signatures)
    {
        if (textSignature != null)
        {
            Console.Write($"Found Text signature: {textSignature.SignatureImplementation} with text {textSignature.Text}.");
            Console.WriteLine($"Location at {textSignature.Left}-{textSignature.Top}. Size is {textSignature.Width}x{textSignature.Height}.");
        }
    }
}
```

