---
id: search-for-digital-e-signatures
url: signature/java/search-for-digital-e-signatures
title: Search for Digital e-signatures
linkTitle: 🔍 Digital
weight: 2
description: "This topic explains how to search for digital electronic signatures across the documents with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Search for digital signatures in documents in Java    
        description: Search digital signatures in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search any digital signatures in documents using Java 
        description: Get additional information of searching digital signatures in documents with Java
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of digital signatures 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found digital signatures.
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) offers an ability to find Digital signatures that are applied to document and returns its digital signature certificate.  
Please follow these steps to search for Digital signatures within the document:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.
    
*   Instantiate the [DigitalSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) object according to your requirements and specify search options  
    
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [DigitalSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) to it.
    

This example shows how to search for Digital signature in the document and analyze digital signature certificate.

```java
Signature signature = new Signature("spreadsheet.xlsx");
DigitalSearchOptions options = new DigitalSearchOptions();

// search for signatures in document
List<DigitalSignature> signatures = signature.search(DigitalSignature.class, options);
System.out.print("\nSource document contains following signatures.");
for (DigitalSignature digitalSignature : signatures)
{
    System.out.print("Digital signature found from "+digitalSignature.getSignTime()+" with validation flag "+digitalSignature.isValid()+". Certificate SN "+ digitalSignature.getCertificate().getType());
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
