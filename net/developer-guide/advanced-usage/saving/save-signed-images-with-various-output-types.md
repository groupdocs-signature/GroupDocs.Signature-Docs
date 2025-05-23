---
id: save-signed-images-with-various-output-types
url: signature/net/save-signed-images-with-various-output-types
title: Saving signed images with various output types
weight: 2
description: "This article explains how to save images with various image format types."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
[Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class supports saving of Image signed documents with various image format types and extended options.

Following classes are inherited from base class [SaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/saveoptions) and allows to specify additional output image format settings.

* [BmpSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/bmpsaveoptions) class allows to save signed image document to **BMP** image format and setup additional options ( like compression, resolutions, bits per pixel etc);
* [GifSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/gifsaveoptions) class allows to save signed image document to **GIF**image format and setup additional options ( like compression, resolutions etc);
* [JpegSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/jpegsaveoptions) class allows to save signed image document to **JPEG** image format and setup additional options ( like compression, resolutions, quality etc);
* [PngSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pngsaveoptions) class allows to save signed image document to **PNG** image format and setup additional options ( like bit depth, color type, compression, filters etc);
* [TiffSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/tiffsaveoptions) class allows to save signed image document to **TIFF** image format and setup additional options

Here are the steps to save signed Image document to special image output type with additional settings with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required signature options.
* Instantiate the one of required class of image format save options [BmpSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/bmpsaveoptions), [GifSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/gifsaveoptions), [JpegSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/jpegsaveoptions), [PngSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pngsaveoptions), [TiffSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/tiffsaveoptions) object according to your requirements and specify its properties.  

* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass signatureoptions and [SaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/saveoptions) object to it.

## Save signed image as BMP

```csharp
using (Signature signature = new Signature("sample.jpg"))
{
    QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith")
    {
        EncodeType = QRCodeTypes.QR, Left = 100, Top = 100
    };
    SaveOptions saveOptions;
    // create Bmp save options with advanced settings
    saveOptions = new BmpSaveOptions()
    {
        AddMissingExtenstion = true,
        Compression = BitmapCompression.Rgb,
        HorizontalResolution = 7,
        VerticalResolution = 7,
        BitsPerPixel = 16,
        OverwriteExistingFiles = true
    };
    // sign document to file
    signature.Sign("signedSample", signOptions, saveOptions);
}
```

## Save signed image as GIF

```csharp
using (Signature signature = new Signature("sample.jpg"))
{
    QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith")
    {
        EncodeType = QRCodeTypes.QR, Left = 100, Top = 100
    };
    SaveOptions saveOptions;
    // create Gif save options with advanced settings
    saveOptions = new GifSaveOptions()
    {
        AddMissingExtenstion = true,
        BackgroundColorIndex = 2,
        ColorResolution = 7,
        DoPaletteCorrection = true,
        HasTrailer = true,
        Interlaced = false,
        IsPaletteSorted = true,
        PixelAspectRatio = 24
    };
    // sign document to file
    signature.Sign("SignedSample", signOptions, saveOptions);
}
```

## Save signed image as JPEG

```csharp
using (Signature signature = new Signature("sample.jpg"))
{
    QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith")
    {
        EncodeType = QRCodeTypes.QR, Left = 100, Top = 100
    };
    SaveOptions saveOptions;
    // create Jpeg save options with advanced settings
    saveOptions = new JpegSaveOptions()
    {
        AddMissingExtenstion = true,
        BitsPerChannel = 8,
        ColorType = JpegCompressionColorMode.Rgb,
        Comment = "signed jpeg file",
        CompressionType = JpegCompressionMode.Lossless,
        Quality = 100,
        SampleRoundingMode = JpegRoundingMode.Extrapolate
    };
    // sign document to file
    signature.Sign("SignedSample", signOptions, saveOptions);
}
```

## Save signed image as PNG

```csharp
using (Signature signature = new Signature("sample.jpg"))
{
    QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith")
    {
        EncodeType = QRCodeTypes.QR, Left = 100, Top = 100
    };
    SaveOptions saveOptions;
    // create png save options with advanced settings
    saveOptions = new PngSaveOptions()
    {
        AddMissingExtenstion = true,
        BitDepth = 8,
        ColorType = PngColorType.Grayscale,
        CompressionLevel = 9,
        FilterType = PngFilterType.Adaptive,
        Progressive = true
    };
    // sign document to file
    signature.Sign("SignedSample", signOptions, saveOptions);
}
```

## Save signed image as TIFF

```csharp
using (Signature signature = new Signature("sample.jpg"))
{
    QrCodeSignOptions signOptions = new QrCodeSignOptions("JohnSmith")
    {
        EncodeType = QRCodeTypes.QR, Left = 100, Top = 100
    };
    SaveOptions saveOptions;
    // create tiff save options with advanced settings
    saveOptions = new TiffSaveOptions()
    {
        AddMissingExtenstion = true,
        ExpectedTiffFormat = TiffFormat.TiffNoCompressionBw
    };
    // sign document to file
    signature.Sign("SignedSample", signOptions, saveOptions);
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

To generate image signatures and/or sign your files with them for free, you can use the [Generate Image](https://products.groupdocs.app/signature/generate/image) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.