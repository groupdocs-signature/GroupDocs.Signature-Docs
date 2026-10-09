---
id: net-standard-2-0-api-limitations
url: signature/net/net-standard-2-0-api-limitations
title: .NET Standard 2.0 API Limitations
weight: 1
description: "This section describes GroupDocs.Signature for .NET limitations when using under .NET Standard 2.0 environment"
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
{{< alert style="warning" >}}
Starting with version 26.9, GroupDocs.Signature for .NET no longer ships a .NET Standard build. On Linux and macOS use the .NET 6, .NET 8 or .NET 10 build; see [System Requirements]({{< ref "signature/net/getting-started/system-requirements.md" >}}).
{{< /alert >}}

## Linux and macOS

The .NET 6, .NET 8 and .NET 10 builds use System.Drawing for some operations. On Linux and macOS these need libgdiplus (see the recommendations below) and the `System.Drawing.EnableUnixSupport` switch in your application project:

```xml
<ItemGroup>
  <RuntimeHostConfigurationOption Include="System.Drawing.EnableUnixSupport" Value="true" />
</ItemGroup>
```

Without them, these operations throw `GroupDocsSignatureException` with the message "The type initializer for 'Gdip' threw an exception":

- stamp signatures, and text signatures drawn as an image (`TextSignatureImplementation.Image`);
- barcode, QR-code and image signatures with a visible border, transparency or image effects (grayscale, brightness, contrast, gamma), and QR-codes with a logo;
- every signature in presentations, such as PPTX, and in raster images (PNG, JPG, BMP, GIF, TIFF, WEBP);
- previews of text and stamp signatures, and document previews of presentations.

Text and digital signatures in PDF and Word documents, plain barcode, QR-code and image signatures in these documents, and document previews of PDF, Word and PNG documents work without libgdiplus.

Install the fonts your documents and signatures use as well. In PDF documents a font that is not installed stops signing with a "Font ... was not found" message. The Microsoft core families Arial, Times New Roman and Courier New are the exception: they are the default fonts of text signatures and of the digital signature appearance, and when one is missing, an installed Liberation or DejaVu font is used instead and a warning is written to the log. Version 26.9 and earlier required these fonts under their own names, for example from `ttf-mscorefonts-installer`.

## Limitations of .NET Standard 2.0 compared to .NET API

### Limitations

1. Because of the lack of Windows fonts in target OS (Android, macOS, Linux, etc), fonts used in documents are substituted with available fonts, this might lead to inaccurate document layout when rendering the document to PNG, JPG, and PDF.
2. If GroupDocs.Signature for .NET Standard is intended to be used in a Linux environment, an additional NuGet package should be referenced to make it work correctly with graphics: [SkiaSharp.NativeAssets.Linux](https://www.nuget.org/packages/SkiaSharp.NativeAssets.Linux) for Ubuntu (it also should work on most Debian-based Linux distributions) or [Goelze.SkiaSharp.NativeAssets.AlpineLinux](https://www.nuget.org/packages/Goelze.SkiaSharp.NativeAssets.AlpineLinux) for Alpine Linux.  

#### Recommendations

When using GroupDocs.Signature in a non-Windows environment in order to improve rendering results we do recommend installing the following packages:

1. libgdiplus - is the Mono library that provides a GDI+-compatible API on non-Windows operating systems.
2. libc6-dev - package contains the symlinks, headers, and object files needed to compile and link programs which use the standard C library.
3. ttf-mscorefonts-installer - package with Microsoft compatible fonts.

To install packages on Debian-based Linux distributions use [apt-get](https://wiki.debian.org/apt-get) utility:

1. sudo apt-get install libgdiplus
2. sudo apt-get install libc6-dev
3. sudo apt-get install ttf-mscorefonts-installer
