---
id: handling-incorrect-document-password-exception
url: signature/java/handling-incorrect-document-password-exception
title: Handling incorrect document password exception
weight: 1
description: "This article shows how to handle incorrect document password exception with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
toc: True
---
[Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class supports handling incorrect password passed to open protected documents over class [IncorrectPasswordException](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.exception/IncorrectPasswordException).

Here are the steps to handle incorrect password exception when working with protected documents with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path or stream as a constructor parameter.
    
*   Cover the code that works with [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) object methods ([sign](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)), [verify](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#verify(com.groupdocs.signature.options.verify.VerifyOptions)), [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)), [update](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#update(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)), [delete](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature))) with try - catch block including catching [IncorrectPasswordException](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.exception/IncorrectPasswordException) exception. 

## Handling incorrect password exception

Following example demonstrates how to handle incorrect password exception.

```java
// initialize LoadOptions with incorrect Password
LoadOptions loadOptions = new LoadOptions();
loadOptions.setPassword("1");
Signature signature = new Signature("ProtectedPwd.pdf", loadOptions);
 
try
{
    QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");
    options.setEncodeType(QrCodeTypes.QR);
    options.setLeft(100);
    options.setTop(100);
    // try to sign document to file, we expect for PasswordRequiredException
    signature.sign(outputFilePath, options);
    System.out.print("\nSource document signed successfully.\nFile saved at " + outputFilePath);
}
catch (IncorrectPasswordException ex)
{
    System.out.print("HandlingIncorrectPasswordException: " + ex.getMessage());
}
catch (GroupDocsSignatureException ex)
{
    System.out.print("Common GroupDocsSignatureException: " + ex.getMessage());
}
catch (java.lang.RuntimeException ex)
{
    System.out.print("Common Exception happens only at user code level: " + ex.getMessage());
}
```

