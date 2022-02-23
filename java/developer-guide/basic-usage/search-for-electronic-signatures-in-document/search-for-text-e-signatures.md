---
id: search-for-text-e-signatures
url: signature/java/search-for-text-e-signatures
title: Search for Text e-signatures
weight: 5
description: "This topic explains how to search for text electronic signatures within the document pages by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides [TextSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/TextSearchOptions) class to specify different options to search for Text electronic signatures within document.

Here are the steps to search for Text e-signatures using GroupDocs.Signature API:
*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;    
*   Instantiate the [TextSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/TextSearchOptions) object according to your requirements and specify additional search options (if needed);      
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature)  class instance and pass [TextSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/TextSearchOptions) to it.
    

This example shows how to search for Text e-signature in the document.

```java
Signature signature = new Signature(sample.pdf);
 
// setup search options
TextSearchOptions options = new TextSearchOptions();
// specify as true to search all pages of a document
options.setAllPages(true);
// search only page with specified number
options.setPageNumber(1);
// specify text math type    
options.setMatchType(TextMatchType.Contains);
// specify text to search
options.setText("John Smith");
 
// search for text signatures in document
List<TextSignature> signatures = signature.search(TextSignature.class,options);
// output signatures
 
for (TextSignature textSignature : signatures)
 {
 
     if (textSignature != null)
     {
         System.out.print("Found Text signature at page "+sign.getPageNumber()+" with type ["+sign.getSignatureImplementation()+"] and text '"+sign.getText()+"'.");
         System.out.print("Location at "+sign.getLeft()+"-"+sign.getTop()+". Size is "+sign.getWidth()+"x"+sign.getHeight()+".");
     }
 }
```


