---
id: verify-text-signatures
url: signature/java/verify-text-signatures
title: Verify Text signatures
weight: 3
description: " This article explains how to provide advanced verification of Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
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


