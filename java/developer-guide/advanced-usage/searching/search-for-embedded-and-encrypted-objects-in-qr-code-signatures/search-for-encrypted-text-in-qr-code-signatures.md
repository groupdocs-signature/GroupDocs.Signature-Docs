---
id: search-for-encrypted-text-in-qr-code-signatures
url: signature/java/search-for-encrypted-text-in-qr-code-signatures
title: Search for encrypted text in QR-code signatures
weight: 4
description: " This article explains how to search for encrypted text in QR-code electronic signatures in the document metadata. This topic contains example of standard encryption usage and searching for encrypted text in the QR-code electronic signature with further decryption by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Search for encrypted text in QR Code signatures in documents in Java    
        description: Advanced search for encrypted text in QR Code electronic signatures in various documents with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: Getting list of encrypted text in QR Code  signatures using Java 
        description: Learn how to get information about encrypted text in QR Code electronic signatures in documents with Java
        steps:
        - name: Provide document of supported file types.
          text: Instantiate Signature with file as a constructor parameter. You can pass either file path or file stream. 
        - name: Create search options 
          text: Instantiate QrCodeSearchOptions providing encryption instance such as SymmetricEncryption.
        - name: Get list of items 
          text: Call method Search with search options.
        - name: Process list of found items
          text: Process in desired way list of found items.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides ability to search over secure QR-code signature ([QrCodeSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/QrCodeSignature)) with standard or custom encryption. Standard encryption is implemented over class [SymmetricEncryption](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.encryption/SymmetricEncryption) class. Creation of this object expects 3 arguments like encryption algorithm enumeration [SymmetricAlgorithmType](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.encryption/SymmetricAlgorithmType) with one of following values (DES, TripleDES, RC2, Rijndael), string value key and string value salt.

Here are the steps to search for secure QR-code text with standard encryption with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path or stream as a constructor parameter.    
*   Compose object of [SymmetricEncryption](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.encryption/SymmetricEncryption) class with same parameters as secured QR-code was signed with.      
*   Create objects of [QrCodeSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) class and setup property [setDataEncryption](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions#setDataEncryption(com.groupdocs.signature.domain.extensions.encryption.IDataEncryption)) with object of [SymmetricEncryption](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.encryption/SymmetricEncryption)
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [QrCodeSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) to it.
    

This example shows how to search for secure QR-code signature text.

```java
Signature signature = new Signature("QRCodeEncryptedText.pdf");
// setup key and passphrase
String key = "1234567890";
String salt = "1234567890";
// create data encryption
IDataEncryption encryption = new SymmetricEncryption(SymmetricAlgorithmType.Rijndael, key, salt);
 
QrCodeSearchOptions options = new QrCodeSearchOptions();
// specify special pages to search on
options.setAllPages(true);
options.setPageNumber(1);
PagesSetup pagesSetup = new PagesSetup();
pagesSetup.setFirstPage(false);
pagesSetup.setLastPage(true);
pagesSetup.setOddPages(false);
pagesSetup.setEvenPages(true);
options.setPagesSetup(pagesSetup);
// specify types of QR code to verify
options.setEncodeType(QrCodeTypes.QR);
options.setDataEncryption(encryption);
 
 
// search for signatures in document
List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class,options);
System.out.print("\nSource document contains following signatures:");
for (QrCodeSignature qrCodeSignature : signatures)
{
    System.out.print("QRCode signature found at page "+qrCodeSignature.getPageNumber()+" with type "+qrCodeSignature.getEncodeType().getTypeName()+" and text "+ qrCodeSignature.getText());
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
