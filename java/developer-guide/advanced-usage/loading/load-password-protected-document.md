---
id: load-password-protected-document
url: signature/java/load-password-protected-document
title: Load password-protected document
weight: 2
description: "This article explains how to load password protected document with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Signing password protected document using Java    
        description: Processing documents which are encrypted with password with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to handle with password protected document via Java 
        description: Get information about ways of handling password protected documents with Java
        steps:
        - name: Set up document password
          text: Instantiate LoadOptions object, providing password data. 
        - name: Pass file to Signature. 
          text: Instantiate Signature object by passing file and LoadOptions as constructor parameters.
        - name: Provide signing options. 
          text: Set specific properties of desired SignOptions instance.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) supports processing documents that are protected with a password.

The following are the steps to work with password protected documents.

*   Instantiate the [LoadOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.loadoptions/LoadOptions) object;
*   Set password in [LoadOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.loadoptions/LoadOptions) the [setPassword](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.loadoptions/LoadOptions#setPassword(java.lang.String))property;
*   Create [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) object and call any method.

The following code sample shows how to process password protected documents.

```java
LoadOptions loadOptions = new LoadOptions() ;  
loadOptions.setPassword("1234567890");       
 
try {
    Signature signature = new Signature("sampleProtected.pdf");
    QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");
    options.setEncodeType(QrCodeTypes.QR);
    options.setLeft(100);
    options.setTop(100);   
 
    // sign document to file
    signature.sign("signedProtected.pdf", options);
}catch(Exception e){
    throw new GroupDocsSignatureException(e.getMessage());
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
