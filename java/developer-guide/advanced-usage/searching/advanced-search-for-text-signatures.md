---
id: advanced-search-for-text-signatures
url: signature/java/advanced-search-for-text-signatures
title: Advanced search for Text signatures
weight: 4
description: " This article explains how to make advanced search for Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [TextSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/TextSearchOptions) class to specify different options to search for Text Signatures.

Here are the steps to search for text signatures within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [TextSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/TextSearchOptions) object according to your requirements and specify search options 
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [TextSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/TextSearchOptions) to it.
    

This example shows how to make advanced search for Text signature in the document.

```java
Signature signature = new Signature("sample.pdf");
 
PagesSetup page = new  PagesSetup();
page.setFirstPage(true);
page.setLastPage(true);
page.setOddPages(false);
page.setEvenPages(false);
TextSearchOptions options = new TextSearchOptions();
options.setAllPages(false);
options.setPageNumber(1);
options.setMatchType(TextMatchType.Exact);
options.setText("John Smith");
 
// search for text signatures in document
List<TextSignature> signatures = signature.search(TextSignature.class,options);
System.out.print("\nSource document contains following text signature(s).");
// enumerate all signature for output
//foreach to while statements conversion
try
{
    for (TextSignature sign : signatures)
    {
 
        if (sign != null)
        {
            System.out.print("Found Text signature at page "+sign.getPageNumber()+" with type ["+sign.getSignatureImplementation()+"] and text '"+sign.getText()+"'.");
            System.out.print("Location at "+sign.getLeft()+"-"+sign.getTop()+". Size is "+sign.getWidth()+"x"+sign.getHeight()+".");
        }
    }
}
catch (Exception ex)
{
    System.out.print("System Exception: " + ex.getMessage());
}
```


