---
id: generate-document-pages-preview
url: signature/nodejs-java/generate-document-pages-preview
title: Generate document pages preview
weight: 6
description: "This topic explains how to get document pages preview as images with various options by GroupDocs.Signature API."
keywords: preview as images, get document pages preview as images
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate documents preview using Node.Js    
        description: Getting pages previews of document pages using Node.Js language and GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to generate previews of particular document pages with Node.Js 
        description: Get images with pages content of various document types in Node.Js
        steps:
        - name: Implement delegates to create and release image stream for each page.
          text: We don't know how you are going to process and release images, so you need to provide CreatePageStream and ReleasePageStream delegates. 
        - name: Load particular file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide preview options. 
          text: Set type of result image in PreviewOptions instance.
        - name: Get pages images
          text: Invoke GeneratePreview method passing options and save page images by method from CreatePageStream delegate.
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) provides [PreviewOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/previewoptions) class to specify different options to manage document pages preview generation process. The feature also supports archives previewing.
  
Here are the steps to generate document preview with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [PreviewOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/previewoptions) object with:
* delegate for each page stream creation (see event handler [CreatePageStream](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/createpagestream));
* image preview format - PNG / JPG / BMP,
* page numbers to process;
* custom size of preview images (if needed).
{{< alert style="info" >}}
Stream that were created by [CreatePageStream](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/createpagestream) delegate will be disposed automatically once after generation of preview image. If you need to implement custom image preview stream disposing you have to pass additional argument [ReleaseStream](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/releasepagestream) to clean up resources.  
{{< /alert >}}
* Call [GeneratePreview](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature/generatepreview) method of [Signature](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature/signature) class instance and pass [PreviewOptions](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/previewoptions) to it.

## CreatePageStream delegate implementation

GroupDocs.Signature expects [CreatePageStream](https://reference.groupdocs.com/signature/nodejs-java/groupdocs.signature.options/createpagestream) delegate to obtain each page stream for image preview generation process

```javascript
  function generatePreview() {
    // The path to the documents directory.
    const filePath = Constants.SAMPLE_PDF; // Assuming Constants.SAMPLE_PDF is defined elsewhere

    const signature = new signatureLib.Signature(filePath);

    // Create preview options object
    const previewOption = new signatureLib.PreviewOptions(createPageStream, releasePageStream);
    previewOption.setPreviewFormat(PreviewOptions.PreviewFormats.JPEG);

    // Generate preview
    signature.generatePreview(previewOption);
  }

  function createPageStream(pageNumber) {
    const imageFilePath = path.join(Constants.OutputPath, 'GeneratePreviewFolder', `image-${pageNumber}.jpg`);
    const folder = path.dirname(imageFilePath);

    if (!fs.existsSync(folder)) {
      fs.mkdirSync(folder, { recursive: true });
    }

    return fs.createWriteStream(imageFilePath);
  }

  function releasePageStream(pageNumber, pageStream) {
    pageStream.end();
    const imageFilePath = path.join(Constants.OutputPath, 'GeneratePreviewFolder', `image-${pageNumber}.jpg`);
    console.log(`Image file ${imageFilePath} is ready for preview`);
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
