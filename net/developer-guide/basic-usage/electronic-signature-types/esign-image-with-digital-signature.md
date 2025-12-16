---
id: esign-image-with-digital-signature
url: signature/net/esign-image-with-digital-signature
title: eSign image with Digital signature
linkTitle: Image Digital signature
weight: 10
description: "This article demonstrates how to sign images with digital signatures using steganography (LSB technique) with GroupDocs.Signature for .NET. Learn how to embed invisible digital signatures into PNG and JPG images."
keywords: digital signature, image signature, steganography, LSB, PNG, JPG, image signing, invisible signature
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Sign images with digital signature in C#    
        description: Sign images with digital signatures using steganography with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign images with digital signature using steganography in C# 
        description: Learn all about signing images with digital signatures using steganography and C#
        steps:
        - name: Load image file
          text: Create the Signature object by passing image file path or stream as a constructor parameter.
        - name: Set up digital signature options 
          text: Provide new ImageDigitalSignOptions class instance and set the Password property (minimum 4 characters).
        - name: Sign the image and save the result 
          text: Invoke the Sign method with signing options and output file path or stream.
---

## What is an Image Digital Signature?

An **Image Digital Signature** uses **steganography** (LSB - Least Significant Bit technique) to embed digital signatures directly into raster image pixels. This method allows you to add invisible, password-protected signatures to images while maintaining image quality. The signature data is embedded into the least significant bits of image pixels, making the signature undetectable to the naked eye.

### Key Features

* **Invisible Signatures**: Signatures are embedded directly into image pixels using steganography
* **Password Protection**: Signatures are protected with a password (minimum 4 characters)
* **Format Support**: Works with PNG and JPG image formats
* **Quality Preservation**: Image quality remains virtually unchanged
* **Size Requirements**: Images must meet minimum size requirements (8x8 pixels, 16,384 total pixels)

## Requirements

### Image Size Requirements

* **Minimum Width**: 8 pixels
* **Minimum Height**: 8 pixels
* **Minimum Total Pixels**: 16,384 pixels (width × height)

### Password Requirements

* **Minimum Length**: 4 characters
* **Case Sensitive**: Yes
* **Special Characters**: Allowed

### Supported Formats

* ✅ **PNG** - Fully supported
* ✅ **JPG/JPEG** - Fully supported
* ❌ **BMP** - Not supported for digital steganography signatures

## How to eSign image with Digital signature

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides the [ImageDigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagedigitalsignoptions) class to specify settings for digital signatures in images using steganography.

Here are the steps to sign an image with a digital signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass the source image path as a constructor parameter
* Instantiate the [ImageDigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagedigitalsignoptions) object and set the [Password](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagedigitalsignoptions/password) property (minimum 4 characters)
* Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass the [ImageDigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/imagedigitalsignoptions) to it

This example shows how to sign an image with a digital signature using steganography.

```csharp
using (Signature signature = new Signature("image.png"))
{
    // Create sign options with password
    ImageDigitalSignOptions signOptions = new ImageDigitalSignOptions
    {
        Password = "MySecurePassword123"
    };

    // Sign the image
    SignResult signResult = signature.Sign("signed_image.png", signOptions);
    
    Console.WriteLine($"Image signed successfully. Found {signResult.Succeeded.Count} signatures.");
}
```

### Signing Images from Streams

You can also sign images using streams instead of file paths:

```csharp
using (Stream inputStream = new FileStream("image.png", FileMode.Open, FileAccess.Read))
using (Signature signature = new Signature(inputStream))
{
    ImageDigitalSignOptions signOptions = new ImageDigitalSignOptions
    {
        Password = "MySecurePassword123"
    };

    using (Stream outputStream = new FileStream("signed_image.png", FileMode.Create))
    {
        SignResult signResult = signature.Sign(outputStream, signOptions);
        Console.WriteLine($"Signed: {signResult.Succeeded.Count} signature(s) added.");
    }
}
```

### Error Handling

The library automatically validates password length and image size requirements. Handle exceptions appropriately:

```csharp
try
{
    using (Signature signature = new Signature("image.png"))
    {
        ImageDigitalSignOptions signOptions = new ImageDigitalSignOptions
        {
            Password = "MyPassword123"  // Minimum 4 characters required
        };

        SignResult signResult = signature.Sign("signed_image.png", signOptions);
        Console.WriteLine("✓ Image signed successfully!");
    }
}
catch (ArgumentException ex)
{
    Console.WriteLine($"Password validation error: {ex.Message}");
    // Password must be at least 4 characters long
}
catch (InvalidOperationException ex)
{
    Console.WriteLine($"Image size error: {ex.Message}");
    // Image is too small for digital steganography signature
}
```

## Limitations and Considerations

### Format Limitations

* **PNG**: Fully supported ✅
* **JPG/JPEG**: Fully supported ✅
* **BMP**: Not supported ❌
* **Other formats**: Not supported ❌

### Image Size Limitations

* Images smaller than 8x8 pixels cannot be signed
* Images with fewer than 16,384 pixels cannot be signed

### Steganography Considerations

* Image compression (especially JPG) may affect signature detection
* Image editing may corrupt embedded signatures
* Always keep original signed images for verification
* The signature is embedded invisibly in the image pixels

### Summary

This guide demonstrates how to use [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) to sign images with digital signatures using steganography. It covers loading images, configuring password-protected digital signatures that are embedded invisibly into image pixels, and saving signed images. The feature provides invisible authentication while maintaining image quality and requires minimum size requirements for images.

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

