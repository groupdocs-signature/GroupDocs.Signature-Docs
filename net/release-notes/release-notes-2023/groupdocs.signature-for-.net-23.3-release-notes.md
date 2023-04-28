---
id: groupdocs-signature-for-net-23-3-release-notes
url: signature/net/groupdocs-signature-for-net-23-3-release-notes
title: GroupDocs.Signature for .NET 23.3 Release Notes
weight: 16
description: "Features and fixes that are shipped in GroupDocs.Signature for .NET 23.3"
keywords: release notes, groupdocs.signature, .net, 23.3
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---

{{< alert style="info" >}}NOTE: From this release we no longer support .NET Framework 4.0. The minimal supported versions is NET Framework 4.6.2 and higher{{< /alert >}}

There are 10+ features, enhancements, and bug fixes in this release.

## Full list of changes in this release

| Key | Category | Summary |
| --- | --- | --- |
|SIGNATURENET-4387|Feature|[Implement support of AZW3 File Type](#implement-support-of-azw3-file-type)|
|SIGNATURENET-4553|Feature|[Added HIBC PAS QR Codes QR, Aztec and DataMatrix](#added-hibc-pas-qa-codes-qa-aztec-and-datamatrix)|
|SIGNATURENET-4551|Feature|[Added HIBC PASCode39 and PASCode128 Barcodes](#added-hibc-pascode39-and-pascode128-barcodes)|
|SIGNATURENET-4413|Enhancement|[Implement AZW3 as new export save file format for Word Processing documents](#implement-azw3-as-new-export-save-file-format-for-word-processing-documents)|
|SIGNATURENET-4417|Enhancement|Migrate product from .NET 40 to NET 462 frameworks|
|SIGNATURENET-4428|Enhancement|Replace DateTime Now values with the Universal format UTC-now|
|SIGNATURENET-4428|Fix|The exception is thrown when .ps document is being opened|
|SIGNATURENET-4314|Fix|Exception with UTC DateTime format with Digital PDF signatures|
|SIGNATURENET-4313|Fix|Implicit using of third party Org.BouncyCastle in referenced libraries|
|SIGNATURENET-4312|Fix|Fixed issue with casting object types on Open Office documents|

## Major Features

This release includes three features and one enhancement:

* [Implement support of AZW3 File Type](#implement-support-of-azw3-file-type)
* [Added HIBC PAS QR Codes QR, Aztec and DataMatrix](#added-hibc-pas-qa-codes-qa-aztec-and-datamatrix)
* [Added HIBC PASCode39 and PASCode128 Barcodes](#added-hibc-pascode39-and-pascode128-barcodes)
* [Implement AZW3 as new export save file format for Word Processing documents](#implement-azw3-as-new-export-save-file-format-for-word-processing-documents)


### Implement support of AZW3 File Type

[FileTypes](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/#properties) was extended with new [AZW3](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/azw3/) supported file type.

{{< tabs "example1">}}
{{< tab "C#" >}}
```cs
/// <summary>
/// Sign azw3 file type
/// </summary>
using (var signature = new Signature("sample.azw3"))
{
    // create sign options
    var options = new TextSignOptions("signed!")
    {
        // set signature position
        Left = 100,
        Top = 100
    };
    // sign document to file
    SignResult result = signature.Sign("output.azw3", options);
}
```
{{< /tab >}}
{{< /tabs >}}

### Added HIBC PAS QR Codes QR, Aztec and DataMatrix

[QRCodeTypes](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodetypes/) static class was updated with new types to support [HIBC PAS QR](https://en.wikipedia.org/wiki/Health_Industry_Business_Communications_Council). 

{{< tabs "example2">}}
{{< tab "C# QR-Code Types" >}}
```cs
/// <summary>
/// HIBC PAS QR-Code Type object.
/// </summary>
public static readonly QrCodeType HIBCPASQR;

/// <summary>
/// HIBC PAS Data Matrix QR-Code Type object.
/// </summary>
public static readonly QrCodeType HIBCPASDataMatrix;

/// <summary>
/// HIBC PAS Aztec QR-Code Type object.
/// </summary>
public static readonly QrCodeType HIBCPASAztec;
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
        EncodeType = QrCodeTypes.HIBCPASQR,
        // set signature position
        Left = 100,
        Top = 100
    };
    // sign document to file
    SignResult result = signature.Sign("output.pdf", options);
}
```
{{< /tab >}}
{{< /tabs >}}

### Added HIBC PASCode39 and PASCode128 Barcodes

[BarcodeTypes](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodetypes/) static class was updated with new types to support [HIBC PAS Barcodes](https://en.wikipedia.org/wiki/Health_Industry_Business_Communications_Council). 

{{< tabs "example3">}}
{{< tab "C# Barcode Types" >}}
```cs
/// <summary>
/// HIBC PAS 39 Barcode Type object.
/// </summary>
public static readonly BarcodeType HIBCCode39PAS;

/// <summary>
/// HIBC PAS 128 Barcode Type object.
/// </summary>
public static readonly BarcodeType HIBCCode128PAS;
```
{{< /tab >}}
{{< tab "C# Usage example" >}}
```cs
using (Signature signature = new Signature("sample.pdf""))
{
    // create barcode option with predefined barcode text that follow HIBC PAS standard
    BarcodeSignOptions options = new BarcodeSignOptions("+A99912345/$$52001510X3")
    {
        // setup Barcode encoding type
        EncodeType = BarcodeTypes.HIBCCode39PAS,
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

### Implement AZW3 as new export save file format for Word Processing documents

[WordProcessingSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/wordprocessingsaveoptions/) was updated with new types to support AZW3 save file format [File Format](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/wordprocessingsavefileformat/). 

{{< tabs "example4">}}
{{< tab "C#" >}}
```cs
using (var signature = new Signature("sample.docx"))
{
    // create QRCode option with predefined QRCode text
    var signOptions = new TextSignOptions("JohnSmith")
    {
        // set signature position
        Left = 100,
        Top = 100
    };

    var saveOptions = new WordProcessingSaveOptions()
    {
        FileFormat = WordProcessingSaveFileFormat.Azw3,
        OverwriteExistingFiles = true
    };
    // sign document to file
    SignResult result = signature.Sign("output.azw3", signOptions, saveOptions);
}
```
{{< /tab >}}
{{< /tabs >}}