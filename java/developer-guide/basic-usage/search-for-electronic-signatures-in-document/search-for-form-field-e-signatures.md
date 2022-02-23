---
id: search-for-form-field-e-signatures
url: signature/java/search-for-form-field-e-signatures
title: Search for Form Field e-signatures
weight: 4
description: "This article explains how to search for Form Fields signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
To search for Form Fields e-signatures inside document you should pass instance of [FormFieldSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/FormFieldSearchOptions) class to a search method of [GroupDocs.Signature](https://products.groupdocs.com/signature/java).  
Here are the guide for searching Form Field e-signatures :

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.
    
*   Instantiate the [FormFieldSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/FormFieldSearchOptions) object according to your requirements and specify additional search options (if needed);  
    
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [FormFieldSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/FormFieldSearchOptions) to it.
    

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


