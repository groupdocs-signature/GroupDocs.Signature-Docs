---
id: load-document-from-amazon-s3-storage
url: signature/net/load-document-from-amazon-s3-storage
title: Load document from Amazon S3 Storage
weight: 1
description: "This section explains how to load document from Amazon S3 Storage with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
Following example demonstrates how to process with documents from Amazon S3 Storage.

```csharp
public static void Run()
{
    string key = "sample.docx";
    string outputFilePath = "SignedSample";
    using (Stream stream = DownloadFile(key))
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

public static Stream DownloadFile(string key)
{
    AmazonS3Client client = new AmazonS3Client();
    string bucketName = "my-bucket";
    GetObjectRequest request = new GetObjectRequest
    {
        Key = key,
        BucketName = bucketName
    };
    using (GetObjectResponse response = client.GetObject(request))
    {
        MemoryStream stream = new MemoryStream();
        response.ResponseStream.CopyTo(stream);
        stream.Position = 0;
        return stream;
    }
}
```

