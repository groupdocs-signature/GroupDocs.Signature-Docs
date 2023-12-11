---
id: load-document-from-azure-blob-storage
url: signature/net/load-document-from-azure-blob-storage
title: Hot to load document from Azure Blob Storage
linkTitle: → Amazon Blob
weight: 2
description: "This section explains how to load document from Azure Blob Storage with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Signing document loaded from Azure Blob Storage using C#    
        description: Handling Azure Blob Storage documents with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to get and process Azure Blob Storage document via C# 
        description: Get information about ways of handling documents downloaded from Azure Blob Storage with C#
        steps:
        - name: Load source document
          text: Instantiate CloudBlobContainer object providing account and blob storage data. Download file and save it to stream.
        - name: Pass file to Signature. 
          text: Instantiate Signature object by passing file stream as a constructor parameter.
        - name: Provide signing options. 
          text: Set specific properties of desired SignOptions instance.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
---
Following example demonstrates how to process documents from Azure Blob Storage.

```csharp
public static void Run()
{
    string blobName = "sample.docx";
    string outputFilePath = "SignedSample";
    using (Stream stream = DownloadFile(blobName))
    {
        using (Signature signature = new Signature(stream))
        {
            QRCodeSignOptions options = new QRCodeSignOptions("JohnSmith")
            {
                EncodeType = QRCodeTypes.QR,
                Left = 100,
                Top = 100
            };
            // sign document to file
            signature.Sign(outputFilePath, options);
        }
    }
    Console.WriteLine("\nSource document signed successfully.\nFile saved at " + outputFilePath);
}

public static Stream DownloadFile(string blobName)
{
    CloudBlobContainer container = GetContainer();

    CloudBlob blob = container.GetBlobReference(blobName);
    MemoryStream memoryStream = new MemoryStream();
    blob.DownloadToStream(memoryStream);
    memoryStream.Position = 0;
    return memoryStream;
}

private static CloudBlobContainer GetContainer()
{
    string accountName = "***";
    string accountKey = "***";
    string endpoint = $"https://{accountName}.blob.core.windows.net/";
    string containerName = "***";

    StorageCredentials storageCredentials = new StorageCredentials(accountName, accountKey);
    CloudStorageAccount cloudStorageAccount = new CloudStorageAccount(
        storageCredentials, new Uri(endpoint), null, null, null);
    CloudBlobClient cloudBlobClient = cloudStorageAccount.CreateCloudBlobClient();

    CloudBlobContainer container = cloudBlobClient.GetContainerReference(containerName);
    container.CreateIfNotExists();

    return container;
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