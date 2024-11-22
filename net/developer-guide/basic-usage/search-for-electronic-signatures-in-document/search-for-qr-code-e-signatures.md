---
id: search-for-qr-code-e-signatures
url: signature/net/search-for-qr-code-e-signatures
title: How to search for QR code signatures
linkTitle: 🔍 QR Codes
weight: 3
description: "This article explains how to search for QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
structuredData:
    showOrganization: True
    application:    
        name: Search for QR-code signatures in documents in C#    
        description: Search QR-code signatures in various documents fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search any QR-code signatures in documents using C# 
        description: Get additional information of searching QR-code signatures in documents with C#
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of QR-code signatures 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found QR-code signatures.
---
When you search for electronic signatures of QR-Code type inside document with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) it's only needed to [QrCodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions) object to Search method.
Here are the quick guide of how to search for QR-code signatures:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [QrCodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions) object according to your requirements and specify search options;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions) to it.

The code snippet below demonstrates search for QR-code signature in the document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // search for signatures in document
    List<QrCodeSignature> signatures = signature.Search<QrCodeSignature>(SignatureType.QrCode);

    Console.WriteLine("\nSource document contains following signatures.");
    foreach (var QrCodeSignature in signatures)
    {
        Console.WriteLine("QRCode signature found at page {0} with type {1} and text {2}",
            QrCodeSignature.PageNumber, QrCodeSignature.EncodeType, QrCodeSignature.Text);
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

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
