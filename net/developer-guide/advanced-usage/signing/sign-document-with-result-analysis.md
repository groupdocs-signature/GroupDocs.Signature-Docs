---
id: sign-document-with-result-analysis
url: signature/net/sign-document-with-result-analysis.md
title: Sign document with analysis of the Sign process result
weight: 16
description: "This article shows how to analyse the sign processing of the document"
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides the each method result as the implementation of the [IResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/iresult/) interface which contains the process metrics.

Here are the steps to analyze the process result with GroupDocs.Signature:

* Create a new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [SignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions) object with the required options and set the ZOrder property.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of  [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [SignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult/) response of the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method.


## Sign document with result analysis

This example shows how to analize sign process result.

```csharp
public static void Run()
{
    using (Signature signature = new Signature("sample.pdf"))
    {
        // create QRCode option with predefined QRCode text
        QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");

        // sign document to file
        SignResult signResult = signature.Sign("output.pdf", options);

        // analyze SignResult (IResult properties)
        Console.WriteLine($"Sign-process was executed for {signResult.ProcessingTime} mls");
        Console.WriteLine($"Input document size {signResult.SourceDocumentSize} bytes");
        Console.WriteLine($"Output document size {signResult.DestinDocumentSize} bytes");
        Console.WriteLine($"Total processed signatures {signResult.TotalSignatures}");
        if (signResult.Failed.Count == 0)
        {
            Console.WriteLine("\nAll signatures were successfully created!");
        }
        else
        {
            Console.WriteLine($"Successfully created signatures : {signResult.Succeeded.Count}");
            Helper.WriteError($"Failed signatures : {signResult.Failed.Count}");
        }
        Console.WriteLine("\nList of newly created signatures:");
        int number = 1;
        foreach (BaseSignature temp in signResult.Succeeded)
        {
            Console.WriteLine($"Signature #{number++}: Type: {temp.SignatureType} Id:{temp.SignatureId}");
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
