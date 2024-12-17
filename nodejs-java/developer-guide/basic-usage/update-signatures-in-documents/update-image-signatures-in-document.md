---
id: update-image-signatures-in-document
url: signature/nodejs-java/update-image-signatures-in-document
title: Update Image signatures in document
linkTitle: ✎ Image
weight: 2
description: "This article explains how to update Image electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Node.Js via Java 
structuredData:
    showOrganization: True
    application:    
        name: Update images in documents in Node.Js    
        description: Update image signatures in various documents fast and easily with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to update any images in documents using Node.Js 
        description: Get additional information of updating image signatures in documents with Node.Js
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of images
          text: Instantiate ImageSearchOptions object and invoke method Search with it.
        - name: Update found signature
          text: Select one of found signature and update it properties in desirable way.
        - name: Update document
          text: Call method Update passing updated signature.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides [ImageSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/imagesignature) class to manipulate barcode signatures location, size and textual content.
Please be aware that [Update](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/update/) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class.

Here are the steps to update Barcode signature in the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [ImageSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/imagesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/search) method to obtain list of [ImageSignatures](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/imagesignature);  
* Select from list [ImageSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/imagesignature) object(s) that should be updated;  
* Call [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) object [Update](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/update/) method and pass one or several signatures to it.  

This example shows how to update Image signature that was found using  [Search](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/search) method.

```csharp
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_SIGNED_MULTI; 
  const fileName = path.basename(filePath);

  // Copy source file since the update method works with the same document
  const outputFilePath = path.join(Constants.OutputPath, 'UpdateImage', fileName);
  const dir = path.dirname(outputFilePath);
  if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
  }
  
  // Initialize Signature instance
  const signature = new signatureLib.Signature(filePath);

  // Initialize ImageSearchOptions
  const options = new signatureLib.ImageSearchOptions();

  // Search for image signatures in the document
  const signatures = signature.search(signatureLib.ImageSignature.class, options).toArray();

  if (signatures.length > 0) {
    const imageSignature = signatures[0];
    imageSignature.setLeft(100);
    imageSignature.setTop(100);

    // Update the image signature in the document
    const result = signature.update(outputFilePath, imageSignature);

    if (result) {
      console.log(`\nImage signature at location ${imageSignature.getLeft()}x${imageSignature.getTop()} and Size ${imageSignature.getSize()} was updated in the document [${fileName}].`);
    } else {
      console.log(`\nSignature was not updated in the document! Image signature at location ${imageSignature.getLeft()}x${imageSignature.getTop()} and Size ${imageSignature.getSize()} was not found!`);
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

To generate image signatures and/or sign your files with them for free, you can use the [Generate Image](https://products.groupdocs.app/signature/generate/image) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.