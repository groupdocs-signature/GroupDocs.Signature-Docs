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

```csharp
public static void GetPreview()
{
    // create options
    QrCodeSignOptions signOptions = new QrCodeSignOptions
    {
        EncodeType = QrCodeTypes.QR,
        // setup Data property with Address object
        Data = new GroupDocs.Signature.Domain.Extensions.Address()
        {
            Street = "221B Baker Street",
            City = "London",
            State = "NW",
            ZIP = "NW16XE",
            Country = "England"
        },
        // set right bottom corner
        HorizontalAlignment = HorizontalAlignment.Left,
        VerticalAlignment = VerticalAlignment.Center,
        Width = 100,
        Height = 100,
        Margin = new Padding(10)
    };

    // create signature preview options object
    PreviewSignatureOptions previewOption = new PreviewSignatureOptions(signOptions, CreateSignatureStream, ReleaseSignatureStream)
    {
        SignatureId = Guid.NewGuid().ToString(),
        PreviewFormat = PreviewSignatureOptions.PreviewFormats.JPEG,
    };
    // generate preview
    Signature.GenerateSignaturePreview(previewOption);
}

private static Stream CreateSignatureStream(PreviewSignatureOptions previewOptions)
{
    SignOptions signOptions = previewOptions.SignOptions;
    string imageFilePath = $"signature-{previewOptions.SignatureId}-{previewOptions.SignOptions.GetType().Name}.jpg";
    return new FileStream(imageFilePath, FileMode.Create);
}

private static void ReleaseSignatureStream(PreviewSignatureOptions previewOptions, Stream signatureStream)
{
    signatureStream.Dispose();
    Console.WriteLine($"Signature {previewOptions.SignatureId}-{previewOptions.SignOptions.GetType().Name} is ready for preview");
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
