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

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) for .NET supports verifying digital signatures embedded in raster images using **steganography** (LSB - Least Significant Bit technique). These signatures are invisibly embedded in image pixels and can be verified using the password that was used during signing.

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
4. **Result**: Returns verification status and signature details

## Requirements

### Password Requirements

* **Must Match**: Password must match the one used during signing
* **Case Sensitive**: Yes, passwords are case-sensitive
* **Minimum Length**: 4 characters (same as signing)

### Supported Formats

* ✅ **PNG** - Fully supported
* ✅ **JPG/JPEG** - Fully supported
* ❌ **BMP** - Not supported for digital steganography signatures

## Basic Usage

### Verifying a Signed Image

```csharp
using GroupDocs.Signature;
using GroupDocs.Signature.Options;

// Load the signed image
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
        Console.WriteLine("Digital signature is valid!");
        Console.WriteLine($"Found {verifyResult.Succeeded.Count} verified signatures.");
    }
    else
    {
        Console.WriteLine("Digital signature is invalid or not found.");
    }
}
```

### Complete Verification Example

```csharp
using GroupDocs.Signature;
using GroupDocs.Signature.Options;

string signedFile = "signed_document.png";
string password = "SecurePassword123";

// Verify the signed image
using (Signature signature = new Signature(signedFile))
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = password
    };

    VerificationResult verifyResult = signature.Verify(verifyOptions);
    
    if (verifyResult.IsValid)
    {
        Console.WriteLine("Digital signature is valid!");
        Console.WriteLine($"Verified signatures: {verifyResult.Succeeded.Count}");

        foreach (var sig in verifyResult.Succeeded)
        {
            if (sig is DigitalSignature digitalSig)
            {
                Console.WriteLine($"  Signature ID: {digitalSig.SignatureId}");
                Console.WriteLine($"  Sign Time: {digitalSig.SignTime}");
                Console.WriteLine($"  Is Valid: {digitalSig.IsValid}");
            }
        }
    }
    else
    {
        Console.WriteLine("✗ Digital signature is invalid or not found.");

        if (verifyResult.Failed != null && verifyResult.Failed.Count > 0)
        {
            Console.WriteLine($"  Failed verifications: {verifyResult.Failed.Count}");
            foreach (var failure in verifyResult.Failed)
            {
                Console.WriteLine($"    - {failure}");
            }
        }
    }
}
```

## Advanced Usage

### Custom Detection Threshold

The detection threshold determines the minimum percentage of signature data that must be detected for verification to succeed (0-100%). Default is 75%.

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
        Console.WriteLine("Signature verified with 90% threshold");
    }
    else
    {
        Console.WriteLine("Signature verification failed - threshold not met");
    }
}
```

### Testing Different Thresholds

```csharp
using (Signature signature = new Signature("signed_image.png"))
{
    string password = "MyPassword123";
    
    // Test different threshold values
    int[] thresholds = { 50, 75, 90, 95, 100 };
    
    foreach (int threshold in thresholds)
    {
        ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
        {
            Password = password,
            DetectionThresholdPercent = threshold
        };

        VerificationResult verifyResult = signature.Verify(verifyOptions);
        
        Console.WriteLine($"Threshold {threshold}%: {(verifyResult.IsValid ? "✓ Valid" : "✗ Invalid")}");
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
    
    if (verifyResult.IsValid)
    {
        Console.WriteLine("Signature verified with full data extraction");
        
        // DetectedProbability is set when UseFullDataExtraction is true
        if (verifyOptions.DetectedProbability.HasValue)
        {
            Console.WriteLine($"Detection probability: {verifyOptions.DetectedProbability.Value}%");
        }
    }
}
```

### Working with Streams

You can verify images using streams instead of file paths:

```csharp
using System.IO;
using GroupDocs.Signature;
using GroupDocs.Signature.Options;

// Verifying from stream
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
        Console.WriteLine("Signature is valid!");
    }
}
```

## Detection Threshold

The `DetectionThresholdPercent` property controls how strict the verification is:

* **Lower Threshold (0-50%)**: More lenient, may detect partial signatures
* **Default (75%)**: Balanced detection
* **Higher Threshold (90-100%)**: Very strict, requires nearly complete signature data

### Choosing the Right Threshold

```csharp
// For lenient verification (may detect partial signatures)
ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
{
    Password = "MyPassword",
    DetectionThresholdPercent = 50  // Lower threshold
};

// For balanced verification (default)
verifyOptions.DetectionThresholdPercent = 75;  // Default

// For strict verification (requires complete signature)
verifyOptions.DetectionThresholdPercent = 95;  // High threshold
```

### Threshold Examples

```csharp
using (Signature signature = new Signature("signed_image.png"))
{
    string password = "MyPassword123";
    
    // Test with different thresholds
    var thresholds = new[] { 50, 75, 90, 95, 100 };
    
    foreach (int threshold in thresholds)
    {
        ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
        {
            Password = password,
            DetectionThresholdPercent = threshold
        };

        VerificationResult verifyResult = signature.Verify(verifyOptions);
        
        string status = verifyResult.IsValid ? "✓ Valid" : "✗ Invalid";
        Console.WriteLine($"{threshold}% threshold: {status}");
    }
}
```

## Full Data Extraction

When `UseFullDataExtraction` is enabled:

* Performs more thorough analysis using `AnalyzePercentageDigitalSignature`
* Provides a probability score (0-100%) in `DetectedProbability`
* More accurate but slightly slower
* Useful when standard verification is uncertain

### Using Full Data Extraction

```csharp
using (Signature signature = new Signature("signed_image.png"))
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = "MyPassword",
        UseFullDataExtraction = true,
        DetectionThresholdPercent = 85
    };

    VerificationResult result = signature.Verify(verifyOptions);

    if (result.IsValid && verifyOptions.DetectedProbability.HasValue)
    {
        Console.WriteLine($"✓ Signature detected with {verifyOptions.DetectedProbability.Value}% probability");
    }
    else
    {
        Console.WriteLine("✗ Signature not detected or below threshold");
    }
}
```

### When to Use Full Data Extraction

Use full data extraction when:
* Standard verification gives uncertain results
* You need maximum accuracy
* Image may have been slightly modified
* You want probability scores

```csharp
// First try standard verification
ImageDigitalVerifyOptions standardOptions = new ImageDigitalVerifyOptions
{
    Password = "MyPassword"
};

VerificationResult standardResult = signature.Verify(standardOptions);

if (!standardResult.IsValid)
{
    // If standard verification fails, try full extraction
    ImageDigitalVerifyOptions fullExtractionOptions = new ImageDigitalVerifyOptions
    {
        Password = "MyPassword",
        UseFullDataExtraction = true,
        DetectionThresholdPercent = 70  // Lower threshold for full extraction
    };

    VerificationResult fullResult = signature.Verify(fullExtractionOptions);
    
    if (fullResult.IsValid)
    {
        Console.WriteLine($"Signature found with {fullExtractionOptions.DetectedProbability}% probability");
    }
}
```

## Handling Verification Results

### Detailed Result Processing

```csharp
using (Signature signature = new Signature("signed_image.png"))
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = "MyPassword123"
    };

    VerificationResult verifyResult = signature.Verify(verifyOptions);

    if (verifyResult.IsValid)
    {
        Console.WriteLine($"✓ Signature valid. Found {verifyResult.Succeeded.Count} signature(s).");
        
        foreach (var sig in verifyResult.Succeeded)
        {
            if (sig is DigitalSignature digitalSig)
            {
                Console.WriteLine($"  Signature ID: {digitalSig.SignatureId}");
                Console.WriteLine($"  Sign Time: {digitalSig.SignTime}");
                Console.WriteLine($"  Is Valid: {digitalSig.IsValid}");
            }
        }
    }
    else
    {
        Console.WriteLine("✗ Signature invalid or not found.");
        
        if (verifyResult.Failed != null && verifyResult.Failed.Count > 0)
        {
            Console.WriteLine($"  Failed verifications: {verifyResult.Failed.Count}");
            foreach (var failure in verifyResult.Failed)
            {
                Console.WriteLine($"    - {failure}");
            }
        }
    }
}
```

## Error Handling

### Wrong Password

```csharp
try
{
    using (Signature signature = new Signature("signed_image.png"))
    {
        ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
        {
            Password = "WrongPassword"  // Wrong password
        };

        VerificationResult verifyResult = signature.Verify(verifyOptions);
        
        if (!verifyResult.IsValid)
        {
            Console.WriteLine("Signature verification failed - wrong password or no signature found.");
        }
    }
}
catch (Exception ex)
{
    Console.WriteLine($"Error during verification: {ex.Message}");
}
```

### Password Validation

```csharp
try
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = "123"  // Too short, minimum is 4 characters
    };

    using (Signature signature = new Signature("signed_image.png"))
    {
        VerificationResult verifyResult = signature.Verify(verifyOptions);
    }
}
catch (ArgumentException ex)
{
    Console.WriteLine($"Password validation error: {ex.Message}");
    // Output: "Password must be at least 4 characters long."
}
```

### Threshold Range Validation

```csharp
try
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = "MyPassword",
        DetectionThresholdPercent = 150  // Invalid: must be 0-100
    };

    using (Signature signature = new Signature("signed_image.png"))
    {
        VerificationResult verifyResult = signature.Verify(verifyOptions);
    }
}
catch (ArgumentOutOfRangeException ex)
{
    Console.WriteLine($"Threshold error: {ex.Message}");
    // Output: "Detection threshold must be within 0-100 range."
}
```

## Best Practices

### 1. Use Appropriate Thresholds

```csharp
// For critical applications, use higher threshold
ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
{
    Password = password,
    DetectionThresholdPercent = 95,  // High threshold for critical verification
    UseFullDataExtraction = true     // Maximum accuracy
};
```

### 2. Handle Verification Results Properly

```csharp
VerificationResult verifyResult = signature.Verify(verifyOptions);

if (verifyResult.IsValid)
{
    // Process successful verification
    ProcessValidSignature(verifyResult.Succeeded);
}
else
{
    // Handle failed verification
    HandleInvalidSignature(verifyResult.Failed);
}
```

### 3. Try Full Extraction if Standard Verification Fails

```csharp
// First attempt with standard verification
ImageDigitalVerifyOptions standardOptions = new ImageDigitalVerifyOptions
{
    Password = password,
    DetectionThresholdPercent = 75
};

VerificationResult result = signature.Verify(standardOptions);

if (!result.IsValid)
{
    // Try with full extraction and lower threshold
    ImageDigitalVerifyOptions fullOptions = new ImageDigitalVerifyOptions
    {
        Password = password,
        UseFullDataExtraction = true,
        DetectionThresholdPercent = 60  // Lower threshold
    };

    result = signature.Verify(fullOptions);
}
```

### 4. Store Passwords Securely

```csharp
// Retrieve password from secure storage
string password = GetPasswordFromSecureStorage();

ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
{
    Password = password
};
```

### 5. Verify Original Signed Images

```csharp
// Always verify the original signed image, not edited copies
string originalSignedImage = "signed_image.png";  // Original
string editedImage = "edited_signed_image.png";    // May have corrupted signature

// Verify original
using (Signature signature = new Signature(originalSignedImage))
{
    ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
    {
        Password = "MyPassword"
    };

    VerificationResult result = signature.Verify(verifyOptions);
    // This should work
}
```

## Troubleshooting

### Issue: Verification Fails with Correct Password

**Possible Causes**:
* Image was edited or compressed after signing
* Wrong detection threshold
* Image format not fully supported
* Image corruption

**Solutions**:

1. **Try Lower Threshold**:
```csharp
ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
{
    Password = "MyPassword",
    DetectionThresholdPercent = 50  // Lower threshold
};
```

2. **Enable Full Data Extraction**:
```csharp
ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
{
    Password = "MyPassword",
    UseFullDataExtraction = true,
    DetectionThresholdPercent = 60
};
```

3. **Verify Original Image**:
```csharp
// Always verify the original signed image, not edited copies
using (Signature signature = new Signature("original_signed_image.png"))
{
    // Verify here
}
```

### Issue: Wrong Password Error

**Solution**: Ensure the password matches exactly (case-sensitive) the one used during signing.

```csharp
// Password must match exactly (case-sensitive)
ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
{
    Password = "MyPassword123"  // Must match signing password exactly
};
```

### Issue: BMP Format Not Working

**Solution**: BMP format does not support LSB steganography digital signatures. Use PNG or JPG format instead.

```csharp
// Only PNG and JPG are supported
string[] supportedFormats = { ".png", ".jpg", ".jpeg" };
```

### Issue: Threshold Too High

**Solution**: Lower the detection threshold if verification fails.

```csharp
// Start with lower threshold
ImageDigitalVerifyOptions verifyOptions = new ImageDigitalVerifyOptions
{
    Password = "MyPassword",
    DetectionThresholdPercent = 50  // Lower threshold
};

// If that works, gradually increase to find optimal threshold
```

## Summary

Verifying digital signatures in images provides:

* ✅ **Password-Based Security**: Verify using the signing password
* ✅ **Flexible Thresholds**: Configurable detection sensitivity (0-100%)
* ✅ **High Accuracy**: Optional full data extraction mode
* ✅ **Format Support**: Works with PNG and JPG formats
* ✅ **Probability Scores**: Get detection probability with full extraction

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

