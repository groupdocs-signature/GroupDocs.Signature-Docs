---
id: verify-qr-code-signatures-in-the-document
url: signature/net/verify-qr-code-signatures-in-the-document
title: Verify QR-code signatures in the document
weight: 3
description: "This topic explains how to verify QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [QrCodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodeverifyoptions) class to specify different options for verification of QR-code signatures.

Here are the steps to verify qr-code signature within the document with GroupDocs.Signature for .NET API:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [QrCodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodeverifyoptions) object according to your requirements and specify verification options
* Call [Verify](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/verify) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [QrCodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodeverifyoptions) to it.

This example shows how to verify QR-code signature in the document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    QrCodeVerifyOptions options = new QrCodeVerifyOptions()
    {
        AllPages = true, // this value is set by default
        Text = "John",
        MatchType = TextMatchType.Contains
        // set encode type
        // if this value is not set any barcode type will be valid
        EncodeType = QrCodeTypes.QR
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

