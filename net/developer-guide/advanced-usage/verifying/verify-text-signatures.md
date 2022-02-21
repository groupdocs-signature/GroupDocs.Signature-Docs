---
id: verify-text-signatures
url: signature/net/verify-text-signatures
title: Verify Text signatures
weight: 3
description: " This article explains how to provide advanced verification of Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textverifyoptions) class to specify different options for verification of Text signatures.

Here are the steps to verify Text signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [TextVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textverifyoptions) object according to your requirements and specify verification options
* Call [Verify](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/verify) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [TextVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textverifyoptions) to it.
* Analyze [VerificationResult](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/verificationresult) result if needed.  

This example shows how to verify Text signature in the document. See [VerificationResult](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/verificationresult)

```csharp
using (Signature signature = new Signature("signedSample.pdf"))
{
    TextVerifyOptions options = new TextVerifyOptions()
    {
        // specify if all pages shoudl be verified
        AllPages = false,
        PagesSetup = new PagesSetup() { FirstPage = false, LastPage = true, OddPages = false, EvenPages = true },
        // specify text pattern
        Text = "John",
        // specify verification text pattern
        MatchType = TextMatchType.Contains,
        // specify types of QR code to verify
        SignatureImplementation = TextSignatureImplementation.Stamp,
        // specify if form fielsd should be verified
        FormTextFieldTitle = "Sample",
        FormTextFieldType = FormTextFieldType.RichText
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


