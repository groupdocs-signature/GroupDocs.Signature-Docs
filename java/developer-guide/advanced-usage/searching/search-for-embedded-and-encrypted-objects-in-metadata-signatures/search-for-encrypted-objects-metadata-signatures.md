---
id: search-for-encrypted-objects-metadata-signatures
url: signature/java/search-for-encrypted-objects-metadata-signatures
title: Search for encrypted objects Metadata signatures
weight: 3
description: " This article explains how to search for encrypted electronic signatures in the document metadata. This topic contains example of using standard encryption, serialization, class definition and search for embedded objects in the document metadata with GroupDocs.Signature."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: Java
    application:    
        name: Search for encrypted signatures in documents in C#    
        description: Searching for encrypted electronic signatures in various documents with C# language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: Java
    howTo:
        name: How to get list of encrypted electronic signatures using C# 
        description: Getting information about encrypted electronic signatures in documents with C#
        steps:
        - name: Load file which has one of supported file types.
          text: Create object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create search options 
          text: Instantiate MetadataSearchOptions object providing encryption object instance such as SymmetricEncryption.
        - name: Get list of items 
          text: Invoke method Search with instance of search options.
        - name: Process found items list
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides ability to search for embedded objects in Metadata signatures with standard or custom encryption. Standard encryption is implemented over class [SymmetricEncryption](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.encryption/SymmetricEncryption) class. Creation of this object expects 3 arguments like encryption algorithm enumeration [SymmetricAlgorithmType](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.encryption/SymmetricAlgorithmType) with one of following values (DES, TripleDES, RC2, Rijndael), string value key and string value salt.

Here are the steps to search for embedded Metadata signature with standard encryption with GroupDocs.Signature:

*   *   Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) class and pass source document path or stream as a constructor parameter.
    *   Compose object of [SymmetricEncryption](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.encryption/SymmetricEncryption) class with same parameters as secured QR-code was signed with.
    *   Create objects of [MetadataSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/MetadataSearchOptions) class and setup property  [setDataEncryption](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/MetadataSearchOptions#setDataEncryption(com.groupdocs.signature.domain.extensions.encryption.IDataEncryption)) with object of [SymmetricEncryption](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.encryption/SymmetricEncryption)
    *   Call [Search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/Signature#search(int...)) method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) class instance and pass [MetadataSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/MetadataSearchOptions) to it.
    *   Call method [getData](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures.metadata/MetadataSignature#getData(java.lang.Class)) of encrypted [MetadataSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures.metadata/MetadataSignature) object to retrieve object of type Type

## Definition of class

This example shows how to define custom class with serialization and encryption properties and setup Format attributes for properties.

```java
public static class DocumentSignatureData
{
    public String getID(){ return ID; }
    public void setID(String value){ ID = value; }
    @FormatAttribute(propertyName = "SignID")
    public String ID;
 
 
    public final String getAuthor(){ return Author; }
    public final void setAuthor(String value){ Author = value; }
    @FormatAttribute(propertyName = "SAuth")
    public String Author;
    //JAVA-added public wrapper for internalized property accessor
 
    public final java.util.Date getSigned() {  return Signed; }
    public final void setSigned(java.util.Date value) { Signed = value; }
    @FormatAttribute (propertyName = "SDate",propertyFormat = "yyyy-MM-dd")
    public java.util.Date Signed = new java.util.Date();
 
 
    public final java.math.BigDecimal getDataFactor() { return DataFactor; }
    public final void setDataFactor(java.math.BigDecimal value) { DataFactor = value; }
    @FormatAttribute (propertyName = "SDFact",propertyFormat = "N2")
    public java.math.BigDecimal DataFactor = new java.math.BigDecimal(0.01);
}
```

## Search for embedded object in Metadata signatures

This example shows how to search for embedded objects in Metadata signatures.

```java
Signature signature = new Signature("MetadataEncryptedObject.docx");
// setup key and passphrase
String key = "1234567890";
String salt = "1234567890";
// create data encryption
IDataEncryption encryption = new SymmetricEncryption(SymmetricAlgorithmType.Rijndael, key, salt);
 
MetadataSearchOptions options = new MetadataSearchOptions();
options.setDataEncryption(encryption);
 
// search for signatures in document
List<WordProcessingMetadataSignature> signatures = signature.search(WordProcessingMetadataSignature.class,options);
System.out.print("\nSource document contains following signatures.");
 
// get required metadata signatures
WordProcessingMetadataSignature wordSignature = null;
for (WordProcessingMetadataSignature mdSign : signatures) {
    if (mdSign.getName().equals("Signature")) {
        wordSignature = mdSign;
        break;
    }
}
if (wordSignature != null)
{
    DocumentSignatureData documentSignatureData = wordSignature.getData(DocumentSignatureData.class);
    if (documentSignatureData != null)
    {
        System.out.print("Signature has DocumentSignatureData object:\n ID = " + documentSignatureData.getID() + ", Author = " + documentSignatureData.getAuthor() + ", Signed = " + documentSignatureData.getSigned() + ", DataFactor " + documentSignatureData.getDataFactor());
    }
}
// get required metadata signatures
WordProcessingMetadataSignature mdAuthor = null;
for (WordProcessingMetadataSignature mdSign : signatures) {
    if (mdSign.getName().equals("Author")) {
        mdAuthor = mdSign;
        break;
    }
}
if (mdAuthor != null)
{
    System.out.print("Metadata signature found. Name : " + mdAuthor.getName() + ". Value: " + mdAuthor.getData(String.class));
}
// get required metadata signatures
WordProcessingMetadataSignature mdDocId = null;
for (WordProcessingMetadataSignature mdSign : signatures) {
    if (mdSign.getName().equals("DocumentId")) {
        mdDocId = mdSign;
        break;
    }
}
if (mdDocId != null)
{
    System.out.print("Metadata signature found. Name : " + mdDocId.getName() + ". Value: " + mdDocId.getData(String.class));
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
