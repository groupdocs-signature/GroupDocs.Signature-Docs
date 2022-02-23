---
id: load-document-from-local-disk
url: signature/java/load-document-from-local-disk
title: Load document from local disk
weight: 4
description: "This section explains how to load document from local disk with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
When document is located on the local disk [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) enables you to work with document over the file [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class constructor. [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) instance will open file for reading only when any method of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) will be called.

Following code snippet shows how to load document from local disk.

```java
Signature signature = new Signature("sample.docx");
TextSignOptions options = new TextSignOptions("John Smith");
 
// sign document to file
signature.sign(outputFilePath, options);
```


