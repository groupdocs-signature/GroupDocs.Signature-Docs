---
id: search-for-image-e-signatures
url: signature/nodejs-java/search-for-image-e-signatures
title: How to search for Image signatures
linkTitle: 🔍 Images
weight: 7
description: "This article explains how to search for Image electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Node.Js via Java 
structuredData:
    showOrganization: True
    application:    
        name: Search for images signatures in documents in Node.Js    
        description: Search images in various documents fast and easily with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search any images in documents using Node.Js 
        description: Get additional information of searching images in documents with Node.Js
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of images 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found images.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides [ImageSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/imagesearchoptions) class to specify different options to search for Image e-signatures.

 Here are the steps to search for Image signatures within the document with GroupDocs.Signature API:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [ImageSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/imagesearchoptions) object according to your requirements and specify additional search options (if needed);
* Call [Search](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class instance and pass [ImageSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/imagesearchoptions) to it.

The code snippet below demonstrates how to search for Image electronic signature in the document.

```javascript
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_SIGNED_MULTI; 
  const fileName = path.basename(filePath);
  const signature = new signatureLib.Signature(filePath);

  // Search document
  const signatures = signature.search(signatureLib.ImageSignature.class, signatureLib.SignatureType.Image).toArray();
  console.log(`\nSource document ['${fileName}'] contains the following image signature(s).`);

  // Output signatures
  for (const imageSignature of signatures) {
    console.log(`Found Image signature at page ${imageSignature.getPageNumber()} and size ${imageSignature.getSize()}.`);
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
