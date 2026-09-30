---
id: sign-documents-with-exception-handling
url: signature/net/sign-documents-with-exception-handling
title: Sign documents with exception handling
linkTitle: ✎ Handling errors
weight: 2
description: " This article explains how to use exceptions handling when adding electronic signatures to document with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides different error messages due to validation issues, missing required data, files etc. For exception class [GroupDocsSignatureException](https://reference.groupdocs.com/signature/net/groupdocs.signature/groupdocssignatureexception) is being used.

Here are the steps to handle exceptions from GroupDocs.Signature:

* Compose try-catch block above [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method with catching [GroupDocsSignatureException](https://reference.groupdocs.com/signature/net/groupdocs.signature/groupdocssignatureexception) type error.  

This example shows how to handle GroupDocs.Signature exceptions.

```csharp
try
{
    using (Signature signature = new Signature("sample.xlsx"))
    {
        DigitalSignOptions options = new DigitalSignOptions()
        {
            CertificateFilePath = Constants.CertificatePfx,
            ImageFilePath = Constants.ImageHandwrite,
            // skip password specification
            //Password = "123456780"
        };
        // sign document to file
        signature.Sign("signed.xlsx", options);
    }
}
catch (GroupDocsSignatureException ex)
{
    Console.WriteLine("GroupDocs Signature Exception: " + ex.Message);
}
catch (Exception ex)
{
    Console.WriteLine("System Exception: " + ex.Message);
}
```

### Digital certificate errors

Starting with GroupDocs.Signature for .NET 26.9, `Sign` also throws [GroupDocsSignatureException](https://reference.groupdocs.com/signature/net/groupdocs.signature/groupdocssignatureexception) when the signing certificate has expired or is not valid yet, and nothing is signed or saved. See "Certificates outside their validity period" in [Pdf Digitally signing]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/sign-document-with-digital-signature-advanced.md" >}}) for the message and for the `AllowExpired` and `AllowNotYetValid` properties that allow such a certificate.

`Sign` also throws when the time-stamp authority set in `PdfDigitalSignature.TimeStamp` cannot be reached or rejects the request. See [Sign PDF document with a time stamp]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/sign-pdf-document-with-timestamp.md" >}}).

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
