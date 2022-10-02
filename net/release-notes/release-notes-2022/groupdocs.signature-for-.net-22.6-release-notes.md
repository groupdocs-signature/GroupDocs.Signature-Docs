---
id: groupdocs-signature-for-net-22-6-release-notes
url: signature/net/groupdocs-signature-for-net-22-6-release-notes
title: GroupDocs.Signature for .NET 22.6 Release Notes
weight: 44
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 22.6{{< /alert >}}

{{< alert style="info" >}}NOTE: Starting from this release .NET Framework 2.0 is not longer supported in the GroupDocs.Signature for .NET. The minimal supported versions is .NET Framework 4.0 and higher{{< /alert >}}
## Major Features

This release contains an important updates for QR Code entities and .Net Framework upgrade. Few changes were made to improve the Digital Signatures appearance with the Chinese charset for the PDF documents. Some adjustments were made on the ordering of the signatures on the Image Documents. Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.6:

* Implemented ability to specify the order of signature for Spreadsheet, Word process and Image documents.
* Provided full SVG file type support for image documents and most signature types.
* Involved a significant optimization of file detection algorithm.
* Implement adjustment on image preview signature for front-end applications.
* Fixed a few internal issues.
* Update the referenced libraries to the latest versions.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3845 | Implement standard QR Code WiFi entry  | Feature |
| SIGNATURENET-3844 | Upgrade .Net Framework up to 4.0 | Improvement |
| SIGNATURENET-3837 | Adjust standard QR-Code entities to support empty values | Improvement |
| SIGNATURENET-3810 | Improve ordering signatures for the Image Documents | Improvement |
| SIGNATURENET-3838 | Update the Developers Guide and Use Cases section of GroupDocs.Signature documentation | Improvement |
| SIGNATURENET-3843 | Chinese strings are not displayed correctly on the PDF Digital Signatures | Improvement |

## Public Developer Guide examples changes

The following topics from Developer Guide were changed

[Sign document with ordering the signatures]({{< ref "signature/net/developer-guide/advanced-usage/signing/sign-embed-and-encr-data-qr-codes/sign-documents-with-standard-qr-code-entries.md" >}})

## Public API and Backward Incompatible Changes

#### New public enumeration [WiFiEncryptionType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/wifiencryptiontype) was added to specify various encryption types for the WiFi QR Code entities

This enumeration keeps supported WiFi encryption types.

**New public enumeration**

```csharp
    /// <summary>
    /// Represents WiFi Encryption type.
    /// </summary>
    [Obfuscation(Feature = "internalization", Exclude = true, ApplyToMembers = true)]
    [Flags]
    public enum WiFiEncryptionType
    {
        /// <summary>Represents no encryption WiFi type.</summary>
        None = 0,

        /// <summary>Represents WiFi with the WPA encryption type.</summary>
        WPA = 1,

        /// <summary>Represents WiFi with the WPA-EAP encryption type.</summary>
        WPAEAP = 2,

        /// <summary>Represents WiFi with the WPA/WPA2 encryption type.</summary>
        WPAWPA2 = 3,

        /// <summary>Represents WiFi with the WEP encryption type.</summary>
        WEP = 4,
    }
```

#### Public class [WiFi](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/wifi) was added to provide WiFi QR Code object properties

Class [WiFi] contains following properties to get or set.

The following example demonstrates how to create WiFi QR Code standard entry.

**Create QR Code signature with WiFi**

```csharp
public static void Run()
{
    using (Signature signature = new Signature(filePath))
    {
        // create WiFi object
        WiFi wifi  = new WiFi()
        {
            SSID = "GuestNetwork!",
            Encryption = WiFiEncryptionType.WPAWPA2,
            Password = "guest",
            Hidden = false
        };
        // create options
        QrCodeSignOptions options = new QrCodeSignOptions
        {
            EncodeType = QrCodeTypes.QR,
            // setup Data property to SMS instance
            Data = wifi,
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
