---
id: esign-document-with-barcode-signature
url: signature/java/esign-document-with-barcode-signature
title: eSign document with Barcode signature
linkTitle: ✎ Barcode
weight: 1
description: "This article explains how to add Barcode signature on document page with various options like barcode type, barcode text, positioning, alignment and other visual settings with GroupDocs.Signature"
keywords: barcode, barcode signature, GroupDocs.Signature barcode, GroupDocs.Signature barcode signature
productName: GroupDocs.Signature for Java
hideChildren: False
structuredData:
    showOrganization: True
    application:    
        name: Sign documents using Barcode and Java    
        description: Put generated Barcode on any document with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to add generated Barcode to various documents with Java 
        description: Find out ways of signing documents by Barcode using Java
        steps:
        - name: Load source file
          text: Creating Signature class instance demands file as a constructor parameter. It can be provided either as file path or as file stream. 
        - name: Provide barcode options 
          text: Provide all needed data while BarcodeSignOptions instantiating.
        - name: Sign source and obtain result 
          text: Invoke method Sign providing options and output file data. You can save signed file using file path or stream.
---
## What is a Barcode?

A **barcode** or **bar code** is a way of presenting data in a visual, machine-readable form. Generally speaking, barcode is an image of rectangular form that consists of parallel black lines and white spaces of different widths.  
Barcodes are used in various areas where quick identification is necessary - as part of the purchase process in retail stores, in warehouses to track inventory, and on invoices to assist in accounting, among many other uses.

![](/signature/java/images/esign-document-with-barcode-signature.gif)

Barcodes allow to store product related data like manufacturing and expiry dates, manufacturer name, country of the origin and product price. There are plenty of barcode types nowadays because different companies use different amount of number and bar combinations in their barcodes dependent on their needs. From document signature perspective Barcode may contain different characters (letters, digits or symbols) and have a various length and its size depending on the type and settings to keep signature information, title, subject or short encrypted data.  

## eSign document with Barcode signature

[GroupDocs.Signature](https://products.groupdocs.com/signature/java) for Java supports wide range or Barcode types that can be used to create electronic signature within the documents. Please refer to [BarcodeTypes](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.barcodes/BarcodeTypes) description to get the full list of supported barcodes.  
To specify different options for Barcode signature GroupDocs.Signature for Java provides [BarcodeSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/BarcodeSignOptions) class. The main fields are:

*   [getEncodeType](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/BarcodeSignOptions#getEncodeType()) - specifies Barcode type (AustralianPost, Codabar, EAN13, OPC, etc.);
*   [getText](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/TextSignOptions#getText()) - specifies Barcode text. 

Here are the steps to eSign document with Barcode signature using GroupDocs.Signature for .NET API:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [BarcodeSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/BarcodeSignOptions) object according to your requirements and specify Barcode type by setting [setEncodeType](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/BarcodeSignOptions#setEncodeType()) from predefined supported types. Set [setText](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/TextSignOptions#setText(java.lang.String)) property value.    
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [BarcodeSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/BarcodeSignOptions) to it.
    

This example shows how to sign PDF document with Barcode signature.

```java
Signature signature = new Signature("sample.pdf");
try 
{
    // setup options with text of signature
    BarcodeSignOptions signOptions = new BarcodeSignOptions("12345678");
    // setup Barcode encoding type
    signOptions.setEncodeType(BarcodeTypes.Code128);
    // set signature position
    signOptions.setLeft(100);
    signOptions.setTop(100);
    // sign document   
    signature.sign("SampleSigned.pdf", signOptions);    
}catch (Exception e){
    throw new GroupDocsSignatureException(e.getMessage());
}
```

## More resources

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/java/developer-guide/advanced-usage/_index.md" >}}).

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
