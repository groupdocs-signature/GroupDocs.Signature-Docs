---
id: load-document-from-azure-blob-storage
url: signature/net/load-document-from-azure-blob-storage
title: Load document from Azure Blob Storage
weight: 2
description: "This section explains how to load document from Azure Blob Storage with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
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

