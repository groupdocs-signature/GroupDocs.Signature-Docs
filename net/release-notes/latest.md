---
id: groupdocs-signature-for-net-latest-release-notes
url: signature/net/groupdocs-signature-for-net-latest-release-notes
title: Latest release (March 2023)
weight: 0
description: "Changes that shipped in the latest version of GroupDocs.Signature for .NET"
keywords: release notes, groupdocs.signature for .net, latest
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---

{{< alert style="info" >}} ⓘ INFORMATION: Starting with this release, we now support processing documents within archive files. Currently, supported formats include ZIP, TAR, and 7Z for signing documents contained in these archives. In the upcoming version, we will introduce additional operations such as verification, searching, modification, and more.{{< /alert >}}

There are about ten features, enhancements, and bug fixes in this release.

## Full list of changes in this release

| Key | Category | Summary |
| --- | --- | --- |
|SIGNATURENET-4369| ★ Feature|[Implement support of ZIP File Type](#implement-support-of-zip-file-type)|
|SIGNATURENET-4442| ★ Feature|[Implement support of TAR File Type](#implement-support-of-tar-file-type)|
|SIGNATURENET-4452| ★ Feature|[Implement support of 7z File Type](#implement-support-of-7z-file-type)|
|SIGNATURENET-4479| ★ Feature|[Implement Document Info for archives](#implement-document-info-for-archives)|
|SIGNATURENET-4476| ⚙️ Enhancement|[Support Succeeded and Failed list as result of processing archives](#support-succeeded-and-failed-list-as-result-of-processing-archives)|
|SIGNATURENET-4374| 🔧 Fix|Error on signing Wordprocessing documents digitally with Linux generated certificates|
|SIGNATURENET-4373| 🔧 Fix|Exception on processing Spreadsheets file with Digital signatures with non Win-OS certificates|
|SIGNATURENET-4203| 🔧 Fix|Some tests for PDF throw "Invalid provider type specified" exception|
|SIGNATURENET-4169| 🔧 Fix|Some files couldn't be processed with curent version of the product|

## Major Features

This release includes four new archive features and one enhancement:

* [Implement support of ZIP File Type](#implement-support-of-zip-file-type)
* [Implement support of TAR File Type](#implement-support-of-tar-file-type)
* [Implement support of 7z File Type](#implement-support-of-7z-file-type)
* [Implement Document Info for archives](#implement-document-info-for-archives)
* [Support Succeeded and Failed list as result of processing archives](#support-succeeded-and-failed-list-as-result-of-processing-archives)

### Implement support of ZIP File Type

🌐 New class [DocumentResultSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentresultsignature/#properties) was added to describe the processed document within the archive file. This class extends [BaseSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/basesignature/) and implements [IResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/iresult/) interface as container of the process (sign, verify, search) over this particular document. See example below.
🌐 [FileTypes](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/#properties) was extended with new [ZIP](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/zip/) supported file type.

{{< tabs "example1">}}
{{< tab "C#" >}}
```cs
/// <summary>
/// Get ZIP file and sign all documents within the archive
/// </summary>
using (var signature = new Signature("sample.zip"))
{
    // create sign options
    var options = new TextSignOptions("signed!")
    {
        // set signature position
        Left = 100,
        Top = 100
    };
    // sign archive to new zip file
    SignResult result = signature.Sign("output.zip", options);
    // analyze signed documents
    Console.WriteLine("\nList of successfully signed documents:");
    foreach (DocumentResultSignature document in signResult.Succeeded)
    {
        Console.WriteLine($"Document {document.FileName} was signed with. Processing time: {document.ProcessingTime}, mls");
    }
}
```
{{< /tab >}}
{{< /tabs >}}

### Implement support of TAR File Type

🌐 [FileTypes](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/#properties) was extended with new [TAR](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/tar/) supported file type.

{{< tabs "example2">}}
{{< tab "C#" >}}
```cs
/// <summary>
/// Get TAR file and sign all documents within the archive
/// </summary>
using (var signature = new Signature("sample.tar"))
{
    // create list of signature options
    BarcodeSignOptions bcOptions1 = new BarcodeSignOptions("12345678", BarcodeTypes.Code128)
    {
        Left = 100,
        Top = 100
    };
    QrCodeSignOptions qrOptions2 = new QrCodeSignOptions("12345678", QrCodeTypes.QR)
    {
        Left = 400,
        Top = 400
    };
    List<SignOptions> listOptions = new List<SignOptions>() { bcOptions1, qrOptions2 };
    // sign archive to new tar file with list of options
    SignResult result = signature.Sign("output.tar", listOptions);
    // analyze signed documents
    Console.WriteLine("\nList of successfully signed documents:");
    foreach (DocumentResultSignature document in signResult.Succeeded)
    {
        Console.WriteLine($"Document {document.FileName} was signed with. Processing time: {document.ProcessingTime}, mls");
    }
}
```
{{< /tab >}}
{{< /tabs >}}

### Implement support of 7z File Type

🌐 [FileTypes](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/#properties) was extended with new [SevenZip](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/sevenzip/) supported file type.

{{< tabs "example3">}}
{{< tab "C#" >}}
```cs
/// <summary>
/// Get 7z file and sign all documents within the archive
/// </summary>
using (var signature = new Signature("sample.7z"))
{
    // create sign options
    var options = new TextSignOptions("signed!")
    {
        // set signature position
        Left = 100,
        Top = 100
    };
    // sign archive to new 7z file
    SignResult result = signature.Sign("output.7z", options);
    // analyze signed documents
    Console.WriteLine("\nList of successfully signed documents:");
    foreach (DocumentResultSignature document in signResult.Succeeded)
    {
        Console.WriteLine($"Document {document.FileName} was signed with. Processing time: {document.ProcessingTime}, mls");
    }
}
```
{{< /tab >}}
{{< /tabs >}}

### Implement Document Info for archives

🌐 Class [DocumentInfo](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/idocumentinfo/) was extended with the new property [Documents](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/idocumentinfo/documents/) to represent the list of the document info with the archives.

{{< tabs "example4">}}
{{< tab "C#" >}}
```cs
/// <summary>
/// Get zip file and obtain documents information with the archive
/// </summary>
using (var signature = new Signature("sample.zip"))
{
    IDocumentInfo documentInfo = signature.GetDocumentInfo();
    Console.WriteLine($"Archive properties {Path.GetFileName(certificatePath)}:");
    Console.WriteLine($" - format : {documentInfo.FileType.FileFormat}");
    Console.WriteLine($" - extension : {documentInfo.FileType.Extension}");
    Console.WriteLine($" - size : {documentInfo.Size}");
    Console.WriteLine($" - documents count : {documentInfo.PageCount}");

    // display each document information
    Console.WriteLine($"Documents information:");
    foreach (DocumentResultSignature document in documentInfo.Documents)
    {
        Console.WriteLine($"Document: {document.FileName}. {document.SourceDocumentSize} /{document.DestinDocumentSize}");
    }
}
```
{{< /tab >}}
{{< /tabs >}}

### Support Succeeded and Failed list as result of processing archives

🌐 The [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) will keep the list of succeeded and failed [DocumentResultSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentresultsignature/#properties) elements in the result of the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method.

{{< tabs "example5">}}
{{< tab "C#" >}}
```cs
/// <summary>
/// Support Succeeded and Failed list as result of processing archives
/// </summary>
using (var signature = new Signature("sample.zip"))
{
    // create sign options
    var options = new TextSignOptions("signed!")
    {
        // set signature position
        Left = 100,
        Top = 100
    };
    // sign archive to new 7z file
    SignResult result = signature.Sign("output.7z", options);
    // analyze signed documents
    foreach (DocumentResultSignature document in result.Succeeded)
    {
        Console.WriteLine($"Document {document.FileName}. Processed: {document.ProcessingTime}, mls");
    }
    if (signResult.Failed.Count > 0)
    {
        Console.WriteLine("\nList of failed documents:");
        number = 1;
        foreach (DocumentResultSignature document in result.Failed)
        {
            Console.WriteLine($"Document {document.FileName}. Processed: {document.ProcessingTime}, mls");
        }
    }
}
```
{{< /tab >}}
{{< /tabs >}}
