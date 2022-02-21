---
id: esign-document-with-image-signature
url: signature/net/esign-document-with-image-signature
title: eSign document with Image signature
weight: 4
description: "This article demonstrates how to add Image signature on document page with GroupDocs.Signature."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
## What is a Image Signature?

An **image** as signature is alternative way to put any presenting data in a visual form. This electronic signature type allows to create custom image with company logo, sender' initials, names or make a company stamp icon in it,  
![Images](signature/net/images/esign-document-with-image-signature.png)

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [ImageSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions) class to specify different settings for Image signature such as image content by file or stream, location, colors and advanced effects.

Here are the steps to create Image signature on document page:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [ImageSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions) object according to your requirements and specify Image signature options;
* Call [Sign](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/sign) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [ImageSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions) to it.

## How to eSign document with Image signature

This example shows how to sign PDF with Image signature.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    ImageSignOptions options = new ImageSignOptions("signature.jpg")
    {
        // set signature position
        Left = 100,
        Top = 100,
        //
        AllPages = true
    };
    signature.Sign("SampleSigned.pdf", options);
}
```


