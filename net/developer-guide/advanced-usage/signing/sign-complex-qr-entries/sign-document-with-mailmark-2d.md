---
id: sign-document-with-mailmark-2d
url: signature/net/sign-document-with-mailmark-2d
title: Sign document with Royal Mail Mailmark 2D Barcode signature
linkTitle: ✎ Mailmark 2D
weight: 1
description: "This article explains how to sign document with Royal Mail Mailmark 2D Barcode electronic signatures"
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [Mailmark2D](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/mailmark2d/mailmark2d) class to create Royal Mail Mailmark 2D barcode. These barcodes can store various data, including information about the sender, recipient, postage, and destination. The use of Mailmark 2D barcodes allows for more accurate and detailed tracking of mail items throughout their journey in the postal system.

Here are the steps how to add Mailmark2D Barcode signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the  [Mailmark2D](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/mailmark2d/mailmark2d/) object with all required additional options.
* Instantiate the  [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/) object with all required additional options and set Mailmark2D object into Data property.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to add Mailmark2D signature to document. We use enum [Mailmark2DType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/mailmark2dtype/) to specify 2D barcode type, on which depends barcode form:

![Types](/signature/net/images/mailmark2dtype.png)

```csharp
using (Signature signature = new Signature(filePath))
{
    // create Mailmark2D data object
    Mailmark2D mailmark2D = new Mailmark2D()
    {
        UPUCountryID = "JGB ",
        InformationTypeID = "0",
        Class = "1",
        SupplyChainID = 123,
        ItemID = 1234,
        DestinationPostCodeAndDPS = "QWE1",
        RTSFlag = "0",
        ReturnToSenderPostCode = "QWE2",
        DataMatrixType = Mailmark2DType.Type_7,
        CustomerContentEncodeMode = DataMatrixEncodeMode.C40,
        CustomerContent = "CUSTOM"
    };

    // create options
    QrCodeSignOptions options = new QrCodeSignOptions
    {
        EncodeType = QrCodeTypes.QR,
        Left = 100,
        Top = 100,
        // setup Data property to Mailmark2D instance
        Data = mailmark2D
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
