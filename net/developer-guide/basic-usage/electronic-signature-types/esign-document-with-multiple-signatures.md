---
id: esign-document-with-multiple-signatures
url: signature/net/esign-document-with-multiple-signatures
title: eSign document with multiple signatures
linkTitle: Multiple types eSign
weight: 9
description: "This article explains how to sign a document with multiple signatures of various types by GroupDocs.Signature API"
keywords: multiple signatures, sign document, how to sign document with multiple signatures
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Documents signing with multiple signatures in C#    
        description: Sign documents with many signatures simultaneously and C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign any documents with various signatures simultaneously using C# 
        description: Learn all about signing a document by using multiple signatures and C#
        steps:
        - name: Load file which is planned to be signed
          text: Create the Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Instantiate and set up BarcodeSignOptions, QrCodeSignOptions and DigitalSignOptions objects and add them to the List.
        - name: Sign the source file with form fields and save the result 
          text: Invoke the Sign method with signing options and output file path or stream.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) allows signing a document with several signatures simultaneously and even apply signatures of different types to the same document.

Doing this is as simple as:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass the source document path or stream as a constructor parameter.
* Instantiate all required sign options objects depending on signature type:
    * [BarcodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/barcodesignoptions) - for Barcode signatures;
    * [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) - for Digital signatures;
    * [FormFieldSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsignoptions) - for Form-field signatures;
    * [ImageSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions) - for Image signatures;
    * [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) - for Metadata signatures;
    * [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) - for QR-code signatures
    * [StampSIgnOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/stampsignoptions) - for Stamp signatures;
    * [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions) - for Text signatures.
* Fill the collection with sign options from the previous step.  
* Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass the collection of sign options to it.

This code snippet below demonstrates how to eSign a PDF document with multiple signatures at the same time.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // define several signature options of different types and settings
    TextSignOptions textOptions = new TextSignOptions("This is test message")
    {
        VerticalAlignment = VerticalAlignment.Top,
        HorizontalAlignment = HorizontalAlignment.Left
    };

    BarcodeSignOptions barcodeOptions = new BarcodeSignOptions("123456")
    {
        EncodeType = BarcodeTypes.Code128,
        Left = 100,
        Top = 100
    };
    QrCodeSignOptions qrcodeOptions = new QrCodeSignOptions("JohnSmith")
    {
        EncodeType = QrCodeTypes.QR,
        Left = 100,
        Top = 200
    };
    DigitalSignOptions digitalOptions = new DigitalSignOptions("certificate.pfx")
    {
        ImageFilePath = Constants.ImageHandwrite,
        VerticalAlignment = VerticalAlignment.Center,
        HorizontalAlignment = HorizontalAlignment.Center,
        Password = "1234567890"
    };
    // define list of signature options
    List<SignOptions> listOptions = new List<SignOptions>();
    listOptions.Add(textOptions);
    listOptions.Add(barcodeOptions);
    listOptions.Add(qrcodeOptions);
    listOptions.Add(digitalOptions);

    // sign document to file
    signature.Sign("signed.pdf", listOptions);
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