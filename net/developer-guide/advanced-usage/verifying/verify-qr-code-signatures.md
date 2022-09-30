---
id: verify-qr-code-signatures
url: signature/net/verify-qr-code-signatures
title: Verifying QR Code signatures in advance
weight: 2
description: " This article explains how to provide advanced verification of QR Code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Verify QR code signature in documents using C#    
        description: This article explains how to scan the document for QR Code and provide its verification with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to scan QR Code and verify the document for specific QR Code entities using C# 
        description: This topic explains how to verify the document for QR Code, provide QR Code verification and validation in C#
        steps:
        - name: Load document for verification from the local file or stream.
          text: Create Signature class instance by passing either local or network file path or stream. 
        - name: Provide QR Code verification options. 
          text: Set demanded data of the QRCodeVerifyOptions instance to specify optionally QR Code type or text.
        - name: Run verification
          text: Call the Verify method with passing verification options and keep the verification process result.
        - name: Analyse verification result
          text: Check verification result for its state and verification details.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides different properties in [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodeverifyoptions) class to specify verification of QR Code signatures.

Here are the steps to verify QR Code signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
*Instantiate the  [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodeverifyoptions) object according to your requirements and specify verification options  
* Call [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodeverifyoptions) to it.  
* Analyze [VerificationResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/verificationresult) result if needed.
  
This example shows how to verify QR Code signature in the document. See [VerificationResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/verificationresult)

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
