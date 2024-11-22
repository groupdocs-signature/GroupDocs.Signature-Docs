---
id: generating-document-preview-advanced
url: signature/net/generating-document-preview-advanced
title: Generating document preview - advanced
weight: 1
description: "This article shows how to generate document pages preview with advanced options."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate document pages preview using C#    
        description: Getting document pages images using C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to obtain document page as image with C# 
        description: Getting document pages saved as images of various types in C#
        steps:
        - name: Implement delegates to create and release image stream for each page.
          text: We don't know how you are going to process and release generated previews, so you need to provide CreatePageStream and ReleasePageStream methods. 
        - name: Load particular file of supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide preview options. 
          text: Instantiate PreviewOptions object. Set up all important properties especially CreatePageStream and ReleasePageStream.
        - name: Get pages images
          text: Invoke GeneratePreview method passing preview options and save pages images by method defined in CreatePageStream method.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [PreviewOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewoptions) class to specify different options to manage document pages preview generation process. Since 19.12 version there's ability to hide signatures from documents. Using property [HideSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewoptions/hidesignatures) of [PreviewOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewoptions) will allow to hide signatures from document preview.  
  
Here are the steps to generate document preview with GroupDocs.Signature with hidden signatures:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [PreviewOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewoptions) object with:
* delegate for each page stream creation (see event handler [CreatePageStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/createpagestream));  
* property [HideSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewoptions/hidesignatures) set to true;
* image preview format - PNG / JPG / BMP;
* page numbers to process;
* custom size of preview images (if needed).  
{{< alert style="info" >}}
Stream that were created by [CreatePageStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/createpagestream) delegate will be disposed automatically once after generation of preview image. If you need to implement custom image preview stream disposing you have to pass additional argument [ReleasePageStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/releasepagestream) to clean up resources.  
{{< /alert >}}  
* Call [GeneratePreview](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/generatepreview) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [PreviewOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewoptions) to it.

## Generate document preview without signatures on it

```csharp
public static void GetPreview()
{
    // The path to the documents directory.
    string filePath = Constants.SAMPLE_WORD_SIGNED;
    using (Signature signature = new Signature(filePath))
    {
        // create preview options object
        PreviewOptions previewOption = new PreviewOptions(CreatePageStream, ReleasePageStream)
        {
            PreviewFormat = PreviewOptions.PreviewFormats.JPEG,
            // set property to hide all known signatures
            HideSignatures = true
        };
        // generate preview
        signature.GeneratePreview(previewOption);
    }
}

private static Stream CreatePageStream(PreviewPageData pageData)
{
    string imageFilePath = Path.Combine("GeneratePreviewFolder", "image-" + pageData.PageNumber.ToString() + ".jpg");
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
    string imageFilePath = Path.Combine("GeneratePreviewFolder", "image-" + pageData.PageNumber.ToString() + ".jpg");
    Console.WriteLine("Image file {0} is ready for preview", imageFilePath);
}
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.