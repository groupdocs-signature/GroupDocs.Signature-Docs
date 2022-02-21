---
id: load-document-from-url
url: signature/net/load-document-from-url
title: Load document from URL
weight: 6
description: "This section explains how to load document from URL with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
Following example demonstrates how to work with documents from URL.

```csharp
public static void Run()
{
    string url = "https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET/blob/api-v2/Examples/Resources/SampleFiles/sample.pdf?raw=true";


    using (Stream stream = GetRemoteFile(url))
    {
        using (Signature signature = new Signature(stream))
        {
            TextSignOptions options = new TextSignOptions("John Smith")
            {
                Left = 100,
                Top = 100
            };

            // sign document to file
            signature.Sign("SampleSigned", options);
        }
    }
    Console.WriteLine("\nSource document signed successfully.\nFile saved at " + outputFilePath);
}

private static Stream GetRemoteFile(string url)
{
    WebRequest request = WebRequest.Create(url);

    using (WebResponse response = request.GetResponse())
        return GetFileStream(response);
}

private static Stream GetFileStream(WebResponse response)
{
    MemoryStream fileStream = new MemoryStream();

    using (Stream responseStream = response.GetResponseStream())
        responseStream.CopyTo(fileStream);

    fileStream.Position = 0;
    return fileStream;
}
```

