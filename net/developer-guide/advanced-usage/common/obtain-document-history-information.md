---
id: obtain-document-history-information
url: signature/net/obtain-document-history-information
title: Obtain document history information
weight: 2
description: "This article shows how to obtain the history of document changes with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) allows to get document history information about processed changes that include list of [ProcessLog](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/processlog). Each history log record contains following information :

* date/time of processed change.
* type of document process change. See [ProcessType](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain/processtype)
* description of change
* quantity of succeeded and failed signatures

## Analyze document process history information

The following code snippet demonstrates how to obtain information about document historical changes and analyze them.

```csharp
using (Signature signature = new Signature(filePath))
{
    IDocumentInfo documentInfo = signature.GetDocumentInfo();
    // display document process history information
    Console.WriteLine($"Document Process logs information: count = {documentInfo.ProcessLogs.Count}");
    foreach (ProcessLog processLog in documentInfo.ProcessLogs)
    {
        var info = $" - operation [{processLog.Type}] on {processLog.Date.ToShortDateString()}. ";
        info += $"Succedded/Failed {processLog.Succeeded}/{processLog.Failed}. Message: {processLog.Message}";
        Console.WriteLine(info);
    }
}
```
