---
id: searching-for-document-signatures-with-exception-handling
url: signature/net/searching-for-document-signatures-with-exception-handling
title: Searching for document signatures with exception handling
weight: 11
description: "This article explains how to handle exceptions when searching for electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides different error messages due to validation issues, missing required data, files etc. For handling these exceptions class [GroupDocsSignatureException](https://apireference.groupdocs.com/net/signature/groupdocs.signature/groupdocssignatureexception) should be used.

Here are the steps to handle exceptions from GroupDocs.Signature while searching for document signatures:

* Compose try-catch block above [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1)  method with catching [GroupDocsSignatureException](https://apireference.groupdocs.com/net/signature/groupdocs.signature/groupdocssignatureexception) type error.

## Exception handling while searching for document signatures

This example shows how to handle GroupDocs.Signature exceptions.

```csharp
try
{
    // dont specify Password on protected document
    LoadOptions loadOptions = new LoadOptions();
    using (Signature signature = new Signature("samplePasswordProtected.pdf"))
    {
        DigitalSearchOptions options = new DigitalSearchOptions()
        {
        };
        // sign document to file
        List<DigitalSignature> signatures = signature.Search<DigitalSignature>(options);
    }
}
catch (GroupDocsSignatureException ex)
{
    Console.WriteLine("GroupDocs Signature Exception: " + ex.Message);
}
catch (Exception ex)
{
    Console.WriteLine("System Exception: " + ex.Message);
}
```


