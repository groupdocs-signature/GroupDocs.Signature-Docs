---
id: load-document-from-stream
url: signature/java/load-document-from-stream
title: Load document from Stream
weight: 5
description: "This section explains how to load document from stream with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
There might be the case when your document is not physically located on the disk. Instead, you have the document in the form of a stream. In this case, to avoid the overhead of saving stream as a file on disk, [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) enables you to work with document from streams directly. Please be aware that [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) object does not dispose passed stream.

The following are the steps to be followed:

*   Obtain document stream; 
*   Pass opened stream to [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class constructor.

Following code snippet serves this purpose.

```java
InputStream stream = new FileInputStream("sample.pdf");
Signature signature = new Signature(stream);
QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");
 
options.setEncodeType(QrCodeTypes.QR);
options.setLeft(100);
options.setTop(100);           
 
// sign document to file
signature.sign("SampleSigned.pdf", options);
```


