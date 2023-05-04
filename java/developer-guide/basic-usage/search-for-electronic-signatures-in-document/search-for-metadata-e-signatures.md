---
id: search-for-metadata-e-signatures
url: signature/java/search-for-metadata-e-signatures
title: Search for Metadata e-signatures
linkTitle: 🔍 Metadata
weight: 3
description: "This topic explains how to search for metadata signatures within the documents with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Search for metadata in documents in Java    
        description: Search metadata in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search any metadata in documents using Java 
        description: Get additional information of searching metadata in documents with Java
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of metadata 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found metadata.
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides a [MetadataSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/MetadataSearchOptions) class to search Metadata electronic signatures within document.  
Here are the steps to search for Metadata signatures using GroupDocs.Signature API:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;
    
*   Instantiate the [MetadataSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/MetadataSearchOptions) object according to your requirements and specify additional search options (if needed);  
    
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [MetadataSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/MetadataSearchOptions) to it.
    

This code snippet demonstrates how to search for Metadata e-signature in the document.

```java
Signature signature = new Signature("sample.pdf");
MetadataSearchOptions options = new MetadataSearchOptions();

// search for signatures in document
List<MetadataSignature> signatures = signature.search(MetadataSignature.class, options);
System.out.print("\nSource document contains following signatures.");
for (MetadataSignature metadataSignature : signatures)
{
    System.out.print("Metadata signature found. Name : "+metadataSignature.getName()+". Value: "+ metadataSignature.getValue());
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
