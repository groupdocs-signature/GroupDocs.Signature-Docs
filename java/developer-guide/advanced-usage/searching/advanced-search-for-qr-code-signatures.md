---
id: advanced-search-for-qr-code-signatures
url: signature/java/advanced-search-for-qr-code-signatures
title: Advanced search for QR-code signatures
linkTitle: 🌐 QR Code
weight: 3
description: " This article explains how to provide advanced search for QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for QR Code signatures in documents in Java    
        description: Advanced search for QR Codes in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search QR Codes in advanced way using Java 
        description: Get additional information of advanced searching QR Code signatures in documents with Java
        steps:
        - name: Load file which has one of supported file types.
          text: Create object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create search options 
          text: Instantiate QrCodeSearchOptions object providing all demanded data like type, pages setup or return content.
        - name: Get list of items 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [QrCodeSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) class to specify different options to search for QR-code signatures.

Here are the steps to search for barcode signatures within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [QrCodeSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) object according to your requirements and specify search options 
*   Call[search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [QrCodeSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) to it.
    

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
