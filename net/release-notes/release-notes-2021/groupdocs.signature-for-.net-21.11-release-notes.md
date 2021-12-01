---
id: groupdocs-signature-for-net-21-11-release-notes
url: signature/net/groupdocs-signature-for-net-21-11-release-notes
title: GroupDocs.Signature for .NET 21.11 Release Notes
weight: 38
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 21.11{{< /alert >}}

## Major Features

This release contains new features with Pdf and Spreadsheet documents processing, new method with Image signatures and enhancements with customizing Digital Signature appearance. New barcode type Mailmark was added to support signing and searching. Also this update contains few fixed issues with document processing. Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.11:

* Involved new settings for Pdf Digital Signature Appearance.
* Added new Barcode potal type Mailmark.
* Implemented a way to compose Image siganture from base64 string content.
* New export types were added for Spreadsheet documents.
* Few issues were fixed.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3730 | Implement Foreground color for Pdf Digital Signature Appearance | Feature |
| SIGNATURENET-3729 | Implement new MailMark Barcode type | Feature |
| SIGNATURENET-3703 | Implement easy way to pass image as base64 string to ImageSignOption | Feature |
| SIGNATURENET-3735 | Implement ImageSignOptions as IDisposable interface class | Improvement |
| SIGNATURENET-3734 | Implement new Spreadsheet document export format types | Improvement |
| SIGNATURENET-3733 | The exception is thrown when rendering Spreadsheet .ods file | Bug |
| SIGNATURENET-3732 | The exception is thrown for Digital Signature verification and searching for Linux OS | Bug |
| SIGNATURENET-3731 | Pdf Document could not be successfully certified for trial versions | Bug |
| SIGNATURENET-3701 | The signed Pdf file is corrupted and can not be opened in Acrobat Reader (.Net Core 3.x) | Bug |

## Public API and Backward Incompatible Changes

#### Public class [PdfDigitalSignatureAppearance](https://apireference.groupdocs.com/signature/net/groupdocs.signature.options.appearances/pdfdigitalsignatureappearance) was updated with new property that allows to specify foreground color of Digital Signature appearance on Pdf document page

Public class [PdfDigitalSignatureAppearance](https://apireference.groupdocs.com/signature/net/groupdocs.signature.options.appearances/pdfdigitalsignatureappearance) was updated with propery

* property Color [Foreground] that allows to specify foreground text color of signature labels.

**New properties of PdfDigitalSignatureAppearance class**

```csharp
    public class PdfDigitalSignatureAppearance
    {
        /// <summary>
        /// Get or set foreground text color of signature appearance.
        /// By default the value is Color.FromArgb(76, 100, 255)
        /// </summary>
        public Color Foreground { get; set; }
   }
```

#### Public class [BarcodeTypes](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodetypes) was updated with new static BarcodeType property that describes postal barcode Mailmark

This property defines support of new postal barcode Mailmark.

**New static property**

```csharp
    
    public static class BarcodeTypes
    {
        ...
        /// <summary>
        /// Royal Mail 2D Mailmark Barcode Type object.
        /// </summary>
        public static readonly BarcodeType Mailmark;
        ...
    }
}
```

#### Public enum [SpreadsheetSaveFileFormat](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain/spreadsheetsavefileformat) was updated with new supported save format types like Emf, Jpg and Png

Newly added format types SpreadsheetSaveFileFormat.Emf, SpreadsheetSaveFileFormat.Jpg and SpreadsheetSaveFileFormat.Png allow to save signed document to rquired format.

**New enumeration values**

```csharp
    
    public enum SpreadsheetSaveFileFormat
    {
        ...
        /// <summary>Saves the document in Windows Enhanced Metafile format.</summary>
        Emf = 31,

        /// <summary>Saves the document in Jpeg format.</summary>
        Jpg = 33,

        /// <summary>Saves the document in Portable Network Graphics format.</summary>
        Png = 34
    }
}
```

#### Public class [ImageSignOption](https://apireference.groupdocs.com/signature/net/groupdocs.signature.options/imagesignoptions) was extended with static method to create ImageSignOptions instance from base64 image string content and updated to implement IDisposable interface

The ImageSignOptions class implements IDisposable interface and contains static method FromBase64(string base64Content) to create ImageSignOptions from base64 string

**Public class ImageSignOption**

```csharp
    
    public class ImageSignOptions : SignOptions, IRectangle, IAlignment, IRotation, ITransparency, IDisposable
    {
        /// <summary>
        /// Creates a new instance of the ImageSignOptions class with predefined Image from Base64.
        /// </summary>
        /// <param name="base64Content"></param>
        /// <returns></returns>
        public static ImageSignOptions FromBase64(string base64Content);
    }
}
```

Following example demonstrates how to create ImageSignOptions from base64 string.

**Create Image signature from base64 string**

```csharp
public static void Run()
{
    using (Stream source = new FileStream("sample.pdf", FileMode.Open, FileAccess.Read))
    {
        using (Stream destin = new MemoryStream())
        {
            using (Signature.Signature signature = new Signature.Signature(source))
            {
                string base64Content = @"iVBORw0KGgoAAAANSUhEUg....AAAPoAAACSCAYAAABsS9cKAAAAGXRF";
                using (ImageSignOptions options = ImageSignOptions.FromBase64(base64Content))
                {
                    options.Left = 100;
                    options.Top = 100;
                    SignResult result = signature.Sign(destin, options);
                }
            }
        }
    }
}

```
