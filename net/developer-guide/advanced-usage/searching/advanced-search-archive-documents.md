---
id: advanced-search-archive-documents
url: signature/net/advanced-search-archive-documents
title: Advanced search archive documents
linkTitle: 🌐 Archive
weight: 16
description: "This article explains how to make advanced search withing the archive that contains several documents for any electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for varios signatures within the archive files in C#    
        description: Advanced search for all supported signatures within the archives fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search data in the archive using C# 
        description: Get additional information of advanced searching for any signature data within the archive documents with C#
        steps:
        - name: Upload supported archive file (ZIP, TAR or 7Z).
          text: Instantiate object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create one or many search options 
          text: Instantiate specific SearchOptions (one or many) object(s) providing all required data.
        - name: Get list of the corresponding signatures 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [archiveSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/archivesearchoptions) class to specify different options to search text data within the archive docuemnts. 
Please be aware that the search result will be always as the MetadataSignature.

Here are the steps to search for the values within the archive document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the varios [SearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions) objects according to your requirements. Here there's ability to compose list of any search options types.
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass list of the [SearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions) to it.

This example shows how to make advanced search for any data within the archive documents.

```csharp
using (var signature = new Signature("archive.zip"))
{
    // create list of signature options
    var bcOptions = new BarcodeSearchOptions(BarcodeTypes.Code128);
    var qrOptions = new QrCodeSearchOptions(QrCodeTypes.QR);

    // setup search options
    List<SearchOptions> listOptions = new List<SearchOptions>() { bcOptions, qrOptions };

    // search archive for documents
    var searchResult = signature.Search(listOptions);

    // check the result                
    Console.WriteLine("\nList of successfully processed documents:");
    int number = 1;
    foreach (DocumentResultSignature document in searchResult.Succeeded)
    {
        Console.WriteLine($"Document #{number++}: {document.FileName}. Processed: {document.ProcessingTime}, mls");
        foreach (BaseSignature temp in document.Succeeded)
        {
            Console.WriteLine($"\t\t#{temp.SignatureId}: {temp.SignatureType}");
        }
    }
    if (searchResult.Failed.Count > 0)
    {
        Console.WriteLine("\nList of failed documents:");
        number = 1;
        foreach (DocumentResultSignature document in searchResult.Failed)
        {
            Console.WriteLine($"ERROR in Document #{number++}-{document.FileName}: {document.ErrorMessage}, mls");
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

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
