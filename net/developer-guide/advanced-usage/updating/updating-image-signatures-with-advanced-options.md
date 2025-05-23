---
id: updating-image-signatures-with-advanced-options
url: signature/net/updating-image-signatures-with-advanced-options
title: Updating Image signatures with advanced options
linkTitle: ✜ Image
weight: 2
description: " This article explains how to provide advanced options when updating Image electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [ImageSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/imagesignature) class to manipulate image signatures location, and size over [Update](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/update/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class. This method returns [UpdateResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/updateresult) object to analyze if signatures were successfully processed.

Please be aware that [Update](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/update/) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class. The [UpdateResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/updateresult) contains list of successfully updated signatures and ones that failed. The Image signature could be failed to update due to several reasons:

* if signature object was initialized with constructor by incorrect signature identifier;
* if signature object was not found;
* there was an error occurred while updating signature in the document.

Here are the steps to update Image signature in the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [ImageSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method to obtain list of [ImageSignatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/imagesignature);
* Select from list [ImageSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/imagesignature) object(s) that should be updated;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Update](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/update/) method and pass one or several signatures to it.
* Analyze [UpdateResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/updateresult) result to check whether signatures were updated or not.

Here are the alternative steps to update Image signature in the document with GroupDocs.Signature. This approach is based on saved signatures Id after [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) or [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) methods.

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate one or several [ImageSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/imagesignature) objects with signature Id(s) passed to constructor;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class object [Update](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/update/) method and pass one or several signatures to it;
* Analyze [UpdateResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/updateresult) result to check whether signatures were updated or not.

The following table describes changeable properties for Image signatures dependent on document type.

| Document Type / Signature Property | Left | Top | Width | Height | Size | IsSignature |
| --- | --- | --- | --- | --- | --- | --- |
| Image | ![(error)](/signature/net/images/error.png) | ![(error)](/signature/net/images/error.png) | ![(error)](/signature/net/images/error.png) | ![(error)](/signature/net/images/error.png) | ![(error)](/signature/net/images/error.png) | ![(error)](/signature/net/images/error.png) |
| Spreadsheet | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(error)](/signature/net/images/error.png) | ![(tick)](/signature/net/images/check.png) |
| Pdf | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(error)](/signature/net/images/error.png) | ![(tick)](/signature/net/images/check.png) |
| Presentation | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(error)](/signature/net/images/error.png) | ![(tick)](/signature/net/images/check.png) |
| Word Processing | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(tick)](/signature/net/images/check.png) | ![(error)](/signature/net/images/error.png) | ![(tick)](/signature/net/images/check.png) |

## Update Image signature in the document after Search

This example shows how to update Image signature that was found using [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method.

```csharp
using (Signature signature = new Signature("sampleSigned.xlsx"))
{
    ImageSearchOptions options = new ImageSearchOptions();
    // search for image signatures in document
    List<ImageSignature> signatures = signature.Search<ImageSignature>(options);
    // adjust signature properties
    foreach (ImageSignature temp in signatures)
    {
        // apply some condition to adjust signature properties
        temp.Left = temp.Left + 10;
        temp.Top = temp.Top + 10;
        if (temp.Size > 10000)
        {
            temp.IsSignature = false;
        }
    }
    // update all found signatures
    UpdateResult updateResult = signature.Update(signatures.ConvertAll(p => (BaseSignature)p));
    if (updateResult.Succeeded.Count == signatures.Count)
    {
        Console.WriteLine("All signatures were successfully updated!");
    }
    else
    {
        Console.WriteLine($"Successfully updated signatures : {updateResult.Succeeded.Count}");
        Console.WriteLine($"Not updated signatures : {updateResult.Failed.Count}");
    }
    Console.WriteLine("List of updated signatures:");
    foreach (BaseSignature temp in updateResult.Succeeded)
    {
        Console.WriteLine($"Signature# Id:{temp.SignatureId}, Location: {temp.Left}x{temp.Top}. Size: {temp.Width}x{temp.Height}");
    }
}
```

## Update Image signature in document by known signature Identifier  

This example shows how to update Image signature in the document by known signature Id (that was obtained by [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) or [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method previously).

```csharp
// initialize Signature instance
using (Signature signature = new Signature("sampleSigned.pdf"))
{
    // read from some data source signature Id value
    string[] signatureIdList = new string[]
    {
        "1dd21cf3-b904-4da9-9413-1ff1dab51974",
        "9e386726-a773-4971-b2fc-eaadfce65ffd"
    };
    // create list of Image Signature by known SignatureId
    List<BaseSignature> signatures = new List<BaseSignature>();
    signatureIdList.ToList().ForEach(p => signatures.Add(new ImageSignature(p)));
    // update all found signatures
    UpdateResult updateResult = signature.Update(signatures);
    if (updateResult.Succeeded.Count == signatures.Count)
    {
        Console.WriteLine("All signatures were successfully updated!");
    }
    else
    {
        Console.WriteLine($"Successfully updated signatures : {updateResult.Succeeded.Count}");
        Console.WriteLine($"Not updated signatures : {updateResult.Failed.Count}");
    }
    Console.WriteLine("List of updated signatures:");
    foreach (BaseSignature temp in updateResult.Succeeded)
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
