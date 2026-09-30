---
id: sign-documents-with-extra-digital-signature-properties
url: signature/net/sign-documents-with-extra-digital-signature-properties
title: Sign documents with extra Digital Signature properties
weight: 2
description: " This article explains how to use extended Digital electronic signatures options and adjustment on document page."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) contains [DigitalSignatureAppearance](https://reference.groupdocs.com/signature/net/groupdocs.signature.options.appearances/digitalsignatureappearance) class that implements extra settings for digital signature of Word Processing and Spreadsheets documents

Base signature options [SignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions) property [SignOptions.Appearance](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions/appearance) should be set with instance of [DigitalSignatureAppearance](https://reference.groupdocs.com/signature/net/groupdocs.signature.options.appearances/digitalsignatureappearance) class to provide additional digital signature look

Here are the steps to setup extra image appearance with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Compose object of[DigitalSignatureAppearance](https://reference.groupdocs.com/signature/net/groupdocs.signature.options.appearances/digitalsignatureappearance) object with all required additional options.
* Set  [SignOptions.Appearance](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions/appearance) property with [DigitalSignatureAppearance](https://reference.groupdocs.com/signature/net/groupdocs.signature.options.appearances/digitalsignatureappearance) object and set its properties
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [SignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to setup extra digital signature look. See [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult)

```csharp
using (Signature signature = new Signature("sample.docx"))
{
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx")
    {
        // certifiate password
        Password = "1234567890",
        // digital certificate details
        Reason = "Sign",
        Contact = "JohnSmith",
        Location = "Office1",

        // image as digital certificate appearance on document pages
        ImageFilePath = imagePath,
        //
        AllPages = true,
        Width = 80,
        Height = 60,
        VerticalAlignment = VerticalAlignment.Bottom,
        HorizontalAlignment = HorizontalAlignment.Right,
        Margin = new Padding() { Bottom = 10, Right = 10 },
        // Setup signature line appearance.
        // This appearance will add Signature Line on the first page.
        // Could be useful for .xlsx files.
        Appearance = new DigitalSignatureAppearance("John Smith", "Title", "jonny@test.com")

    };
    signature.Sign("signed.docx", options);
}


```

## Sign Pdf document with Text signature Sticker appearance

This example shows how to add Text signature to Pdf document with sticker look. See [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult)

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    TextSignOptions options = new TextSignOptions("John Smith")
    {
        // set signature position
        Left = 100,
        Top = 100,
        // set signature rectangle
        Width = 100,
        Height = 30,
        // setup proper signature implementation
        SignatureImplementation = TextSignatureImplementation.Sticker,
        Appearance = new PdfTextStickerAppearance()
        {
            // select sticker icon
            Icon = PdfTextStickerIcon.Star,
            // setup if popup annotation will be opened by default
            Opened = false,
            // text content of an annotation
            Contents = "Sample",
            Subject = "Sample subject",
            Title = "Sample Title"
        },
        // set signature alignment
        VerticalAlignment = VerticalAlignment.Bottom,
        HorizontalAlignment = HorizontalAlignment.Right,
        Margin = new Padding() { Bottom = 20, Right = 20 },
        // set text color and Font
        ForeColor = Color.Red,
        Font = new SignatureFont { Size = 12, FamilyName = "Comic Sans MS" },
    };
    // sign document to file
    signature.Sign("signed.pdf", options);
}
```

## Sign Word documents with post-quantum (ML-DSA) certificates

Starting with GroupDocs.Signature for .NET 26.9, Word Processing documents can be signed with a certificate that has a post-quantum ML-DSA key (ML-DSA-44, ML-DSA-65 or ML-DSA-87, defined in FIPS 204). The PFX file is used in the same way as any other certificate:

```csharp
using (Signature signature = new Signature("sample.docx"))
{
    // PFX file with an ML-DSA-65 key and its certificate
    DigitalSignOptions options = new DigitalSignOptions("mldsa65.pfx")
    {
        Password = "1234567890"
    };
    SignResult result = signature.Sign("signed.docx", options);
}
```

This works on every supported platform. .NET itself reads ML-DSA keys only on some systems (for example, it cannot on Linux with .NET 6 or .NET 8). Where it cannot, GroupDocs.Signature uses the certificate as read by the Word Processing engine. Verifying the signed document with [DigitalVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalverifyoptions/) and the PFX file, or its public `.cer` certificate, works in the same way.

Limits:

* Only Word Processing documents (for example DOCX, DOC and ODT) can be signed with ML-DSA. PDF, Spreadsheet and Presentation documents cannot yet.
* ML-KEM keys are for key agreement and cannot sign.
* There is no standard XML-DSig identifier for ML-DSA yet, so the signature names the algorithm by its object identifier (for example `urn:oid:2.16.840.1.101.3.4.3.18` for ML-DSA-65). Microsoft Word and LibreOffice may not validate such a signature. Check with the software your recipients use before you rely on it.
* Where .NET cannot read the key, the certificate returned in [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) (`DigitalSignature.Certificate`) is the public certificate, without its private key.
* Expired and not-yet-valid ML-DSA certificates are rejected in the same way as any other certificate. See "Certificates outside their validity period" in [Pdf Digitally signing]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/sign-document-with-digital-signature-advanced.md" >}}).

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
