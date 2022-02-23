---
id: search-for-digital-e-signatures
url: signature/java/search-for-digital-e-signatures
title: Search for Digital e-signatures
weight: 2
description: "This topic explains how to search for digital electronic signatures across the documents with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) offers an ability to find Digital signatures that are applied to document and returns its digital signature certificate.  
Please follow these steps to search for Digital signatures within the document:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.
    
*   Instantiate the [DigitalSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) object according to your requirements and specify search options  
    
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [DigitalSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) to it.
    

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


