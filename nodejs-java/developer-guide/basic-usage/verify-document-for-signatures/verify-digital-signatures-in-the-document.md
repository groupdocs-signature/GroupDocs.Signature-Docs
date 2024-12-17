---
id: verify-digital-signatures-in-the-document
url: signature/nodejs-java/verify-digital-signatures-in-the-document
title: Verify Digital signatures in the document
linkTitle: 🛡 Digital certificates
weight: 2
description: "This topic explains how to verify digital electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify digital signatures in signed documents via Node.Js    
        description: Verification of digital signatures in various documents in convenient way with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to check are digital signatures valid in particular document using Node.Js 
        description: Get additional information of digital signatures validation for any documents in Node.Js
        steps:
        - name: Load particular file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide verification options. 
          text: Set demanded data of the DigitalVerifyOptions instance such as comment text and type of text verification.
        - name: Get verification result
          text: Call method Verify passing options. Obtain verification result whose property IsValid must be true if verification succeed.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides [DigitalVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/digitalverifyoptions) class to specify different options for digital signatures verification.

Here are the steps to verify Digital signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [DigitalVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/digitalverifyoptions) object according to your requirements and specify verification options
* Call [Verify](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class instance and pass [DigitalVerifyOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/digitalverifyoptions) to it.

This example shows how to verify Digital signature in the document.

```csharp
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_PDF_SIGNED; 

  // Initialize Signature instance
  const signature = new signatureLib.Signature(filePath);

  // Initialize DigitalVerifyOptions
  const options = new signatureLib.DigitalVerifyOptions(Constants.CertificatePfx);
  options.setComments('Mr.Smith');
  options.setPassword('1234567890');

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

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
