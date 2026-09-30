---
id: sign-pdf-document-with-timestamp
url: signature/net/sign-pdf-document-with-timestamp
title: Sign PDF document with a time stamp
linkTitle: ✎ Time stamp
weight: 3
description: "This article explains how to add a trusted RFC 3161 time stamp to a PDF digital signature with GroupDocs.Signature API."
keywords: time stamp, timestamp, TSA, RFC 3161, trusted signing time, PDF digital signature, PdfDigitalSignature, TimeStamp
productName: GroupDocs.Signature for .NET
toc: True
hideChildren: False
structuredData:
    showOrganization: True
    application:
        name: Adding a trusted time stamp to a PDF digital signature using C#
        description: Sign PDF documents with a digital certificate and an RFC 3161 time stamp with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net
    showVideo: True
    howTo:
        name: How to add a time stamp to a PDF digital signature via C#
        description: Sign a PDF document with a certificate and a time stamp from a time-stamp authority with C#
        steps:
        - name: Set up the time stamp
          text: Create a PdfDigitalSignature object and set its TimeStamp property to the address of the time-stamp authority, with a user name and password if it needs them.
        - name: Set up the digital signature options
          text: Create DigitalSignOptions with the certificate and its password, and assign the PdfDigitalSignature object to the Signature property.
        - name: Sign the document
          text: Call the Sign method of the Signature class and pass the options and the output file.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) can add a trusted time stamp to a PDF digital signature. The time stamp comes from a time-stamp authority (TSA) that implements [RFC 3161](https://www.rfc-editor.org/rfc/rfc3161). It proves *when* the document was signed, which matters once the signing certificate expires: a validator can then check that the certificate was valid at the signing time.

Here are the steps to sign a PDF document with a time stamp:

* Create a [PdfDigitalSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/pdfdigitalsignature/) object and set its [TimeStamp](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/pdfdigitalsignature/timestamp/) property to the address of the time-stamp authority.
* Create [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) with the certificate and its password, and assign the `PdfDigitalSignature` object to its [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/signature/) property.
* Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/) class.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    PdfDigitalSignature pdfDigitalSignature = new PdfDigitalSignature()
    {
        // The time-stamp authority to contact. The user name and password are optional:
        // set either, both or neither, depending on what the time-stamp authority requires.
        TimeStamp = new TimeStamp("https://freetsa.org/tsr", "", "")
    };

    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx")
    {
        Password = "1234567890",
        Signature = pdfDigitalSignature
    };

    signature.Sign("signed.pdf", options);
}
```

## How the time stamp is requested

* The time-stamp authority is contacted while the document is signed, so the signing machine must be able to reach it. The request contains a hash of the signature, not the document.
* The time stamp uses the same digest as the signature: SHA-256 by default, or the value of [HashAlgorithm](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions/hashalgorithm/).
* The user name and password are sent with HTTP Basic authentication, so use an `https://` address. Starting with GroupDocs.Signature for .NET 26.9, they are sent when either of them is set; earlier versions sent them only when both were set.
* If the time-stamp authority cannot be reached or rejects the request, `Sign` throws [GroupDocsSignatureException](https://reference.groupdocs.com/signature/net/groupdocs.signature/groupdocssignatureexception/) and the document is not signed.
* Time stamps are available for PDF documents.

See [Network access and data privacy]({{< ref "signature/net/getting-started/network-access-and-data-privacy.md" >}}) for every situation in which GroupDocs.Signature uses the network.

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
