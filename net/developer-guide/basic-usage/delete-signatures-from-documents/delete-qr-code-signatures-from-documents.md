---
id: delete-qr-code-signatures-from-documents
url: signature/net/delete-qr-code-signatures-from-documents
title: Delete QR-code signatures from documents
weight: 3
description: "This article explains how to delete QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [QrCodeSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/qrcodesignature) class to manipulate QR-code signatures and delete them from the documents over [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method.  
Please be aware that [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method modifies the same document that was passed to constructor of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class.

Here are the steps to delete QR-code signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [QrCodeSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodesearchoptions) object with desired properties;
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method to obtain list of [QrCodeSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/qrcodesignature);
* Select from list [QrCodeSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/qrcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) object [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method and pass one or several signatures to it.

This example shows how to delete QR-code signature that was found using [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method.

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


