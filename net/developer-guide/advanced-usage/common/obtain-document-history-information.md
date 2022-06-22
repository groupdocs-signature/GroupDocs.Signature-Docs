---
id: obtain-document-history-information
url: signature/net/obtain-document-history-information
title: Obtain document history information
weight: 2
description: "This article shows how to obtain the history of document changes with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Get document history with C#    
        description: Collecting information about documents history with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to get documents history data with C# 
        description: Learn how to get data about history of particular document changes via C#
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Get detailed information about form-fields and signatures. 
          text: Invoke method GetDocumentInfo which returns specific DocumentInfo object.
        - name: Process obtained data. 
          text: Loop through ProcessLogs collection and process data about document operations.
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

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online App

Along with full-featured .NET library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.