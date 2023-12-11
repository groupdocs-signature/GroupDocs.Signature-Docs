---
id: deleting-barcode-signatures-advanced
url: signature/net/deleting-barcode-signatures-advanced
title: Deleting Barcode signatures - advanced
linkTitle: ✖ Barcode
weight: 1
description: "This article shows how to delete Barcode electronic signatures different ways with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Delete barcode signatures from document via C#    
        description: Remove specific barcodes in documents using C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to remove barcodes in supported documents with C# 
        description: Learn about ways of deletion selected barcodes in document using C#
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Specify barcodes to delete. 
          text: Get all barcodes presented in a document by invoking method Search passing BarcodeSearchOptions. Select only suitable barcode signatures in case if it is needed.
        - name: Delete selected barcodes. 
          text: Invoke Delete method and analyze DeleteResult instance.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [BarcodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodesignature) class to manipulate barcode signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class.

Here are the steps to delete Barcode signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [BarcodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/barcodesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method to obtain list of [BarcodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodesignature);
* Select from list [BarcodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.
* Analyze [DeleteResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/deleteresult) result to check whether signatures were updated or not.

Here are the alternative steps to delete Barcode signature from the document with GroupDocs.Signature. This approach is based on saved signatures Id after [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) or [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) methods.

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate one or several [BarcodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodesignature) objects with signature Id(s) passed to constructor;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it;
* Analyze [DeleteResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/deleteresult) result to check whether signatures were updated or not.

## Delete Barcode signature from the document after Search

This example shows how to delete Barcode signature that was found using [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method.

```csharp
// initialize Signature instance
using (Signature signature = new Signature("signed.docx"))
{
    BarcodeSearchOptions options = new BarcodeSearchOptions();
    List<BarcodeSignature> signatures = signature.Search<BarcodeSignature>(options);
    List<BaseSignature> signaturesToDelete = new List<BaseSignature>();
    // collect signatures to delete
    foreach (BarcodeSignature temp in signatures)
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

## Delete Barcode signature from the document by known signature Identifier  

This example shows how to delete Barcode signature in the document by known signature Id (that was obtained by [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) or [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method previously).

```csharp
// initialize Signature instance
using (Signature signature = new Signature("signed.docx"))
{
    // read from some data source signature Id value
    string[] signatureIdList = new string[]
    {
        "1dd21cf3-b904-4da9-9413-1ff1dab51974",
        "9e386726-a773-4971-b2fc-eaadfce65ffd"
    };
    // create list of Barcode Signature by known SignatureId
    List<BaseSignature> signatures = new List<BaseSignature>();
    signatureIdList.ToList().ForEach(p => signatures.Add(new BarcodeSignature(p)));
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

To generate barcodes and/or sign your files with barcodes for free, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
