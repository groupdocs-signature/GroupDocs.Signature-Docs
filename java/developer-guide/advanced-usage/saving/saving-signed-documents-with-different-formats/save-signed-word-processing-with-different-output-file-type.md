---
id: save-signed-word-processing-with-different-output-file-type
url: signature/java/save-signed-word-processing-with-different-output-file-type
title: Save signed Word Processing with different output file type
linkTitle: Words → format
weight: 5
description: "This article explains how to save signed Word Processing documents with various file formats by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Save signed Words in different format using Java    
        description: This article explains how to save signed Words document in differnt output format using Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to save signed Words with different output format file using Java 
        description: This topic explains how to save Words documents with specific file format using Java
        steps:
        - name: Load Words document for signing from the local file or stream.
          text: Create Signature class instance by passing either local or network file path or stream. 
        - name: Provide with the signature options the specific WordProcessingSaveOptions in. 
          text: Set the instance of WordProcessingSaveOptions with FileFormat and Overwrite properties to setup the saving policy.
        - name: Run signing process and retrieve output Words in desired format 
          text: Call the Sign method with passing in the signature options and the Words save options.
        - name: Obtain signed Words document in required format
          text: Get the output document in requested format.
---
[Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class supports saving of Word Processing signed documents with different formats. Each of document type has list of compatible saving type. These values are listed in enum [WordProcessingSaveFileFormat](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/WordProcessingSaveFileFormat).

Here are the steps to save signed Word Processing document to different output type with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java):

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature)  class and pass source document path or stream as a constructor parameter.    
*   Instantiate required signature options.    
*   Instantiate the [WordProcessingSaveOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/WordProcessingSaveOptions) object according to your requirements and specify [setFileFormat](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/WordProcessingSaveOptions#setFileFormat(int)) as one of predefined values from [WordProcessingSaveFileFormat](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/WordProcessingSaveFileFormat).     
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature)  class instance and pass signatureoptions and [WordProcessingSaveOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/WordProcessingSaveOptions) object to it.
    

Following example demonstrates how to save signed Word processing document with different output type

```java
Signature signature = new Signature("sample.docx");
// create QRCode option with predefined QRCode text
QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith");
signOptions.setEncodeType(QrCodeTypes.QR);
signOptions.setLeft(100);
signOptions.setTop(100);
 
WordProcessingSaveOptions saveOptions = new WordProcessingSaveOptions();
saveOptions.setFileFormat(WordProcessingSaveFileFormat.Odt);
saveOptions.setOverwriteExistingFiles(true);
// sign document to file
signature.sign("SignedDocx.odt", signOptions, saveOptions);
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
