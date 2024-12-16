---
id: verify-for-multiple-signatures
url: signature/nodejs-java/verify-for-multiple-signatures
title: Verify for multiple signatures
linkTitle: 🛡 Multiple types
weight: 5
description: "This topic explains how to verify electronic signatures of various types with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify electronic signatures in signed documents via Node.Js    
        description: Verification of electronic signatures in various documents in convenient way with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to check are electronic signatures valid in particular document using Node.Js 
        description: Get additional information of electronic signatures validation for any documents in Node.Js
        steps:
        - name: Load particular file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide verification options. 
          text: Set properties of demanded VerifyOptions such as BarcodeVerifyOptions or DigitalVerifyOptions. Various properties like text or BarcodeType depends on options type.
        - name: Get verification result
          text: Call method Verify passing options. Obtain verification result whose property IsValid must be true if verification succeed.
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) supports verification of documents for different signature types. This approach requires to add all required verification options to list.

Here are the steps to verify document for multiple signatures with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required several [VerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/verifyoptions) objects ([BarcodeVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/barcodeverifyoptions), [QrCodeVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/qrcodeverifyoptions), [DigitalVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalverifyoptions), [TextVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/textverifyoptions)) and add instances to List<[VerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/verifyoptions)\> collection.
* Call [Verify](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class instance and pass filled list of List<[VerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/verifyoptions)\> to it.

This example shows how to search for different signature types in the document.

```csharp
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_SIGNED_MULTI; // Assuming Constants.SAMPLE_SIGNED_MULTI is defined elsewhere

  // Initialize Signature instance
  const signature = new signatureLib.Signature(filePath);

  // Initialize TextVerifyOptions
  const textVerifyOptions = new signatureLib.TextVerifyOptions();
  textVerifyOptions.setAllPages(true); // this value is set by default
  textVerifyOptions.setText('Text signature');
  textVerifyOptions.setSignatureImplementation(signatureLib.TextSignatureImplementation.Native);
  textVerifyOptions.setMatchType(signatureLib.TextMatchType.Contains);

  // Initialize BarcodeVerifyOptions
  const barcVerifyOptions = new signatureLib.BarcodeVerifyOptions();
  barcVerifyOptions.setAllPages(true); // this value is set by default
  barcVerifyOptions.setText('12345');
  barcVerifyOptions.setMatchType(signatureLib.TextMatchType.Contains);

  // Initialize QrCodeVerifyOptions
  const qrcdVerifyOptions = new signatureLib.QrCodeVerifyOptions();
  qrcdVerifyOptions.setAllPages(true); // this value is set by default
  qrcdVerifyOptions.setText('John');
  qrcdVerifyOptions.setMatchType(signatureLib.TextMatchType.Contains);

  // Initialize DigitalVerifyOptions
  const digtVerifyOptions = new signatureLib.DigitalVerifyOptions();
  digtVerifyOptions.setPassword('1234567890');

  // Verify document signatures
  const javaArray = java.newInstanceSync("java.util.ArrayList")
  javaArray.add(textVerifyOptions);
  javaArray.add(barcVerifyOptions);
  javaArray.add(qrcdVerifyOptions);
  javaArray.add(digtVerifyOptions);
  const result = signature.verify(javaArray);

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

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
