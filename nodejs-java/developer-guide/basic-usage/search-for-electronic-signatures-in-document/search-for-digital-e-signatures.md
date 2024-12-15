---
id: search-for-digital-e-signatures
url: signature/nodejs-java/search-for-digital-e-signatures
title: How to search for Digital signatures
linkTitle: 🔍 Digital certificates
weight: 2
description: "This topic explains how to search for digital electronic signatures across the documents with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Node.Js via Java 
structuredData:
    showOrganization: True
    application:    
        name: Search for digital signatures in documents in Node.Js    
        description: Search digital signatures in various documents fast and easily with Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search any digital signatures in documents using Node.Js 
        description: Get additional information of searching digital signatures in documents with Node.Js
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of digital signatures 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found digital signatures.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) offers an ability to find Digital signatures that are applied to document and returns its digital signature certificate.  
Please follow these steps to search for Digital signatures within the document:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [DigitalSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsearchoptions) object according to your requirements and specify search options
* Call [Search](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class instance and pass [DigitalSearchOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/digitalsearchoptions) to it.

This example shows how to search for Digital signature in the document and analyze digital signature certificate.

``` javascript
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_SIGNED_MULTI; 

  const signature = new signatureLib.Signature(filePath);
  const options = new signatureLib.DigitalSearchOptions();

  // Search for signatures in the document
  const signatures = signature.search(signatureLib.DigitalSignature.class, options).toArray();
  console.log('\nSource document contains the following digital signatures.');

  for (const digitalSignature of signatures) {
    console.log(`Digital signature found from ${digitalSignature.getSignTime()} with validation flag ${digitalSignature.isValid()}. Certificate SN ${digitalSignature.getCertificate().getType()}`);
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
