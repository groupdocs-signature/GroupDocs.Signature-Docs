---
id: advanced-search-for-text-signatures
url: signature/net/advanced-search-for-text-signatures
title: Advanced search for Text signatures
weight: 5
description: "This article explains how to make advanced search for Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for text signatures in documents in C#    
        description: Advanced search for text items in various documents fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search for text in advanced way using C# 
        description: Get additional information of advanced searching for text signatures in documents with C#
        steps:
        - name: Upload file of supported file types.
          text: Instantiate object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create search options 
          text: Instantiate TextSearchOptions object providing all demanded data like text, pages setup or match type.
        - name: Get list of text signatures 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsearchoptions) class to specify different options to search for Text Signatures.

Here are the steps to search for text signatures within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [TextSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsearchoptions) object according to your requirements and specify search options.
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [TextSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsearchoptions) to it.

This example shows how to make advanced search for Text signature in the document.

```csharp
using (Signature signature = new Signature(sample.pdf))
{
    // setup search options
    TextSearchOptions searchOptions = new TextSearchOptions()
    {
        // specify special pages to search on
        AllPages = false,
        // single page number
        PageNumber = 1,
        // setup extended search in pages setup
        PagesSetup = new PagesSetup() { FirstPage = true, LastPage = true, OddPages = false, EvenPages = false },
        // specify text match type
        MatchType = TextMatchType.Exact,
        // specify text pattern to search
        Text = "John Smith"
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

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online App

Along with full-featured .NET library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
