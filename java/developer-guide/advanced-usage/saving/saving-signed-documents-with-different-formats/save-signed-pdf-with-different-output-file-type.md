---
id: save-signed-pdf-with-different-output-file-type
url: signature/java/save-signed-pdf-with-different-output-file-type
title: Save signed Pdf with different output file type
linkTitle: PDF → format
weight: 2
description: "This article explains how to save signed PDF document with various file formats by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Save PDF document in different file format using Java    
        description: This article demonstrates how to save signed PDF file in differnt output format using Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to save PDF with different output format file using Java 
        description: This topic explains how to save PDF documents with specific file format using Java
        steps:
        - name: Load PDF document for signing from the local file or stream.
          text: Create Signature class instance by passing either local or network file path or stream. 
        - name: Provide with the signature options the specific PdfSaveOptions in. 
          text: Set the instance of PdfSaveOptions with FileFormat and Overwrite properties to setup the saving policy.
        - name: Run signing process and retrieve output PDF in desired format 
          text: Call the Sign method with passing in the signature options and the PDF save options.
        - name: Obtain signed PDF document in required format
          text: Get the output document in requested format.
---
[Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class supports saving of Pdf signed documents to different formats. Each of document type has list of compatible saving type. These values are listed in enum [PdfSaveFileFormat](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/PdfSaveFileFormat).

Here are the steps to save signed Pdf document to different output type with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java):
*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature)  class and pass source document path or stream as a constructor parameter.    
*   Instantiate required signature options.    
*   Instantiate the [PdfSaveOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/PdfSaveOptions) object according to your requirements and specify [setFileFormat](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/PdfSaveOptions#setFileFormat(int)) as one of predefined values from [PdfSaveFileFormat](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/PdfSaveFileFormat).      
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass signatureoptions and [PdfSaveOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.saveoptions/PdfSaveOptions) object to it.
    

```java
Signature signature = new Signature("sample.pdf");
// create QRCode option with predefined QRCode text
QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith");
signOptions.setEncodeType(QrCodeTypes.QR);
signOptions.setLeft(100);
signOptions.setTop(100);
 
PdfSaveOptions saveOptions = new PdfSaveOptions();
saveOptions.setFileFormat(PdfSaveFileFormat.DocX);
saveOptions.setOverwriteExistingFiles(true);
// sign document to file
signature.sign("SignedPdf.docx", signOptions, saveOptions);
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
