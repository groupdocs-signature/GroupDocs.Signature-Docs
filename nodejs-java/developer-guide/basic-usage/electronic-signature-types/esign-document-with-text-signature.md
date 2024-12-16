---
id: esign-document-with-text-signature
url: signature/nodejs-java/esign-document-with-text-signature
title: eSign document with Text signature
linkTitle: Text signature
weight: 7
description: "This article explains how to sign a document with Text signature by GroupDocs.Signature API. Let's try to add a digital signature to a PDF programmatically."
keywords: Add digital signature to a PDF programmatically, Text signature
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Documents signing with text in Node.Js    
        description: Put text on any document with Node.Js language by GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign any documents with text using Node.Js 
        description: Learn all about signing a document by using a text and Node.Js
        steps:
        - name: Load file which is planned to be signed
          text: Create the Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide new ImageSignOptions class instance and fill all demanded data.
        - name: Put text on the source file and save the result 
          text: Invoke the Sign method with signing options and output file path or stream.
---
## What is a Text signature?

A **Text** electronic signature is an arbitrary text that is added to a document in a native way depending on the type of the document. GroupDocs.Signature provides the text signature feature and allows customizing a wide range of text settings - from font name, size and color to alignment, borders, shadow effects etc. This is how a text signature may look like:  

![Text](/signature/nodejs-java/images/esign-document-with-text-signature.png)

## How to eSign document with Text signature

Let's try to add a text signature to a PDF programmatically.

To manipulate text signatures programmatically [**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides the [TextSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/textsignoptions) class and the whole workflow is as easy as follows:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [TextSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/textsignoptions) object according to your requirements and specify the signature options.
* Call the [Sign](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class instance and pass the [TextSignOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/textsignoptions) to it.

This example shows how to add a text signature to a document.

```javascript
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_PDF;
  const fileName = path.basename(filePath);

  const outputFilePath = path.join(Constants.OutputPath, 'SignWithText', fileName);
  const signature = new signatureLib.Signature(filePath);

  // Create text sign options
  const options = new signatureLib.TextSignOptions('John Smith');
  // Set signature position
  options.setLeft(100);
  options.setTop(100);

  // Set signature rectangle
  options.setWidth(100);
  options.setHeight(30);

  // Set text color and font
  //options.setForeColor(new Color(255, 0, 0)); // Red color
  const signatureFont = new signatureLib.SignatureFont();
  signatureFont.setSize(12);
  signatureFont.setFamilyName('Comic Sans MS');
  options.setFont(signatureFont);

  // Sign document to file
  signature.sign(outputFilePath, options);
  console.log(`\nSource document signed successfully.\nFile saved at ${outputFilePath}`);
```
### Summary
This guide explains how to add text-based signatures to documents with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) . It covers configuring text properties such as font, color, size, and position, and applying the text signature to a document. The signed document is then saved with the added text signature.

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