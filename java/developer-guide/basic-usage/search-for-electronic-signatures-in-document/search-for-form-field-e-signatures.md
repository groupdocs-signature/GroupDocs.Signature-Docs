---
id: search-for-form-field-e-signatures
url: signature/java/search-for-form-field-e-signatures
title: Search for Form Field e-signatures
weight: 4
description: "This article explains how to search for Form Fields signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Search for form-fields signatures in documents in Java    
        description: Search form-fields in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search any form-fields in documents using Java 
        description: Get additional information of searching form-fields in documents with Java
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of form-fields 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found form-fields.
---
To search for Form Fields e-signatures inside document you should pass instance of [FormFieldSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/FormFieldSearchOptions) class to a search method of [GroupDocs.Signature](https://products.groupdocs.com/signature/java).  
Here are the guide for searching Form Field e-signatures :

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.
    
*   Instantiate the [FormFieldSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/FormFieldSearchOptions) object according to your requirements and specify additional search options (if needed);  
    
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [FormFieldSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/FormFieldSearchOptions) to it.
    

This example shows how to search for Form Field signatures in the document.

```java
Signature signature = new Signature("signed.pdf");
FormFieldSearchOptions options = new FormFieldSearchOptions();
 
// search for signatures in document
List<FormFieldSignature> signatures = signature.search(FormFieldSignature.class, options);
System.out.print("\nSource document contains following signatures.");
for (FormFieldSignature formFieldSignature : signatures)
{
    System.out.print("FormField signature found. Name : "+formFieldSignature.getName()+". Value: " +formFieldSignature.getValue());
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
