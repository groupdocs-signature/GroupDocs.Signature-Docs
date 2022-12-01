---
id: groupdocs-signature-for-net-22-11-release-notes
url: signature/net/groupdocs-signature-for-net-22-11-release-notes
title: GroupDocs.Signature for .NET 22.11 Release Notes
weight: 28
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 22.11{{< /alert >}}

## Major Features

The main features of this release are enhancements with supporting certificate PFX type files as a source document and providing Logging across the product with different logging level. The PFX files support as document allows to retrive list of the certificate properties as metadata signatures from the Document Info method. The new ILogger interface is used as optional argument for settings to log various level of process events like errors, warnings and informations messages. In this releae we implemented logging of the errors and warnings mostly. Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.11:

* Implement support to load PFX Certificate files as document to retrieve information
* Implement ability to provide optional logging to track various level of process events like errors, warnings, information etc
* Extended DocumentInfo method to support certificate file PFX type.
* Provide sample Console and File loggers as quick and easy solution to track the product events.
* Fixed issue with processing Word Processing document with specific digital certificates.
* The referenced libraries were updated to the latest versions.


**Added support to load PFX Certificate file as document to retrive information**

### The following example demonstrates how to obtain certificate properties as part of [GetDocumentInfo](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/getdocumentinfo/) method with the new [CertificateMetadataSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/certificatemetadatasignature/) class.

```csharp
public static void Run()
{
    // create the Signature instance with the load options to set the password
    var loadOptions = new LoadOptions()
    {
        Password = "1234567890"
    };
    using (Signature signature = new Signature("certificate.pfx", loadOptions))
    {
        IDocumentInfo documentInfo = signature.GetDocumentInfo();
        Console.WriteLine($"Document properties {Path.GetFileName(filePath)}:");
        Console.WriteLine($" - format : {documentInfo.FileType.FileFormat}");
        Console.WriteLine($" - extension : {documentInfo.FileType.Extension}");        
        // display certificate properties as Certificate Metadata signatures information
        Console.WriteLine($"Certificate properties : {documentInfo.MetadataSignatures.Count}");
        foreach (CertificateMetadataSignature metadataSignature in documentInfo.MetadataSignatures)
        {
            Console.WriteLine($" - #{metadataSignature.Name} = {metadataSignature.Value}");
        }
    }
}
```

**Implemented ability to provide standard or custom ILogger interface to log different product events**

#### New interface [ILogger](https://reference2.groupdocs.com/signature/net/groupdocs.signature.logging/ilogger/) was created to provide ability to log the product events. The instance of this interface can be passed to the new property of the [SignatureSetting](https://reference.groupdocs.com/signature/net/groupdocs.signature/signaturesettings/) the field [Logger](https://reference.groupdocs.com/signature/net/groupdocs.signature/signaturesettings/logger/)

The following example demonstrates how to pass standard [FileLogger](https://reference.groupdocs.com/signature/net/groupdocs.signature.logging/filelogger/) class that implements ILogger interface.

```csharp
public static void Run()
{
    var logger = new FileLogger("signature-log.txt");
    var settings = new SignatureSettings(logger);
    var loadOptions = new LoadOptions()
    {
        Password = "1" // Wrong password
    };
    using (Signature signature = new Signature("source.pdf", loadOptions, settings))
    {
        QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith")
        {
            EncodeType = QrCodeTypes.QR,
            Left = 100,
            Top = 100
        };
        try
        {
            // sign document to file
            signature.Sign("output.pdf", options);
        }
        catch // catch the Exception
        {
            // Error will be already in the log file
        }
    }
}
```

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-4104 | Search signature returns null in SignatureId field for pptx file | Bug |
| SIGNATURENET-3961 | Exception Digital certificate has wrong format. Description: Cannot find the requested object | Feature |
| SIGNATURENET-4083 | Implement ILogger interface for optional logging | Feature |
| SIGNATURENET-4023 | Respect PFX certificate document type to receive Document Info | Feature |
| SIGNATURENET-4137 | Implement CertificateMetadataSignature to respect Certificate Documents | Enhancement |
| SIGNATURENET-4091 | Implement ConsoleLogger as example of interface using | Enhancement |
| SIGNATURENET-4090 | Implement FileLogger as example of interface using | Enhancement |

## Public Developer Guide examples changes

The following topics from the Developer Guide were changed

[eSign PDF with QR Code entries]({{< ref "signature/net/developer-guide/advanced-usage/common/obtain-document-form-fields-and-signatures-information.md" >}})

## Public API and Backward Incompatible Changes

#### Public static variable [PFX](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/pfx/) was added to the list of supported types as field of the [FileType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/filetype/)

```csharp
public static void Run()
{
    var supportedFileTypes = FileType
                .GetSupportedFileTypes()
                .OrderBy(f => f.Extension);
    foreach (FileType fileType in supportedFileTypes)
    {
        Console.WriteLine($"{fileType.FileFormat}. Extension: {fileType.Extension});
    }
}
```

#### Public enumeration [DocumentType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documenttype/) was updated with the new document type Certificate

```csharp
public static void Run()
{
    public enum DocumentType
    {
        . . . .
        /// <summary>Certificate file Type.</summary>
        Certificate
    };
}
```


