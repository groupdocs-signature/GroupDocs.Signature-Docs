---
id: verify-barcode-signatures-in-the-document
url: signature/java/verify-barcode-signatures-in-the-document
title: Verify Barcode signatures in the document
linkTitle: 🛡 Barcodes
weight: 1
description: "This topic explains how to verify document for Barcode electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Verify barcode signatures in signed documents via Java    
        description: Verification of barcodes in various documents in convenient way with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to check are barcodes valid in particular document using Java 
        description: Get additional information of barcodes validation for any documents in Java
        steps:
        - name: Load particular file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide verification options. 
          text: Set demanded data of the BarcodeVerifyOptions instance such as Barcode type, text and type of text verification.
        - name: Get verification result
          text: Call method Verify passing options. Obtain verification result whose property IsValid must be true if verification succeed.
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides [BarcodeVerifyOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.verify/BarcodeVerifyOptions) class to specify different options for verification of Barcode signatures.

Here are the steps to verify Barcode signature within the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.
    
*   Instantiate the [BarcodeVerifyOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.verify/BarcodeVerifyOptions) object according to your requirements and specify verification options  
    
*   Call [verify](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#verify(com.groupdocs.signature.options.verify.VerifyOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [BarcodeVerifyOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.verify/BarcodeVerifyOptions) to it.
    

  

  
This example shows how to verify Barcode signature in the document.

```java
Signature signature = new Signature("sample.pdf");
BarcodeVerifyOptions options = new BarcodeVerifyOptions();
options.setAllPages(true); // this value is set by default
options.setText("John");
options.setMatchType(TextMatchType.Contains);

// verify document signature
VerificationResult result = signature.verify(options);
if (result.isValid())
{
    System.out.print("\nDocument was verified successfully!");
}
else
{
    System.out.print("\nDocument failed verification process.");
}
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
