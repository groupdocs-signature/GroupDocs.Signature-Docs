---
id: groupdocs-signature-for-net-22-12-release-notes
url: signature/net/groupdocs-signature-for-net-22-12-release-notes
title: GroupDocs.Signature for .NET 22.12 Release Notes
weight: 24
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 22.12{{< /alert >}}

## Major Features

The main features of this release are improvements with logging, fixes the issues under Linux platform and new property DataType of the metadata signatures. The updates with logging are related to extended messages for Trace log level that allow to log information events. Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.12:

* Fixed the error with previewing Word Processing documents on the Linux platform
* Fixed unexpected QRCode Signature verification result under Linux OS
* Detection of PFX Certificate files were recognized properly
* Log Level enumeration was provided to limit the logging messages events
* Implement new DataType property of the MetadataSignature class.
* Implement detailed Trace messages for logging of the most methods.
* Provide Log Level flags enumeration to specify multiple log levels processing.


**Added new enumeration LogLevel to specify the level of logging witing the SignatureSettings new LogLevel propert**

### The following example demonstrates how to setup standard or custom logging.

```csharp
public static void Run()
{
    // use standard console logger
    var logger = new ConsoleLogger();
    var settings = new SignatureSettings(logger);
    settings.LogLevel = LogLevel.Error | LogLevel.Warning;
    try
    {
        // create the Signature instance with the Signature settings
        using (Signature signature = new Signature("sample.pdf", loadOptions, settings))
        {
            QrCodeSignOptions options = new QrCodeSignOptions("Sample1");

            // sign document to file
            signature.Sign(outputFilePath, options);
        }
    }
    catch
    {
        // skip the Exception - check the log
    }
    Console.WriteLine("\nSource document signed successfully.\nFile saved at " + outputFilePath);
}
```


Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-4206 | Error with previewing Word Processing documents on the Linux platform | Bug |
| SIGNATURENET-4157 | QRCode Signature verification result differs from expected (Linux platform) | Bug |
| SIGNATURENET-4147 | Some PFX Certificate documents are not recognized properly | Bug |
| SIGNATURENET-4155 | Implement Log Level settings to limit the logging messages events | Feature |
| SIGNATURENET-4138 | Implement DataType property of the MetadataSignature class | Enhancement |
| SIGNATURENET-4115 | Implement detailed Trace messages for logging of the most methods | Enhancement |
| SIGNATURENET-4110 | Provide Log Level flags enumeration to specify multiple log levels processing | Enhancement |

