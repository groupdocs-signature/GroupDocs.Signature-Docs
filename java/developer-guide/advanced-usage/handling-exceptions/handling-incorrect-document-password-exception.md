---
id: handling-incorrect-document-password-exception
url: signature/java/handling-incorrect-document-password-exception
title: Handling incorrect document password exception
weight: 1
description: "This article shows how to handle incorrect document password exception with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Handling incorrect document password exception with Java    
        description: Handle wrong password exception during document processing with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to coupe with incorrect password exception using Java 
        description: Learn all about ways of handling incorrect document password exceptions using Java
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Surround code with specific try-catch statement. 
          text: Use IncorrectPasswordException type in try-catch statement to handle with incorrect password exception.
        - name: Provide code with Signature try-catch statement. 
          text: For other Signature exceptions use GroupDocsSignatureException.
        - name: Implement code with common try-catch statement. 
          text: For all other possible exceptions use Exception.
---
[Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class supports handling incorrect password passed to open protected documents over class [IncorrectPasswordException](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.exception/IncorrectPasswordException).

Here are the steps to handle incorrect password exception when working with protected documents with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path or stream as a constructor parameter.
    
*   Cover the code that works with [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) object methods ([sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)), [verify](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#verify(com.groupdocs.signature.options.verify.VerifyOptions)), [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)), [update](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#update(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)), [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature))) with try - catch block including catching [IncorrectPasswordException](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.exception/IncorrectPasswordException) exception. 

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
