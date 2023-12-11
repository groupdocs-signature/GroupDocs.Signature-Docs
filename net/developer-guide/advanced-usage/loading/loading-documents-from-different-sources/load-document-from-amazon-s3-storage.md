---
id: load-document-from-amazon-s3-storage
url: signature/net/load-document-from-amazon-s3-storage
title: How to load document from Amazon S3 Storage
linkTitle: → Amazon S3 
weight: 1
description: "This section explains how to load document from Amazon S3 Storage with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Signing document loaded from Amazon S3 Storage using C#    
        description: Handling Amazon S3 Storage documents with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to get and process Amazon S3 Storage document via C# 
        description: Get information about ways of handling documents downloaded from Amazon S3 Storage with C#
        steps:
        - name: Load source document
          text: Instantiate AmazonS3Client object, provide key and bucket values and save file to stream. 
        - name: Pass file to Signature. 
          text: Instantiate Signature object by passing file stream as a constructor parameter.
        - name: Provide signing options. 
          text: Set specific properties of desired SignOptions instance.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
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