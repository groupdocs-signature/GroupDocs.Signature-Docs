---
id: sign-document-with-digital-signature
url: signature/nodejs-java/sign-document-with-digital-signature
title: Sign document with Digital signature
linkTitle: Digital signature
weight: 2
description: "Learn about the benefits of using digital signatures to sign documents securely. Discover how to add programmatically digital signatures in Node.Js with step-by-step instructions."
keywords: document, signature, certificate, digitally, sign, pfx, Node.Js, net
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
---

## Introduction

In today's digital age, ensuring the authenticity and integrity of electronic documents is crucial. One highly effective method for achieving this is through the use of digital signatures. In this guide, we will explore the world of digital signatures, explaining what they are, why they are essential, and how you can utilize GroupDocs.Signature to seamlessly eSign your documents.

## What is a Digital Signature?

A digital signature is a cryptographic mechanism for verifying the authenticity and integrity of electronic documents. It provides strong assurance that the document originated from a known sender and has not been tampered with by unauthorized sources. Digital signatures are typically represented by certificates containing private (for signing) and public (for verification) keys. Various public key cryptography standards, such as PFX format, are commonly used for this purpose.
The picture below shows how a digital signature looks on a PDF document page by default.

![Digital](/signature/nodejs-java/images/esign-document-with-digital-signature.png)

## Why Use Digital Signatures?

- **Enhanced Security:** Digital signatures provide a higher level of document security, making it extremely challenging for unauthorized parties to alter the content.
- **Authentication:** They offer a reliable way to verify the identity of the document sender.
- **Non-repudiation:** Digital signatures prevent senders from denying the authenticity of the signed document.


## How to Sign a document with a Digital Signature

**[GroupDocs.Signature](https://products.groupdocs.com/signature/nodejs-java)** supports the creation of digital signatures based on existing PFX certificates. To specify various settings the library provides the [DigitalSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/) class that allows adjusting digital signature properties in the document:

* The [FilePath](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/certificatefilepath/) or [Stream](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/certificatestream/) properties define the certificate source;
* The [password](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/password/) property specifies the certificate password;
* The [Contact](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/contact/), [Reason](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/reason/) and [Location](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/location/) properties specify additional descriptions;
* The [Visible](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/visible/) property specifies whether the signature should be visible on the document page or not;
* The [XAdES type](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/xadestype/) property defines whether the e-signature should be of an XML Advanced Electronic Signature type.

### Follow these steps to sign your documents with a digital signature

1. Install the GroupDocs.Signature [NuGet package](https://www.nuget.org/packages/groupdocs.signature) to your .NET application.
2. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
3. Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/) object with the required certificate and its password.
4. Call the [Sign](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class instance and pass the [DigitalSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsignoptions/) to it.

The example below shows how to sign a PDF document with a digital e-signature using Node.Js language. We can sign any other supported document format in the same way.

```javascript
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
### Summary
This guide demonstrates how to use [**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) to sign documents with digital signatures. It explains how to load documents, configure certificate-based signatures, and save signed files securely. Advanced features, including signature appearance customization and validation, are also covered. Refer to related resources for additional details on digital signing workflows.



## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature Node.Js for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
