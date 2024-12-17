---
id: search-for-text-e-signatures
url: signature/nodejs-java/search-for-text-e-signatures
title: Search for Text e-signatures
linkTitle: 🔍 Texts
weight: 6
description: "This topic explains how to search for text electronic signatures within the document pages by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Node.Js via Java 
structuredData:
    showOrganization: True
    application:    
        name: Search for text signatures in documents in Node.Js    
        description: Search text signatures in various documents fast and easily with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search any text signatures in documents using Node.Js 
        description: Get additional information of searching text signatures in documents with Node.Js
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of text signatures 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found text signatures.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides [TextSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/textsearchoptions) class to specify different options to search for Text electronic signatures within document.

Here are the steps to search for Text e-signatures using GroupDocs.Signature API:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [TextSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/textsearchoptions) object according to your requirements and specify additional search options (if needed);  
* Call [Search](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature)  class instance and pass [TextSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/textsearchoptions) to it.

This example shows how to search for Text e-signature in the document.

```javascript
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_SIGNED_MULTI; 
  const fileName = path.basename(filePath);
  const signature = new signatureLib.Signature(filePath);

  // Setup search options
  const options = new signatureLib.TextSearchOptions();
  options.setAllPages(true);

  // Search for text signatures in the document
  const signatures = signature.search(signatureLib.TextSignature.class, options).toArray();
  console.log(`\nSource document ['${fileName}'] contains the following text signature(s).`);

  // Enumerate all signatures for output
  for (const textSignature of signatures) {
    console.log(`Found Text signature at page ${textSignature.getPageNumber()} with type [${textSignature.getSignatureImplementation()}] and text '${textSignature.getText()}'.`);
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