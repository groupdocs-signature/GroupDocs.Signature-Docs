---
id: sign-document-with-text-signature-advanced
url: signature/net/sign-document-with-text-signature-advanced
title: Sign document with Text signature - advanced
linkTitle: ✎ Text
weight: 14
description: " This article explains how to sign document with Text electronic signatures using advanced options with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions) class to specify additional options for text signature to specify following signature appearance

* signature alignment ([HorizontalAlignment](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/horizontalalignment), [VerticalAlignment](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/verticalalignment))
* margins ([Margin](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/margin))
* border and background settings ([Border,](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/border) [Background](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/background))
* font and colors ([Font](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/font), [Forecolor](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/forecolor))
* text signature implementation ([stamp, text as image, watermark, annotation, shaped](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/signatureimplementation) etc)

Here are the steps to add Text signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions) object with all required additional options .
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to add Text signature to document with advanced setup and analyzing result of method. See [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult)

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    TextSignOptions options = new TextSignOptions("John Smith")
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
        // adjust signature appearance
        // setup signature border
        Border = new Border()
        {
            Color = Color.DarkGreen,
            DashStyle = DashStyle.DashLongDashDot,
            Transparency = 0.5,
            Visible = true,
            Weight = 2
        },
        // set text color and Font
        ForeColor = Color.Red,
        Font = new SignatureFont { Size = 12, FamilyName = "Comic Sans MS" },
        // setup background
        Background = new Background()
        {
            Color = Color.LimeGreen,
            Transparency = 0.5,
            Brush = new LinearGradientBrush(Color.LimeGreen, Color.DarkGreen)
        },
        // set rotation
        RotationAngle = 45,
        // set alternative signature implementation on document page
        SignatureImplementation = TextSignatureImplementation.Image

    };
    // set up shadow options for text
    TextShadow shadow = new TextShadow()
    {
        Color = Color.OrangeRed,
        Angle = 135,
        Blur = 5,
        Distance = 4,
        Transparency = 0.2
    };
    //add text shadow to signature extensions
    options.Extensions.Add(shadow);
    // sign document to file
    SignResult signResult = signature.Sign("signedSample.pdf", options);
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

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
