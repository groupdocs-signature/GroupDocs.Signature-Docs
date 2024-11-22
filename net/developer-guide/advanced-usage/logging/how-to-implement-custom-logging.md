---
id: how-to-implement-custom-logging
url: signature/net/how-to-implement-custom-logging
title: Custom logging
weight: 2
description: "This article explains how to implement custom logging and use it while document processing with GroupDocs.Signature within your .NET applications."
keywords: logging, logger, document esign, converting
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---

By default logging is disabled when processing documents but product provides a way to specify custom logging implementationsave and set up this instance.

There is an interface that we can utilize:

* [ILogger](https://reference.groupdocs.com/net/signature/groupdocs.signature.logging/ilogger) - defines the interface for logging different process event like errors, warnings and information messages (traces).

There are 3 types of messages in the log file:

* Error - for unrecoverable exceptions
* Warning - for recoverable/expected/known exceptions
* Trace - for general information

## Implementing custom logger

To make your logger you should implement [ILogger](https://reference.groupdocs.com/net/signature/groupdocs.signature.logging/ilogger) interface.

For trace messages - implement public void Trace(string message) method \
For warning messages - implement public void Warning(string message) method \
For error messages - implement public void Error(string message) method

In this example, we'll implement a simple file logger.

```csharp
// Create logger and specify the output file
var logger = new CustomLogger("output.log");

// Create SignatureSettings and specify FileLogger
var settings = new SignatureSettings(fileLogger);

using (var signature = new Signature("sample.docx", settings))
{
    var options = new QrCodeSignOptions("JohnSmith");
    // sign document to file
    signature.Sign(outputFilePath, options);
}

/// <summary>
/// Writes log messages to API endpoint.
/// </summary>
public class APILogger : ILogger
{
    private object _lock = new object();
    private HttpClient _client;
    /// <summary>
    /// Create logger to API endpoint.
    /// </summary>
    public APILogger()
    {
        _client = new HttpClient()
        {
            BaseAddress = new Uri("http://localhost:64195/")
        };
        _client.DefaultRequestHeaders.Accept.Clear();
        _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
    }

    /// <summary>
    /// Writes an error message to the console.
    /// Error log messages provide information about unrecoverable events in application flow.
    /// </summary>
    /// <param name="message">The error message.</param>
    /// <param name="exception">The exception.</param>
    /// <exception cref="System.ArgumentNullException">Thrown when <paramref name="message"/> is null.</exception>
    /// <exception cref="System.ArgumentNullException">Thrown when <paramref name="exception"/> is null.</exception>
    public void Error(string message, Exception exception)
    {
        if (message == null)
            throw new ArgumentNullException(nameof(message));
        if (exception == null)
            throw new ArgumentNullException(nameof(exception));

        var line = $"{message}. Exception: {exception}";
        PostMessage(LogLevel.Error, line);
    }

    /// <summary>
    /// Writes trace message to the console.
    /// Trace log messages provide generally useful information about application flow.
    /// </summary>
    /// <param name="message">The trace message.</param>
    /// <exception cref="System.ArgumentNullException">Thrown when <paramref name="message"/> is null.</exception>
    public void Trace(string message)
    {
        if (message == null)
            throw new ArgumentNullException(nameof(message));
        PostMessage(LogLevel.Trace, message);
    }

    /// <summary>
    /// Writes warning message to the console;
    /// Warning log messages provide information about the unexpected and recoverable event in application flow.
    /// </summary>
    /// <param name="message">The warning message.</param>
    /// <exception cref="System.ArgumentNullException">Thrown when <paramref name="message"/> is null.</exception>
    public void Warning(string message)
    {
        if (message == null)
            throw new ArgumentNullException(nameof(message));
        PostMessage(LogLevel.Warning, message);
    }

    private string PostMessage(LogLevel level, string message)
    {
        string result = string.Empty;
        string hdrs = "INFO";
        switch (level)
        {
            case LogLevel.Warning: hdrs = "WARNING"; break;
            case LogLevel.Error: hdrs = "ERROR"; break;
        }
        string date = DateTime.Now.ToString("MM/dd/yyyy hh:mm tt");
        string line = $"GroupDocs.Signature {hdrs} [{date}]. Message: {message}";
        var quer = new StringContent(line);
        
        lock (this._lock)
        {
            HttpResponseMessage response = _client.PostAsync("api/logging", quer).Result;
            response.Content.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            response.EnsureSuccessStatusCode();
            result = response.Content.ReadAsStringAsync().Result;
        }
        return result;
    }
}
```
