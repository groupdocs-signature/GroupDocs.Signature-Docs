---
id: verify-qr-code-signatures-in-the-document
url: signature/net/verify-qr-code-signatures-in-the-document
title: Verify QR-code signatures in the document
weight: 3
description: "This topic explains how to verify QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Verify QR-code signatures in signed documents via C#    
        description: Verification of QR-codes in various documents in convenient way with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to check are QR-codes valid in particular document using C# 
        description: Get additional information of QR-codes validation for any documents in C#
        steps:
        - name: Load particular file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide verification options. 
          text: Set demanded data of the QrCodeVerifyOptions instance such as QR-code type, text and type of text verification.
        - name: Get verification result
          text: Call method Verify passing options. Obtain verification result whose property IsValid must be true if verification succeed.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [QrCodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodeverifyoptions) class to specify different options for verification of QR-code signatures.

Here are the steps to verify qr-code signature within the document with GroupDocs.Signature for .NET API:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [QrCodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodeverifyoptions) object according to your requirements and specify verification options
* Call [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeVerifyOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodeverifyoptions) to it.

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
