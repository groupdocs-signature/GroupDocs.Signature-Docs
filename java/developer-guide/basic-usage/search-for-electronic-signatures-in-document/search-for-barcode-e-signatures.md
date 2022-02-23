---
id: search-for-barcode-e-signatures
url: signature/java/search-for-barcode-e-signatures
title: Search for Barcode e-signatures
weight: 1
description: "This article explains how to search for Barcode in the document with few lines of code over GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides an easy and straightforward way to find all Barcode signatures that are present in a document.  
For the most simpler use case - just find all Barcode signatures within document its only needed to instantiate [BarcodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/BarcodeSearchOptions) class and pass it to [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method.

Here are the exact steps to search for Barcode signatures within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.
    
*   Instantiate the [BarcodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/BarcodeSearchOptions) object according to your requirements and specify search options  
    
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [BarcodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/BarcodeSearchOptions) to it.
    

This example shows how to search for Barcode signature in the document.

```java
Signature signature = new Signature("sample.pdf");
BarcodeSearchOptions options = new BarcodeSearchOptions();
// search for signatures in document
List<BarcodeSignature> signatures = signature.search(BarcodeSignature.class, options);
System.out.print("\nSource document contains following signatures.");
for (BarcodeSignature barcodeSignature : signatures)
{
    System.out.print("Barcode signature found at page "+barcodeSignature.getPageNumber()+" with type "+barcodeSignature.getEncodeType()+" and text "+ barcodeSignature.getText());
}
```


