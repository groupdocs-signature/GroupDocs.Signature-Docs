---
id: groupdocs-signature-for-net-22-4-release-notes
url: signature/net/groupdocs-signature-for-net-22-4-release-notes
title: GroupDocs.Signature for .NET 22.4 Release Notes
weight: 48
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 22.4{{< /alert >}}

{{< alert style="info" >}}NOTE: .NET Framework 2.0 will not be supported since the next release of GroupDocs.Signature for .NET. The minimal supported versions will be .NET Framework 4.0 and higher{{< /alert >}}
## Major Features

This release contains an important features for ordering the electronic signatures on document pages. The new options Order was implemented for page-oriented signature types like Text, Image, Barcode, QRCode and Stamps and supported for most document types such as Spreadsheets, Word Processing and Images. Having this feature will allow the front-end applications to adjust signature ordering on the page and move them from back to front. Also this release contains significant optimization for document type detections and implementation of sull svg-image file format support. Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.4:

* Implemented ability to specify the order of signature for Spreadsheet, Word process and Image documents.
* Provided full SVG file type support for image documents and most signature types.
* Involved a significant optimization of file detection algorithm.
* Implement adjustment on image preview signature for front-end applications.
* Fixed a few internal issues.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3810 | Implement Order position for page-oriented signatures for Image Documents | Feature |
| SIGNATURENET-3809 | Implement Order position for page-oriented signatures for Word Processing Documents | Feature |
| SIGNATURENET-3808 | Implement full SVG file type for image documents for all signature types | Feature |
| SIGNATURENET-3807 | Improve file type detection algorithm | Improvement |
| SIGNATURENET-3758 | Implement Order position for page-oriented signatures for Spreadsheet Documents | Feature |
| SIGNATURENET-3706 | Implement various Image Signature Preview for Signature App Generation Templates | Improvement |

## Public Developer Guide examples changes

The following topics from Developer Guide were added

[Sign document with ordering the signatures]({{< ref "signature/net/developer-guide/advanced-usage/signing/sign-document-with-ordering.md" >}})

## Public API and Backward Incompatible Changes

#### Public class [SignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/signoptions) was updated with ZOrder property

Property [ZOrder] expects integer values to put the signatures on document page in proper order.

The following example demonstrates how to setup special ordering of the signatures on the document page.

**Generate signature preview**

```csharp
public static void Run()
{
    using (Signature signature = new Signature("sample.png"))
    {
        // create several signatures that intersect
        // # 1 create barcode option with predefined barcode text
        // this options will be on top
        BarcodeSignOptions options1 = new BarcodeSignOptions("12345678")
        {
            // setup Barcode encoding type
            EncodeType = BarcodeTypes.Code128,
            // set signature position
            Left = 100,
            Top = 100,
            Width = 100,
            Height = 100,
            ZOrder = 2,
        };
        // # 2 create barcode option with predefined barcode text
        // this options will be bottom
        QrCodeSignOptions options2 = new QrCodeSignOptions("12345678")
        {
            // setup Barcode encoding type
            EncodeType = QrCodeTypes.QR,
            // set signature position
            Left = 150,
            Top = 150,
            ZOrder = 1
        };
        // sign document to file
        List<SignOptions> options = new List<SignOptions>() { options1, options2 };
        SignResult signResult = signature.Sign(outputFilePath, options);
        Console.WriteLine($"\nSource document signed successfully with {signResult.Succeeded.Count} signature(s).\nFile saved at {outputFilePath}.");
    }
} 
```
