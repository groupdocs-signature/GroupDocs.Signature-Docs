---
id: update-barcode-signatures-in-document
url: signature/nodejs-java/update-barcode-signatures-in-document
title: Update Barcode signatures in document
linkTitle: ✎ Barcode
weight: 1
description: "This article explains how to update Barcode electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Node.Js via Java 
structuredData:
    showOrganization: True
    application:    
        name: Update barcode signatures in documents in Node.Js    
        description: Update barcode signatures in various documents fast and easily with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to update any barcode signatures in documents using Node.Js 
        description: Get additional information of updating barcode signatures in documents with Node.Js
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of barcode signatures
          text: Instantiate BarcodeSearchOptions object and invoke method Search with it.
        - name: Update found signature
          text: Select one of found signature and update it properties in desirable way.
        - name: Update document
          text: Call method Update passing updated signature.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides [BarcodeSignature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/barcodesignature) class to manipulate barcode signatures location, size and textual content.
Please be aware that [Update](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/update/) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class.

### Here are the steps to update Barcode signature in the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [BarcodeSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/barcodesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/search) method to obtain list of [BarcodeSignatures](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/barcodesignature);
* Select from list [BarcodeSignature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/barcodesignature) object(s) that should be updated;
* Call [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) object [Update](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/update/) method and pass one or several signatures to it.

This example shows how to update Barcode signature that was found using  [Search](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/search) method.

```csharp
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_PDF_SIGNED; 
  const fileName = path.basename(filePath);

  // Copy source file since the update method works with the same document
  const outputFilePath = path.join(Constants.OutputPath, 'UpdateBarcode', fileName);
  const dir = path.dirname(outputFilePath);
  if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
  }

  // Initialize Signature instance
  const signature = new signatureLib.Signature(filePath);

  // Initialize BarcodeSearchOptions
  const options = new signatureLib.BarcodeSearchOptions();

  // Search for barcode signatures in the document
  const signatures = signature.search(signatureLib.BarcodeSignature.class, options).toArray();

  if (signatures.length > 0) {
    const barcodeSignature = signatures[0];
    barcodeSignature.setLeft(100);
    barcodeSignature.setTop(100);

    // Update the barcode signature in the document
    const result = signature.update(outputFilePath, barcodeSignature);

    if (result) {
      console.log(`\nSignature with Barcode '${barcodeSignature.getText()}' and encode type '${barcodeSignature.getEncodeType().getTypeName()}' was updated in the document ['${fileName}'].`);
    } else {
      console.log(`\nSignature was not updated in the document! Signature with Barcode '${barcodeSignature.getText()}' and encode type '${barcodeSignature.getEncodeType().getTypeName()}' was not found!`);
    }
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

To generate barcodes and/or sign your files with barcodes for free, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.