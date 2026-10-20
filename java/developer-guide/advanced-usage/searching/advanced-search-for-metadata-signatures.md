---
id: advanced-search-for-metadata-signatures
url: signature/java/advanced-search-for-metadata-signatures
title: Advanced search for Metadata signatures
linkTitle: 🌐 Metadata
weight: 12
description: " This article explains how to search various data values types within electronic signatures in the document metadata by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for metadata entries in documents in Java    
        description: Advanced search for metadata in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search metadata in advanced way using Java 
        description: Learn the best way of advanced searching metadata records in documents with Java
        steps:
        - name: Pass file of supported file types.
          text: Call constructor of Signature class passing file as a parameter. You can use either file path or file stream. 
        - name: Get list of items 
          text: Invoke method search passing PdfMetadataSignature.class and SignatureType.Metadata.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides ability to search Metadata signatures and convert obtained values to various data types.

Here are the steps to search for Metadata signature and obtain required data type with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path or stream as a constructor parameter.
    
*   Create objects of [MetadataSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/metadatasearchoptions/) class  
    
*   Call `search` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [MetadataSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/metadatasearchoptions/)  to it.
    
*   Call proper conversion method to obtain corresponding Metadata value to required data type.

## Search for electronic Metadata signature values with various data type

This example shows how to search for Metadata signature values with various data types.

```java
Signature signature = new Signature("signed.pdf");
try
{
    // search for signatures in document
    List<PdfMetadataSignature> signatures = signature.search(PdfMetadataSignature.class, SignatureType.Metadata);
    // See example SignPdfWithMetadata with added various data type values to signatures
    try
    {
        for (PdfMetadataSignature mdSignature : signatures)
        {
            switch (mdSignature.getName())
            {
                case "Author":
                    System.out.println("\t[" + mdSignature.getName() + "] as String = " + mdSignature.toString());
                    break;
                case "CreatedOn":
                    System.out.println("\t[" + mdSignature.getName() + "] as Date = " + mdSignature.toDateTime());
                    break;
                case "DocumentId":
                    System.out.println("\t[" + mdSignature.getName() + "] as Integer = " + mdSignature.toInteger());
                    break;
                case "SignatureId":
                    System.out.println("\t[" + mdSignature.getName() + "] as Double = " + mdSignature.toDouble());
                    break;
                case "Amount":
                    System.out.println("\t[" + mdSignature.getName() + "] as Double = " + mdSignature.toDouble());
                    break;
                case "Total":
                    System.out.println("\t[" + mdSignature.getName() + "] as Float = " + mdSignature.toSingle());
                    break;
            }
        }
    }
    catch (Exception ex)
    {
        System.out.println("Error obtaining signature: " + ex.getMessage());
    }
}
finally
{
    signature.dispose();
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
Along with full-featured Java library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.