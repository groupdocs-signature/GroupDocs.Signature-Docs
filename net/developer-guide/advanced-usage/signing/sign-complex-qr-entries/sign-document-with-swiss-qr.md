---
id: sign-document-with-swiss-qr
url: signature/net/sign-document-with-swiss-qr
title: Sign document with Swiss QR Barcode signature
linkTitle: ✎ Swiss QR
weight: 3
description: "This article explains how to sign document with Swiss QR Barcode electronic signatures"
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [SwissQR](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/swissqr/) class to create Swiss QR. The Swiss QR Barcode is used mostly in the QR-bill, which is a document designed to replace the payment slips and currently used in payment transactions in Switzerland.

Here are the steps how to add Swiss QR signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the  [SwissQR](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/swissqr/) object with all required additional options.
* Instantiate the  [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/) object with all required additional options and set SwissQR object into Data property.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.

```csharp
using (Signature signature = new Signature(filePath))
{
    // create SwissQR data object
    var swissQR = new SwissQR()
    {
        Account = "CH4431999123000889012",
        Amount = 1000.25m,
        Currency = "CHF",
        Reference = "210000000003139471430009017",
        Creditor = new SwissAddress
        {
            Name = "Muster & Söhne",
            Street = "Musterstrasse",
            HouseNo = "12b",
            PostalCode = "8200",
            Town = "Zürich",
            CountryCode = "CH"
        },

        Debtor = new SwissAddress
        {
            Name = "Muster AG",
            Street = "Musterstrasse",
            HouseNo = "1",
            PostalCode = "3030",
            Town = "Bern",
            CountryCode = "CH"
        }
    };

    // create options
    QrCodeSignOptions options = new QrCodeSignOptions
    {
        EncodeType = QrCodeTypes.QR,
        Left = 100,
        Top = 100,
        // setup Data property to SwissQR instance
        Data = swissQR
    };

    // sign document to file
    var signResult = signature.Sign(outputFilePath, options);
            
    // analyzing result
    Console.WriteLine("List of newly created signatures:");
    int number = 1;
    foreach (BaseSignature temp in signResult.Succeeded)
    {
        Console.WriteLine($"Signature #{number++}: Type: {temp.SignatureType} Id:{temp.SignatureId}, Location: {temp.Left}x{temp.Top}. Size: {temp.Width}x{temp.Height}");
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
