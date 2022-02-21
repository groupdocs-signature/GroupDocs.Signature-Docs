---
id: sign-document-with-image-signature-advanced
url: signature/net/sign-document-with-image-signature-advanced
title: Sign document with Image signature - advanced
weight: 9
description: " This article explains how to sign document with Image electronic signatures using extended options with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [ImageSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions) class to specify different options for Image signature as follow

* signature alignment ([HorizontalAlignment](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions/properties/horizontalalignment), [VerticalAlignment](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions/properties/verticalalignment))
* margins ([Margin](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions/properties/margin))
* additional extensions and appearances ([Extensions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/signoptions/properties/extensions), [Appearance](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/signoptions/properties/appearance))

Here are the steps to add Image signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [ImageSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions) object according to your requirements and specify image signature options.
* Call [Sign](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/sign) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [ImageSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/imagesignoptions) to it.
* Analyze [SignResult](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to specify different Image signature options. See [SignResult](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/signresult)

```csharp
using (Signature signature = new Signature("sample.xlsx"))
{
    ImageSignOptions options = new ImageSignOptions("sample.jpg")
    {
        // set signature position
        Left = 100,
        Top = 100,
        // set signature rectangle
        Width = 100,
        Height = 30,
        // set signature alignment
        // when VerticalAlignment is set the Top coordinate will be ignored.
        // Use Margin properties Top, Bottom to provide vertical offset
        VerticalAlignment = Domain.VerticalAlignment.Top,
        // when HorizontalAlignment is set the Left coordinate will be ignored.
        // Use Margin properties Left, Right to provide horizontal offset
        HorizontalAlignment = Domain.HorizontalAlignment.Right,
        Margin = new Padding() { Top = 20, Right = 20 },
        // set rotation
        RotationAngle = 45,
        // setup image additional appearance as Brightness and Border
        Appearance = new ImageAppearance()
        {
            Brightness = 0.9f,
            Border = new Border()
            {
                Color = Color.DarkGreen,
                DashStyle = DashStyle.DashLongDashDot,
                Transparency = 0.5,
                Visible = true,
                Weight = 2
            },
        }
    };

    // sign document to file
    SignResult signResult = signature.Sign("sgnedSample.xlsx", options);
    Console.WriteLine("List of newly created signatures:");
    int number = 1;
    foreach (BaseSignature temp in signResult.Succeeded)
    {
        Console.WriteLine($"Signature #{number++}: Type: {temp.SignatureType} Id:{temp.SignatureId}, Location: {temp.Left}x{temp.Top}. Size: {temp.Width}x{temp.Height}");
    }
 }
```


