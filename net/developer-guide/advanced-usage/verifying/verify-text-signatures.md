---
id: verify-text-signatures
url: signature/net/verify-text-signatures
title: Verifying Text signatures in advance
weight: 3
description: " This article explains how to provide advanced verification of Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Verify text signature in documents using C#    
        description: This article explains how to scan the document for text signatures and provide its verification with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to scan document for text entities and verify the document for specific text signatures conditions using C# 
        description: This topic explains how to verify the document for Text signatures, provide Text elements verification and validation in C#
        steps:
        - name: Load document for verification from the local file or stream.
          text: Create Signature class instance by passing either local or network file path or stream. 
        - name: Provide Text verification options. 
          text: Set demanded data of the TextVerifyOptions instance to specify text content pattern.
        - name: Run verification
          text: Call the Verify method with passing verification options and keep the verification process result.
        - name: Analyse verification result
          text: Check verification result for its state and verification details.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textverifyoptions) class to specify different options for verification of Text signatures.

Here are the steps to verify Text signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [TextVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textverifyoptions) object according to your requirements and specify verification options
* Call [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [TextVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textverifyoptions) to it.
* Analyze [VerificationResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/verificationresult) result if needed.  

This example shows how to verify Text signature in the document. See [VerificationResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/verificationresult)

```csharp
using (Signature signature = new Signature("signedSample.pdf"))
{
    TextVerifyOptions options = new TextVerifyOptions()
    {
        // specify if all pages shoudl be verified
        AllPages = false,
        PagesSetup = new PagesSetup() { FirstPage = false, LastPage = true, OddPages = false, EvenPages = true },
        // specify text pattern
        Text = "John",
        // specify verification text pattern
        MatchType = TextMatchType.Contains,
        // specify types of QR code to verify
        SignatureImplementation = TextSignatureImplementation.Stamp,
        // specify if form fielsd should be verified
        FormTextFieldTitle = "Sample",
        FormTextFieldType = FormTextFieldType.RichText
    };
    // verify document signatures
    VerificationResult result = signature.Verify(options);
    if (result.IsValid)
    {
        Console.WriteLine("\nDocument was verified successfully!");
    }
    else
    {
        Console.WriteLine("\nDocument failed verification process.");
    }
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
