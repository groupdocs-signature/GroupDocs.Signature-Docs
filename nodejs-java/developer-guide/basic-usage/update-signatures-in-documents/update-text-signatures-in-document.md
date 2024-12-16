---
id: update-text-signatures-in-document
url: signature/nodejs-java/update-text-signatures-in-document
title: Update Text signatures in document
linkTitle: ✎ Text
weight: 4
description: "This article explains how to update Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Node.Js via Java 
structuredData:
    showOrganization: True
    application:    
        name: Update text signatures in documents in Node.Js    
        description: Update text signatures in various documents fast and easily with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to update any text signatures in documents using Node.Js 
        description: Get additional information of updating text signatures in documents with Node.Js
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of text signatures
          text: Instantiate BarcodeSearchOptions object and invoke method Search with it.
        - name: Update found signature
          text: Select one of found signature and update it properties in desirable way.
        - name: Update document
          text: Call method Update passing updated signature.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides [TextSignature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/textsignature) class to manipulate text signatures location, size and textual content.  
Please be aware that [Update](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/update/) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class.

Here are the steps to update Text signature in the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [TextSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/textsearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/search) method to obtain list of [TextSignatures](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/textsignature);
* Select from list [TextSignature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/textsignature) object(s) that should be updated;
* Call [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) object [Update](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/update/) method and pass one or several signatures to it.

This example shows how to update Text signature that was found using  [Search](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/search) method.

```csharp
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_SIGNED_MULTI; 
  const fileName = path.basename(filePath);

  // Copy source file since the update method works with the same document
  const outputFilePath = path.join(Constants.OutputPath, 'UpdateText', fileName);
  const dir = path.dirname(outputFilePath);
  if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
  }

  // Initialize Signature instance
  const signature = new signatureLib.Signature(filePath);

  // Initialize TextSearchOptions
  const options = new signatureLib.TextSearchOptions();

  // Search for text signatures in the document
  const signatures = signature.search(signatureLib.TextSignature.class, options).toArray();

  if (signatures.length > 0) {
    const textSignature = signatures[0];

    // Change Text property
    textSignature.setText('John Walkman');
    // Change position
    textSignature.setLeft(textSignature.getLeft() + 50);
    textSignature.setTop(textSignature.getTop() + 50);
    // Change size. Please note not all documents support changing signature size
    textSignature.setWidth(200);
    textSignature.setHeight(100);

    // Update the text signature in the document
    const result = signature.update(outputFilePath, textSignature);

    if (result) {
      console.log(`\nSignature with Text '${textSignature.getText()}' was updated in the document ['${fileName}'].`);
    } else {
      console.log(`\nSignature was not updated in the document! Signature with Text '${textSignature.getText()}' was not found!`);
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

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.