---
id: search-for-qr-code-e-signatures
url: signature/net/search-for-qr-code-e-signatures
title: Search for QR-Code e-signatures
weight: 3
description: "This article explains how to search for QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
When you search for electronic signatures of QR-Code type inside document with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) it's only needed to [QrCodeSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodesearchoptions) object to Search method.
Here are the quick guide of how to search for QR-code signatures:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [QrCodeSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodesearchoptions) object according to your requirements and specify search options;
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [QrCodeSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/qrcodesearchoptions) to it.

The code snippet below demonstrates search for QR-code signature in the document.

```csharp
            using (Signature signature = new Signature("sample.pdf"))
            {
                // search for signatures in document
                List<QRCodeSignature> signatures = signature.Search<QRCodeSignature>(SignatureType.QrCode);

                Console.WriteLine("\nSource document contains following signatures.");
                foreach (var QRCodeSignature in signatures)
                {
                    Console.WriteLine("QRCode signature found at page {0} with type {1} and text {2}", QRCodeSignature.PageNumber, QRCodeSignature.EncodeType, QRCodeSignature.Text);
                }
            }
```


