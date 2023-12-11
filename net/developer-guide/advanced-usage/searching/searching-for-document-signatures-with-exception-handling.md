---
id: searching-for-document-signatures-with-exception-handling
url: signature/net/searching-for-document-signatures-with-exception-handling
title: Searching for document signatures with exception handling
linkTitle: 🌐 Handling errors
weight: 11
description: "This article explains how to handle exceptions when searching for electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Handling search exception with C#    
        description: Handle exceptions during searching for signatures in documents with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to coupe with search exceptions using C# 
        description: Learn all about ways of handling exceptions during search using C#
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Surround code Signature try-catch statement. 
          text: For search exceptions use GroupDocsSignatureException.
        - name: Implement code with common try-catch statement. 
          text: For all other possible exceptions use Exception class.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides different error messages due to validation issues, missing required data, files etc. For handling these exceptions class [GroupDocsSignatureException](https://reference.groupdocs.com/signature/net/groupdocs.signature/groupdocssignatureexception) should be used.

Here are the steps to handle exceptions from GroupDocs.Signature while searching for document signatures:

* Compose try-catch block above [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search)  method with catching [GroupDocsSignatureException](https://reference.groupdocs.com/signature/net/groupdocs.signature/groupdocssignatureexception) type error.

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
