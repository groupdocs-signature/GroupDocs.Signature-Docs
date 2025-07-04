---
id: generate-signature-preview
url: signature/net/generate-signature-preview
title: Generate signature preview
weight: 7
description: "This topic explains how to get document signature preview in c#"
keywords: signature preview, how to get signature preview
productName: GroupDocs.Signature for .NET 
toc: True
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) [PreviewSignatureOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewsignatureoptions) class to specify different options to manage signatures preview generation process.  
  
Here are the steps how to generate signature preview with GroupDocs.Signature:

* Instantiate the required [SignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions) object with the settings you want to generate the preview
* Instantiate the [PreviewSignatureOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewsignatureoptions) object with:
* delegate for signature stream creation (see event handler [CreateSignatureStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/createsignaturestream));
* image preview format - PNG / JPG / BMP,
* unique signature identifier.

{{< alert style="info" >}}
Stream that were created by [CreateSignatureStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/createsignaturestream) delegate will be disposed automatically once after generation of preview image. If you need to implement custom image preview stream disposing you have to pass additional argument [ReleaseSignatureStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/releasesignaturestream) to clean up resources.  
{{< /alert >}}
* Call the static method [GenerateSignaturePreview](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/generatesignaturepreview) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) and pass [PreviewSignatureOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewsignatureoptions) to it.

## Generate signature preview

This example demonstrates how to generate a preview image for a QR Code signature using GroupDocs.Signature with default sizes.

```csharp
public static void GetPreview()
{
    // Create QR code sign options
    QrCodeSignOptions signOptions = new QrCodeSignOptions
    {
        EncodeType = QrCodeTypes.QR,
        Data = new GroupDocs.Signature.Domain.Extensions.Address
        {
            Street = "221B Baker Street",
            City = "London",
            State = "NW",
            ZIP = "NW16XE",
            Country = "England"
        },
        HorizontalAlignment = HorizontalAlignment.Left,
        VerticalAlignment = VerticalAlignment.Center,
        Margin = new Padding(10)
    };

    // Create signature preview options
    PreviewSignatureOptions previewOption = new PreviewSignatureOptions(
        signOptions, 
        CreateSignatureStream, 
        ReleaseSignatureStream
    )
    {
        SignatureId = Guid.NewGuid().ToString(),
        PreviewFormat = PreviewSignatureOptions.PreviewFormats.JPEG
    };

    // Generate signature preview
    Signature.GenerateSignaturePreview(previewOption);
}

private static Stream CreateSignatureStream(PreviewSignatureOptions previewOptions)
{
    string imageFilePath = 
        $"signature-{previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name}.jpg";

    return new FileStream(imageFilePath, FileMode.Create);
}

private static void ReleaseSignatureStream(PreviewSignatureOptions previewOptions, 
    Stream signatureStream)
{
    signatureStream.Dispose();
    Console.WriteLine(
        $"Signature {previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name} is ready for preview"
    );
}
```

##  Adaptive rendering for QR Code signature previews

{{< alert style="info" >}}
If the specified width and height are not appropriate for generating a readable QR Code preview, the system will automatically use default size values. These defaults are chosen as the nearest optimal dimensions to ensure the QR Code remains clear and scannable. 
{{< /alert >}}

This example demonstrates how to generate a preview image for a QR Code signature using GroupDocs.Signature. You’ll see how to configure the QR Code’s appearance, including size, color, and text alignment, and how to generate and save the preview image stream.

```csharp
public static void GetPreview()
{
    // Initialize QR Code signing options
    QrCodeSignOptions qrSignOptions = new QrCodeSignOptions("GROUP DOCS", QrCodeTypes.QR)
    {
        Width = 250,                          // Width of the QR code
        Height = 270,                         // Height of the QR code
        ForeColor = Color.Red,                // Color of the QR code
        CodeTextAlignment = CodeTextAlignment.Below, // Text alignment relative to the QR code
        Text = "GROUP DOCS"                   // Text displayed below the QR code
    };

    // Configure preview generation options for the QR code signature
    PreviewSignatureOptions previewOptions = new PreviewSignatureOptions(
        qrSignOptions,
        CreateSignatureStream,   // Delegate to create the stream
        ReleaseSignatureStream   // Delegate to release the stream
    )
    {
        SignatureId = Guid.NewGuid().ToString(),  // Unique identifier for the preview
        PreviewFormat = PreviewSignatureOptions.PreviewFormats.PNG  // Output format of preview
    };

    // Generate the signature preview image
    Signature.GenerateSignaturePreview(previewOptions);
}

private static Stream CreateSignatureStream(PreviewSignatureOptions previewOptions)
{
    string imageFilePath = 
        $"signature-{previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name}.jpg";

    return new FileStream(imageFilePath, FileMode.Create);
}

private static void ReleaseSignatureStream(PreviewSignatureOptions previewOptions, 
    Stream signatureStream)
{
    signatureStream.Dispose();
    Console.WriteLine(
        $"Signature {previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name} is ready for preview"
    );
}
```

##  Adaptive rendering for Barcode signature previews

{{< alert style="info" >}}
When the width and height provided for the Barcode preview are not suitable, the preview generation will fall back to default size values. These defaults are selected to produce a barcode image that is readable and properly rendered.
{{< /alert >}}

This section shows how to create a preview for a Barcode signature. The example covers setting barcode properties such as type, size, and color, as well as generating the preview image with a custom stream handler.

```csharp
public static void GetPreview()
{
    // Initialize QR Code signing options
    BarcodeSignOptions signOptions = new BarcodeSignOptions("GROUP DOCS", BarcodeTypes.MaxiCode)
    {
        Width = 400,                          // Width of the Barcode code
        Height = 400,                         // Height of the Barcode code
        ForeColor = Color.Red,                // Color of the Barcode code
        CodeTextAlignment = CodeTextAlignment.Below, // Text alignment relative to the Barcode code
        Text = "GROUP DOCS"                   // Text displayed below the Barcode code
    };

    // Configure preview generation options for the QR code signature
    PreviewSignatureOptions previewOptions = new PreviewSignatureOptions(
        qrSignOptions,
        CreateSignatureStream,   // Delegate to create the stream
        ReleaseSignatureStream   // Delegate to release the stream
    )
    {
        SignatureId = Guid.NewGuid().ToString(),  // Unique identifier for the preview
        PreviewFormat = PreviewSignatureOptions.PreviewFormats.PNG  // Output format of preview
    };

    // Generate the signature preview image
    Signature.GenerateSignaturePreview(previewOptions);
}

private static Stream CreateSignatureStream(PreviewSignatureOptions previewOptions)
{
    string imageFilePath = 
        $"signature-{previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name}.jpg";

    return new FileStream(imageFilePath, FileMode.Create);
}

private static void ReleaseSignatureStream(PreviewSignatureOptions previewOptions, 
    Stream signatureStream)
{
    signatureStream.Dispose();
    Console.WriteLine(
        $"Signature {previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name} is ready for preview"
    );
}
```

## Rotate Barcode and QR Code previews

This example demonstrates how to apply rotation to Barcode and QR Code signature previews. Rotation can help fit signatures into specific layout requirements or create visual effects.

```csharp
public static void GetPreview()
{
    // Initialize Barcode signing options
    BarcodeSignOptions barcodeSignOptions = new BarcodeSignOptions("GROUP DOCS", BarcodeTypes.MaxiCode)
    {
        Width = 400,                               // Width of the barcode
        Height = 400,                              // Height of the barcode
        ForeColor = Color.Red,                     // Foreground color of the barcode
        CodeTextAlignment = CodeTextAlignment.Below,  // Position of the text relative to the barcode
        Text = "GROUP DOCS",                       // Text displayed with the barcode
        RotationAngle = 45                         // Rotate the barcode by 45 degrees
    };

    // Configure preview generation options for the QR code signature
    PreviewSignatureOptions previewOptions = new PreviewSignatureOptions(
        qrSignOptions,
        CreateSignatureStream,   // Delegate to create the stream
        ReleaseSignatureStream   // Delegate to release the stream
    )
    {
        SignatureId = Guid.NewGuid().ToString(),  // Unique identifier for the preview
        PreviewFormat = PreviewSignatureOptions.PreviewFormats.PNG  // Output format of preview
    };

    // Generate the signature preview image
    Signature.GenerateSignaturePreview(previewOptions);
}

private static Stream CreateSignatureStream(PreviewSignatureOptions previewOptions)
{
    string imageFilePath = 
        $"signature-{previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name}.jpg";

    return new FileStream(imageFilePath, FileMode.Create);
}

private static void ReleaseSignatureStream(PreviewSignatureOptions previewOptions, 
    Stream signatureStream)
{
    signatureStream.Dispose();
    Console.WriteLine(
        $"Signature {previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name} is ready for preview"
    );
}
```

## Transparency for Barcode/QR previews

This snippet shows how to set the transparency level of Barcode or QR Code previews, allowing you to customize the signature's visual blending with the underlying document.

```csharp
public static void GetPreview()
{
    // Initialize barcode signing options with Codabar type
    BarcodeSignOptions barcodeSignOptions = new BarcodeSignOptions("GROUP DOCS", BarcodeTypes.Codabar)
    {
        Width = 400,                               // Width of the barcode preview
        Height = 400,                              // Height of the barcode preview
        ForeColor = Color.Red,                     // Foreground color of the barcode bars
        CodeTextAlignment = CodeTextAlignment.Below,  // Position text below the barcode
        Text = "GROUP DOCS",                       // Text displayed with the barcode
        Transparency = 0.5                         // Set barcode background transparency (50%)
    };

    // Configure preview generation options for the QR code signature
    PreviewSignatureOptions previewOptions = new PreviewSignatureOptions(
        qrSignOptions,
        CreateSignatureStream,   // Delegate to create the stream
        ReleaseSignatureStream   // Delegate to release the stream
    )
    {
        SignatureId = Guid.NewGuid().ToString(),  // Unique identifier for the preview
        PreviewFormat = PreviewSignatureOptions.PreviewFormats.PNG  // Output format of preview
    };

    // Generate the signature preview image
    Signature.GenerateSignaturePreview(previewOptions);
}

private static Stream CreateSignatureStream(PreviewSignatureOptions previewOptions)
{
    string imageFilePath = 
        $"signature-{previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name}.jpg";

    return new FileStream(imageFilePath, FileMode.Create);
}

private static void ReleaseSignatureStream(PreviewSignatureOptions previewOptions, 
    Stream signatureStream)
{
    signatureStream.Dispose();
    Console.WriteLine(
        $"Signature {previewOptions.SignatureId}-" +
        $"{previewOptions.SignOptions.GetType().Name} is ready for preview"
    );
}
```

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/net/developer-guide/advanced-usage/_index.md" >}}).

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
