---
id: load-document-from-stream
url: signature/java/load-document-from-stream
title: Load document from Stream
weight: 5
description: "This section explains how to load document from stream with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Signing document loaded from stream using Java    
        description: Handling documents stored in memory stream with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: Process document from memory stream with Java 
        description: Learn how to sign documents stored in memory stream with Java
        steps:
        - name: Load source document
          text: Create file stream and provide Signature instance with it as a constructor parameter. 
        - name: Provide signing options. 
          text: Set specific properties of desired SignOptions instance.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
---
There might be the case when your document is not physically located on the disk. Instead, you have the document in the form of a stream. In this case, to avoid the overhead of saving stream as a file on disk, [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) enables you to work with document from streams directly. Please be aware that [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) object does not dispose passed stream.

The following are the steps to be followed:

*   Obtain document stream; 
*   Pass opened stream to [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class constructor.

Following code snippet serves this purpose.

```java
InputStream stream = new FileInputStream("sample.pdf");
Signature signature = new Signature(stream);
QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");
 
options.setEncodeType(QrCodeTypes.QR);
options.setLeft(100);
options.setTop(100);           
 
// sign document to file
signature.sign("SampleSigned.pdf", options);
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
