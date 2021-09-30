---
id: groupdocs-signature-for-net-21-6-release-notes
url: signature/net/groupdocs-signature-for-net-21-6-release-notes
title: GroupDocs.Signature for .NET 21.6 Release Notes
weight: 44
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 21.6{{< /alert >}}

## Major Features

This release contains improvement on obtaining Document information, adding new Spreadsheet format files to support, important fixes with Digital signatures deletion and few bug fixes.
Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.6:

* Implemented ability to exclude Deleted Signatures from Document information.
* Word Processing document issue with saving digital signatures was fixed.
* The issues with deleting Digital signatures in Word Processing and Spreadsheet files were fixed.
* Added support of Spreadsheet formats XLT and XLTM.
* Improvements were made to run sign processing with multiple threads.
* Implemented metadata adjustments ehn midifying documents.
* Few other minor bugs were fixed.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3493 | Update Image signatures modification to adjust metadata layout  | Feature |
| SIGNATURENET-3492 | Update Text signatures modification to adjust metadata layout  | Feature |
| SIGNATURENET-3458 | Implement ability to exclude Deleted Signatures from Document information  | Feature |
| SIGNATURENET-3494 | Update QR-code/Barcode signatures modification to adjust metadata layout  | Improvement |
| SIGNATURENET-3483 | Extend IDocumentInfo interface with new property to keep list of all existing Signatures  | Improvement |
| SIGNATURENET-3457 | Words Processing document does not have information about Digital Signatures | Bug |
| SIGNATURENET-3456 | Remove digital signature from Word and Excel | Improvement |
| SIGNATURENET-3412 | Excel file is not supported (XLT format) | Improvement |
| SIGNATURENET-3455 | Localized string error for MetaInfo data  | Bug |
| SIGNATURENET-3364 | Multiple calls issue in .NET in parallel multi-threads  | Bug |
| SIGNATURENET-2886 | File preview raises unexpected "Damaged file" exception  | Bug |

## Public API and Backward Incompatible Changes

#### New public static FileType [FileType](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype) were added to support new Spreadsheet file formats

These FileType static objects describe new supported Spreadsheet document types.

**New public static objects**

```csharp
    public sealed class FileType
    {
        /// <summary>
        /// Excel binary Temlpate (.xlt) represents Excel Temlpate File Format.
        /// Learn more about this file format <a href="https://wiki.fileformat.com/spreadsheet/xlt">here</a>. 
        /// </summary>
        public static readonly FileType XLT = new FileType("Excel Template file", ".xlt");

        /// <summary>
        /// Excel Office OpenXML file Temlpate (.xltm) represents Excel Temlpate File Format.
        /// Learn more about this file format <a href="https://wiki.fileformat.com/spreadsheet/xltm">here</a>. 
        /// </summary>
        public static readonly FileType XLTM = new FileType("Excel Template file", ".xltm");
    };
```

#### Public class [SignatureSettings](https://apireference.groupdocs.com/signature/net/groupdocs.signature/signaturesettings) was updated with new property that allow to exclude deleted Signatures from Document information result

Public class [SignatureSettings](https://apireference.groupdocs.com/signature/net/groupdocs.signature/SignatureSettings) was updated with property

* property bool [ShowDeletedSignaturesInfo] that allows to specify if deleted Signature information should be included into the Document Information structure. By default this value is enabled.

**New property of SignatureSettings class**

```csharp
    public class SignatureSettings
    {
        /// <summary>
        /// Gets or sets flag that includes deleted signatures into Document Info result.
        /// Each Signature <see cref="BaseSignature"/> has Deleted flag <see cref="BaseSignature.Deleted"/> to detect if it was deleted.
        /// </summary>
        public bool ShowDeletedSignaturesInfo { get; set; } = true;
   }
```

### Public interface [IDocumentInfo](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain/idocumentinfo) was extended with new property Signatures

Public interface **[IDocumentInfo](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain/idocumentinfo)** was extended with new property Signatures.

* Signatures property as IList of BaseSignature objects to keep the list of all document signatures.

**New property Signatures of IDocumentInfo interface**

```csharp
    /// <summary>
    ///  Defines document description properties.
    /// </summary>
    public interface IDocumentInfo
	{
        /// <summary>
        /// Collection of document all types signatures <see cref="BaseSignature"/>.
        /// </summary>
        IList<BaseSignature> Signatures { get; }
	}
```

### Public class [DocumentInfo](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain/documentinfo) was extended with new property Signatures

Public interface **[DocumentInfo](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain/documentinfo)** was extended with new property **Signatures** to keep the list of document signatures of all types.

**New property Signatures of DocumentInfo class**

```csharp
    public class DocumentInfo : IDocumentInfo
	{
        ...
        /// <summary>
        /// Collection of document all types signatures <see cref="BaseSignature"/>.
        /// </summary>
        public IList<BaseSignature> Signatures { get; }
	}
```

Following example demonstrates how to obtain information about actual document signatures.

**Get Document extended information**

```csharp
public static void Run()
{
    // define Signature settings to remove Deleted signatures from the list
    SignatureSettings signatureSettings = new SignatureSettings()
    {
        ShowDeletedSignaturesInfo = false
    };
    using (Signature signature = new Signature("signed.pdf", signatureSettings))
    {
        IDocumentInfo documentInfo = signature.GetDocumentInfo();
        
        // display all document signatures information without deleted ones
        Console.WriteLine($"Document actual Signatures : {documentInfo.Signatures.Count}");
        foreach (BaseSignature baseSignature in documentInfo.Signatures)
        {
            Console.WriteLine(
                $" - #{baseSignature.SignatureId}: Type: {baseSignature.SignatureType} Location: {baseSignature.Left}x{baseSignature.Top}. " +
                $"Size: {baseSignature.Width}x{baseSignature.Height}. " +
                $"CreatedOn/ModifiedOn: {baseSignature.CreatedOn.ToShortDateString()} / {baseSignature.ModifiedOn.ToShortDateString()}");
        }                
        
        // display document process history information
        Console.WriteLine($"Document Process logs information: count = {documentInfo.ProcessLogs.Count}");
        foreach (ProcessLog processLog in documentInfo.ProcessLogs)
        {
            Console.WriteLine($" - operation [{processLog.Type}] on {processLog.Date.ToShortDateString()}. Succedded/Failed {processLog.Succeeded}/{processLog.Failed}. Message: {processLog.Message} : ");
            if (processLog.Signatures != null)
            {
                foreach (BaseSignature logSignature in processLog.Signatures)
                {
                    Console.WriteLine($"\t\t -{logSignature.SignatureType} #{logSignature.SignatureId} at {logSignature.Top} x {logSignature.Left} pos;");
                }
            }
        }
    }
}
```
