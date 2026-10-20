---
id: load-document-with-filetype
url: signature/java/load-document-with-filetype
title: Specify file type when loading a document
weight: 3
description: "This article explains how to specify file type when loading a document with GroupDocs.Signature for Java API."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Specify file type when loading a document using Java    
        description: Specify file type when loading a document with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to sign a document with QR code and specify file type via Java
        description: Learn how to sign a document with a QR code and specify file type while loading the document using Java.
        steps:
        - name: Set up file paths
          text: Define the path to the sample PDF document and the path of the signed output document.
        - name: Open the document as a stream
          text: Open the document file as a stream for reading using `new FileInputStream(filePath)`.
        - name: Specify the file type
          text: Instantiate the [LoadOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.loadoptions/loadoptions/) object and specify the file type (e.g., `FileType.PDF`).
        - name: Create Signature instance
          text: Instantiate the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) object by passing the file stream and load options as constructor parameters.
        - name: Define QR code signing options
          text: Instantiate the [QrCodeSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/qrcodesignoptions/) object and set properties like signer name, QR code type, and position.
        - name: Sign the document
          text: Call the `sign` method to sign the document and save it to the specified output path.
        - name: Verify the result
          text: Print a success message with the file path of the signed document using `System.out.println`.

---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) supports specifying the file type when loading a document. When the file type is not specified, GroupDocs.Signature detects it from the document content, which takes some time. Starting with GroupDocs.Signature for Java 26.10, you can specify the file type directly in [LoadOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.loadoptions/loadoptions/), and GroupDocs.Signature skips the detection and uses the specified type right away.

The following are the steps to specify the file type when loading a document.

*   Instantiate the [LoadOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.loadoptions/loadoptions/) object and set the file type, either with the `LoadOptions(FileType)` constructor or with the `setFileType` method;
*   Create an `InputStream` for the document file, for example `new FileInputStream(filePath)`;
*   Create [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) object by passing the document stream and load options to its constructor;
*   Call the `sign` method to sign the document and save the signed version to the output path.

The following code sample shows how to specify file type when loading a document.

```java
try (InputStream stream = new FileInputStream(filePath))
{
    // Specify the file type (PDF) while loading the document
    LoadOptions loadOptions = new LoadOptions(FileType.PDF);

    // Initialize the Signature instance with the file stream and load options
    Signature signature = new Signature(stream, loadOptions);
    try
    {
        QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");
        options.setEncodeType(QrCodeTypes.QR);
        options.setLeft(100);
        options.setTop(100);

        // sign document to file
        signature.sign(outputFilePath, options);
    }
    finally
    {
        signature.dispose();
    }
}
System.out.println("\nSource document signed successfully.\nFile saved at " + outputFilePath);
```

The same load options work with a file path: `new Signature(filePath, new LoadOptions(FileType.PDF))`. `FileType.Unknown`, the default, detects the file type from the document content.

## More resources
### GitHub Examples
You may easily run the code above and see the feature in action in our GitHub examples:
*   [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)    
*   [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)    
*   [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)    
*   [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)    
*   [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)     
*   [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)    

### Free Online Apps 
Along with the full-featured Java library, we provide simple but powerful free online apps.  
To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
