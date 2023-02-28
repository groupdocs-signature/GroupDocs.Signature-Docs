---
id: groupdocs-signature-for-net-23-1-release-notes
url: signature/net/groupdocs-signature-for-net-23-2-release-notes
title: GroupDocs.Signature for .NET 23.2 Release Notes
weight: 18
description: "Features and fixes that are shipped in GroupDocs.Signature for .NET 23.2"
keywords: release notes, groupdocs.signature, .net, 23.2
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---

{{< alert style="info" >}}NOTE: .NET Framework 4.0 will not be supported since the next release of GroupDocs.Signature for .NET. The minimal supported versions will be .NET Framework 4.6.2 and higher{{< /alert >}}

There are 15+ features, enhancements, and bug fixes in this release.

## Full list of changes in this release

| Key | Category | Summary |
| --- | --- | --- |
|SIGNATURENET-4257|Feature|[Implement support of Succeeded Signature list for Verification Result](#implement-support-for-succeded-results)|
|SIGNATURENET-4255|Feature|[Implement new Barcode Type HIBC LIC 39/128 (HIBCCode39LIC, HIBCCode128LIC)](#added-barcode-hibclic39128)|
|SIGNATURENET-4254|Feature|[Implement new QR-Code Types HIBC LIC QR](#added-qrcode-hibclicqr)|
|SIGNATURENET-4223|Feature|[Implement Verification of Certificate documents](#implement-verification-of-certificate-documents)|
|SIGNATURENET-4317|Fix|Signed PDF Documents saved under .NET Core are not opening with the native Adobe Acrobat Reader|
|SIGNATURENET-4316|Fix|PDF Documents saved under non-licensed mode are unable to be digitally signed|
|SIGNATURENET-4315|Fix|Error on signing PDF Document with Digital signature and specific certificate properties|
|SIGNATURENET-4314|Fix|PDF documents metadata items do not detect data type on loading|
|SIGNATURENET-4313|Fix|Loading of special JPEG images raises the StackOverflowException exception|
|SIGNATURENET-4312|Fix|The exception occurs when signing Spreadsheet documents with specific X509 .pfx certificates|
|SIGNATURENET-4311|Fix|Unexpected response image when rendering .ods file|
|SIGNATURENET-4310|Fix|Exception is thrown when processing image preview with .ods file|
|SIGNATURENET-4309|Fix|GS1CompositeBar barcodes are not recognized with full original text|
|SIGNATURENET-4303|Fix|Processing time may be equal to zero for some cases under Net4.0 framework|
|SIGNATURENET-4281|Fix|Mailmark Barcode type default value throws an exception|

## Major Features

This release includes three features and one enhancement:

* [Implement support for Succeded list of Verification Result](#implement-support-for-succeded-results)
* [Added new Barcode Types HIBC LIC 39 and HIBC LIC 128](#added-barcode-hibclic39128)
* [Implemented new QR Code Types HIBC LIC QR, Aztec and DataMatrix](#added-qrcode-hibclicqr)
* [Implement Verification of Certificate documents](#implement-verification-of-certificate-documents)


### Implement support for Succedded list of Verification Result

[VerificationResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/verificationresult/) now supports the list of the [Succeeded](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/iresult/succeeded/) verified signatures.

{{< tabs "example1">}}
{{< tab "C#" >}}
```cs
/// <summary>
/// Verify document and list Succeded signatures
/// </summary>
using (Signature signature = new Signature("sample.pdf"))
{
    var options = new BarcodeVerifyOptions()
    {
        Text = "12345",
        MatchType = TextMatchType.Contains
    };
    // verify document signatures
    VerificationResult result = signature.Verify(options);
    if (result.IsValid)
    {
        Console.WriteLine("\nDocument was verified successfully!");
        Console.WriteLine("\nList of Succeded sigantures:");
        foreach(BaseSignature temp in result.Succeeded)
        {
            Console.WriteLine($" -#{temp.SignatureId}-{temp.SignatureType} at: {temp.Left}x{temp.Top}. Size: {temp.Width}x{temp.Height}")
        }
    }
    else
    {
        Console.WriteLine("\nDocument failed verification process.");
    }
}
```
{{< /tab >}}
{{< /tabs >}}

### Added new Barcode Types HIBC LIC 39 and HIBC LIC 128

[BarcodeTypes](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodetypes/) static class was updated with new types to support [HIBC LIC Barcodes](https://en.wikipedia.org/wiki/Health_Industry_Business_Communications_Council). 

{{< tabs "example2">}}
{{< tab "C# Barcode Types" >}}
```cs
/// <summary>
/// HIBC LIC 39 Barcode Type object.
/// </summary>
public static readonly BarcodeType HIBCCode39LIC;

/// <summary>
/// HIBC LIC 128 Barcode Type object.
/// </summary>
public static readonly BarcodeType HIBCCode128LIC;
```
{{< /tab >}}
{{< tab "C# Usage example" >}}
```cs
using (Signature signature = new Signature("sample.pdf""))
{
    // create barcode option with predefined barcode text that follow HIBC LIC standard
    BarcodeSignOptions options = new BarcodeSignOptions("+A99912345/$$52001510X3")
    {
        // setup Barcode encoding type
        EncodeType = BarcodeTypes.HIBCCode39LIC,
        // set signature position
        Left = 100,
        Top = 100
    };
    // sign document to file
    SignResult result = signature.Sign(outputFilePath, options);
}
```
{{< /tab >}}
{{< /tabs >}}

### Implemented new QR Code Types HIBC LIC QR, Aztec and DataMatrix

[QRCodeTypes](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodetypes/) static class was updated with new types to support [HIBC LIC QR](https://en.wikipedia.org/wiki/Health_Industry_Business_Communications_Council). 

{{< tabs "example2">}}
{{< tab "C# QR-Code Types" >}}
```cs
/// <summary>
/// HIBC LIC QR-Code Type object.
/// </summary>
public static readonly QrCodeType HIBCLICQR;

/// <summary>
/// HIBC LIC Data Matrix QR-Code Type object.
/// </summary>
public static readonly QrCodeType HIBCLICDataMatrix;

/// <summary>
/// HIBC LIC Aztec QR-Code Type object.
/// </summary>
public static readonly QrCodeType HIBCLICAztec;
```
{{< /tab >}}
{{< tab "C# Usage example" >}}
```cs
using (Signature signature = new Signature("sample.pdf""))
{
    // create barcode option with predefined QR-Code text that follow HIBC LIC standard
    var options = new QrCodeSignOptions("A123PROD30917/75#422011907#GP293")
    {
        // setup Barcode encoding type
        EncodeType = QrCodeTypes.HIBCLICQR,
        // set signature position
        Left = 100,
        Top = 100
    };
    // sign document to file
    SignResult result = signature.Sign(outputFilePath, options);
}
```
{{< /tab >}}
{{< /tabs >}}

### Implement Verification of Certificate documents

New [CertificateVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/certificateverifyoptions/) class contains different properties of the digital certificate file to validate over the [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify/#verify) method.

{{< tabs "example5">}}
{{< tab "C#" >}}
```cs
var loadOptions = new LoadOptions()
{
    Password = "1234567890"
};
using (Signature signature = new Signature("certificate.pfx", loadOptions))
{
    CertificateVerifyOptions options = new CertificateVerifyOptions()
    {
        // do not provide X.509 chain validation
        PerformChainValidation = false,
        // find exact math
        MatchType = TextMatchType.Exact,
        // check the serial number
        SerialNumber = "00AAD0D15C628A13C7"
    };

    // verify certificate
    VerificationResult result = signature.Verify(options);
    if (result.IsValid)
    {
        Console.WriteLine("\nCertificate was verified successfully!");
    }
    else
    {
        Helper.WriteError("\nCertificate failed verification process.");
    }
}
```
{{< /tab >}}
{{< /tabs >}}