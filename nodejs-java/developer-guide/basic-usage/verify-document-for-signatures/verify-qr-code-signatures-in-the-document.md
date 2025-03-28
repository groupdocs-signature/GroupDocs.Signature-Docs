---
id: verify-qr-code-signatures-in-the-document
url: signature/nodejs-java/verify-qr-code-signatures-in-the-document
title: Verify QR-code signatures in the document
linkTitle: 🛡 QR Codes
weight: 3
description: "This topic explains how to verify QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify QR-code signatures in signed documents via Node.Js    
        description: Verification of QR-codes in various documents in convenient way with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to check are QR-codes valid in particular document using Node.Js 
        description: Get additional information of QR-codes validation for any documents in Node.Js
        steps:
        - name: Load particular file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide verification options. 
          text: Set demanded data of the QrCodeVerifyOptions instance such as QR-code type, text and type of text verification.
        - name: Get verification result
          text: Call method Verify passing options. Obtain verification result whose property IsValid must be true if verification succeed.
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides the [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/qrcodeverifyoptions) class to specify different options for verification of QR-code signatures.

Here are the steps to verify a QR-code signature within the document using GroupDocs.Signature for Node.Js via Java API:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/qrcodeverifyoptions) object according to your requirements and specify verification options.
* Call the [Verify](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/verify) method of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class instance and pass the [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/qrcodeverifyoptions) to it.
This example shows how to verify QR-code signature in the document.

```csharp
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_SIGNED_MULTI; // Assuming Constants.SAMPLE_SIGNED_MULTI is defined elsewhere

  // Initialize Signature instance
  const signature = new signatureLib.Signature(filePath);

  // Initialize QrCodeVerifyOptions
  const options = new signatureLib.QrCodeVerifyOptions();
  options.setAllPages(true); // this value is set by default
  options.setText('John');
  options.setMatchType(signatureLib.TextMatchType.Contains);

  // Verify document signatures
  const result = signature.verify(options);

  if (result.isValid()) {
    console.log('\nDocument was verified successfully!');
  } else {
    console.log('\nDocument failed the verification process.');
  }
```


## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET 
examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To generate QR codes and/or sign your files with QR codes for free, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
