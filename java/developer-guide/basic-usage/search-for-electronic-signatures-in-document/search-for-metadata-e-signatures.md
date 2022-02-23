---
id: search-for-metadata-e-signatures
url: signature/java/search-for-metadata-e-signatures
title: Search for Metadata e-signatures
weight: 3
description: "This topic explains how to search for metadata signatures within the documents with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides a [MetadataSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/MetadataSearchOptions) class to search Metadata electronic signatures within document.  
Here are the steps to search for Metadata signatures using GroupDocs.Signature API:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;
    
*   Instantiate the [MetadataSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/MetadataSearchOptions) object according to your requirements and specify additional search options (if needed);  
    
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [MetadataSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/MetadataSearchOptions) to it.
    

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


