---
id: deleting-qr-code-signatures-advanced
url: signature/java/deleting-qr-code-signatures-advanced
title: Deleting QR-code signatures - advanced
weight: 4
description: "This article shows how to delete QR-code electronic signatures different ways with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Delete QR Code signatures from document via Java    
        description: Remove specific QR Codes in documents using Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to remove QR Codes in supported documents with Java 
        description: Learn about ways of wiping out selected QR Codes in document using Java
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Specify QR Codes to delete. 
          text: Get all QR Code signatures presented in a document by invoking method Search passing QrCodeSearchOptions. Select only suitable barcode signatures in case if it is needed.
        - name: Expel selected QR Code signatures. 
          text: Invoke Delete method and analyze DeleteResult instance.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [QrCodeSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/QrCodeSignature) class to manipulate QR-code signatures and delete them from the documents over [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method.  
Please be aware that [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature))  method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class.

Here are the steps to delete QR-code signature from the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;
    
*   Instantiate [QrCodeSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) object with desired properties;
    
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method to obtain list of [QrCodeSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/QrCodeSignature);  
    
*   Select from list [QrCodeSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/QrCodeSignature) object(s) that should be removed from the document;  
    
*   Call [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) object [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature))  method and pass one or several signatures to it.
    
*   Analyze [DeleteResult](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain/DeleteResult) result to check whether signatures were updated or not.

Here are the alternative steps to delete QR-code signature from the document with GroupDocs.Signature. This approach is based on saved signatures Id after [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) or [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) methods.

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;
    
*   Instantiate one or several [QrCodeSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/QrCodeSignature) objects with signature Id(s) passed to constructor;  
    
*   Call [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class object [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method and pass one or several signatures to it;
    
*   Analyze [DeleteResult](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain/DeleteResult) result to check whether signatures were updated or not. 

## Delete QR-code signature from the document after Search

This example shows how to delete QR-code signature that was found using [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method.

```java
// initialize Signature instance
Signature signature = new Signature("signed.docx");
 
QrCodeSearchOptions options = new QrCodeSearchOptions();
 
List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class,options);
List<BaseSignature> signaturesToDelete = new ArrayList<BaseSignature>();
// collect signatures to delete
for (QrCodeSignature temp : signatures)
{
    if (temp.getText().contains("John"))
    {
        signaturesToDelete.add(temp);
    }
}
// delete signatures
DeleteResult deleteResult = signature.delete("signed.docx",signaturesToDelete);
if (deleteResult.getSucceeded().size() == signaturesToDelete.size())
{
    System.out.print("All signatures were successfully deleted!");
}
else
{
    System.out.print("Successfully deleted signatures : " + deleteResult.getSucceeded().size());
    System.out.print("Not deleted signatures : " + deleteResult.getFailed().size());
}
System.out.print("List of deleted signatures:");
for(BaseSignature temp : deleteResult.getSucceeded())
{
    System.out.print("Signature# Id:"+temp.getSignatureId()+", Location: "+temp.getLeft()+"x"+temp.getTop()+". Size: "+temp.getWidth()+"x"+temp.getHeight());
}
```

## Delete QR-code signature from the document by known signature Identifier

This example shows how to delete QR-code signature in the document by known signature Id (that was obtained by  [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) or [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method previously).

```java
// initialize Signature instance
Signature signature = new Signature("signed.pdf");
 
// read from some data source signature Id value
String[] signatureIdList = new String[]
    {
            "1a5fbc08-4b96-43d9-b650-578b16fbb877",
            "b0123987-b0d4-4004-86ec-30ab5c41ac7e"
    };
// create list of QR-code Signature by known SignatureId
List<BaseSignature> signatures = new ArrayList<BaseSignature>();
for (String item : signatureIdList)
{
    signatures.add(new QrCodeSignature(item));
}
 
// delete required signatures
DeleteResult deleteResult = signature.delete("signed.pdf",signatures);
if (deleteResult.getSucceeded().size() == signatures.size())
{
    System.out.print("All signatures were successfully deleted!");
}
else
{
    System.out.print("Successfully deleted signatures : " + deleteResult.getSucceeded().size());
    System.out.print("Not deleted signatures : " + deleteResult.getFailed().size());
}
System.out.print("List of deleted signatures:");
for(BaseSignature temp : deleteResult.getSucceeded())
{
    System.out.print("Signature# Id:"+temp.getSignatureId()+", Location: "+temp.getLeft()+"x"+temp.getTop()+". Size: "+temp.getWidth()+"x"+temp.getHeight());
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
