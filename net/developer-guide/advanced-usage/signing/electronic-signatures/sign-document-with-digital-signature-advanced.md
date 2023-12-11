---
id: sign-document-with-digital-signature-advanced
url: signature/net/sign-document-with-digital-signature-advanced
title: Pdf Digitally signing
linkTitle: ✎ Pdf digitally signing
weight: 1
description: "This article explains how to sign document with Digital electronic signatures using advanced options with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) class to specify different amount of settings for Digital signature

* digital certificate (file on local disk [CertificateFilePath](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/certificatefilepath/) or stream [CertificateStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/certificatestream/)) (required)
* password of digital certificate [Password](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/password/) (required)
* digital signature details ([Reason](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/reason/), [Contact](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/contact/), [Location](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/location/))
* signature image as digital signature appearance on document page ([ImageFilePath](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions/imagefilepath) or [ImageStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions/imagestream))
* image signature appearance on document page ([Alignment](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions/horizontalalignment), [Margin](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions/margin) etc.)

Here are the steps to add Digital signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object with required certificate and its password.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of  [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to add Digital signature to document. See [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult)

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // initialize digital option with certificate file path
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx")
    {
        // certifiate password
        Password = "1234567890",
        // digital certificate details
        Reason = "Sign",
        Contact = "JohnSmith",
        Location = "Office1",
        // image as digital certificate appearance on document pages
        ImageFilePath = "sample.jpg",
        //
        AllPages = true,
        Width = 80,
        Height = 60,
        VerticalAlignment = VerticalAlignment.Bottom,
        HorizontalAlignment = HorizontalAlignment.Right,
        Margin = new Padding() {  Bottom = 10, Right = 10},
    };
    signature.Sign("signed.pdf", options);
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

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
