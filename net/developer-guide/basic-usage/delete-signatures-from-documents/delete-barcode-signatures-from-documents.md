---
id: delete-barcode-signatures-from-documents
url: signature/net/delete-barcode-signatures-from-documents
title: Delete Barcode signatures from documents
weight: 1
description: "This article explains how to delete Barcode electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [BarcodeSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/barcodesignature) class to manipulate barcode signatures and delete them from the documents over [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method.  
Please be aware that [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method modifies the same document that was passed to constructor of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class.

Here are the steps to delete Barcode signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [BarcodeSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/barcodesearchoptions) object with desired properties;
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method to obtain list of [BarcodeSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/barcodesignature);
* Select from list [BarcodeSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/barcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) object [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method and pass one or several signatures to it.

This example shows how to delete Barcode signature that was found using [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method.

```csharp
using (Signature signature = new Signature("signed.docx"))
{
    BarcodeSearchOptions options = new BarcodeSearchOptions();
    // search for Barcode signatures in document
    List<BarcodeSignature> signatures = signature.Search<BarcodeSignature>(options);
    if (signatures.Count > 0)
    {
        BarcodeSignature barcodeSignature = signatures[0];
        bool result = signature.Delete(barcodeSignature);
        if (result)
        {
            Console.WriteLine($"Signature with Barcode '{barcodeSignature.Text}' and encode type '{barcodeSignature.EncodeType.TypeName}' was deleted from document ['{fileName}'].");
        }
        else
        {
            Console.WriteLine($"Signature was not deleted from the document! Signature with Barcode '{barcodeSignature.Text}' and encode type '{barcodeSignature.EncodeType.TypeName}' was not found!");
        }
    }
}
```


