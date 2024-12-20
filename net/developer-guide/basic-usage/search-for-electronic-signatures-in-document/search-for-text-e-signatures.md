---
id: search-for-text-e-signatures
url: signature/net/search-for-text-e-signatures
title: Search for Text e-signatures
linkTitle: 🔍 Texts
weight: 6
description: "This topic explains how to search for text electronic signatures within the document pages by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
structuredData:
    showOrganization: True
    application:    
        name: Search for text signatures in documents in C#    
        description: Search text signatures in various documents fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search any text signatures in documents using C# 
        description: Get additional information of searching text signatures in documents with C#
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of text signatures 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found text signatures.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsearchoptions) class to specify different options to search for Text electronic signatures within document.

Here are the steps to search for Text e-signatures using GroupDocs.Signature API:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [TextSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsearchoptions) object according to your requirements and specify additional search options (if needed);  
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature)  class instance and pass [TextSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsearchoptions) to it.

This example shows how to search for Text e-signature in the document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
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
         Console.Write($"Found Text signature: {textSignature.SignatureImplementation} " +
                       $"with text {textSignature.Text}.");
         Console.WriteLine($"Location at {textSignature.Left}-{textSignature.Top}. " +
                           $"Size is {textSignature.Width}x{textSignature.Height}.");
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