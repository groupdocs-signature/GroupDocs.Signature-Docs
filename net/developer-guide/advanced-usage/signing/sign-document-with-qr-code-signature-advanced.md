---
id: sign-document-with-qr-code-signature-advanced
url: signature/net/sign-document-with-qr-code-signature-advanced
title: Sign document with QR-code signature - advanced
linkTitle: ✎ QR Code
weight: 11
description: " This article explains how to sign document with QR-code electronic signatures using extended options with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
GroupDocs.Signature provides [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) class to specify additional options for QR-code signature with following signature appearance

* signature alignment ([HorizontalAlignment](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/horizontalalignment), [VerticalAlignment](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/verticalalignment))
* margins ([Margin](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/margin))
* border and background settings ([Border,](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/border) [Background](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/background))
* font and colors ([Font](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/font), [Forecolor](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/forecolor))

Here are the steps to add QR-code signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) object with all required additional options.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to add Barcode signature to document. See [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult)

```csharp
 using (Signature signature = new Signature("sample.docx"))
 {
     // create QRCode option with predefined QRCode text
     QrCodeSignOptions options = new QrCodeSignOptions("12345678")
     {
         // setup QRCode encoding type
         EncodeType = QrCodeTypes.QR,
         // set signature position
         Left = 100,
         Top = 100,
         // set signature alignment
         // when VerticalAlignment is set the Top coordinate will be ignored.
         // Use Margin properties Top, Bottom to provide vertical offset
         VerticalAlignment = VerticalAlignment.Top,
         // when HorizontalAlignment is set the Left coordinate will be ignored.
         // Use Margin properties Left, Right to provide horizontal offset
         HorizontalAlignment = HorizontalAlignment.Right,
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
         }
     };
     // sign document to file
     SignResult signResult = signature.Sign("signed.docx", options);
     Console.WriteLine("\nList of newly created signatures:");
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

To generate QR codes and/or sign your files with QR codes for free, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.