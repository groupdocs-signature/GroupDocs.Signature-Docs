---
id: sign-documents-with-standard-encryption-for-qr-code
url: signature/net/sign-documents-with-standard-encryption-for-qr-code
title: Sign documents with standard encryption for QR-code
linkTitle: ✎ QR Encryption
weight: 4
description: "This article explains how to create encrypted QR-code electronic signature"
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides ability to encrypt QR-code signature with symmetric algorithms. Class [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption) implements one of the following values algorithms ([DES, TripleDES, RC2, Rijndael or AES](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricalgorithmtype)), string value key and string value salt.

Here are the steps to encrypt QR-code text with embedded encryption by GroupDocs.Signature:

* Create one or several objects of [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) object with [Data](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/data) or Text property
* Instantiate the  [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) object according to your requirements and custom object to [Data](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/data) property.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) to it.  

## How to encrypt QR-code signature

 This example shows how to encrypt QR-code signature.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // setup key and passphrase
    string key = "1234567890";
    string salt = "1234567890";
    // create data encryption
    IDataEncryption encryption = new SymmetricEncryption(SymmetricAlgorithmType.AES, key, salt);
    // setup QR-Code options
    QrCodeSignOptions options = new QrCodeSignOptions()
    {
        // set QR-code text
        Text = "This is secure text that will be encrypted",
        // QR-code type
        EncodeType = QrCodeTypes.QR,
        // specify serialization encryption
        DataEncryption = encryption,
        // locate and aligh signature
        Height = 100,
        Width = 100,
        VerticalAlignment = VerticalAlignment.Bottom,
        HorizontalAlignment = HorizontalAlignment.Right,
        Margin = new Padding() { Right = 10, Bottom = 10 }
    };
    // sign document to file
    signature.Sign("QrCodeEncrypted.pdf", options);
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

To generate QR codes and/or sign your files with QR codes for free, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.