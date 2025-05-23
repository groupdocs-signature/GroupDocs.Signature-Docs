---
id: sign-document-with-image-signature-advanced
url: signature/net/sign-document-with-image-signature-advanced
title: Sign document with Image signature - advanced
linkTitle: ✎ Image
weight: 9
description: " This article explains how to sign document with Image electronic signatures using extended options with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [ImageSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions) class to specify different options for Image signature as follow

* signature alignment ([HorizontalAlignment](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions/horizontalalignment), [VerticalAlignment](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions/verticalalignment))
* margins ([Margin](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions/margin))
* additional extensions and appearances ([Extensions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions/extensions), [Appearance](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions/appearance))

Here are the steps to add Image signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [ImageSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions) object according to your requirements and specify image signature options.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [ImageSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to specify different Image signature options. See [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult)

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
            Brightness = 0.9f          
        },
        Border = new Border()
        {
            Color = Color.DarkGreen,
            DashStyle = DashStyle.DashLongDashDot,
            Transparency = 0.5,
            Visible = true,
            Weight = 2
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