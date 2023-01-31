---
id: groupdocs-signature-for-net-23-1-release-notes
url: signature/net/groupdocs-signature-for-net-23-1-release-notes
title: GroupDocs.Signature for .NET 23.1 Release Notes
weight: 20
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 23.1{{< /alert >}}

The main feature of this release is the implementation of the process metrics that provides statistic on processing time, incoming and outgoing document size, the number of signatures, etc. The IResult interface was enhanced to implement these values. Also, the release includes the changes to fix the Word Processing preview under the .Net Core on Linux platforms, fix on Spreadsheet page size calculation and correction on forming the PNG output format when exporting the document pages as images. Below is the list of the most notable changes in the release of GroupDocs.Signature for .NET 23.1:

* Process metrics were implemented for Sign, Update, Delete, Search and Verify methods
* Fixed the exception by previewing the Word Processing document in Jpg format
* Document export as image method was fixed to provide accurate PNG format files
* The Page size property of the DocumentInfo was fixed for Spreadsheet documents
* Trace logging was extended with informational messages for each method of working with a particular signature
* Referenced libraries and dependencies were updated


**SignResult implements product metrics properties of the IResult interface**

### The following example demonstrates how to analyze IResult metrics.

```csharp
public static void Run()
{
    using (Signature signature = new Signature("sample.pdf"))
    {
        // create QRCode option with predefined QRCode text
        QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");

        // sign document to file
        SignResult signResult = signature.Sign("output.pdf", options);

        // analyze SignResult (IResult properties)
        Console.WriteLine($"Sign-process was executed for {signResult.ProcessingTime} mls");
        Console.WriteLine($"Input document size {signResult.SourceDocumentSize} bytes");
        Console.WriteLine($"Output document size {signResult.DestinDocumentSize} bytes");
        Console.WriteLine($"Total processed signatures {signResult.TotalSignatures}");
        if (signResult.Failed.Count == 0)
        {
            Console.WriteLine("\nAll signatures were successfully created!");
        }
        else
        {
            Console.WriteLine($"Successfully created signatures : {signResult.Succeeded.Count}");
            Helper.WriteError($"Failed signatures : {signResult.Failed.Count}");
        }
        Console.WriteLine("\nList of newly created signatures:");
        int number = 1;
        foreach (BaseSignature temp in signResult.Succeeded)
        {
            Console.WriteLine($"Signature #{number++}: Type: {temp.SignatureType} Id:{temp.SignatureId}");
        }
    }
}
```


Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-4259 | Exported PNG images from the documents have a corrupted format | Bug |
| SIGNATURENET-4222 | The Page size property of the DocumentInfo is wrong for Spreadsheet files | Bug |
| SIGNATURENET-4006 | .Net Core : Preview Word Processing document in Jpg format gives unexpected exception | Bug |
| SIGNATURENET-4150 | Implement process method metrics to all product methods | Feature |
| SIGNATURENET-4260 | Extend trace level logging messages for each particular signature processing for Sign, Update, Delete, Search and Verify methods | Enhancement |

## Public Developer Guide examples changes

The following topics from Developer Guide were added

[Sign document with ordering the signatures]({{< ref "signature/net/developer-guide/advanced-usage/signing//sign-document-with-result-analysis.md" >}})

## Public API and Backward Incompatible Changes

#### Public interface [IResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/iresult/) was updated with following properties

Property [ProcessingTime] of type long return the execution time of the process in milliseconds.
Property [TotalSignatures] of type int return the total processed signatures.
Property [SourceDocumentSize] of type long return the input document length in bytes.
Property [DestinDocumentSize] of type long return the output document length in bytes.

#### Public classes [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult/), [UpdateResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/updateresult/), [DeleteResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/deleteresult/) were updated with following properties to implement IResult interface

Property [ProcessingTime] of type long return the execution time of the process in milliseconds.
Property [TotalSignatures] of type int return the total processed signatures.
Property [SourceDocumentSize] of type long return the input document size in bytes.
Property [DestinDocumentSize] of type long return the output (signed/modified/saved) document size in bytes.

#### Public classes [VerificationResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/verificationresult/) and [SearchResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/searchresult/) were updated to implement IResult interface and support following properties

Property [ProcessingTime] of type long return the execution time of the Sign process in milliseconds.
Property [TotalSignatures] of type int return the total processed signatures.
Property [SourceDocumentSize] of type long return the input document size in bytes.
Property [DestinDocumentSize] of type long for Verify and Search method always returns zero.
Property [Succeeded] as List of [BaseSignature] objects keeps the list of processed successfully signatures for Search method. This property does not yet supported for Verify method.
Property [Failed] as List of [BaseSignature] objects keeps the list of failed signatures. This property currently does not supported for Verify and Search methods.

