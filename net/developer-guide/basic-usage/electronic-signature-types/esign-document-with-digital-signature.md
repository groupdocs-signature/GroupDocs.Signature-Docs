---
id: sign-document-with-digital-signature
url: signature/net/sign-document-with-digital-signature
title: Sign document with Digital signature
linkTitle: Digital signature
weight: 2
description: "Learn about the benefits of using digital signatures to sign documents securely. Discover how to add programmatically digital signatures in C# with step-by-step instructions."
keywords: document, signature, certificate, digitally, sign, pfx, c#, net
productName: GroupDocs.Signature for .NET
---

## Introduction:

In today's digital age, ensuring the authenticity and integrity of electronic documents is crucial. One highly effective method for achieving this is through the use of digital signatures. In this guide, we will explore the world of digital signatures, explaining what they are, why they are essential, and how you can utilize GroupDocs.Signature to seamlessly eSign your documents.

## What is a Digital Signature?

A digital signature is a cryptographic mechanism for verifying the authenticity and integrity of electronic documents. It provides strong assurance that the document originated from a known sender and has not been tampered with by unauthorized sources. Digital signatures are typically represented by certificates containing private (for signing) and public (for verification) keys. Various public key cryptography standards, such as PFX format, are commonly used for this purpose.
Picture below shows how digital signature looks by default on PDF document page.

![Digital](/signature/net/images/esign-document-with-digital-signature.png)

## Why Use Digital Signatures?

- **Enhanced Security:** Digital signatures provide a higher level of document security, making it extremely challenging for unauthorized parties to alter the content.
- **Authentication:** They offer a reliable way to verify the identity of the document sender.
- **Non-repudiation:** Digital signatures prevent senders from denying the authenticity of the signed document.


## How to Sign document with Digital signature

**[GroupDocs.Signature](https://products.groupdocs.com/signature/net)** supports creation of digital signature based on existing PFX certificate. To specify different settings library provides [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) class that allows to adjust digital signature properties in the document:

* Certificate source from [FilePath](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/certificatefilepath/) or [Stream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/certificatestream/);
* Certificate [password](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/password/);
* [Contact](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/contact/), [Reason](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/reason/) and [Location](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/location/) properties to set additional description;
* [Visible](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/visible/) property to specify whether signature should be visible on document page or not;
* [XAdES type](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/xadestype/) to specify whether e-signature should be of Xml Advanced Electronic Signature type.

### Follow these steps to sign your documents with digital signature

1. Install in your .NET application GroupDocs.Signature NuGet [package](https://www.nuget.org/packages/groupdocs.signature).
2. Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
3. Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object with required certificate and its password.
4. Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) to it.

Example shows how to sign PDF document with digital e-signature using C# language. We can sign any other supported document format in the same way.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // initialize digital option with certificate file path
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx")
    {
        // optional: setup image file path
        ImageFilePath = "sample.jpg",

        // set signature position
        Left = 100,
        Top = 100,

        // set
        Password = "1234567890"
    };
    signature.Sign("sampleSigned.pdf", options);
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

### Free Online App

Along with full-featured .NET library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
