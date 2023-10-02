---
id: sign-specific_pages_in_multipage-document
url: signature/net/sign-specific_pages_in_multipage-document
title: Signing specific pages in the multipage document
weight: 5
description: "This article explains how to sign specific pages in the multipage documents"
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
Base signature options [SignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions) contains property [SignOptions.PagesSetup](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pagessetup/) which allows to set up specific page numbers.

This example shows how to sign specific pages in the multipage Tiff document through the [PagesSetup.PageNumbers](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pagessetup/pagenumbers/) list of integer values.

```csharp
using (var signature = new Signature("multipage.tiff"))
{
    var options = new QrCodeSignOptions("Patient #36363393. R: No-Issues")
    {
        // set signature position 
        Left = 10,
        Top = 10,
        // set signature rectangle
        Width = 200,
        Height = 200,
        //specify pages numbers which we want to sign
        PagesSetup = new PagesSetup()
        {
            PageNumbers = new List<int> { 1, 3 }
        }
    };

    // sign document to file
    SignResult signResult = signature.Sign(outputFilePath, options);
    Console.WriteLine($"\nDocument signed with {signResult.Succeeded.Count} signatures");
    Console.WriteLine("\nList of newly created signatures:");
    foreach (BaseSignature temp in signResult.Succeeded)
    {
        Console.WriteLine($"{temp.SignatureType} at page #{temp.PageNumber}: Id:{temp.SignatureId}.");
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
