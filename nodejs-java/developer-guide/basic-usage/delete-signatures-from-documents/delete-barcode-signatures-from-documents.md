---
id: delete-barcode-signatures-from-documents
url: signature/nodejs-java/delete-barcode-signatures-from-documents
title: Delete Barcode signatures from documents
linkTitle: ✖ Barcode
weight: 1
description: "This article explains how to delete Barcode electronic signatures with GroupDocs.Signature API."
keywords: delete Barcode,delete Barcode electronic signatures, how to delete Barcode electronic signatures
productName: GroupDocs.Signature for Node.Js via Java
toc: True
structuredData:
  showOrganization: True
  application:
    name: Remove Barcodes from documents in Node.Js
    description: Delete Barcodes presented in documents in convenient way with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
    productCode: signature
    productPlatform: net
  showVideo: True
  howTo:
    name: How to clear any documents from barcodes using Node.Js
    description: Information about removing barcodes from documents by Node.Js
    steps:
      - name: Load file which is belongs to various supported file types
        text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream.
      - name: Get list of barcodes presented in document
        text: Create an instance of BarcodeSearchOptions class, fill data and call Search method of signature.
      - name: Delete one of found barcodes and save result
        text: Invoke Delete method passing found barcode and file path for signed file. File stream can be used as well.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides [BarcodeSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/barcodesignature) class to manipulate barcode signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class.

## How to delete Barcode signature from the document
Here are the steps to delete Barcode signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [BarcodeSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options.search/barcodesearchoptions/) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/#search(com.groupdocs.signature.options.search.SearchOptions)) method to obtain list of [BarcodeSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/barcodesignature);
* Select from list [BarcodeSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/barcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/delete) method and pass one or several signatures to it.

This example shows how to delete Barcode signature that was found using [Search](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/#search(com.groupdocs.signature.options.search.SearchOptions)) method.

```javascript
  const filePath = Constants.SAMPLE_PDF_SIGNED; 
  const fileName = path.basename(filePath);

  const outputDirectory = path.join(Constants.OutputPath, 'DeleteBarcode');
  if (!fs.existsSync(outputDirectory)) {
    fs.mkdirSync(outputDirectory, { recursive: true });
  }

  // Copy source file since the delete method works with the same Document
  const outputFilePath = path.join(outputDirectory, fileName);

  fs.copyFileSync(filePath, outputFilePath);

  const signature = new signatureLib.Signature(outputFilePath);

  const options = new signatureLib.BarcodeSearchOptions();

  // Search for Barcode signatures in the document
  const signatures =  signature.search(signatureLib.BarcodeSignature.class, options).toArray();
  if (signatures.length > 0) {
     const barcodeSignature = signatures[0];
     const isDeleted = signature.delete(outputFilePath, barcodeSignature);
  
     const barcodeText = barcodeSignature.getText();
     const encodeTypeName = barcodeSignature.getEncodeType().getTypeName();
  
     if (isDeleted) {
         console.log(
             `Signature with Barcode '${barcodeText}' and encode type '${encodeTypeName}' was successfully deleted from the document '${fileName}'.`
         );
     } else {
         console.log(
             `Failed to delete the signature! Barcode '${barcodeText}' with encode type '${encodeTypeName}' was not removed from the document '${fileName}'.`
         );
     }
  }
```


## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
