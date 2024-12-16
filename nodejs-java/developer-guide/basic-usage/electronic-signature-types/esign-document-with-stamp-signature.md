---
id: esign-document-with-stamp-signature
url: signature/nodejs-java/esign-document-with-stamp-signature
title: eSign document with Stamp signature
linkTitle: Stamp signature
weight: 8
description: "This article explains how to sign a document electronically with generated Stamp signatures by GroupDocs.Signature API."
keywords: sign document electronically, Stamp signatures
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Signing documents with stamps in Node.Js    
        description: Sign documents with generated stamps and Node.Js language by GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign any documents with stamps using Node.Js 
        description: Learn all about signing a document by using stamps and Node.Js
        steps:
        - name: Load file which is planned to be signed
          text: Create the Signature object by passing the file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide new FormFieldSignature class instance and fill all demanded data.
        - name: Sign source file with just painted stamp and save result 
          text: Invoke the Sign method with signing options and output file path or stream.
---
## What is a Stamp signature?

A **stamp** signature is a special type of electronic signature that has the visual appearance of a round seal and its visual parameters can be set programmatically.
Every stamp signature can have multiple "stamp lines" with custom text and different line thicknesses, colors, font weights and sizes. Here is an example of how a stamp signature created with [**GroupDocs.Siganture**](https://products.groupdocs.com/signature/nodejs-java) may look like:

![Stamp](/signature/nodejs-java/images/esign-document-with-stamp-signature.png)

GroupDocs.Signature provides the [StampSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/stampsignoptions) class to specify different options for Stamp signature:

* Stamp type - Round or Square;
* Height and width in pixels;
* Alignment and position within the document page;
* and many more.

Each Stamp option contains inner and outer lines. Inner lines represent vertical lines inside the stamp, while outer lines represent circles (or rectangles based on stamp type) around the stamp with their own text, border settings, background etc.

Here are the steps to add a Stamp signature to a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [StampSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/stampsignoptions) object according to your requirements and specify appropriate options.
* Call the [Sign](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class instance and pass the [StampSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/stampsignoptions) to it.

## How to eSign document with Stamp signature

This example shows how to add a Stamp signature to a document.

```javascript
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_PDF; // Assuming Constants.SAMPLE_PDF is defined elsewhere
  const fileName = path.basename(filePath);

  const outputFilePath = path.join(Constants.OutputPath, 'SignWithStamp', fileName);
  const signature = new signatureLib.Signature(filePath);

  // Create stamp sign options
  const options = new signatureLib.StampSignOptions();

  // Set stamp signature position
  options.setLeft(100);
  options.setTop(100);

  // Setup first external line of Stamp
  const outerLine = new signatureLib.StampLine();
  outerLine.setText(" * European Union * European Union  * European Union  * European Union  * European Union  * ");
  outerLine.getFont().setSize(12);
  outerLine.setHeight(22);
  outerLine.setTextBottomIntent(6);
  //outerLine.setTextColor(Color.WHITE);
  //outerLine.setBackgroundColor(Color.BLUE);
  options.getOuterLines().add(outerLine);

  // Inner square lines - horizontal lines inside the rings
  const innerLine = new signatureLib.StampLine();
  innerLine.setText("John");
  //innerLine.setTextColor(Color.RED);
  const signFont = new signatureLib.SignatureFont();
  signFont.setSize(20);
  signFont.setBold(true);
  innerLine.setFont(signFont);
  innerLine.setHeight(40);
  options.getInnerLines().add(innerLine);

  // Sign document to file
  signature.sign(outputFilePath, options);
  console.log(`\nSource document signed successfully.\nFile saved at ${outputFilePath}`);
```
### Summary
This guide explains how to apply stamp-based signatures to documents using [**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) . It covers the process of creating a stamp signature, customizing its appearance, and positioning it on the document. The signed document can then be saved with the stamp signature applied.



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

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.