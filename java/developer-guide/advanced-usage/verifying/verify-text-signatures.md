---
id: verify-text-signatures
url: signature/java/verify-text-signatures
title: Verifying Text signatures
weight: 3
description: " This article explains how to provide advanced verification of Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Verify text signature in documents using Java    
        description: This article explains how to scan the document for text signatures and provide its verification with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to scan document for text entities and verify the document for specific text signatures conditions using Java 
        description: This topic explains how to verify the document for Text signatures, provide Text elements verification and validation in Java
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
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [TextVerifyOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.verify/TextVerifyOptions) class to specify different options for verification of Text signatures.

Here are the steps to verify Text signature within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [TextVerifyOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.verify/TextVerifyOptions) object according to your requirements and specify verification options      
*   Call [verify](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#verify(com.groupdocs.signature.options.verify.VerifyOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [TextVerifyOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.verify/TextVerifyOptions) to it.       
*   Analyze [VerificationResult](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.domain/VerificationResult) result if needed.

This example shows how to verify Text signature in the document. See [VerificationResult](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.domain/VerificationResult)

```java
Signature signature = new Signature("signedSample.pdf");
// create QRCode option with predefined QRCode text
TextVerifyOptions options = new TextVerifyOptions();
 
// specify if all pages shoudl be verified
options.setAllPages(false);
PagesSetup pagesSetup = new PagesSetup();
pagesSetup.setFirstPage(false);
pagesSetup.setLastPage(true);
pagesSetup.setOddPages(false);
pagesSetup.setEvenPages(true);
options.setPagesSetup(pagesSetup);
// specify text pattern
options.setText("John");
// specify verification text pattern
options.setMatchType(TextMatchType.Contains);
// specify types of QR code to verify
options.setSignatureImplementation(TextSignatureImplementation.Stamp);
options.setFormTextFieldTitle("Sample");
options.setFormTextFieldType(FormTextFieldType.RichText);
 
// sign document to file
VerificationResult result = signature.verify(options);
if (result.isValid()) {
    System.out.print("\nDocument was verified successfully!");
} else {
    System.out.print("\nDocument failed verification process.");
}
```

## More resources

### GitHub Examples 

You may easily run the code above and see the feature in action in our GitHub examples:

*   [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)    
*   [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)    
*   [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)    
*   [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)    
*   [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)   
*   [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
    

### Free Online App 

Along with full-featured .NET library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
