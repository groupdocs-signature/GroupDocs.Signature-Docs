---
id: esign-document-with-barcode-signature
url: signature/nodejs-java/esign-document-with-barcode-signature
title: eSign document with Barcode signature
linkTitle: Barcode signature
weight: 1
description: "This article explains how to add Barcode signature on document page with various options like barcode type, barcode text, positioning, alignment and other visual settings with GroupDocs.Signature"
keywords: barcode, barcode signature, GroupDocs.Signature barcode, GroupDocs.Signature barcode signature
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Sign documents with Barcode and Node.Js    
        description: Adding Barcode to any document page with Node.Js language by GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to add Barcode to various documents with Node.Js 
        description: Find out ways of signing documents with the Barcode using Node.Js
        steps:
        - name: Load source document
          text: Creating Signature instance with file path or stream as a constructor parameter will load the document. 
        - name: Provide barcode options. 
          text: Set specific properties of the BarcodeSignOption instance like a Barcode type, barcode text, and signature appearance settings.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed files using a file path or a stream.
---
## What is a Barcode?

A **barcode** or **bar code** is a way of presenting data in a visual, machine-readable form. Generally speaking, barcode is an image of a rectangular form that consists of parallel black lines and white spaces of different widths.  
Barcodes are used in various areas where quick identification is necessary - as part of the purchase process in retail stores, in warehouses to track inventory, and on invoices to assist in accounting, among many other uses.

![Barcode](/signature/nodejs-java/images/esign-document-with-barcode-signature.gif)

Barcodes allow storing of product-related data like manufacturing and expiry dates, manufacturer name, country of origin, and product price. There are plenty of barcode types nowadays because different companies use different combinations of numbers and bars in their barcodes depending on their needs. From the document signature perspective, Barcode may contain different characters (letters, digits, or symbols) and may have various lengths and sizes depending on the type and settings to keep signature information, title, subject, or short encrypted data.  

## How to eSign document with Barcode signature

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) supports a wide range of Barcode types that can be used to create electronic signatures within the documents. Please refer to the [BarcodeTypes](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/barcodetypes/#fields) description to get the full list of supported barcodes.  
To specify different options for Barcode signature GroupDocs.Signature for Node.Js via Java provides [BarcodeSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/barcodesignoptions) class. The main fields are:

* [EncodeType](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/barcodesignoptions/encodetype) - specifies the Barcode type (AustralianPost, Codabar, EAN13, OPC, etc.);
* [Text](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/textsignoptions/text) - specifies the Barcode text.


Here are the steps to eSign a document with the Barcode signature using GroupDocs.Signature for Node.Js via Java API:
* Create a new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [BarcodeSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/barcodesignoptions) object according to your requirements and specify the Barcode type by setting the [EncodeType](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/barcodesignoptions/encodetype) property with one of the predefined supported types. Set the [Text](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/textsignoptions/text) property value.
* Call the [Sign](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class instance and pass the [BarcodeSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/barcodesignoptions) to it.

This example shows how to sign a PDF document with a Barcode signature.

```javascript
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_PDF; 
  const fileName = path.basename(filePath);

  const outputFilePath = path.join(Constants.OutputPath, 'SignPdfWithBarcode', fileName);
  const signature = new signatureLib.Signature(filePath);

  // Create barcode option with predefined barcode text
  const options = new signatureLib.BarcodeSignOptions('JohnSmith');
  // Setup barcode encoding type
  options.setEncodeType(signatureLib.BarcodeTypes.Code128);
  // Set signature position
  options.setLeft(100);
  options.setTop(100);
  options.setWidth(200);
  options.setHeight(50);
  
  // Sign document to file
  signature.sign(outputFilePath, options);
  console.log(`\nSource document signed successfully.\nFile saved at ${outputFilePath}`);
```

### Summary
This guide demonstrates how to use [**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) to add barcode-based signatures to documents. It covers creating, configuring, and applying barcode signatures with support for various barcode types and customization options. For further exploration, refer to related guides on document information and advanced signing techniques.

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature Node.Js for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To generate barcodes and/or sign your files with barcodes for free, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
