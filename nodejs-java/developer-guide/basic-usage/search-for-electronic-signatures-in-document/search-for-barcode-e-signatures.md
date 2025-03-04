---
id: search-for-barcode-e-signatures
url: signature/nodejs-java/search-for-barcode-e-signatures
title: Search for Barcode e-signatures
linkTitle: 🔍 Barcodes
weight: 1
description: "This article explains how to search for Barcode in the document with few lines of code over GroupDocs.Signature API."
keywords: search for barcode, how to search for Barcode
productName: GroupDocs.Signature for Node.Js via Java 
structuredData:
    showOrganization: True
    application:    
        name: Search for barcode signatures in documents in Node.Js    
        description: Search barcodes in various documents fast and easily with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search any barcodes in documents using Node.Js 
        description: Get additional information of searching barcodes in documents with Node.Js
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of barcodes 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found barcodes.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides an easy and straightforward way to find all Barcode signatures that are present in a document.  
For the simpler use case - just find all Barcode signatures within document its only needed to instantiate [BarcodeSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/#search) class and pass it to [Search](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/#search) method.

Here are the exact steps to search for Barcode signatures within the document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [BarcodeSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/#search) object according to your requirements and specify search options.
* Call the [Search](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/#search) method of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class instance and pass the [BarcodeSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/#search) to it.

This example shows how to search for Barcode signature in the document.

```javascript
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_SIGNED_MULTI; 

  const signature = new signatureLib.Signature(filePath);
  const options = new signatureLib.BarcodeSearchOptions();
  options.setAllPages(true); // this value is set by default

  // Search for signatures in the document
  const signatures = signature.search(signatureLib.BarcodeSignature.class, options).toArray();
  console.log('\nSource document contains the following signatures.');

  for (const barcodeSignature of signatures) {
    console.log(`Barcode signature found at page ${barcodeSignature.getPageNumber()} with type ${barcodeSignature.getEncodeType()} and text ${barcodeSignature.getText()}`);
  }
```


## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
