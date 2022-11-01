---
id: groupdocs-signature-for-net-22-9-release-notes
url: signature/net/groupdocs-signature-for-net-22-9-release-notes
title: GroupDocs.Signature for .NET 22.9 Release Notes
weight: 34
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 22.9{{< /alert >}}

{{< alert style="info" >}}NOTE: Since this release, the GroupDocs.Signature for .NET starts to support .NET 6.0 Framework.{{< /alert >}}
## Major Features

The main feature of this release is the Net6.0 framework support. Besides that there are many fixes, improvements and features. New standard object SMS was implemented for the QR Code. Few fixes are related to processing QR Codes and signing Word Processing documents. Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.9:

* Net 6.0 framework support was added.
* New QR Code SMS object was implemented
* Fixed QR Code Event serialization issue.
* Implemented fixes with unexpected options settings.
* Fixed issues with damaged metadata information in the Microsoft Office documents
* The referenced libraries were updated to the latest versions.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3993 | Fixed QR Code Event object with multiple location serialization | Bug |
| SIGNATURENET-3987 | Error when signing the document with negative Width or Heigh parameters | Bug |
| SIGNATURENET-3959 | Exception : Image export failed | Bug |
| SIGNATURENET-3953 | Error processing Image documents: Unable to cast object of type 'System.Int32' to type 'System.UInt16' | Bug |
| SIGNATURENET-3952 | Error obtaining Words processing Document Info | Bug |
| SIGNATURENET-3951 | Processing Word Documents : Parameter not valid | Bug |
| SIGNATURENET-3658 | Error processing Image Document with many metadata items | Bug |
| SIGNATURENET-3915 | Implement SMS QR Code entity object | Feature |
| SIGNATURENET-3847 | Involve .Net 6.0 Support | Feature |
| SIGNATURENET-3991 | Skip possible damaged internal metadata information for most supported Office documents | Enhancement |

## Public Developer Guide examples changes

The following topics from Developer Guide were changed

[eSign PDF with QR Code entries]({{< ref "signature/net/developer-guide/advanced-usage/signing/sign-embed-and-encr-data-qr-codes/sign-documents-with-standard-qr-code-entries.md" >}})

## Public API and Backward Incompatible Changes

#### Public class [SMS](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/sms) was added to provide SMS QR Code object properties

Class [SMS] contains following properties to get or set.

```csharp
/// <summary>
/// Represents SMS short message service details.
/// </summary>
public class SMS
{
    /// <summary>
    ///Gets or sets SMS receipient phone number.
    /// </summary>
    public string Number { get; set; }

    /// <summary>
    ///Gets or sets SMS message content.
    /// </summary>
    public string Message { get; set; }

    /// <summary>
    /// Creates VCard instance with default values.
    /// </summary>
    public SMS()
    {
    }
}
```

The following example demonstrates how to create SMS QR Code standard entry.

**Create QR Code signature with SMS**

```csharp
public static void Run()
{
    using (Signature signature = new Signature("sample.pdf"))
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
