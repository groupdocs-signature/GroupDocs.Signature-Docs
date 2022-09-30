---
id: advanced-search-for-form-field-signatures
url: signature/net/advanced-search-for-form-field-signatures
title: Advanced search for Form Field signatures
weight: 7
description: " This article explains how to provide advanced search for Form Field electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for Form Field signatures in documents in C#    
        description: Advanced search for Form Field signatures in various documents fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search Form Field signatures in advanced way using C# 
        description: Get additional information of advanced searching Form Field signatures in documents with C#
        steps:
        - name: Upload document which has one of supported types.
          text: Instantiate Signature object passing either file path or file stream as a constructor parameter.
        - name: Create search options 
          text: Instantiate FormFieldSearchOptions object providing all demanded data like Value or Type.
        - name: Get list of items 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [FormFieldSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsearchoptions) class to specify different options to search for Form Field Signatures.

Here are the steps to search for Form Field signatures within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [FormFieldSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsearchoptions) object according to your requirements and specify search options
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [FormFieldSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsearchoptions) to it.

This example shows how to make advanced search for Form Field signatures in the document.

```csharp
using (Signature signature = new Signature("signed.pdf"))
{
    FormFieldSearchOptions options = new FormFieldSearchOptions()
    {
        Value = "Value1",
        AllPages = true,
        Name = "TestField",
        Type = FormFieldType.Text
    };
    // search for signatures in document
    List<FormFieldSignature> signatures = signature.Search<FormFieldSignature>(options);
    Console.WriteLine("\nSource document contains following signatures.");
    foreach (var formFieldSignature in signatures)
    {
        Console.WriteLine("FormField signature found. Name : {0}. Value: {1}", formFieldSignature.Name, formFieldSignature.Value);
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

### Free Online App

Along with full-featured .NET library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
