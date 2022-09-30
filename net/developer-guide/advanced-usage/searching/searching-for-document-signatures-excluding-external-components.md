---
id: searching-for-document-signatures-excluding-external-components
url: signature/net/searching-for-document-signatures-excluding-external-components
title: Searching for document signatures excluding external components
weight: 10
description: "This article explains how to search with excluding non-signature components like native documents text, images or barcodes that are the part of document content."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for signatures in documents in C#    
        description: Advanced search for electronic signatures excluding non-signature items in various documents with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to get list of signatures using C# 
        description: Learn more about advanced search for only-signature items in documents with C#
        steps:
        - name: Provide file of supported file types.
          text: Instantiate Signature class passing either file path or file stream as a parameter.
        - name: Create search options 
          text: Instantiate SearchOptions object and set up SkipExternal in true.
        - name: Get list of items 
          text: Call method Search providing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in desirable way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides boolean property [SkipExternal](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions/skipexternal) of [SearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions) class to specify if searching process should exclude external signatures (external signatures are the signatures that were added with an 3rd party software and not with GroupDocs.Signature).

Since 19.12 version every time when document is being signed information about document signatures are stored in document's metadata. Which means that all created signatures by GroupDocs.Signature can be distinguished from an actual document content and [IsSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/basesignature/issignature) flag will be set as true. [IsSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/basesignature/issignature) property specifies if document component (text/image/barcode/qr-code) is the actual signature or element of document content.

In order to convert signatures added by 3rd party software or by previous version of GroupDocs.Signature, just run [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) with[SkipExternal](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions/skipexternal) property set to false (this is default value) and update [IsSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/basesignature/issignature) for each signature returned by the search result.

There are few ways to manipulate with document signature search results:

* If signature is no longer required it can be removed from the document by [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method;
* Signature could be marked as document native content by setting up [IsSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/basesignature/issignature) = false property,in this case [SkipExternal](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions/skipexternal) field will allow [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search)  method to skip this signature;
* Signatures that were added before 19.12 are treated as non signatures because information about them are not yet stored in the document. Setting [SkipExternal](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions/skipexternal) flag to true will exclude these signatures from [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) result.

Here are the steps to search for signatures and exclude external components of the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [SearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions) object according to your requirements and specify [SkipExternal](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions/skipexternal) to true
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search)  method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [SearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions) to it.

## Excluding external signatures from search

 Following example demonstrates usage of [SkipExternal](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions/skipexternal) property for excluding non actual signatures from search result

### Using SearchOptions SkipExternal property to exclude non actual signatures from search

```csharp
using (Signature signature = new Signature("sample_signed.pdf"))
{
    TextSearchOptions options = new TextSearchOptions()
    {
        // specify SkipExternal value to exclude non signature objects from Search result
        SkipExternal = true,
        // specify search on all pages
        AllPages = false
    };
    // search for text signatures in document
    List<TextSignature> signatures = signature.Search<TextSignature>(options);
    Console.WriteLine("\nSource document contains following text signature(s).");
    // enumerate all signature for output
    foreach (TextSignature textSignature in signatures)
    {
        if (textSignature != null)
        {
            Console.WriteLine($"Found Text signature at page {textSignature.PageNumber} with type [{textSignature.SignatureImplementation}] and text '{textSignature.Text}'.");
            Console.WriteLine($"Location at {textSignature.Left}-{textSignature.Top}. Size is {textSignature.Width}x{textSignature.Height}.");
        }
    }
}
```

## Updating signatures from GroupDocs.Signature 19.11 and below

Following examples shows the way to mark signatures in document as actual signatures ([IsSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/basesignature/issignature) = true)

### How to mark signatures in document as actual signatures

```csharp
 // initialize Signature instance
 using (Signature signature = new Signature("sample_signed.pdf"))
 {
     // define search options to select required signatures om the document
     BarcodeSearchOptions barcodeOptions = new BarcodeSearchOptions();
     QrCodeSearchOptions qrCodeOptions = new QrCodeSearchOptions();
     TextSearchOptions textOptions = new TextSearchOptions();
     // add options to list
     List<SearchOptions> listOptions = new List<SearchOptions>();
     listOptions.Add(barcodeOptions);
     listOptions.Add(qrCodeOptions);
     listOptions.Add(textOptions);
     // search for signatures in document
     SearchResult result = signature.Search(listOptions);
     if (result.Signatures.Count > 0)
     {
         Console.WriteLine("\nTrying to update all signatures...");
         // mark all signatures as actual Signatures
         foreach(BaseSignature baseSignature in result.Signatures)
         {
             baseSignature.IsSignature = true;
         }
         // update all found signatures
         UpdateResult updateResult = signature.Update(result.Signatures);
         if(updateResult.Succeeded.Count == result.Signatures.Count)
         {
             Console.WriteLine("\nAll signatures were successfully updated!");
         }
         else
         {
             Console.WriteLine($"Successfully updated signatures : {updateResult.Succeeded.Count}");
             Console.WriteLine($"Not updated signatures : {updateResult.Failed.Count}");
         }
         Console.WriteLine("\nList of updated signatures:");
         int number = 1;
         foreach(BaseSignature temp in updateResult.Succeeded)
         {
             Console.WriteLine($"Signature #{number++}: Type: {temp.SignatureType} Id:{temp.SignatureId}, Location: {temp.Left}x{temp.Top}. Size: {temp.Width}x{temp.Height}");
         }
     }
     else
     {
         Console.WriteLine("No one signature was found.");
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
