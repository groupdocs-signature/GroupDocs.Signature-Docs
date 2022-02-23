---
id: search-for-qr-code-e-signatures
url: signature/java/search-for-qr-code-e-signatures
title: Search for QR-Code e-signatures
weight: 6
description: "This article explains how to search for QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
  

When you search for electronic signatures of QR-Code type inside document with [GroupDocs.Signature](https://products.groupdocs.com/signature/java) it's only needed to [QrCodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) object to Search method.   
Here are the quick guide of how to search for QR-code signatures:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;
    
*   Instantiate the [QrCodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) object according to your requirements and specify search options;  
    
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [QrCodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) to it.
    

The code snippet below demonstrates search for QR-code signature in the document.

```java
Signature signature = new Signature("sample.pdf");
QrCodeSearchOptions options = new QrCodeSearchOptions();
options.setAllPages(true); // this value is set by default

// search for signatures in document
List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, options);
System.out.print("\nSource document contains following signatures.");
for (QrCodeSignature qrCodeSignature : signatures)
{
    System.out.print("QRCode signature found at page "+qrCodeSignature.getPageNumber() +" with type "+qrCodeSignature.getEncodeType() +" and text "+ qrCodeSignature.getText());
}
```


