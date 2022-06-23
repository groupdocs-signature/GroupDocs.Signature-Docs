---
id: advanced-search-for-metadata-signatures
url: signature/java/advanced-search-for-metadata-signatures
title: Advanced search for Metadata signatures
weight: 12
description: " This article explains how to search various data values types within electronic signatures in the document metadata by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
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
          text: Invoke method Search passing SignatureType.Metadata type.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides ability to search Metadata signatures and convert obtained values to various data types.

Here are the steps to search for Metadata signature and obtain required data type with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
    
*   Create objects of [MetadataSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions) class  
    
*   Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [MetadataSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/metadatasearchoptions)  to it.
    
*   Call proper conversion method to obtain corresponding Metadata value to required data type.

## Search for electronic Metadata signature values with various data type

This example shows how to search for Metadata signature values with various data types.

```csharp
using (Signature signature = new Signature("signed.pdf"))
{
    // search for signatures in document
    List<PdfMetadataSignature> signatures = signature.Search<PdfMetadataSignature>(SignatureType.Metadata);
    // try to get each Pdf signature with proper data type added in Basic usage example SignPdfWithMetadata             
    PdfMetadataSignature mdSignature;
    // See example SignPdfWithMetadata with added various data type values to signatures
    try
    {
        mdSignature = signatures.FirstOrDefault(p => p.Name == "Author");
        Console.WriteLine($"\t[{mdSignature.Name}] as String = {mdSignature.ToString()}");
        mdSignature = signatures.FirstOrDefault(p => p.Name == "CreatedOn");
        Console.WriteLine($"\t[{mdSignature.Name}] as String = {mdSignature.ToDateTime().ToShortDateString()}");
        mdSignature = signatures.FirstOrDefault(p => p.Name == "DocumentId");
        Console.WriteLine($"\t[{mdSignature.Name}] as Integer = {mdSignature.ToInteger()}");
        mdSignature = signatures.FirstOrDefault(p => p.Name == "SignatureId");
        Console.WriteLine($"\t[{mdSignature.Name}] as Double = {mdSignature.ToDouble()}");
        mdSignature = signatures.FirstOrDefault(p => p.Name == "Amount");
        Console.WriteLine($"\t[{mdSignature.Name}] as Decimal = {mdSignature.ToDecimal()}");
        mdSignature = signatures.FirstOrDefault(p => p.Name == "Total");
        Console.WriteLine($"\t[{mdSignature.Name}] as Float = {mdSignature.ToSingle()}");
    }
    catch (Exception ex)
    {
        Helper.WriteError($"Error obtaining signature: {ex.Message}");
    }
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