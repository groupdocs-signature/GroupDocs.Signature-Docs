---
id: verify-text-signatures-in-the-document
url: signature/java/verify-text-signatures-in-the-document
title: Verify Text signatures in the document
weight: 4
description: "This topic explains how to verify Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [TextVerifyOptions](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.options.verify/TextVerifyOptions) class to specify different options for verification of Text signatures.

Here are the steps to verify Text signature within the document with GroupDocs.Signature:
*   Create new instance of [Signature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.
*   Instantiate the [TextVerifyOptions](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.options.verify/TextVerifyOptions) object according to your requirements and specify verification options
*   Call [verify](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#verify(com.groupdocs.signature.options.verify.VerifyOptions)) method of [Signature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) class instance and pass [TextVerifyOptions](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.options.verify/TextVerifyOptions) to it.

This example shows how to verify Text signature in the document.

```java
Signature signature = new Signature("sample.pdf");
TextVerifyOptions options = new TextVerifyOptions();
options.setAllPages(true); // this value is set by default
options.setSignatureImplementation(TextSignatureImplementation.Stamp);
options.setText("John");
options.setMatchType(TextMatchType.Contains);
 
// verify document signatures
VerificationResult result = signature.verify(options);
if (result.isValid())
{
    System.out.print("\nDocument was verified successfully!");
}
else
{
    System.out.print("\nDocument failed verification process.");
}
```


