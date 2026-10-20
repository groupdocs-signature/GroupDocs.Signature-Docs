---
id: esign-image-with-digital-signature
url: signature/java/esign-image-with-digital-signature
title: eSign image with Digital signature
linkTitle: Image Digital signature
weight: 10
description: "This article demonstrates how to sign images with digital signatures using steganography (LSB technique) with GroupDocs.Signature for Java. Learn how to embed invisible digital signatures into PNG and JPG images."
keywords: digital signature, image signature, steganography, LSB, PNG, JPG, image signing, invisible signature
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Sign images with digital signature in Java    
        description: Sign images with digital signatures using steganography with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to sign images with digital signature using steganography in Java 
        description: Learn all about signing images with digital signatures using steganography and Java
        steps:
        - name: Load image file
          text: Create the Signature object by passing image file path or stream as a constructor parameter.
        - name: Set up digital signature options 
          text: Provide new ImageDigitalSignOptions class instance and set the password with setPassword (minimum 4 characters).
        - name: Sign the image and save the result 
          text: Invoke the sign method with signing options and output file path or stream.
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

These are the limits below which signing is refused. An image that only just exceeds them may still be too small to hold a signature that verifies, so use images well above the minimum and check the result with [image digital signature verification]({{< ref "signature/java/developer-guide/basic-usage/verify-document-for-signatures/verify-digital-signatures-in-image.md" >}}).

### Password Requirements

* **Minimum Length**: 4 characters
* **Case Sensitive**: Yes
* **Special Characters**: Allowed

### Supported Formats

* **PNG** - Supported
* **JPG/JPEG** - Supported
* **BMP** - Not supported for digital steganography signatures

## How to eSign image with Digital signature

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides the `ImageDigitalSignOptions` class (package `com.groupdocs.signature.options.sign`) to specify settings for digital signatures in images using steganography.

Here are the steps to sign an image with a digital signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass the source image path as a constructor parameter
* Instantiate the `ImageDigitalSignOptions` object and set the password with `setPassword` (minimum 4 characters), or pass the password to the constructor
* Call the `sign` method of the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass the `ImageDigitalSignOptions` to it

This example shows how to sign an image with a digital signature using steganography.

```java
Signature signature = new Signature("image.png");
try
{
    // Create sign options with password
    ImageDigitalSignOptions signOptions = new ImageDigitalSignOptions();
    signOptions.setPassword("MySecurePassword123");

    // Sign the image
    signature.sign("signed_image.png", signOptions);

    System.out.println("Image signed successfully. File saved at signed_image.png");
}
finally
{
    signature.dispose();
}
```

{{< alert style="info" >}}
The returned [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) does not list the embedded image digital signature in `getSucceeded()`. To confirm that the image carries the signature, verify it with `ImageDigitalVerifyOptions`.
{{< /alert >}}

### Saving the Signed Image as PNG

To control the format of the output image, pass `ImageSaveOptions` (package `com.groupdocs.signature.options.saveoptions.imagessaveoptions`) to the `sign` method:

```java
Signature signature = new Signature("image.jpg");
try
{
    ImageDigitalSignOptions signOptions = new ImageDigitalSignOptions("MySecurePassword123");

    // Save the signed image as PNG
    ImageSaveOptions saveOptions = new ImageSaveOptions();
    saveOptions.setFileFormat(ImageSaveFileFormat.Png);

    signature.sign("signed_image.png", signOptions, saveOptions);
}
finally
{
    signature.dispose();
}
```

### Signing Images from Streams

You can also sign images using streams instead of file paths:

```java
try (InputStream inputStream = new FileInputStream("image.png");
     OutputStream outputStream = new FileOutputStream("signed_image.png"))
{
    Signature signature = new Signature(inputStream);
    try
    {
        ImageDigitalSignOptions signOptions = new ImageDigitalSignOptions();
        signOptions.setPassword("MySecurePassword123");

        signature.sign(outputStream, signOptions);
        System.out.println("Image signed successfully.");
    }
    finally
    {
        signature.dispose();
    }
}
```

### Error Handling

The library automatically validates password length and image size requirements. Both errors reach your code as [GroupDocsSignatureException](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.exception/groupdocssignatureexception/):

```java
try
{
    Signature signature = new Signature("image.png");
    try
    {
        ImageDigitalSignOptions signOptions = new ImageDigitalSignOptions();
        signOptions.setPassword("MyPassword123"); // Minimum 4 characters required

        signature.sign("signed_image.png", signOptions);
        System.out.println("Image signed successfully!");
    }
    finally
    {
        signature.dispose();
    }
}
catch (GroupDocsSignatureException ex)
{
    // "Password must be at least 4 characters long." or
    // "Image is too small for digital steganography signature. ..."
    System.out.println("Signing error: " + ex.getMessage());
}
```

## Limitations and Considerations

### Format Limitations

* **PNG**: Supported
* **JPG/JPEG**: Supported
* **BMP**: Not supported
* **Other formats**: Not supported

### Image Size Limitations

* Images smaller than 8x8 pixels cannot be signed
* Images with fewer than 16,384 pixels cannot be signed

### Steganography Considerations

* Image compression (especially JPG) may affect signature detection
* Image editing may corrupt embedded signatures
* Always keep original signed images for verification
* The signature is embedded invisibly in the image pixels

### Summary

This guide demonstrates how to use [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) to sign images with digital signatures using steganography. It covers loading images, configuring password-protected digital signatures that are embedded invisibly into image pixels, and saving signed images. The feature provides invisible authentication while maintaining image quality and requires minimum size requirements for images.

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/java/developer-guide/advanced-usage/_index.md" >}}).

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)

### Free Online Apps

Along with the full-featured Java library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
