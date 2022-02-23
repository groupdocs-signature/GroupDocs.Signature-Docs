---
id: advanced-search-for-digital-signatures
url: signature/java/advanced-search-for-digital-signatures
title: Advanced search for Digital signatures
weight: 2
description: " This article explains how to make advanced search for digital electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [DigitalSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) class to specify different options to search for Digital Signatures.

Here are the steps to search for digital signatures within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [DigitalSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) object according to your requirements and specify search options  
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [DigitalSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) to it.
    

This example shows how to make advanced search for Digital signature in the document.

```java
Signature signature = new Signature("signed.pdf");
DigitalSearchOptions options = new DigitalSearchOptions();
// specify special search criteria
options.setComments("Test comment");
// certificate issues criteria
options.setIssuerName("John");
// digital certificate subject
options.setSubjectName("Test");
// specify date range period of signature
options.setSignDateTimeFrom(DateUtils.addMonths(new Date(), -1));
options.setSignDateTimeTo(new Date());
 
// search for signatures in document
List<DigitalSignature> signatures = signature.search(DigitalSignature.class, options);
System.out.print("\nSource document contains following signatures.");
for (DigitalSignature digitalSignature : signatures)
{
    System.out.print("Digital signature found from "+digitalSignature.getSignTime()+" with validation flag "+digitalSignature.isValid()+". Certificate SN "+ digitalSignature.getCertificate().getType());
}
```


