---
id: how-to-set-up-logging
url: signature/java/how-to-set-up-logging
title: Set up logging
weight: 1
description: "This article explains how to set up logging when processing a document with GroupDocs.Signature within your Java applications."
keywords: logging, logger, document esign, converting
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---

By default logging is disabled when processing documents, but the product provides embedded implementations that write the log to the console or to a file.

There is an interface that we can utilize:

* [ILogger](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.logging/ilogger/) - defines the interface for logging different process event like errors, warnings and information messages (traces).

There are classes that we can utilize:

* [ConsoleLogger](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.logging/consolelogger/) - defines the methods that are required for logging to console.
* [FileLogger](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.logging/filelogger/) - defines the methods that are required for logging to file.

There are 3 types of messages in the log file:

* Error - for unrecoverable exceptions
* Warning - for recoverable/expected/known exceptions
* Trace - for general information

The logger is passed to the [SignatureSettings](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signaturesettings/) constructor, and the settings are passed to the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) constructor.

## Choose which messages are logged

The `setLogLevel` method of [SignatureSettings](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signaturesettings/) decides which kinds of messages reach the logger. The values are `int` flags of the [LogLevel](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.logging/loglevel/) class that can be combined with `|`: `LogLevel.Error`, `LogLevel.Warning` and `LogLevel.Trace`. The default, `LogLevel.All`, logs all three, and `LogLevel.None` logs nothing.

```java
SignatureSettings settings = new SignatureSettings(new ConsoleLogger());
// Errors and warnings, without the step-by-step traces.
settings.setLogLevel(LogLevel.Error | LogLevel.Warning);
```

The level only filters the log: exceptions are thrown as before.

{{< alert style="info" >}}
`setLogLevel` takes effect starting with GroupDocs.Signature for Java 26.10. In earlier versions the level was compared as a single value instead of a set of flags, so with the default `LogLevel.All`, or with a combination such as `LogLevel.Error | LogLevel.Warning`, nothing reached the logger.
{{< /alert >}}

## Logging to File

In this example, we'll log into the file so we need to use [FileLogger](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.logging/filelogger/) class.

```java
// Create logger and specify the output file
FileLogger fileLogger = new FileLogger("output.log");

// Create SignatureSettings and specify FileLogger
SignatureSettings settings = new SignatureSettings(fileLogger);

Signature signature = new Signature("sample.docx", settings);
try
{
    QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");
    // sign document to file
    signature.sign(outputFilePath, options);
}
finally
{
    signature.dispose();
}
```

## Logging to Console

In this example, we'll log into the console so we need to use [ConsoleLogger](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.logging/consolelogger/) class.

```java
// Create logger that writes to the console
ConsoleLogger consoleLogger = new ConsoleLogger();

// Create SignatureSettings and specify ConsoleLogger instance
SignatureSettings settings = new SignatureSettings(consoleLogger);

Signature signature = new Signature("sample.docx", settings);
try
{
    QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");
    // sign document to file
    signature.sign(outputFilePath, options);
}
finally
{
    signature.dispose();
}
```

The `ConsoleLogging`, `ConsoleLoggingWithLogLevels` and `FileLogging` classes of the [Java examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java) run these loggers with different log levels.

## Warnings you may see

GroupDocs.Signature writes a warning when an operation succeeds but the result may not be what you expect. Warnings are logged when the log level includes `LogLevel.Warning`, as the default does. Starting with GroupDocs.Signature for Java 26.10, you may see these warnings:

| Warning begins with | When | What to do |
| --- | --- | --- |
| `The signing certificate expired on` | Signing with a certificate whose validity period has ended, while `DigitalSignOptions.setAllowExpired(true)` is set. The document is signed, but validators report the signature as not valid. With the default, `false`, `sign` throws instead. | Sign with a valid certificate. |
| `The signing certificate is not valid until` | Signing with a certificate whose validity period has not started yet, while `DigitalSignOptions.setAllowNotYetValid(true)` is set. The document is signed, but validators report the signature as not valid. With the default, `false`, `sign` throws instead. | Sign with a valid certificate, or check the computer's clock. |
| `The certificate for the VBA project expired on`, `The certificate for the VBA project is not valid until` | The same, for the certificate that signs the VBA project of a spreadsheet (`DigitalVBA`). The same two settings govern it. | Use a valid certificate for the VBA project. |
| `HashAlgorithm <value> was set on <type> signature options` | Signing a PDF document with `setHashAlgorithm` called on a signature type other than a digital signature. The setting has no effect there. | Remove the setting, or set it on `DigitalSignOptions`. |
| `Digital signature failed cryptographic verification` | Verifying a PDF document whose digital signature does not match the signed content, or is damaged. `verify` reports it as not valid. | Treat the document as changed after signing. |

See [Certificate validity, digests and logging]({{< ref "signature/java/use-cases/certificate-validity-hash-and-logging.md" >}}) for the `setAllowExpired` and `setAllowNotYetValid` methods.
