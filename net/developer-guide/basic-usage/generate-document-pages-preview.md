---
id: generate-document-pages-preview
url: signature/net/generate-document-pages-preview
title: Generate document pages preview
weight: 6
description: "This topic explains how to get document pages preview as images with various options by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [PreviewOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/previewoptions) class to specify different options to manage document pages preview generation process.  
  
Here are the steps to generate document preview with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [PreviewOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/previewoptions) object with:
* delegate for each page stream creation (see event handler [CreatePageStream](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/createpagestream));
* image preview format - PNG / JPG / BMP,
* page numbers to process;
* custom size of preview images (if needed).
{{< alert style="info" >}}
Stream that were created by [CreatePageStream](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/createpagestream) delegate will be disposed automatically once after generation of preview image. If you need to implement custom image preview stream disposing you have to pass additional argument [ReleaseStream](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/releasepagestream) to clean up resources.  
{{< /alert >}}
* Call [GeneratePreview](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/generatepreview)method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [PreviewOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/previewoptions) to it.

## CreatePageStream delegate implementation

GroupDocs.Signature expects [CreatePageStream](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/createpagestream) delegate to obtain each page stream for image preview generation process

```csharp
private static Stream CreatePageStream(int pageNumber)
{
    string imageFilePath = Path.Combine("GeneratePreviewFolder", "image-" + pageNumber.ToString() + ".jpg");
    var folder = Path.GetDirectoryName(imageFilePath);
    if(!Directory.Exists(folder))
    {
        Directory.CreateDirectory(folder);
    }
    return new System.IO.FileStream(imageFilePath, FileMode.Create);
}
```

## ReleasePageStream delegate implementation

```csharp
private static void ReleasePageStream(int pageNumber, Stream pageStream)
{
     pageStream.Dispose();
     string imageFilePath = Path.Combine("GeneratePreviewFolder", "image-" + pageNumber.ToString() + ".jpg");
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

private static Stream CreatePageStream(int pageNumber)
{
    string imageFilePath = Path.Combine("GeneratePreviewFolder", "image-" + pageNumber.ToString() + ".jpg");
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

private static Stream CreatePageStream(int pageNumber)
{
    string imageFilePath = Path.Combine("GeneratePreviewFolder", "image-" + pageNumber.ToString() + ".jpg");
    var folder = Path.GetDirectoryName(imageFilePath);
    if(!Directory.Exists(folder))
    {
        Directory.CreateDirectory(folder);
    }
    return new System.IO.FileStream(imageFilePath, FileMode.Create);
}

private static void ReleasePageStream(int pageNumber, Stream pageStream)
{
     pageStream.Dispose();
     string imageFilePath = Path.Combine("GeneratePreviewFolder", "image-" + pageNumber.ToString() + ".jpg");
     Console.WriteLine("Image file {0} is ready for preview", imageFilePath);
}
```


