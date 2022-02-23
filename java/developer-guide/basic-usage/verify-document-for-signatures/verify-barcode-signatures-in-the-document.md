---
id: verify-barcode-signatures-in-the-document
url: signature/java/verify-barcode-signatures-in-the-document
title: Verify Barcode signatures in the document
weight: 1
description: "This topic explains how to verify document for Barcode electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides [BarcodeVerifyOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.verify/BarcodeVerifyOptions) class to specify different options for verification of Barcode signatures.

Here are the steps to verify Barcode signature within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.
    
*   Instantiate the [BarcodeVerifyOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.verify/BarcodeVerifyOptions) object according to your requirements and specify verification options  
    
*   Call [verify](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#verify(com.groupdocs.signature.options.verify.VerifyOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [BarcodeVerifyOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.verify/BarcodeVerifyOptions) to it.
    

  

  
This example shows how to verify Barcode signature in the document.

```java
Signature signature = new Signature("sample.pdf");
BarcodeVerifyOptions options = new BarcodeVerifyOptions();
options.setAllPages(true); // this value is set by default
options.setText("John");
options.setMatchType(TextMatchType.Contains);

// verify document signature
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


