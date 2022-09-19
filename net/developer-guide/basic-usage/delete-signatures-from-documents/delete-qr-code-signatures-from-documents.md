---
id: delete-qr-code-signatures-from-documents
url: signature/net/delete-qr-code-signatures-from-documents
title: Delete QR-code signatures from documents
weight: 3
description: "This article explains how to delete QR code electronic signatures with GroupDocs.Signature API."
keywords: delete QR code, how to delete QR code
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Remove QR codes from documents in C#    
        description: Delete QR codes presented in documents in convenient way with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to clear any documents from QR codes using C# 
        description: Information about removing QR codes from documents by C#
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of QR codes presented in document 
          text: Create an instance of QrCodeSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found QR codes and save result 
          text: Invoke Delete method passing found QR codes and file path for signed file. File stream can be used as well.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [QrCodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature) class to manipulate QR-code signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class.

Here are the steps to delete QR-code signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [QrCodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method to obtain list of [QrCodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature);
* Select from list [QrCodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.

This example shows how to delete QR-code signature that was found using [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method.

```csharp
using (Signature signature = new Signature("signed.docx"))
{
    QrCodeSearchOptions options = new QrCodeSearchOptions();
    // search for QRCode signatures in document
    List<QrCodeSignature> signatures = signature.Search<QrCodeSignature>(options);
    if (signatures.Count > 0)
    {
        QrCodeSignature qrCodeSignature = signatures[0];
        bool result = signature.Delete(qrCodeSignature);
        if (result)
        {
            Console.WriteLine($"Signature with QR-Code '{qrCodeSignature.Text}' was deleted.");
        }
        else
        {
            Console.WriteLine($"Signature was not deleted from the document!");
        }
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
