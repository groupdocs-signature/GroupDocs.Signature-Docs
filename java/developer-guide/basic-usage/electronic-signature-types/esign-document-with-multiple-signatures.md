---
id: esign-document-with-multiple-signatures
url: signature/java/esign-document-with-multiple-signatures
title: eSign document with multiple signatures
linkTitle: ✎ Multiple
weight: 9
description: "This article explains how to sign document with multiple signatures of various type by GroupDocs.Signature API"
keywords: multiple signatures, sign document, how to sign document with multiple signatures
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Documents signing with multiple signatures in Java    
        description: Sign documents with many signatures simultaneously and Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to sign any documents with various signatures simultaneously using Java 
        description: Learn all about signing a document by using multiple signatures and Java
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Instantiate and set up BarcodeSignOptions, QrCodeSignOptions and DigitalSignOptions objects and add them to List.
        - name: Sign source file with form fields and save result 
          text: Invoke Sign method with signing options and output file path or stream.
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) allows to sign document with several signatures simultaneously and even apply signatures of different types to the same document.   
Doing this is as simple as:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path or stream as a constructor parameter.    
*   Instantiate required all required sign options objects dependent on signature type:    
    *   [BarcodeSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/BarcodeSignOptions) - for Barcode signatures;
    *   [DigitalSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/DigitalSignOptions) - for Digital signatures;
    *   [FormFieldSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/FormFieldSignOptions) - for Form-field signatures;
    *   [ImageSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/ImageSignOptions) - for Image signatures;
    *   [MetadataSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions) - for Metadata signatures;
    *   [QrCodeSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/QrCodeSignOptions) - for QR-code signatures
    *   [StampSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/StampSignOptions) - for Stamp signatures;
    *   [TextSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/TextSignOptions) - for Text signatures.
*   Fill collection with sign options from previous step.  
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20java.util.List)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass collection of sign options to it.
    
This code snippet below demonstrates how to eSign PDF document with multiple signatures at the same time.

```java
Signature signature = new Signature("sample.pdf");
// setup options with text of signature
// define several signature options of different types and settings
TextSignOptions textOptions = new TextSignOptions("This is test message");
textOptions.setVerticalAlignment(VerticalAlignment.Top);
textOptions.setHorizontalAlignment(HorizontalAlignment.Left);

BarcodeSignOptions barcodeOptions = new BarcodeSignOptions("123456");
barcodeOptions.setEncodeType(BarcodeTypes.Code128);
barcodeOptions.setLeft(100);
barcodeOptions.setTop(100);

QrCodeSignOptions qrcodeOptions = new QrCodeSignOptions("JohnSmith");
qrcodeOptions.setEncodeType(QrCodeTypes.QR);
qrcodeOptions.setLeft(100);
qrcodeOptions.setTop(200);

DigitalSignOptions digitalOptions = new DigitalSignOptions("certificate.pfx");
digitalOptions.setImageFilePath("sample.jpg");
digitalOptions.setVerticalAlignment(VerticalAlignment.Center);
digitalOptions.setHorizontalAlignment(HorizontalAlignment.Center);
digitalOptions.setPassword("1234567890");

// define list of signature options
List<SignOptions> listOptions = new ArrayList<SignOptions>();

listOptions.add(textOptions);
listOptions.add(barcodeOptions);
listOptions.add(qrcodeOptions);
listOptions.add(digitalOptions);

// sign document to file
signature.sign("signed.pdf", listOptions);
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
