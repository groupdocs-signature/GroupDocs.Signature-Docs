---
id: search-for-image-e-signatures
url: signature/java/search-for-image-e-signatures
title: Search for Image e-signatures
weight: 7
description: "This article explains how to search for Image electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides [ImageSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/ImageSearchOptions) class to specify different options to search for Image e-signatures.

 Here are the steps to search for Image signatures within the document with GroupDocs.Signature API:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;    
*   Instantiate the [ImageSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/ImageSearchOptions) object according to your requirements and specify additional search options (if needed);  
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [ImageSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/ImageSearchOptions) to it.
    

The code snippet below demonstrates how to search for Image electronic signature in the document.

```java
Signature signature = new Signature(sample.pdf);
// setup search options
ImageSearchOptions searchOptions = new ImageSearchOptions();   
 
// search document
List<ImageSignature> signatures = signature.search(ImageSignature.class,searchOptions);
System.out.print("\nSource document ['" + fileName + "'] contains following image signature(s).");
// output signatures   
for (ImageSignature imageSignature : signatures)
{
 
   System.out.print("Found Image signature at page "+imageSignature.getPageNumber()+" and size "+imageSignature.getSize()+".");
   System.out.print("Location at "+imageSignature.getLeft()+"-"+imageSignature.getTop()+". Size is "+imageSignature.getWidth()+"x"+imageSignature.getHeight()+".");
}
```


