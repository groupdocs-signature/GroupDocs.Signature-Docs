---
id: verify-digital-signatures-in-image
url: signature/java/verify-digital-signatures-in-image
title: Verify Digital signatures in image
linkTitle: Image Digital signatures
weight: 6
description: "This topic explains how to verify digital signatures embedded in images using steganography (LSB technique) with GroupDocs.Signature for Java API."
keywords: digital signature, image signature, steganography, LSB, PNG, JPG, verify image signature
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify digital signatures in images via Java    
        description: Verification of digital signatures embedded in images using steganography in convenient way with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to check are digital signatures valid in images using Java 
        description: Get additional information of digital signatures validation for images in Java
        steps:
        - name: Load image file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide verification options. 
          text: Set demanded data of the ImageDigitalVerifyOptions instance such as password used during signing, detection threshold and full data extraction mode.
        - name: Get verification result
          text: Call method verify passing options. Obtain verification result whose method isValid must return true if verification succeed.
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) for Java supports verifying digital signatures embedded in raster images using **steganography** (LSB - Least Significant Bit technique). These signatures are invisibly embedded in image pixels and can be verified using the password that was used during signing. See [eSign image with Digital signature]({{< ref "signature/java/developer-guide/basic-usage/electronic-signature-types/esign-image-with-digital-signature.md" >}}) to learn how to add such a signature.

The verification settings are kept in the `ImageDigitalVerifyOptions` class (package `com.groupdocs.signature.options.verify`), and the result is a [VerificationResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/verificationresult/) object.

### Key Features

* **Password-Based Verification**: Verify signatures using the password from signing
* **Detection Thresholds**: Configurable detection threshold for verification (0-100%)
* **Full Data Extraction**: Optional full data extraction mode for maximum accuracy
* **Format Support**: Works with PNG and JPG image formats
* **Probability Detection**: Get probability scores when using full extraction mode

## How It Works

Digital signature verification in images:

1. **Extraction**: The embedded signature data is extracted from the least significant bits of image pixels
2. **Password Verification**: The extracted data is verified using the provided password
3. **Threshold Check**: The detection threshold determines if enough signature data was found
4. **Result**: Returns verification status; for a valid signature, the `getSucceeded()` list of the result holds a [DigitalSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/digitalsignature/) object whose `isValid()` returns `true`

The embedded data does not contain a certificate, so the returned `DigitalSignature` carries no certificate details.

## Requirements

### Password Requirements

* **Must Match**: Password must match the one used during signing
* **Case Sensitive**: Yes, passwords are case-sensitive
* **Minimum Length**: 4 characters (same as signing)

### Supported Formats

* **PNG** - Supported
* **JPG/JPEG** - Supported
* **BMP** - Not supported for digital steganography signatures

## Basic Usage

### Verifying a Signed Image

```java
// Load the signed image
Signature signature = new Signature("signed_image.png");
try
{
    // Create verify options with the same password used for signing
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions();
    verifyOptions.setPassword("MySecurePassword123");

    // Verify the signature
    VerificationResult verifyResult = signature.verify(verifyOptions);

    if (verifyResult.isValid())
    {
        System.out.println("Digital signature is valid!");
        System.out.println("Found " + verifyResult.getSucceeded().size() + " verified signatures.");
    }
    else
    {
        System.out.println("Digital signature is invalid or not found.");
    }
}
finally
{
    signature.dispose();
}
```

### Complete Verification Example

```java
String signedFile = "signed_image.png";
String password = "SecurePassword123";

// Verify the signed image
Signature signature = new Signature(signedFile);
try
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions(password);

    VerificationResult verifyResult = signature.verify(verifyOptions);

    if (verifyResult.isValid())
    {
        System.out.println("Digital signature is valid!");
        System.out.println("Verified signatures: " + verifyResult.getSucceeded().size());

        for (BaseSignature sig : verifyResult.getSucceeded())
        {
            if (sig instanceof DigitalSignature)
            {
                DigitalSignature digitalSig = (DigitalSignature) sig;
                System.out.println("  Is Valid: " + digitalSig.isValid());
            }
        }
    }
    else
    {
        System.out.println("Digital signature is invalid or not found.");
    }
}
finally
{
    signature.dispose();
}
```

## Advanced Usage

### Custom Detection Threshold

The detection threshold determines the minimum percentage of signature data that must be detected for verification to succeed (0-100%). Default is 75%.

```java
Signature signature = new Signature("signed_image.png");
try
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions("MySecurePassword123");
    verifyOptions.setDetectionThresholdPercent(90); // Require 90% detection

    VerificationResult verifyResult = signature.verify(verifyOptions);

    if (verifyResult.isValid())
    {
        System.out.println("Signature verified with 90% threshold");
    }
    else
    {
        System.out.println("Signature verification failed - threshold not met");
    }
}
finally
{
    signature.dispose();
}
```

### Testing Different Thresholds

```java
Signature signature = new Signature("signed_image.png");
try
{
    String password = "MyPassword123";

    // Test different threshold values
    int[] thresholds = { 50, 75, 90, 95, 100 };

    for (int threshold : thresholds)
    {
        ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions(password);
        verifyOptions.setDetectionThresholdPercent(threshold);

        VerificationResult verifyResult = signature.verify(verifyOptions);

        System.out.println("Threshold " + threshold + "%: " + (verifyResult.isValid() ? "Valid" : "Invalid"));
    }
}
finally
{
    signature.dispose();
}
```

### Full Data Extraction Mode

For maximum accuracy, you can enable full data extraction mode. This performs a more thorough analysis and provides a probability score.

```java
Signature signature = new Signature("signed_image.png");
try
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions("MySecurePassword123");
    verifyOptions.setUseFullDataExtraction(true); // Enable full extraction
    verifyOptions.setDetectionThresholdPercent(85);

    VerificationResult verifyResult = signature.verify(verifyOptions);

    // getDetectedProbability() is set when full data extraction is enabled
    Integer probability = verifyOptions.getDetectedProbability();
    if (verifyResult.isValid())
    {
        System.out.println("Signature verified with full data extraction");
        if (probability != null)
        {
            System.out.println("Detection probability: " + probability + "%");
        }
    }
    else
    {
        System.out.println("Signature not detected or below threshold. Probability: " + probability + "%");
    }
}
finally
{
    signature.dispose();
}
```

### Working with Streams

You can verify images using streams instead of file paths:

```java
// Verifying from stream
try (InputStream imageStream = new FileInputStream("signed_image.png"))
{
    Signature signature = new Signature(imageStream);
    try
    {
        ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions("MySecurePassword123");

        VerificationResult verifyResult = signature.verify(verifyOptions);

        if (verifyResult.isValid())
        {
            System.out.println("Signature is valid!");
        }
    }
    finally
    {
        signature.dispose();
    }
}
```

## Detection Threshold

The `setDetectionThresholdPercent` method controls how strict the verification is:

* **Lower Threshold (0-50%)**: More lenient, may detect partial signatures
* **Default (75%)**: Balanced detection
* **Higher Threshold (90-100%)**: Very strict, requires nearly complete signature data

### Choosing the Right Threshold

```java
// For lenient verification (may detect partial signatures)
ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions("MyPassword");
verifyOptions.setDetectionThresholdPercent(50); // Lower threshold

// For balanced verification (default)
verifyOptions.setDetectionThresholdPercent(75); // Default

// For strict verification (requires complete signature)
verifyOptions.setDetectionThresholdPercent(95); // High threshold
```

## Full Data Extraction

When `setUseFullDataExtraction(true)` is set:

* Performs a more thorough analysis of the image data
* Provides a probability score (0-100%) in `getDetectedProbability()`; without full data extraction it returns `null`
* The signature is valid when the probability reaches the detection threshold
* Useful when standard verification is uncertain

### When to Use Full Data Extraction

Use full data extraction when:
* Standard verification gives uncertain results
* You need maximum accuracy
* Image may have been slightly modified
* You want probability scores

```java
String password = "MyPassword";

// First try standard verification
ImageDigitalVerifyOptions standardOptions = new ImageDigitalVerifyOptions(password);
VerificationResult result = signature.verify(standardOptions);

if (!result.isValid())
{
    // If standard verification fails, try full extraction with a lower threshold
    ImageDigitalVerifyOptions fullOptions = new ImageDigitalVerifyOptions(password);
    fullOptions.setUseFullDataExtraction(true);
    fullOptions.setDetectionThresholdPercent(70);

    result = signature.verify(fullOptions);
    System.out.println("Full extraction: " + (result.isValid() ? "valid" : "invalid")
        + ", probability " + fullOptions.getDetectedProbability() + "%");
}
```

## Error Handling

### Wrong Password

A wrong password does not raise an error: the signature is simply not detected and `isValid()` returns `false`.

```java
Signature signature = new Signature("signed_image.png");
try
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions("WrongPassword");

    VerificationResult verifyResult = signature.verify(verifyOptions);

    if (!verifyResult.isValid())
    {
        System.out.println("Signature verification failed - wrong password or no signature found.");
    }
}
finally
{
    signature.dispose();
}
```

### Password and Threshold Validation

A password shorter than 4 characters and a detection threshold outside the 0-100 range are rejected with [GroupDocsSignatureException](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.exception/groupdocssignatureexception/):

```java
try
{
    Signature signature = new Signature("signed_image.png");
    try
    {
        ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions("123"); // Too short, minimum is 4 characters
        // verifyOptions.setDetectionThresholdPercent(150); // Invalid as well: must be 0-100

        VerificationResult verifyResult = signature.verify(verifyOptions);
    }
    finally
    {
        signature.dispose();
    }
}
catch (GroupDocsSignatureException ex)
{
    System.out.println("Validation error: " + ex.getMessage());
    // Output: "Password must be at least 4 characters long."
    // or "Detection threshold must be within 0-100 range."
}
```

## Best Practices

### 1. Use Appropriate Thresholds

```java
// For critical applications, use a higher threshold and full data extraction
ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions(password);
verifyOptions.setDetectionThresholdPercent(95);
verifyOptions.setUseFullDataExtraction(true);
```

### 2. Handle Verification Results Properly

Check `isValid()` of the [VerificationResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/verificationresult/) before you process the `getSucceeded()` list.

### 3. Try Full Extraction if Standard Verification Fails

See [When to Use Full Data Extraction](#when-to-use-full-data-extraction) above.

### 4. Store Passwords Securely

Read the password from a secure storage instead of keeping it in the source code.

### 5. Verify Original Signed Images

Always verify the original signed image, not an edited copy: editing or recompressing an image may corrupt the embedded signature.

## Troubleshooting

### Issue: Verification Fails with Correct Password

**Possible Causes**:
* Image was edited or compressed after signing
* Wrong detection threshold
* Image format not supported
* Image corruption

**Solutions**:

1. **Try Lower Threshold**:
```java
ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions("MyPassword");
verifyOptions.setDetectionThresholdPercent(50); // Lower threshold
```

2. **Enable Full Data Extraction**: see [Full Data Extraction Mode](#full-data-extraction-mode).

3. **Verify Original Image**: always verify the original signed image, not edited copies.

### Issue: Wrong Password Error

**Solution**: Ensure the password matches exactly (case-sensitive) the one used during signing.

### Issue: BMP Format Not Working

**Solution**: BMP format does not support LSB steganography digital signatures. Use PNG or JPG format instead.

### Issue: Threshold Too High

**Solution**: Lower the detection threshold if verification fails. If that works, gradually increase it to find the optimal threshold.

## Summary

Verifying digital signatures in images provides:

* **Password-Based Security**: Verify using the signing password
* **Flexible Thresholds**: Configurable detection sensitivity (0-100%)
* **High Accuracy**: Optional full data extraction mode
* **Format Support**: Works with PNG and JPG formats
* **Probability Scores**: Get detection probability with full extraction

Use this feature when you need to:
* Verify image authenticity and integrity
* Check if images contain embedded signatures
* Validate images using password-based signatures
* Detect signatures with configurable sensitivity

Remember to:
* Use the exact password from signing (case-sensitive)
* Choose appropriate detection thresholds
* Use full data extraction for maximum accuracy
* Verify original signed images (not edited copies)
* Handle verification results properly

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
