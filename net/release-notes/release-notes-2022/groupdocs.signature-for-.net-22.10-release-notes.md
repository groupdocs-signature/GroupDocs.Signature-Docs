---
id: groupdocs-signature-for-net-22-10-release-notes
url: signature/net/groupdocs-signature-for-net-22-10-release-notes
title: GroupDocs.Signature for .NET 22.10 Release Notes
weight: 30
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 22.10{{< /alert >}}

## Major Features

The main features of this release are enhancements to the Document Info method and the new Barcode type. The Document Info method was improved to retrieve the list of document Metadata signatures with the optional ability to include standard document metadata information as well. The new composite Barcode type allows to generate the GS1Composite barcode type. For future releases, we will provide additional settings to customize the upper and down barcode type with other options. Besides that, there are few important fixes with Open Document processing files. Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.10:

* Document information data was upgraded with the Metadata signatures that could include optionally standard document meta information
* New composite barcode type GS1Composite Barcode was implemented
* Improved license encryption.
* Implemented additional global Signature settings flag to include or exclude standard document metadata information.
* Fixed issues with modifying the digitally signed Open Office documents.
* The referenced libraries were updated to the latest versions.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3482 | Exceptions during modifying the OpenOffice document with Digital signatures ZipEntry ReadHeader | Bug |
| SIGNATURENET-4016 | Implement list of Metadata for Document Info for all supported file types | Feature |
| SIGNATURENET-3916 | Implement new Barcode Type GS1CompositeBar | Feature |
| SIGNATURENET-4028 | Implement new option for DocumentInfo to include standard document metadata signatures | Enhancement |
| SIGNATURENET-4064 | Improve license encryption security | Enhancement |

## Public Developer Guide examples changes

The following topics from the Developer Guide were changed

[eSign PDF with QR Code entries]({{< ref "signature/net/developer-guide/advanced-usage/common/obtain-document-form-fields-and-signatures-information.md" >}})

## Public API and Backward Incompatible Changes

#### Public interface [IDocumentInfo](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/idocumentinfo/) was updated with new collection of the Metadata signatures [MetadataSignatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/idocumentinfo/metadatasignatures/

Changes with the interface [IDocumentInfo] with new collection of the Metadata signatures of the document.

```csharp
/// <summary>
/// Defines document description properties.
/// </summary>
public interface IDocumentInfo
{
    /// <summary>
    /// Collection of document Metadata signatures.
    /// </summary>
    IList<MetadataSignature> MetadataSignatures { get; }
}
```

#### Public interface [DocumentInfo](https://reference.groupdocs.com/signature/net/groupdocs.signature/signaturesettings/) was updated to implement interface and support collection of the Metadata signatures [MetadataSignatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentinfo/metadatasignatures/

#### Public class [SignatureSettings](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/sms) was updated with the new boolean flag to optional include standard metadata signatures into the document collection of metadata signatures

Class [SignatureSettings] contains the following property to get or set.

```csharp
/// <summary>
/// Represents SMS short message service details.
/// </summary>
public class SignatureSettings
{
    /// <summary>
    /// Gets or sets flag to include into the Metadata List the embedded standard document metadata signatures like Author, Owner, document creation date, modified date, etc.
    /// If this flag is set to false (by default) the GetDocumentInfo will not include these metadata signatures.
    /// When this flag is set to true the document information will include these standard metadata signatures.
    /// </summary>
    public bool IncludeStandardMetadataSignatures { get; set; } = false;
}
```

The following example demonstrates how to create SMS QR Code standard entry.

**Create QR Code signature with SMS**

```csharp
public static void Run()
{
    using (Signature signature = new Signature(filePath))
    {
        // create SMS object
        SMS sms = new SMS()
        {
            Number = "0800 048 0408",
            Message = "Document approval automatic SMS message"
        };
        // create options
        QrCodeSignOptions options = new QrCodeSignOptions
        {
            EncodeType = QrCodeTypes.QR,
            // setup Data property to SMS instance
            Data = sms,
            // set right bottom corner
            HorizontalAlignment = HorizontalAlignment.Left,
            VerticalAlignment = VerticalAlignment.Center,
            Width = 100,
            Height = 100,
            Margin = new Padding(10)
        };

        // sign document to file
        signature.Sign(outputFilePath, options);
        Console.WriteLine($"\nSource document signed successfully with {signResult.Succeeded.Count} signature(s).\nFile saved at {outputFilePath}.");
    }
} 
```
