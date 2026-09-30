---
id: sign-document-with-digital-signature-advanced
url: signature/net/sign-document-with-digital-signature-advanced
title: Pdf Digitally signing
linkTitle: ✎ Pdf digitally signing
weight: 1
description: "This article explains how to sign document with Digital electronic signatures using advanced options with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
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

### Choose the hash algorithm

Starting with GroupDocs.Signature for .NET 26.9, PDF digital signatures use SHA-256 by default, in the `adbe.pkcs7.detached` format. Set the [HashAlgorithm](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions/hashalgorithm/) property to use SHA-384 or SHA-512 instead:

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx")
    {
        Password = "1234567890",
        // SHA-256 is the default. SHA-384 and SHA-512 are also available.
        HashAlgorithm = HashAlgorithm.Sha512
    };
    signature.Sign("signed.pdf", options);
}
```

A time stamp, when you add one, uses the same digest. `HashAlgorithm.Sha1` is still available for legacy validators, but it is not suitable for new signatures and many validators reject it. See [Digital signing with custom hash]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/digital-signing-with-custom-hash.md" >}}) for all values.

### Certificates outside their validity period

A certificate is valid from its `NotBefore` date to its `NotAfter` date, and validators report a signature made outside that period as not valid. So, starting with GroupDocs.Signature for .NET 26.9, the `Sign` method does not sign with such a certificate by default: it throws [GroupDocsSignatureException](https://reference.groupdocs.com/signature/net/groupdocs.signature/groupdocssignatureexception/), and nothing is signed or saved. The message names the certificate and the property that allows it:

```text
The signing certificate expired on 2019-05-01 12:00 UTC (subject "CN=...", thumbprint ...). Validators report a signature made with an expired certificate as not valid, so the document is not signed. To sign anyway, set DigitalSignOptions.AllowExpired to true.
```

To sign anyway, for example to test with an old certificate, set the property for the case you need. The document is then signed, and a warning is written to the logger set in [SignatureSettings](https://reference.groupdocs.com/signature/net/groupdocs.signature/signaturesettings/):

```csharp
using (Signature signature = new Signature("sample.pdf", new SignatureSettings(new ConsoleLogger())))
{
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx")
    {
        Password = "1234567890",
        // Sign even though the certificate has expired. A warning is written to the logger.
        AllowExpired = true
    };
    signature.Sign("signed.pdf", options);
}
```

| Property | Default | Allows |
| --- | --- | --- |
| `AllowExpired` | `false` | a certificate whose validity period has ended |
| `AllowNotYetValid` | `false` | a certificate whose validity period has not started yet. This usually means the certificate was issued for a later date, or the computer's clock is wrong |

The two properties are independent: `AllowExpired` does not allow a certificate that is not valid yet. Also note:

* The certificate is compared with the current time in UTC, not with `DigitalSignature.SignTime`.
* The check covers a certificate given as a file, a stream or a `DigitalSignature.Certificate` object, in every document format.
* For spreadsheets it also covers the certificate of the first `DigitalVBA` extension, and the same two properties govern it. With `DigitalVBA.SignOnlyVBAProject` the spreadsheet itself is not signed, so its own certificate is not checked.
* Digital signatures of images use no certificate and are not checked.
* A certificate that cannot be read, for example because of a wrong password, gives its own error.

### Add Long-Term Validation (LTV) information for a signature

What is Long-Term Validation (LTV) for Digital Signatures?

Long-Term Validation (LTV) is a method used to ensure the continued validity of digital signatures over time, even after the signing certificate expires or is revoked. LTV embeds additional information within the signed document, such as the certificate’s revocation status, timestamp, and the certificate chain, which allows anyone verifying the signature in the future to determine its authenticity, even if the original certificate is no longer available.

Why is LTV Important?

Digital signatures rely on certificates, which have expiration dates. Once the signing certificate expires or is revoked, the signature may no longer be considered valid. However, many legal, financial, and regulatory scenarios require documents to remain valid for years or decades. LTV solves this problem by embedding validation data directly into the signed document, ensuring that the signature’s authenticity can be verified at any point in the future.

Here is an example of how to implement Long-Term Validation (LTV) for a PDF document using GroupDocs.Signature:

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
        AllPages = true,
        Width = 80,
        Height = 60,
        VerticalAlignment = VerticalAlignment.Bottom,
        HorizontalAlignment = HorizontalAlignment.Right,
        Margin = new Padding() {Bottom = 10, Right = 10},
        
        // Enable Long-Term Validation (LTV) to ensure signature validity over time
        UseLtv = true
    };
    signature.Sign("signed.pdf", options);
}
```
After signing a document with LTV support, you can check whether the signature includes LTV data using Adobe Acrobat.
Here is the example of signature detailes in Adobe Acrobat:
![LTV](/signature/net/images/sign-document-with-ltv-advanced.png) 

{{< alert style="info" >}}
The validation data that can be embedded depends on your signing certificate. While it saves the document, GroupDocs.Signature collects revocation information from the OCSP or CRL addresses that the certificate authority publishes in the certificates, so those addresses must be reachable from the signing machine at signing time. A certificate whose authority publishes neither cannot produce complete validation data. See [Network access and data privacy]({{< ref "signature/net/getting-started/network-access-and-data-privacy.md" >}}).
{{< /alert >}}


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
