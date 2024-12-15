---
id: delete-signatures-from-documents-by-id
url: signature/nodejs-java/delete-signatures-from-documents-by-id
title: Delete signatures from documents by ID
linkTitle: ✖ By ID
weight: 4
description: "This article explains how to delete electronic signatures by ID with GroupDocs.Signature API."
keywords: delete signature by id, how to delete electronic signatures by ID
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove electronic signatures from documents by ID in Node.Js    
        description: Delete electronic signatures identified by their unique ID from documents in convenient way with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to clear any documents from electronic signatures using their ID in Node.Js 
        description: Information about removing electronic signatures from documents by their unique ID in Node.Js
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of electronic signatures presented in document 
          text: Create an instance of SearchOptions class, fill data and call Search method of signature to find signatures by ID.
        - name: Delete one of found electronic signatures by ID and save result 
          text: Invoke Delete method passing the signature ID and file path for the signed file. File stream can be used as well.

---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides [TextSignature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/textsignature) class to manipulate text signatures and delete them from the documents.
Please be aware that [Delete](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class.
## How to delete Text signature from the document
Here are the steps to delete Text signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [TextSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/textsearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/search) method to obtain list of [TextSignatures](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/textsignature);
* Select from list [TextSignature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/textsignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/delete) method and pass one or several signatures to it.

This example shows how to delete Text signature that was found using [Search](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/search) method.

```javascript
  // The path to the documents directory.  
  const filePath = Constants.SAMPLE_PDF_SIGNED; 
  const fileName = path.basename(filePath);

  const outputDirectory = path.join(Constants.OutputPath, 'DeleteById');
  if (!fs.existsSync(outputDirectory)) {
    fs.mkdirSync(outputDirectory, { recursive: true });
  }

  // Copy source file since the delete method works with the same Document
  const outputFilePath = path.join(outputDirectory, fileName);

  fs.copyFileSync(filePath, outputFilePath);

  const signature = new signatureLib.Signature(outputFilePath);

  const id = 'eff64a14-dad9-47b0-88e5-2ee4e3604e71';
  const result = await signature.delete(id);
  if (result) {
    console.log(`Signature with Id# '${id}' was deleted from document ['${fileName}'].`);
  } else {
    console.log(`Signature was not deleted from the document! Signature with id# '${id}' was not found!`);
  }
```

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/nodejs-java/developer-guide/advanced-usage/_index.md" >}}).

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