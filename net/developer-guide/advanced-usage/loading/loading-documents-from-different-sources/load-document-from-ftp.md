---
id: load-document-from-ftp
url: signature/net/load-document-from-ftp
title: Load document from FTP
weight: 3
description: "This section explains how to load document from FTP with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
Following example demonstrates how to process documents from FTP.

```csharp
public static void Run()
{
    string filePath = "ftp://localhost/sample.doc";
    using (Stream stream = GetFileFromFtp(filePath))
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
            signature.Sign("SampleSigned", options);
        }
    }
}

private static Stream GetFileFromFtp(string filePath)
{
    Uri uri = new Uri(filePath);
    FtpWebRequest request = CreateRequest(uri);

    using (WebResponse response = request.GetResponse())
        return GetFileStream(response);
}

private static FtpWebRequest CreateRequest(Uri uri)
{
    FtpWebRequest request = (FtpWebRequest)WebRequest.Create(uri);
    request.Method = WebRequestMethods.Ftp.DownloadFile;
    return request;
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

