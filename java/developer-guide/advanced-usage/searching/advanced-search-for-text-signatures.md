---
id: advanced-search-for-text-signatures
url: signature/java/advanced-search-for-text-signatures
title: Advanced search for Text signatures
linkTitle: 🌐 Text
weight: 4
description: " This article explains how to make advanced search for Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for text signatures in documents in Java    
        description: Advanced search for text items in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: hava 
    showVideo: True
    howTo:
        name: How to search for text in advanced way using Java 
        description: Get additional information of advanced searching for text signatures in documents with Java
        steps:
        - name: Upload file of supported file types.
          text: Instantiate object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create search options 
          text: Instantiate TextSearchOptions object providing all demanded data like text, pages setup or match type.
        - name: Get list of text signatures 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [TextSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/TextSearchOptions) class to specify different options to search for Text Signatures.

Here are the steps to search for text signatures within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [TextSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/TextSearchOptions) object according to your requirements and specify search options 
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [TextSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/TextSearchOptions) to it.
    

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
