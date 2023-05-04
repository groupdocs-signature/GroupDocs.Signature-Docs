---
id: load-document-from-local-disk
url: signature/java/load-document-from-local-disk
title: Load document from local disk
linkTitle: → Local
weight: 4
description: "This section explains how to load document from local disk with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Signing document loaded from local disk using Java    
        description: Handling documents stored on local disk with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: Process document from local disk with Java 
        description: Learn how to sign documents stored on local disk with Java
        steps:
        - name: Load source document
          text: Create Signature instance with file path as a constructor parameter. 
        - name: Provide signing options. 
          text: Set specific properties of desired SignOptions instance.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
---
When document is located on the local disk [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) enables you to work with document over the file [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class constructor. [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) instance will open file for reading only when any method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) will be called.

Following code snippet shows how to load document from local disk.

```java
Signature signature = new Signature("sample.docx");
TextSignOptions options = new TextSignOptions("John Smith");
 
// sign document to file
signature.sign(outputFilePath, options);
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
