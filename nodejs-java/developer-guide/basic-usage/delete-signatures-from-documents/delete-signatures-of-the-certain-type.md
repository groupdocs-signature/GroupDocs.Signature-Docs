---
id: delete-signatures-of-the-certain-type
url: signature/nodejs-java/delete-signatures-of-the-certain-type
title: Delete Signatures of the certain type
linkTitle: ✖ By type
weight: 6
description: "This article explains how to delete electronic signatures of the certain type with GroupDocs.Signature API."
keywords: delete signature, how to delete signature of the certain type
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove electronic signatures from documents in Node.Js    
        description: Delete electronic signatures presented in documents in convenient way with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to clear any documents from electronic signatures using Node.Js 
        description: Information about removing electronic signatures from documents by Node.Js
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Delete all signatures of specific type presented in document 
          text: Invoke Delete method passing type of signatures to be deleted.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides overloaded [Delete](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/delete) method that accepts one [SignatureType](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/signaturetype) or list of them.
Please be aware that this method modifies the same document that was passed to constructor of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class.
## How to delete signature by specific type from the document
Here are the steps to delete signature by specific type from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass source document path or its stream as a constructor parameter;
* Call [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/delete) method and pass certain [SignatureType](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/signaturetype) enumeration to it.

This example shows how to delete QR-Code signatures from the document.

```javascript
  const filePath = Constants.SAMPLE_SIGNED_MULTI; 
  const fileName = path.basename(filePath);
  
  const outputDirectory = path.join(Constants.OutputPath, 'DeleteBySignatureType');
  if (!fs.existsSync(outputDirectory)) {
    fs.mkdirSync(outputDirectory, { recursive: true });
  }

  // Copy source file since the delete method works with the same Document
  const outputFilePath = path.join(outputDirectory, fileName);
  // fs.copyFileSync(filePath, outputFilePath);

  // Processing QR-Code signatures
  const signature = new signatureLib.Signature(filePath);
    
  // Deleting QR-Code signatures from the document
  const result = await signature.delete(outputFilePath, signatureLib.SignatureType.QrCode);
  if (result.getSucceeded().size() > 0) {
    console.log('Following QR-Code signatures were deleted:');
    let number = 1;
    result.getSucceeded().toArray().forEach((o) => {
      const temp = o;
      console.log(`Signature #${number++}: Type: ${temp.getSignatureType()}, Id: ${temp.getSignatureId()}, Text: ${temp.getText()}`);
    });
  } else {
    console.log('No QR-Code signatures were deleted.');
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