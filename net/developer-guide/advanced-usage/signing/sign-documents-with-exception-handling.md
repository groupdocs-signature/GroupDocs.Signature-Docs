---
id: sign-documents-with-exception-handling
url: signature/net/sign-documents-with-exception-handling
title: Sign documents with exception handling
weight: 2
description: " This article explains how to use exceptions handling when adding electronic signatures to document with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides different error messages due to validation issues, missing required data, files etc. For exception class [GroupDocsSignatureException](https://apireference.groupdocs.com/net/signature/groupdocs.signature/groupdocssignatureexception) is being used.

Here are the steps to handle exceptions from GroupDocs.Signature:

* Compose try-catch block above [Sign](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/sign) method with catching [GroupDocsSignatureException](https://apireference.groupdocs.com/net/signature/groupdocs.signature/groupdocssignatureexception) type error.  

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


