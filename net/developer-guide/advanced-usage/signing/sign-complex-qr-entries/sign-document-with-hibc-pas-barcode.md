---
id: sign-document-with-hibc-pas-barcode
url: signature/net/sign-document-with-hibc-pas-barcode
title: Sign document with HIBC PAS barcode Symbology
linkTitle: ✎ HIBC PAS
weight: 4
description: "This article explains how to sign document with HIBC PAS barcode Symbology signatures"
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [HIBCPASData](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/hibcpasdata/) class to create HIBC PAS barcode, designed specifically to meet the stringent requirements of the healthcare industry.

Here are the steps how to add HIBC PAS barcode signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the  [HIBCPASData](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/hibcpasdata/). Fill properties 
* Instantiate the  [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/) object with all required additional options and set HIBCLICCombinedData object into Data property.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to add HIBCPASData signature to document using c#:

```csharp
using (Signature signature = new Signature(filePath))
{
    var data = new HIBCPASData()
    {
        DataLocation = HIBCPASDataLocation.Patient,
    };

    data.AddRecord(HIBCPASDataType.LabelerIdentificationCode, "A123");
    data.AddRecord(HIBCPASDataType.ManufacturerSerialNumber, "SERIAL123");

    // create options
    QrCodeSignOptions options = new QrCodeSignOptions
    {
        EncodeType = QrCodeTypes.QR,
        Left = 100,
        Top = 100,        
        Data = data
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

This example shows how to decode HIBCPASData signature from the document using c#:

```csharp
using (Signature.Signature signature = new Signature.Signature(outputFilePath))
{
    List<QrCodeSignature> signatures = signature.Search<QrCodeSignature>(SignatureType.QrCode);
    QrCodeSignature qrCode = signatures.FirstOrDefault();
    var data = qrCode.GetData<HIBCPASData>();
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
