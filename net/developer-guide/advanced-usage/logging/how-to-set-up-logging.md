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

* [ILogger](https://reference.groupdocs.com/net/signature/groupdocs.signature.logging/ilogger) - defines the interface for logging different process event like errors, warnings and information messages (traces).

There are classes that we can utilize:

* [ConsoleLogger](https://reference.groupdocs.com/net/signature/groupdocs.signature.logging/consolelogger) - defines the methods that are required for logging to console.
* [FileLogger](https://reference.groupdocs.com/net/signature/groupdocs.signature.logging/filelogger) - defines the methods that are required for logging to file.

There are 3 types of messages in the log file:

* Error - for unrecoverable exceptions
* Warning - for recoverable/expected/known exceptions
* Trace - for general information

## Logging to File

In this example, we'll log into the file so we need to use [FileLogger](https://reference.groupdocs.com/net/signature/groupdocs.signature.logging/filelogger) class.

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

In this example, we'll log into the console so we need to use [ConsoleLogger](https://reference.groupdocs.com/net/signature/groupdocs.signature.logging/consolelogger) class.

```csharp
// Create logger and specify the output file
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
