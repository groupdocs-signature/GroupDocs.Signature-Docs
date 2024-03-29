---
id: get-supported-file-formats
url: signature/java/get-supported-file-formats
title: Get supported file formats
weight: 1
description: "This article explains how to obtain supported file formats list for PDF, Words, Spreadsheet or Presentation document types when working with GroupDocs.Signature within your .NET applications."
keywords: GroupDocs.Signature supported files, GroupDocs.Signature supported documents, GroupDocs.Signature PDF files, GroupDocs.Signature Words files, GroupDocs.Signature Presentation files, GroupDocs.Signature Spreadsheet files
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Get list of supported file types with Java    
        description: Getting list of document types which can be processed using Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to obtain file types for signing with Java 
        description: Collecting list of various document types which are suitable for signing in Java
        steps:
        - name: Get supported file types.
          text: Invoke method GetSupportedFileTypes. 
        - name: Process file types.
          text: Process all selected file types in demanded way. 
---
With [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) you can get the [list of file formats]({{< ref "signature/java/getting-started/supported-document-formats.md" >}}) that allow adding electronic signatures by following the below steps:

*   Call static function [getSupportedFileTypes](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/FileType#getSupportedFileTypes()) of [FileType](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/FileType) class;
*   Enumerate through the collection of [FileType](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/FileType) objects.

The following code sample demonstrates how to get supported file formats list.

```java
java.util.List<FileType> supportedFileTypes = FileType.getSupportedFileTypes();
for(FileType fileType : supportedFileTypes){
    System.out.print(fileType.getExtension());
}
```

## More resources
### Advanced Usage Topics
To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/java/developer-guide/advanced-usage/_index.md" >}}).

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
