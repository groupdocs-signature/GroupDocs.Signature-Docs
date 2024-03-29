---
id: esign-document-with-stamp-signature
url: signature/java/esign-document-with-stamp-signature
title: eSign document with Stamp signature
linkTitle: ✎ Stamp
weight: 8
description: "This article explains how to sign document electronically with generated Stamp signatures by GroupDocs.Signature API."
keywords: sign document electronically, Stamp signatures
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Documents signing with stamps in C#    
        description: Sign documents with generate stamps and C# language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to sign any documents with stamps using C# 
        description: Learn all about signing a document by using stamps and C#
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide new FormFieldSignature class instance and fill all demanded data.
        - name: Sign source file with just painted stamp and save result 
          text: Invoke Sign method with signing options and output file path or stream.
---
## What is a Stamp signature?

A **stamp** signature is a special type of electronic signature that have visual appearance of round seal and its visual parameters can be set programmatically.   
Every stamp signature can have multiple "stamp lines" with custom text and different line thickness, color, font weight and size. Here is an example of how stamp signature created with [**GroupDocs.Siganture**](https://products.groupdocs.com/signature/java) may look like: 

![](/signature/java/images/esign-document-with-stamp-signature.png)

[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides [StampSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/StampSignOptions) class to specify different options for Stamp signature:

*   Stamp type - Round or Square;
*   Height and width in pixels;
*   Alignment and position within the document page;
*   and many more.

Each Stamp option contains inner and outer lines. Inner lines represent vertical lines inside the stamp, when outer lines represent circles (or rectangles based on stamp type) around stamp with own text, border settings, background etc.

Here are the steps to add Stamp signature into document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [StampSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/StampSignOptions) object according to your requirements and specify appropriate options.    
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [StampSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/StampSignOptions) to it.
    

## How to eSign document with Stamp signature 

This example shows how to add Stamp signature to document.

```java
Signature signature = new Signature("sample.docx");

StampSignOptions options = new StampSignOptions();
// set stamp signature position
options.setLeft(100);
options.setTop(100);

// setup first external line of Stamp
StampLine outerLine = new StampLine();
outerLine.setText(" * European Union * European Union  * European Union  * European Union  * European Union  * ");
outerLine.getFont().setSize(12);
outerLine.setHeight(22);
outerLine.setTextBottomIntent(6);
outerLine.setTextColor(Color.WHITE);
outerLine.setBackgroundColor(Color.BLUE);
options.getOuterLines().add(outerLine);

//Inner square lines - horizontal lines inside the rings
StampLine innerLine = new StampLine();
innerLine.setText("John");
innerLine.setTextColor(Color.RED);
SignatureFont signFont = new SignatureFont();
signFont.setSize(20);
signFont.setBold(true);
innerLine.setFont(signFont);
innerLine.setHeight(40);
options.getInnerLines().add(innerLine);
// sign document to file
signature.sign("SampleSigned.docx", options);
```

## More resources

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/java/developer-guide/advanced-usage/_index.md" >}}).

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
