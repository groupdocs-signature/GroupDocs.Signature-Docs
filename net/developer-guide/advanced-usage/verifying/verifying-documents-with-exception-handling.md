---
id: verifying-documents-with-exception-handling
url: signature/net/verifying-documents-with-exception-handling
title: Verifying documents with exception handling
weight: 1
description: " This article explains how to handle specific exceptions when verifying document electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Exceptions handling while document verification using C#    
        description: This article explains how to handle exception for document verification process with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to handle exception while document verification process using C# 
        description: This topic explains how to handle specific exception while processing document verifcation in C#
        steps:
        - name: Load document for verification from the local file or stream.
          text: Create Signature class instance by passing either local or network file path or stream. 
        - name: Provide Text verification options. 
          text: Set demanded data of the TextVerifyOptions instance to specify text content pattern.
        - name: Run verification
          text: Call the Verify method with passing verification options and keep the verification process result.
        - name: Put the code above in the try-catch block with the specific GroupDocsSignatureException
          text: Put around the code above try-catch block with the common and specific GroupDocsSignatureException expection hanndlings
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides different error messages due to validation issues, missing required data, files etc. For handling these exceptions class [GroupDocsSignatureException](https://reference.groupdocs.com/signature/net/groupdocs.signature/groupdocssignatureexception) should be used.

Here are the steps to handle exceptions from GroupDocs.Signature while document verification:

* Compose try-catch block above [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) method with catching [GroupDocsSignatureException](https://reference.groupdocs.com/signature/net/groupdocs.signature/groupdocssignatureexception) type error.  

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
