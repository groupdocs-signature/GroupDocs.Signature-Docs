---
id: verify-qr-code-signatures
url: signature/net/verify-qr-code-signatures
title: Verify QR-code signatures
weight: 2
description: " This article explains how to provide advanced verification of QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides different properties in [QrCodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodeverifyoptions) class to specify verification of QR-code signatures.

Here are the steps to verify QR-code signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
*Instantiate the  [QrCodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodeverifyoptions) object according to your requirements and specify verification options  
* Call [Verify](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/verify) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [QrCodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodeverifyoptions)to it.  
* Analyze [VerificationResult](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/verificationresult) result if needed.
  
This example shows how to verify QR-code signature in the document. See [VerificationResult](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/verificationresult)

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    QrCodeVerifyOptions options = new QrCodeVerifyOptions()
    {
        // specify if all pages shoudl be verified
        AllPages = false,
        PagesSetup = new PagesSetup() {  FirstPage = false, LastPage = true, OddPages = false, EvenPages = true },
        // specify text pattern
        Text = "John",
        // specify verification text pattern
        MatchType = TextMatchType.Contains,
        // specify types of QR code to verify
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


