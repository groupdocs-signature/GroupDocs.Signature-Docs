---
id: search-for-barcode-e-signatures
url: signature/net/search-for-barcode-e-signatures
title: Search for Barcode e-signatures
weight: 1
description: "This article explains how to search for Barcode in the document with few lines of code over GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides an easy and straightforward way to find all Barcode signatures that are present in a document.  
For the most simpler use case - just find all Barcode signatures within document its only needed to instantiate [BarcodeSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/barcodesearchoptions) class and pass it to [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method.

Here are the exact steps to search for Barcode signatures within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [BarcodeSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/barcodesearchoptions) object according to your requirements and specify search options
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [BarcodeSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/barcodesearchoptions) to it.

This example shows how to search for Barcode signature in the document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
        // search for signatures in document
        List<BarcodeSignature> signatures = signature.Search<BarcodeSignature>(SignatureType.Barcode);

        Console.WriteLine("\nSource document contains following signatures.");
        foreach (var barcodeSignature in signatures)
        {
            Console.WriteLine("Barcode signature found at page {0} with type {1} and text {2}",
                barcodeSignature.PageNumber, barcodeSignature.EncodeType, barcodeSignature.Text);
        }
}
```


