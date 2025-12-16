---
id: verify-digital-signatures-in-image
url: signature/net/verify-digital-signatures-in-image
title: Verify Digital signatures in image
linkTitle: 🛡 Image Digital signatures
weight: 6
description: "This topic explains how to verify digital signatures embedded in images using steganography (LSB technique) with GroupDocs.Signature API."
keywords: digital signature, image signature, steganography, LSB, PNG, JPG, verify image signature
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify digital signatures in images via C#    
        description: Verification of digital signatures embedded in images using steganography in convenient way with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to check are digital signatures valid in images using C# 
        description: Get additional information of digital signatures validation for images in C#
        steps:
        - name: Load image file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide verification options. 
          text: Set demanded data of the ImageDigitalVerifyOptions instance such as password used during signing, detection threshold and full data extraction mode.
        - name: Get verification result
          text: Call method Verify passing options. Obtain verification result whose property IsValid must be true if verification succeed.
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [ImageDigitalVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagedigitalverifyoptions) class to specify different options for verification of digital signatures embedded in images using steganography (LSB - Least Significant Bit technique). Digital signatures are invisibly embedded in image pixels and can be verified using the password that was used during signing.

### Key Features

* **Password-Based Verification**: Verify signatures using the password from signing
* **Detection Thresholds**: Configurable detection threshold for verification (0-100%, default 75%)
* **Full Data Extraction**: Optional full data extraction mode for maximum accuracy
* **Format Support**: Works with PNG and JPG image formats
* **Probability Detection**: Get probability scores when using full extraction mode

### Requirements

* **Password**: Must match the one used during signing (case-sensitive, minimum 4 characters)
* **Supported Formats**: PNG and JPG/JPEG (BMP not supported)
* **Image**: Must have been signed with ImageDigitalSignOptions

Here are the steps to verify Digital signature in an image with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source image path as a constructor parameter.
* Instantiate the [ImageDigitalVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagedigitalverifyoptions) object according to your requirements and specify verification options such as password, detection threshold, and full data extraction mode.
* Call [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [ImageDigitalVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagedigitalverifyoptions) to it.

This example shows how to verify Digital signature in an image.

```csharp
using (Signature signature = new Signature("signed_image.png"))
{
    // Create verify options with the same password used for signing
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = "MySecurePassword123"
    };

    // Verify the signature
    VerificationResult verifyResult = signature.Verify(verifyOptions);
    
    if (verifyResult.IsValid)
    {
        Console.WriteLine("\nImage signature was verified successfully!");
        Console.WriteLine($"Found {verifyResult.Succeeded.Count} verified signatures.");
    }
    else
    {
        Console.WriteLine("\nImage signature failed verification process.");
    }
}
```

### Custom Detection Threshold

The detection threshold determines the minimum percentage of signature data that must be detected for verification to succeed (0-100%). Default is 75%. Higher thresholds require more complete signature data.

```csharp
using (Signature signature = new Signature("signed_image.png"))
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = "MySecurePassword123",
        DetectionThresholdPercent = 90  // Require 90% detection
    };

    VerificationResult verifyResult = signature.Verify(verifyOptions);
    
    if (verifyResult.IsValid)
    {
        Console.WriteLine("\nSignature verified with 90% threshold");
    }
}
```

### Full Data Extraction Mode

For maximum accuracy, you can enable full data extraction mode. This performs a more thorough analysis and provides a probability score.

```csharp
using (Signature signature = new Signature("signed_image.png"))
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = "MySecurePassword123",
        UseFullDataExtraction = true,  // Enable full extraction
        DetectionThresholdPercent = 85
    };

    VerificationResult verifyResult = signature.Verify(verifyOptions);
    
    if (verifyResult.IsValid && verifyOptions.DetectedProbability.HasValue)
    {
        Console.WriteLine($"\nSignature verified with {verifyOptions.DetectedProbability.Value}% probability");
    }
}
```

### Verifying Images from Streams

You can also verify images using streams instead of file paths:

```csharp
using (Stream imageStream = new FileStream("signed_image.png", FileMode.Open, FileAccess.Read))
using (Signature signature = new Signature(imageStream))
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = "MySecurePassword123"
    };

    VerificationResult verifyResult = signature.Verify(verifyOptions);
    
    if (verifyResult.IsValid)
    {
        Console.WriteLine("\nSignature is valid!");
    }
}
```

### Limitations and Considerations

* **Format Support**: Only PNG and JPG/JPEG formats are supported (BMP not supported)
* **Password Match**: Password must match exactly (case-sensitive) the one used during signing
* **Image Integrity**: Image editing or compression may affect signature detection
* **Original Images**: Always verify original signed images, not edited copies

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/net/developer-guide/advanced-usage/_index.md" >}}).

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.

