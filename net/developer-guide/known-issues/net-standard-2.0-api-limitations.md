---
id: net-standard-2-0-api-limitations
url: signature/net/net-standard-2-0-api-limitations
title: Linux and macOS known issues
weight: 1
description: "Known issues of GroupDocs.Signature for .NET on Linux and macOS: System.Drawing and libgdiplus, missing fonts, and the .NET Standard build that was removed in 26.9"
keywords: GroupDocs.Signature for .NET, Linux, macOS, libgdiplus, System.Drawing.EnableUnixSupport, fonts, .NET Standard
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
{{< alert style="warning" >}}
Starting with version 26.9, GroupDocs.Signature for .NET no longer ships a .NET Standard build. On Linux and macOS use the .NET 6, .NET 8 or .NET 10 build; see [System Requirements]({{< ref "signature/net/getting-started/system-requirements.md" >}}).
{{< /alert >}}

## Linux and macOS

The .NET 6, .NET 8 and .NET 10 builds use System.Drawing for some image operations, for example image, stamp, barcode and QR-code signatures. On Linux and macOS this needs libgdiplus (see the recommendations below) and the `System.Drawing.EnableUnixSupport` switch in your application project:

```xml
<ItemGroup>
  <RuntimeHostConfigurationOption Include="System.Drawing.EnableUnixSupport" Value="true" />
</ItemGroup>
```

Without them, these operations throw `GroupDocsSignatureException` with the message "The type initializer for 'Gdip' threw an exception". Install the fonts your documents and signatures use as well: a font that is not installed can also stop signing, with a "Font ... was not found" message.

## Fonts

Fonts that a document uses but that are not installed on the machine are substituted with available fonts. This can change the layout when a document is rendered to PNG, JPG or PDF, so install the fonts your documents use.

### Recommendations

When using GroupDocs.Signature in a non-Windows environment in order to improve rendering results we do recommend installing the following packages:

1. libgdiplus - is the Mono library that provides a GDI+-compatible API on non-Windows operating systems.
2. libc6-dev - package contains the symlinks, headers, and object files needed to compile and link programs which use the standard C library.
3. ttf-mscorefonts-installer - package with Microsoft compatible fonts.

To install packages on Debian-based Linux distributions use [apt-get](https://wiki.debian.org/apt-get) utility:

1. sudo apt-get install libgdiplus
2. sudo apt-get install libc6-dev
3. sudo apt-get install ttf-mscorefonts-installer
