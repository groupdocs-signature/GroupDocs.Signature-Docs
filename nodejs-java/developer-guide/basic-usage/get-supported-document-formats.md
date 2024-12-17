---
id: get-supported-document-formats
url: signature/nodejs-java/get-supported-document-formats
title: Get supported file formats
weight: 1
description: "This article explains how to obtain supported file formats list for PDF, Words, Spreadsheet or Presentation document types when working with GroupDocs.Signature within your .NET applications."
keywords: GroupDocs.Signature supported files, GroupDocs.Signature supported documents, GroupDocs.Signature PDF files, GroupDocs.Signature Words files, GroupDocs.Signature Presentation files, GroupDocs.Signature Spreadsheet files
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Get list of supported file types with Node.Js    
        description: Getting list of document types which can be processed using Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to obtain file types for signing with Node.Js 
        description: Collecting list of various document types which are suitable for signing in Node.Js
        steps:
        - name: Get supported file types.
          text: Invoke method GetSupportedFileTypes. 
        - name: Process file types.
          text: Process all selected file types in demanded way. 
---

## Overview

With [**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) you can get the [list of file formats]({{< ref "signature/nodejs-java/developer-guide/basic-usage/get-supported-document-formats.md" >}}) that allow adding electronic signatures by following the below steps:

* Call static function [GetSupportedFileTypes](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/filetype/getsupportedfiletypes) of [FileType](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/filetype) class;
* Enumerate through the collection of [FileType](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/filetype) objects.

The following code sample demonstrates how to get supported file formats list.

```javascript
    const supportedFileTypes = signatureLib.FileType.getSupportedFileTypes().toArray();

    supportedFileTypes.forEach((fileType) => {
        console.log('\n' + fileType.getExtension());
    });
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
