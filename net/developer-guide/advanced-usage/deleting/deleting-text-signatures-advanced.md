---
id: deleting-text-signatures-advanced
url: signature/net/deleting-text-signatures-advanced
title: Deleting Text signatures - advanced
linkTitle: ✖ Text
weight: 5
description: "This article shows how to delete Text electronic signatures different ways with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Delete text signatures from document via C#    
        description: Remove specific Text electronic signatures in documents using C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to expel texts in supported documents with C# 
        description: Learn about ways of wiping out selected text signatures in document using C#
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Specify text signatures to delete. 
          text: Get all texts presented in a document by invoking method Search passing TextSearchOptions. Select only suitable barcode signatures in case if it is needed.
        - name: Delete selected text signatures. 
          text: Invoke Delete method and analyze DeleteResult instance.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignature) class to manipulate text signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class.

Here are the steps to delete Text signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [TextSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method to obtain list of [TextSignatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignature);
* Select from list [TextSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignature) object(s) that should be removed from the document;  
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.
* Analyze [DeleteResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/deleteresult) result to check whether signatures were updated or not.

Here are the alternative steps to delete Text signature from the document with GroupDocs.Signature. This approach is based on saved signatures Id after [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) or [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) methods.

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate one or several [TextSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignature) objects with signature Id(s) passed to constructor;  
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it;
* Analyze [DeleteResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/deleteresult) result to check whether signatures were updated or not.

## Delete Text signature from the document after Search

This example shows how to delete Text signature that was found using [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method.

```csharp
// initialize Signature instance
using (Signature signature = new Signature("signed.pdf"))
{
    TextSearchOptions options = new TextSearchOptions();
    List<TextSignature> signatures = signature.Search<TextSignature>(options);
    List<BaseSignature> signaturesToDelete = new List<BaseSignature>();
    // collect signatures to delete
    foreach (TextSignature temp in signatures)
    {
        if (temp.Text.Contains("John"))
        {
            signaturesToDelete.Add(temp);
        }
    }
    // delete signatures
    DeleteResult deleteResult = signature.Delete(signaturesToDelete);
    if (deleteResult.Succeeded.Count == signaturesToDelete.Count)
    {
        Console.WriteLine("All signatures were successfully deleted!");
    }
    else
    {
        Console.WriteLine($"Successfully deleted signatures : {deleteResult.Succeeded.Count}");
        Console.WriteLine($"Not deleted signatures : {deleteResult.Failed.Count}");
    }
    Console.WriteLine("List of deleted signatures:");
    foreach (BaseSignature temp in deleteResult.Succeeded)
    {
        Console.WriteLine($"Signature# Id:{temp.SignatureId}, Location: {temp.Left}x{temp.Top}. Size: {temp.Width}x{temp.Height}");
    }
}
```

## Delete Text signature from the document by known signature Identifier  

This example shows how to delete Text signature in the document by known signature Id (that was obtained by [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) or [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method previously).

```csharp
// initialize Signature instance
using (Signature signature = new Signature("signed.xlsx"))
{
    // read from some data source signature Id value
    string[] signatureIdList = new string[]
    {
        "1dd21cf3-b904-4da9-9413-1ff1dab51974",
        "9e386726-a773-4971-b2fc-eaadfce65ffd"
    };
    // create list of Text Signature by known SignatureId
    List<BaseSignature> signatures = new List<BaseSignature>();
    signatureIdList.ToList().ForEach(p => signatures.Add(new TextSignature(p)));
    // delete required signatures
    DeleteResult deleteResult = signature.Delete(signatures);
    if (deleteResult.Succeeded.Count == signatures.Count)
    {
        Console.WriteLine("All signatures were successfully deleted!");
    }
    else
    {
        Console.WriteLine($"Successfully deleted signatures : {deleteResult.Succeeded.Count}");
        Console.WriteLine($"Not deleted signatures : {deleteResult.Failed.Count}");
    }
    Console.WriteLine("List of deleted signatures:");
    foreach (BaseSignature temp in deleteResult.Succeeded)
    {
        Console.WriteLine($"Signature# Id:{temp.SignatureId}, Location: {temp.Left}x{temp.Top}. Size: {temp.Width}x{temp.Height}");
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

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
