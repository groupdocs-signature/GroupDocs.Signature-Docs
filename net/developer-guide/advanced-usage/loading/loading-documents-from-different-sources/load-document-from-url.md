---
id: load-document-from-url
url: signature/net/load-document-from-url
title: Load document from URL
linkTitle: → URL
weight: 6
description: "This section explains how to load document from URL with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Signing document loaded from Url using C#    
        description: Processing documents downloaded from Url with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to load document from Url and process via C# 
        description: Learn all about processing documents downloaded from Url with C#
        steps:
        - name: Load source document
          text: Instantiate WebRequest object providing url and save file to stream. 
        - name: Pass file to Signature. 
          text: Instantiate Signature object by passing file stream as a constructor parameter.
        - name: Provide signing options. 
          text: Set specific properties of desired SignOptions instance.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
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

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.