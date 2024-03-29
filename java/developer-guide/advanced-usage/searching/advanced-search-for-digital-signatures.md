---
id: advanced-search-for-digital-signatures
url: signature/java/advanced-search-for-digital-signatures
title: Advanced search for Digital signatures
linkTitle: 🌐 Digital
weight: 2
description: " This article explains how to make advanced search for digital electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for digital signatures in documents in Java    
        description: Advanced search for digital signatures in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search digital signatures in advanced way using Java 
        description: Get additional information of advanced searching digital signatures in documents with Java
        steps:
        - name: Upload document which has one of supported types.
          text: Instantiate Signature object passing either file path or file stream as a constructor parameter.
        - name: Create search options 
          text: Instantiate DigitalSearchOptions object providing all demanded data like Comments or IssuerName.
        - name: Get list of items 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [DigitalSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) class to specify different options to search for Digital Signatures.

Here are the steps to search for digital signatures within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [DigitalSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) object according to your requirements and specify search options  
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [DigitalSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/DigitalSearchOptions) to it.
    

This example shows how to make advanced search for Digital signature in the document.

```java
Signature signature = new Signature("signed.pdf");
DigitalSearchOptions options = new DigitalSearchOptions();
// specify special search criteria
options.setComments("Test comment");
// certificate issues criteria
options.setIssuerName("John");
// digital certificate subject
options.setSubjectName("Test");
// specify date range period of signature
options.setSignDateTimeFrom(DateUtils.addMonths(new Date(), -1));
options.setSignDateTimeTo(new Date());
 
// search for signatures in document
List<DigitalSignature> signatures = signature.search(DigitalSignature.class, options);
System.out.print("\nSource document contains following signatures.");
for (DigitalSignature digitalSignature : signatures)
{
    System.out.print("Digital signature found from "+digitalSignature.getSignTime()+" with validation flag "+digitalSignature.isValid()+". Certificate SN "+ digitalSignature.getCertificate().getType());
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
