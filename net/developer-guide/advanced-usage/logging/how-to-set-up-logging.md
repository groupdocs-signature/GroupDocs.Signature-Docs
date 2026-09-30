---
id: how-to-set-up-logging
url: signature/net/how-to-set-up-logging
title: Set up logging
weight: 1
description: "This article explains how to set up logging when processing a document with GroupDocs.Signature within your .NET applications."
keywords: logging, logger, document esign, converting
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---

By default logging is disabled when processing documents but product provides a way to save the log with embedded implementation to save events to console and file.

There is an interface that we can utilize:

* [ILogger](https://reference.groupdocs.com/signature/net/groupdocs.signature.logging/ilogger) - defines the interface for logging different process event like errors, warnings and information messages (traces).

There are classes that we can utilize:

* [ConsoleLogger](https://reference.groupdocs.com/signature/net/groupdocs.signature.logging/consolelogger) - defines the methods that are required for logging to console.
* [FileLogger](https://reference.groupdocs.com/signature/net/groupdocs.signature.logging/filelogger) - defines the methods that are required for logging to file.

There are 3 types of messages in the log file:

* Error - for unrecoverable exceptions
* Warning - for recoverable/expected/known exceptions
* Trace - for general information

## Choose which messages are logged

The [LogLevel](https://reference.groupdocs.com/signature/net/groupdocs.signature/signaturesettings/loglevel/) property of [SignatureSettings](https://reference.groupdocs.com/signature/net/groupdocs.signature/signaturesettings/) decides which kinds of messages reach the logger. The values are flags that can be combined: `Error`, `Warning` and `Trace`. The default, `LogLevel.All`, logs all three, and `LogLevel.None` logs nothing.

```csharp
var settings = new SignatureSettings(new ConsoleLogger())
{
    // Errors and warnings, without the step-by-step traces.
    LogLevel = LogLevel.Error | LogLevel.Warning
};
```

The level only filters the log: exceptions are thrown as before.

{{< alert style="info" >}}
`LogLevel` takes effect starting with GroupDocs.Signature for .NET 26.9. In earlier versions every error, warning and trace reached the logger, whatever the value.
{{< /alert >}}

## Logging to File

In this example, we'll log into the file so we need to use [FileLogger](https://reference.groupdocs.com/signature/net/groupdocs.signature.logging/filelogger) class.

```csharp
// Create logger and specify the output file
FileLogger fileLogger = new FileLogger("output.log");

// Create SignatureSettings and specify FileLogger
var settings = new SignatureSettings(fileLogger);

using (var signature = new Signature("sample.docx", settings))
{
    var options = new QrCodeSignOptions("JohnSmith");
    // sign document to file
    signature.Sign(outputFilePath, options);
}
```

## Logging to Console

In this example, we'll log into the console so we need to use [ConsoleLogger](https://reference.groupdocs.com/signature/net/groupdocs.signature.logging/consolelogger) class.

```csharp
// Create logger that writes to the console
var consoleLogger = new ConsoleLogger();

// Create SignatureSettings and specify ConsoleLogger instance
var settings = new SignatureSettings(consoleLogger);

using (var signature = new Signature("sample.docx", settings))
{
    var options = new QrCodeSignOptions("JohnSmith");
    // sign document to file
    signature.Sign(outputFilePath, options);
}
```

## Warnings you may see

GroupDocs.Signature writes a warning when an operation succeeds but the result may not be what you expect. Warnings are logged when `LogLevel` includes `LogLevel.Warning`, as the default does. Starting with GroupDocs.Signature for .NET 26.9, you may see these warnings:

| Warning begins with | When | What to do |
| --- | --- | --- |
| `The signing certificate expired on` | Signing with a certificate whose validity period has ended, while `DigitalSignOptions.AllowExpired` is `true`. The document is signed, but validators report the signature as not valid. With the default, `false`, `Sign` throws instead. | Sign with a valid certificate. |
| `The signing certificate is not valid until` | Signing with a certificate whose validity period has not started yet, while `DigitalSignOptions.AllowNotYetValid` is `true`. The document is signed, but validators report the signature as not valid. With the default, `false`, `Sign` throws instead. | Sign with a valid certificate, or check the computer's clock. |
| `The certificate for the VBA project expired on`, `The certificate for the VBA project is not valid until` | The same, for the certificate that signs the VBA project of a spreadsheet (`DigitalVBA`). The same two properties govern it. | Use a valid certificate for the VBA project. |
| `HashAlgorithm.<value> was set on <type> signature options` | Signing a PDF document with `HashAlgorithm` set on a signature type other than a digital signature. The setting has no effect there. | Remove the setting, or set it on `DigitalSignOptions`. |
| `Digital signature failed cryptographic verification` | Verifying a PDF document whose digital signature does not match the signed content, or is damaged. `Verify` reports it as not valid. | Treat the document as changed after signing. |

See "Certificates outside their validity period" in [Pdf Digitally signing]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/sign-document-with-digital-signature-advanced.md" >}}) for the `AllowExpired` and `AllowNotYetValid` properties.
