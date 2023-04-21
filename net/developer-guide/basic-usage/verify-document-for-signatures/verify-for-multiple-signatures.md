---
id: verify-for-multiple-signatures
url: signature/net/verify-for-multiple-signatures
title: Verify for multiple signatures
linkTitle: 🛡 ✅ Multiple types
weight: 5
description: "This topic explains how to verify electronic signatures of various types with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Verify electronic signatures in signed documents via C#    
        description: Verification of electronic signatures in various documents in convenient way with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to check are electronic signatures valid in particular document using C# 
        description: Get additional information of electronic signatures validation for any documents in C#
        steps:
        - name: Load particular file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide verification options. 
          text: Set properties of demanded VerifyOptions such as BarcodeVerifyOptions or DigitalVerifyOptions. Various properties like text or BarcodeType depends on options type.
        - name: Get verification result
          text: Call method Verify passing options. Obtain verification result whose property IsValid must be true if verification succeed.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) supports verification of documents for different signature types. This approach requires to add all required verification options to list.

Here are the steps to verify document for multiple signatures with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required several [VerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/verifyoptions) objects ([BarcodeVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/barcodeverifyoptions), [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodeverifyoptions), [DigitalVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalverifyoptions), [TextVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textverifyoptions)) and add instances to List<[VerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/verifyoptions)\> collection.
* Call [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass filled list of List<[VerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/verifyoptions)\> to it.

This example shows how to search for different signature types in the document.

```csharp
using (Signature signature = new Signature("sampleSigned.pdf"))
{
    TextVerifyOptions textVerifyOptions = new TextVerifyOptions()
    {
        AllPages = true, // this value is set by default
        SignatureImplementation = TextSignatureImplementation.Stamp,
        Text = "John",
        MatchType = TextMatchType.Contains
    };
    BarcodeVerifyOptions barcVerifyOptions = new BarcodeVerifyOptions()
    {
        AllPages = true, // this value is set by default
        Text = "John",
        MatchType = TextMatchType.Contains
    };
    QrCodeVerifyOptions qrcdVerifyOptions = new QrCodeVerifyOptions()
    {
        AllPages = true, // this value is set by default
        Text = "John",
        MatchType = TextMatchType.Contains
    };
    DigitalVerifyOptions digtVerifyOptions = new DigitalVerifyOptions("certificate.pdf")
    {
        Comments = "Test comment"
    };
    // verify document signatures
    List<VerifyOptions> listOptions = new List<VerifyOptions>();
    listOptions.Add(textVerifyOptions);
    listOptions.Add(barcVerifyOptions);
    listOptions.Add(qrcdVerifyOptions);
    listOptions.Add(digtVerifyOptions);
    VerificationResult result = signature.Verify(listOptions);
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
