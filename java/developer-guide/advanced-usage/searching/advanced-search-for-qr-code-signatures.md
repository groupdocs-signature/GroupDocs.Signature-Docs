---
id: advanced-search-for-qr-code-signatures
url: signature/java/advanced-search-for-qr-code-signatures
title: Advanced search for QR-code signatures
weight: 3
description: " This article explains how to provide advanced search for QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [QrCodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) class to specify different options to search for QR-code signatures.

Here are the steps to search for barcode signatures within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [QrCodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) object according to your requirements and specify search options 
*   Call[search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [QrCodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) to it.
    

This example shows how to make advanced search for QR-code signature in the document.

```java
Signature signature = new Signature("sample.pdf");
QrCodeSearchOptions options = new QrCodeSearchOptions();
options.setAllPages(true); // this value is set by default
// single page number
options.setPageNumber(1);
// setup extended search in pages setup
PagesSetup pagesSetup  = new PagesSetup() ;
pagesSetup.setFirstPage(true);
pagesSetup.setLastPage(true);
pagesSetup.setOddPages(false);
pagesSetup.setEvenPages(false);
options.setPagesSetup(pagesSetup);
 
// specify special barcode type to search
options.setEncodeType(QrCodeTypes.QR);
// specify text match type
options.setMatchType(TextMatchType.Exact);
// specify text pattern to search
options.setText("12345678");
 
// search for signatures in document
List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, options);
System.out.print("\nSource document contains following signatures.");
for (QrCodeSignature qrCodeSignature : signatures)
{
    System.out.print("QRCode signature found at page "+qrCodeSignature.getPageNumber() +" with type "+qrCodeSignature.getEncodeType() +" and text "+ qrCodeSignature.getText());
}
```


