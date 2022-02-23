---
id: load-document-from-url
url: signature/java/load-document-from-url
title: Load document from URL
weight: 6
description: "This section explains how to load document from URL with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
Following example demonstrates how to work with documents from URL.

```java
String url = "https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET/blob/master/Examples/Resources/SampleFiles/sample.pdf?raw=true";
 
InputStream stream = new URL(url).openStream();
Signature signature = new Signature(stream);
 
TextSignOptions options = new TextSignOptions("John Smith");
 
// set signature position
options.setLeft(100);
options.setTop(100);
 
// sign document to file
signature.sign("SampleSigned.pdf", options);
```


