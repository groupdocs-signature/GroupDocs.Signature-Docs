---
id: advanced-search-for-barcode-signatures
url: signature/java/advanced-search-for-barcode-signatures
title: Advanced search for Barcode signatures
weight: 1
description: " This article explains how to make advanced search for Barcode electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for barcode signatures in documents in Java    
        description: Advanced search for barcodes in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search barcodes in advanced way using Java 
        description: Get additional information of advanced searching barcodes in documents with Java
        steps:
        - name: Load file which has one of supported file types.
          text: Create object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create search options 
          text: Instantiate BarcodeSearchOptions object providing all demanded data like type, pages setup or return content.
        - name: Get list of items 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [BarcodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/BarcodeSearchOptions) class to specify different options to search for Barcode Signatures.

Here are the steps to search for barcode signatures within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [BarcodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/BarcodeSearchOptions) object according to your requirements and specify search options   
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [BarcodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/BarcodeSearchOptions) to it.
    

This example shows how to make advanced search for Barcode signature in the document.

```java
Signature signature = new Signature("sample.pdf");
BarcodeSearchOptions options = new BarcodeSearchOptions();
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
options.setEncodeType(BarcodeTypes.Code39Standard);
// specify text match type
options.setMatchType(TextMatchType.Contains);
// specify text pattern to search
options.setText("12345678");
 
// search for signatures in document
List<BarcodeSignature> signatures = signature.search(BarcodeSignature.class, options);
System.out.print("\nSource document contains following signatures.");
for (BarcodeSignature barcodeSignature : signatures) {
    System.out.print("Barcode signature found at page " + barcodeSignature.getPageNumber() + " with type " + barcodeSignature.getEncodeType() + " and text " + barcodeSignature.getText());
}
```

## More resources

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
