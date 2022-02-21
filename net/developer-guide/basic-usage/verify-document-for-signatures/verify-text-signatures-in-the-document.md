---
id: verify-text-signatures-in-the-document
url: signature/net/verify-text-signatures-in-the-document
title: Verify Text signatures in the document
weight: 4
description: "This topic explains how to verify Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textverifyoptions) class to specify different options for verification of Text signatures.

Here are the steps to verify Text signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [TextVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textverifyoptions) object according to your requirements and specify verification options
* Call [Verify](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/verify) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [TextVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textverifyoptions) to it.

This example shows how to verify Text signature in the document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
        TextVerifyOptions options = new TextVerifyOptions()
        {
            AllPages = true, // this value is set by default
            SignatureImplementation = TextSignatureImplementation.Stamp,
            Text = "John",
            MatchType = TextMatchType.Contains
        };
        // verify document signatures
        VerificationResult result = signature.Verify(options);
        if(result.IsValid)
        {
            Console.WriteLine("\nDocument was verified successfully!");
        }
        else
        {
            Console.WriteLine("\nDocument failed verification process.");
        }
}
```


