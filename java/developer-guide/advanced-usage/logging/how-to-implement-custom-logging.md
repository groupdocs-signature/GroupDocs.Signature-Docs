---
id: how-to-implement-custom-logging
url: signature/java/how-to-implement-custom-logging
title: Custom logging
weight: 2
description: "This article explains how to implement custom logging and use it while document processing with GroupDocs.Signature within your Java applications."
keywords: logging, logger, document esign, converting
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---

By default logging is disabled when processing documents, but the product provides a way to pass your own logger implementation and use it while processing documents.

There is an interface that we can utilize:

* [ILogger](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.logging/ilogger/) - defines the interface for logging different process event like errors, warnings and information messages (traces).

There are 3 types of messages in the log file:

* Error - for unrecoverable exceptions
* Warning - for recoverable/expected/known exceptions
* Trace - for general information

## Implementing custom logger

To make your logger you should implement [ILogger](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.logging/ilogger/) interface.

For trace messages - implement the `public void trace(String message)` method \
For warning messages - implement the `public void warning(String message)` method \
For error messages - implement the `public void error(String message, Exception exception)` method

Which of the three methods are called depends on the log level set with the `setLogLevel` method of [SignatureSettings](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signaturesettings/). See [Set up logging]({{< ref "signature/java/developer-guide/advanced-usage/logging/how-to-set-up-logging.md" >}}).

In this example, we'll implement a logger that writes messages in its own format. Replace the `postMessage` method to send them to a log file, a logging framework or an API endpoint.

```java
// Create the custom logger
CustomLogger logger = new CustomLogger();

// Create SignatureSettings and specify the custom logger
SignatureSettings settings = new SignatureSettings(logger);

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

/**
 * Writes log messages in a custom format. Replace postMessage to send them
 * to a log file, a logging framework or an API endpoint.
 */
public static class CustomLogger implements ILogger
{
    private final Object lock = new Object();

    /**
     * Error log messages provide information about unrecoverable events in application flow.
     */
    public void error(String message, Exception exception)
    {
        if (message == null)
            throw new IllegalArgumentException("message");
        if (exception == null)
            throw new IllegalArgumentException("exception");
        postMessage(LogLevel.Error, message + ". Exception: " + exception);
    }

    /**
     * Trace log messages provide generally useful information about application flow.
     */
    public void trace(String message)
    {
        if (message == null)
            throw new IllegalArgumentException("message");
        postMessage(LogLevel.Trace, message);
    }

    /**
     * Warning log messages provide information about the unexpected and recoverable event in application flow.
     */
    public void warning(String message)
    {
        if (message == null)
            throw new IllegalArgumentException("message");
        postMessage(LogLevel.Warning, message);
    }

    private void postMessage(int level, String message)
    {
        String header = "INFO";
        switch (level)
        {
            case LogLevel.Warning: header = "WARNING"; break;
            case LogLevel.Error: header = "ERROR"; break;
        }
        String date = new SimpleDateFormat("MM/dd/yyyy hh:mm a").format(new Date());
        String line = "GroupDocs.Signature " + header + " [" + date + "]. Message: " + message;
        synchronized (lock)
        {
            System.out.println(line);
        }
    }
}
```

The `CustomLogging` class of the [Java examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java) uses this logger.
