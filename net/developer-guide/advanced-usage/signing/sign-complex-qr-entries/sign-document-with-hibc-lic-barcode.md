---
id: sign-document-with-hibc-lic-barcode
url: signature/net/sign-document-with-hibc-lic-barcode
title: Sign document with HIBC LIC barcode Symbology
linkTitle: ✎ HIBC LIC
weight: 2
description: "This article explains how to sign document with HIBC LIC barcode Symbology signatures"
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [HIBCLICCombinedData](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/hibcliccombineddata/) class to create HIBC LIC barcode. It is used by manufacturers of health care products for identification purpose. Labelers can encode Primary Data and Secondary Data.

Here are the steps how to add HIBC LIC barcode signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the  [HIBCLICCombinedData](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/hibcliccombineddata/). Fill properties which correspond Primary Data and Secondary Data structure with models [HIBCLICPrimaryData](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/hibclicprimarydata/) and [HIBCLICSecondaryAdditionalData](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/hibclicsecondaryadditionaldata/) respectively.
* Instantiate the  [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/) object with all required additional options and set HIBCLICCombinedData object into Data property.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to add HIBCLICCombinedData signature to document:

```csharp
using (Signature signature = new Signature(filePath))
{
    // Create HIBCLICCombinedData data object which composes Primary and Secondary data
    var hibclicCombinedData = new HIBCLICCombinedData()
    {
        PrimaryData = new HIBCLICPrimaryData()
        {
            ProductOrCatalogNumber = "12345",
            LabelerIdentificationCode = "A999",
            UnitOfMeasureID = 1
        },

        SecondaryAdditionalData = new HIBCLICSecondaryAdditionalData()
        {
            ExpiryDate = DateTime.Today,
            ExpiryDateFormat = HIBCLICDateFormat.MMDDYY,
            Quantity = 30,
            LotNumber = "LOT123",
            SerialNumber = "SERIAL123",
            DateOfManufacture = DateTime.Today
        }
    };

    // create options
    QrCodeSignOptions options = new QrCodeSignOptions
    {
        EncodeType = QrCodeTypes.QR,
        Left = 100,
        Top = 100,
        // setup Data property to Mailmark2D instance
        Data = hibclicCombinedData
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

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To generate barcodes and/or sign your files with barcodes for free, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
