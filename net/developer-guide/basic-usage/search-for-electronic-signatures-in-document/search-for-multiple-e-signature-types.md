---
id: search-for-multiple-e-signature-types
url: signature/net/search-for-multiple-e-signature-types
title: Search for multiple e-signature types
weight: 8
description: "This article explains how to search for multiple electronic signatures across document pages with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for multiple signatures in documents in C#    
        description: Search multiple signatures in various documents fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search any multiple signatures in documents using C# 
        description: Get additional information of searching multiple signatures in documents with C#
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of multiple signatures 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found multiple signatures
          text: Loop through list of found barcodes.
---
Sometimes you may want to search for electronic signatures of different types simultaneously. [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) allows searching documents for different signature types in an easy and intuitive way. In common words the idea is to pass collection of desired signature types to Search method.

Here are the steps to search for multiple signatures types within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate search options for required signature types and them to collection of List<[SearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions)\>  type.

The possible options are:

* [BarcodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/barcodesearchoptions) - to search for Barcode signatures;
* [DigitalSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsearchoptions) -  to search for Digital signatures;
* [FormFieldSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsearchoptions) - to search for Form-field signatures;
* [ImageSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesearchoptions) - to search for Image signatures;
* [MetadataSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions) - to search for Metadata signatures;
* [QrCodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions) - to search for QR-code signatures;
* [TextSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsearchoptions) to search for Text signatures.
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass collection of [search options](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions) to it.

This example shows how to search for multiple electronic signature types in the document.

```csharp
using (Signature signature = new Signature("SingedSample.pdf"))
{
    // define few search options
    BarcodeSearchOptions barcodeOptions = new BarcodeSearchOptions()
    {
        EncodeType = BarcodeTypes.Code128
    };
    QRCodeSearchOptions qrCodeOptions = new QRCodeSearchOptions()
    {
        EncodeType = QRCodeTypes.QR,
        Text = "John",
        MatchType = TextMatchType.Contains
    };
    MetadataSearchOptions metadataOptions = new MetadataSearchOptions()
    {
     IncludeBuiltinProperties = true
    };

    // add options to list
    List<SearchOptions> listOptions = new List<SearchOptions>();
    listOptions.Add(barcodeOptions);
    listOptions.Add(qrCodeOptions);
    listOptions.Add(metadataOptions);

    // search for signatures in document
    SearchResult result = signature.Search(listOptions);
    if (result.Signatures.Count > 0)
    {
        Console.WriteLine("\nSource document contains following signatures.");
        foreach (var resSignature in result.Signatures)
        {
            Console.WriteLine("Signature found at page {0} with type {1}", resSignature.PageNumber, resSignature.SignatureType);
        }
    }
    else
    {
        Console.WriteLine("Signatures was not found.");
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

### Free Online App

Along with full-featured .NET library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
