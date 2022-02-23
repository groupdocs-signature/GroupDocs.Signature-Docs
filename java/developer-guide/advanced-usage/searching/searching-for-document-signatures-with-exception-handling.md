---
id: searching-for-document-signatures-with-exception-handling
url: signature/java/searching-for-document-signatures-with-exception-handling
title: Searching for document signatures with exception handling
weight: 11
description: "This article explains how to handle exceptions when searching for electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
toc: True
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides different error messages due to validation issues, missing required data, files etc. For handling these exceptions class [GroupDocsSignatureException](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.exception/GroupDocsSignatureException)should be used.

Here are the steps to handle exceptions from GroupDocs.Signature while searching for document signatures:

*   Compose try-catch block above [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions))  method with catching [GroupDocsSignatureException](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.exception/GroupDocsSignatureException) type error.
    

## Exception handling while searching for document signatures

This example shows how to handle GroupDocs.Signature exceptions.

```java
try {
    LoadOptions loadOptions = new LoadOptions();
    Signature signature = new Signature("samplePasswordProtected.pdf");
    // create QRCode option with predefined QRCode text
    DigitalSearchOptions options = new DigitalSearchOptions();
 
    // search signature document
    List<DigitalSignature> signatures = signature.search(DigitalSignature.class,options);
} catch (GroupDocsSignatureException ex) {
    System.out.print("GroupDocs Signature Exception: " + ex.getMessage());
} catch (Exception ex) {
    System.out.print("System Exception: " + ex.getMessage());
}
```

