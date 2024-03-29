---
id: sign-documents-with-qr-code-embedded-object
url: signature/java/sign-documents-with-qr-code-embedded-object
title: Sign documents with QR-code embedded object
weight: 4
description: "This article explains how to create encrypted QR-code electronic signature with embedded custom object"
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides ability to embed into QR-code signature custom objects. This feature is implemented over object serialization to string and further encryption. By default library uses json format serialization and symmetric encryption, the class [SymmetricEncryption](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.encryption/SymmetricEncryption) class. Creation of this encryption expects 3 arguments like encryption algorithm enumeration [SymmetricAlgorithmType](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.encryption/SymmetricAlgorithmType)with one of following values ([DES, TripleDES, RC2, Rijndael](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.encryption/SymmetricAlgorithmType)), string value key and string value salt.

Here are the steps to embed into QR-code text with standard encryption with GroupDocs.Signature:   

*   Implement if needed custom data serialization class that implement [IDataSerializer](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.serialization/IDataSerializer) interface. By default GroupDocs.Signature uses embedded json format serialization but allows user to customize it.
    
*   Implement if needed custom data encryption class that implements [IDataEncryption](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.encryption/IDataEncryption) interface. By default GroupDocs.Signature has several encryption implementation you can use but allows user to customize it.
*   Implement class with properties and specify if needed class attributes (like custom serialization attribute, custom encryption attribute), specify attributes for properties like [FormatAttribute](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.serialization/FormatAttribute)  to specify serialization name and display format, same as [SkipSerializationAttribute](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions.serialization/SkipSerializationAttribute) to mark property of class as not serialize   
    
*   Create new instance of  [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Create one or several objects of [QrCodeSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/QrCodeSignOptions) object with [setData](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/QrCodeSignOptions#setData(java.lang.Object)) value  
*   Instantiate the  [QrCodeSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/QrCodeSignOptions)  object according to your requirements and custom object to [setData](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/QrCodeSignOptions#setData(java.lang.Object)) property.
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of  [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature)  class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/QrCodeSignOptions) to it.
    

## Definition of class

This example shows how to define custom class with serialization and encryption properties and setup Format attributes for properties.

```java
public class DocumentSignatureData
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

## Implementation of embedding custom object into QR-code signature

This example shows how to embed custom object into QR-code signature.

```java
Signature signature = new Signature("sample.pdf");
// setup key and passphrase
String key = "1234567890";
String salt = "1234567890";
// create data encryption
IDataEncryption encryption = new SymmetricEncryption(SymmetricAlgorithmType.Rijndael, key, salt);
 
// create custom object
// create custom object
DocumentSignatureData documentSignature = new DocumentSignatureData();
documentSignature.setID(java.util.UUID.randomUUID().toString());
documentSignature.setAuthor(System.getenv("USERNAME"));
documentSignature.setSigned(new java.util.Date());
documentSignature.setDataFactor(new java.math.BigDecimal("11.22"));
 
// setup QR-Code options
QrCodeSignOptions options = new QrCodeSignOptions();
// set custom object to serialize to QR Code
options.setData(documentSignature);
// QR-code type
options.setEncodeType(QrCodeTypes.QR);
// specify serialization encryption
options.setDataEncryption(encryption);
// locate and aligh signature
options.setHeight(100);
options.setWidth(100);
options.setVerticalAlignment(VerticalAlignment.Bottom);
options.setHorizontalAlignment(HorizontalAlignment.Right);
Padding padding = new Padding() ;
padding.setRight(10);
padding.setBottom(10);
options.setMargin(padding);
 
// sign document to file
SignResult signResult = signature.sign("QrCodeEncryptedObject.pdf", options);
// analyzing result
System.out.print("List of newly created signatures:");
int number = 1;
for(BaseSignature temp : signResult.getSucceeded())
{
    System.out.print("Signature #"+ number++ +": Type: "+temp.getSignatureType()+" Id:"+temp.getSignatureId()+
            ",Location: "+temp.getLeft()+"x"+temp.getTop()+". Size: "+temp.getWidth()+"x"+temp.getHeight());
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
