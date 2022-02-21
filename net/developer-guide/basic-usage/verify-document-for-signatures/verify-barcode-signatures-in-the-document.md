---
id: verify-barcode-signatures-in-the-document
url: signature/net/verify-barcode-signatures-in-the-document
title: Verify Barcode signatures in the document
weight: 1
description: "This topic explains how to verify document for Barcode electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [BarcodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/barcodeverifyoptions) class to specify different options for verification of Barcode signatures.

Here are the steps to verify Barcode signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [BarcodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/barcodeverifyoptions) object according to your requirements and specify verification options
* Call [Verify](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/verify) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [BarcodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/barcodeverifyoptions) to it.
  
This example shows how to verify Barcode signature in the document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    BarcodeVerifyOptions options = new BarcodeVerifyOptions()
    {
        AllPages = true, // this value is set by default
        Text = "John",
        MatchType = TextMatchType.Contains
        // set encode type
        // if this value is not set any barcode type will be valid
        EncodeType = BarcodeTypes.Code128
    };

    // verify document signatures
    VerificationResult result = signature.Verify(options);
    if (result.IsValid)
    {
        Console.WriteLine("\nDocument was verified successfully!");
    }
    else
    {
        Console.WriteLine("\nDocument failed verification process.");
    }
}
```


