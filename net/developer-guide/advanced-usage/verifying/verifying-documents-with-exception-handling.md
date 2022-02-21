---
id: verifying-documents-with-exception-handling
url: signature/net/verifying-documents-with-exception-handling
title: Verifying documents with exception handling
weight: 1
description: " This article explains how to handle exceptions when verifying document electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides different error messages due to validation issues, missing required data, files etc. For handling these exceptions class [GroupDocsSignatureException](https://apireference.groupdocs.com/net/signature/groupdocs.signature/groupdocssignatureexception)should be used.

Here are the steps to handle exceptions from GroupDocs.Signature while document verification:

* Compose try-catch block above [Verify](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/verify) method with catching [GroupDocsSignatureException](https://apireference.groupdocs.com/net/signature/groupdocs.signature/groupdocssignatureexception) type error.  

This example shows how to handle GroupDocs.Signature exceptions.

```csharp
try
{
    using (Signature signature = new Signature("sample.pdf"))
    {
        DigitalVerifyOptions options = new DigitalVerifyOptions()
        {
            CertificateFilePath = "dummy.pfx",
            // skip password specification
            // Password = "1234567890"
        };
        // sign document to file
        VerificationResult result = signature.Verify(options);
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


