---
id: sign-documents-with-encrypted-qr-code-text
url: signature/net/sign-documents-with-encrypted-qr-code-text
title: Sign documents with encrypted QR-code text
linkTitle: ✎ Encrypted QR Text
weight: 3
description: "This article explains how to create encrypted QR-code electronic signature with GroupDocs.Signature API"
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides ability to secure QR-code signature text with standard or custom encryption. Standard encryption is implemented over class [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption) class. Creation of this object expects 3 arguments like encryption algorithm enumeration [SymmetricAlgorithmType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricalgorithmtype) with one of following values ([DES, TripleDES, RC2, Rijndael](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricalgorithmtype)), string value key and string value salt.

Here are the steps to secure QR-code text with standard encryption with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature)  class and pass source document path or stream as a constructor parameter.
* Compose object of [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption) class with required algorithm and secure pair key/salt
* Create objects of [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) class and setup property [DataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/dataencryption) with object of [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption)
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) to it.

This example shows how to sign document with secure QR-code signature text.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // setup key and passphrase
    string key = "1234567890";
    string salt = "1234567890";
    // create data encryption
    IDataEncryption encryption = new SymmetricEncryption(SymmetricAlgorithmType.Rijndael, key, salt);
    // setup QR-Code options
    QrCodeSignOptions options = new QrCodeSignOptions()
    {
        //setup text to be secured
        Text = "This is private text to be secured.",
        EncodeType = QrCodeTypes.QR,
        // specify text encryption
        DataEncryption = encryption,
        // locate and aligh signature
        Height = 100,
        Width = 100,
        VerticalAlignment = VerticalAlignment.Bottom,
        HorizontalAlignment = HorizontalAlignment.Right,
        Margin = new Padding() {  Right = 10, Bottom = 10}
    };
    // sign document to file
    signature.Sign("QRCodeEncryptedText.pdf", options);
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