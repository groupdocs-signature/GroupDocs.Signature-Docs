---
id: load-document-from-stream
url: signature/net/load-document-from-stream
title: Load document from Stream
weight: 5
description: "This section explains how to load document from stream with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
There might be the case when your document is not physically located on the disk. Instead, you have the document in the form of a stream. In this case, to avoid the overhead of saving stream as a file on disk, [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) enables you to work with document from streams directly. Please be aware that [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) object does not dispose passed stream.

The following are the steps to be followed:

* Obtain document stream;
* Pass opened stream to [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class constructor.

Following code snippet serves this purpose.

```csharp
using (Stream stream = File.OpenRead("sample.pdf"))
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
```

