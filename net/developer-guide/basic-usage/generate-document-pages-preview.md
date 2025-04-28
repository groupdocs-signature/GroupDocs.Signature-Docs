---
id: generate-document-pages-preview
url: signature/net/generate-document-pages-preview
title: Generate document pages preview
weight: 6
description: "This topic explains how to get document pages preview as images with various options by GroupDocs.Signature API."
keywords: preview as images, get document pages preview as images
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate documents preview using C#    
        description: Getting pages previews of document pages using C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to generate previews of particular document pages with C# 
        description: Get images with pages content of various document types in C#
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

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [PreviewOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewoptions) class to specify different options to manage document pages preview generation process. The feature also supports archives previewing.
  
Here are the steps to generate document preview with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [PreviewOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewoptions) object with:
* delegate for each page stream creation (see event handler [CreatePageStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/createpagestream));
* image preview format - PNG / JPG / BMP,
* page numbers to process;
* custom size of preview images (if needed).
{{< alert style="info" >}}
Stream that were created by CreatePageStreamdelegate will be disposed automatically once after generation of preview image. If you need to implement custom image preview stream disposing you have to pass additional argument ReleaseStream to clean up resources.  
{{< /alert >}}
* Call GeneratePreview method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [PreviewOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewoptions) to it.

## CreatePageStream delegate implementation

GroupDocs.Signature expects [CreatePageStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/createpagestream) delegate to obtain each page stream for image preview generation process

```csharp
private static Stream CreatePageStream(PreviewPageData pageData)
{
    string imageName = "image-" + pageData.PageNumber + ".jpg";
    string imageFilePath = Path.Combine("GeneratePreviewFolder", imageName);
    string folder = Path.GetDirectoryName(imageFilePath);
    if(!Directory.Exists(folder))
    {
        Directory.CreateDirectory(folder);
    }
    return new System.IO.FileStream(imageFilePath, FileMode.Create);
}
```

## ReleasePageStream delegate implementation

```csharp
private static void ReleasePageStream(PreviewPageData pageData, Stream pageStream)
{
     pageStream.Dispose();
     string imageName = "image-" + pageData.PageNumber + ".jpg";
     string imageFilePath = Path.Combine("GeneratePreviewFolder", imageName);
     Console.WriteLine("Image file {0} is ready for preview", imageFilePath);
}
```

## Generate document preview from file on local disk

```csharp
public static void GetPreview()
{
    using (Signature signature = new Signature("sample.pdf"))
    {
        // create preview options object
        PreviewOptions previewOption = new PreviewOptions(GeneratePreview.CreatePageStream)
        {
            PreviewFormat = PreviewOptions.PreviewFormats.JPEG,
        };
        // generate preview
        signature.GeneratePreview(previewOption);
    }
}

private static Stream CreatePageStream(PreviewPageData pageData)
{
    string imageName = "image-" + pageData.PageNumber + ".jpg";
    string imageFilePath = Path.Combine("GeneratePreviewFolder", imageName);
    var folder = Path.GetDirectoryName(imageFilePath);
    if(!Directory.Exists(folder))
    {
        Directory.CreateDirectory(folder);
    }
    return new System.IO.FileStream(imageFilePath, FileMode.Create);
}
```

## Generate document preview from stream with custom stream releasing delegate

```csharp
public static void GetPreview()
{
  using (var stream = File.OpenRead("sample.pdf"))
  {
    using (Signature signature = new Signature("sample.pdf"))
    {
        // create preview options object
        PreviewOptions previewOption = new PreviewOptions(GeneratePreview.CreatePageStream)
        {
            PreviewFormat = PreviewOptions.PreviewFormats.JPEG,
        };
        // generate preview
        signature.GeneratePreview(previewOption);
    }
  }
}

private static Stream CreatePageStream(PreviewPageData pageData)
{
    string imageName = "image-" + pageData.PageNumber + ".jpg";
    string imageFilePath = Path.Combine("GeneratePreviewFolder", imageName);
    var folder = Path.GetDirectoryName(imageFilePath);
    if(!Directory.Exists(folder))
    {
        Directory.CreateDirectory(folder);
    }
    return new System.IO.FileStream(imageFilePath, FileMode.Create);
}

private static void ReleasePageStream(PreviewPageData pageData, Stream pageStream)
{        
    pageStream.Dispose();
    string imageName = "image-" + pageData.PageNumber + ".jpg";
    string imageFilePath = Path.Combine("GeneratePreviewFolder", imageName);
    Console.WriteLine("Image file {0} is ready for preview", imageFilePath);
}
```

## Creating a document preview with custom Resolution

```csharp
// The path to the documents
string filePath = "sample.pdf";
using (Signature signature = new Signature(filePath))
{
    int resolution = 96;
    // create preview options object
    // You can reuse CreatePageStream and ReleasePageStream methods from the previous example
    PreviewOptions previewOption = new PreviewOptions(CreatePageStream, ReleasePageStream, resolution)
    {
        PreviewFormat = PreviewOptions.PreviewFormats.JPEG
    };
    // generate preview
    signature.GeneratePreview(previewOption);
}
```

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/net/developer-guide/advanced-usage/_index.md" >}}).

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
