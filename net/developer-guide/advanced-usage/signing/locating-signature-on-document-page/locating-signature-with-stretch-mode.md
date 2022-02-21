---
id: locating-signature-with-stretch-mode
url: signature/net/locating-signature-with-stretch-mode
title: Locating signature with stretch mode
weight: 3
description: " This article explains how to use stretch mode values to adjust signature area positions on document page with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides ability to stretch signature area along page width or height. Use enumeration [StretchMode](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/stretchmode) contains following values

* [None](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/stretchmode) - no stretch will be applied
* [PageWidth](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/stretchmode) -  to stretch signature area along page width
* [PageHeight](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/stretchmode) - to stretch signature area along page height
* [PageArea](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/stretchmode) - to stretch signature area along page width and height

Here are the steps to use stretch mode with adding text or images signatures into document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [TextSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textsignoptions) or [ImageSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions)  object with all required additional options and setup [Stretch](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions/properties/stretch) property
* Call [Sign](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/sign) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and the instance of signature options ([ImageSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions) for example) to it.

## Locate Signature Area with Stretch Mode

This example shows how to locate signature with stretch mode.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // define several signature options of different types and settings
    TextSignOptions textOptions = new TextSignOptions("This is test message")
    {
        AllPages = true,
        VerticalAlignment = VerticalAlignment.Top,
        Margin = new Padding(50),
        Stretch = StretchMode.PageWidth
    };
    BarcodeSignOptions barcodeOptions = new BarcodeSignOptions("123456")
    {
        AllPages = true,
        EncodeType = BarcodeTypes.Code128,
        VerticalAlignment = VerticalAlignment.Bottom,
        Margin = new Padding(50),
        Stretch = StretchMode.PageWidth
    };
    ImageSignOptions imageOptions = new ImageSignOptions()
    {
        AllPages = true,
        Stretch = StretchMode.PageHeight,
        HorizontalAlignment = HorizontalAlignment.Right,
        ImageFilePath = Constants.ImageHandwrite
    };

    // define list of signature options
    List<SignOptions> listOptions = new List<SignOptions>();
    listOptions.Add(textOptions);
    listOptions.Add(barcodeOptions);
    listOptions.Add(imageOptions);
    // sign document to file
    signature.Sign("signed.pdf", listOptions);
}
```


