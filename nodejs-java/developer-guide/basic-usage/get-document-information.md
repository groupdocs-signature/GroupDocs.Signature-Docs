---
id: get-document-information
url: signature/nodejs-java/get-document-information
title: Get document information
weight: 2
description: "This article explains how to detect document file type, obtain document details,  retrieve list of existing form fields and added signatures, calculate pages count when processing document file with GroupDocs.Signature."
keywords: document properties, document information, document details, get document information
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Get document extended information using Node.Js    
        description: Gaining information about particular document using Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to collect document information using Node.Js 
        description: Getting detailed information about documents of various document types in Node.Js
        steps:
        - name: Load particular file with supported type.
          text: Instantiate Signature class by passing either file path or stream. 
        - name: Get document information
          text: Call GetDocumentInfo method save process information such as page count or document format.
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) allows to get document information which includes:

* [FileType](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/documentinfo/filetype)
* [Size](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/documentinfo/size)
* [PageCount](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/documentinfo/pagecount)
* Pages dimensions - [Height](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/pageinfo/height) and [Width](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/pageinfo/width) for each page in a document [Pages](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.domain/idocumentinfo/pages) collection.

## Get document information from a file

The following code snippet demonstrates how to obtain information about document provided as a file.

```javascript
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_PDF;

  const signature = new signatureLib.Signature(filePath);

  const documentInfo = await signature.getDocumentInfo();

  console.log(`Document properties ${path.basename(filePath)}`);
  console.log(` - format : ${documentInfo.getFileType().getFileFormat()}`);
  console.log(` - extension : ${documentInfo.getFileType().getExtension()}`);
  console.log(` - size : ${documentInfo.getSize()}`);
  console.log(` - page count : ${documentInfo.getPageCount()}`);
  console.log(` - Form Fields count : ${documentInfo.getFormFields().size()}`);
  console.log(` - Text signatures count : ${documentInfo.getTextSignatures().size()}`);
  console.log(` - Image signatures count : ${documentInfo.getImageSignatures().size()}`);
  console.log(` - Digital signatures count : ${documentInfo.getDigitalSignatures().size()}`);
  console.log(` - Barcode signatures count : ${documentInfo.getBarcodeSignatures().size()}`);
  console.log(` - QrCode signatures count : ${documentInfo.getQrCodeSignatures().size()}`);
  console.log(` - FormField signatures count : ${documentInfo.getFormFieldSignatures().size()}`);

  for (const pageInfo of documentInfo.getPages().toArray()) {
    console.log(` - page-${pageInfo.getPageNumber()} Width ${pageInfo.getWidth()}, Height ${pageInfo.getHeight()}`);
  }
```

{{< alert style="info" >}}
**GroupDocs.Signature** also provides an abilityto obtain extended information of document form fields and existing signatures.  
To learn more about please refer to the following guides:
[Obtain document form fields and signatures information]({{< ref "signature/nodejs-java/developer-guide/advanced-usage/common/obtain-document-form-fields-and-signatures-information.md" >}})
{{< /alert >}}

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/nodejs-java/developer-guide/advanced-usage/_index.md" >}}).

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for ,NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
