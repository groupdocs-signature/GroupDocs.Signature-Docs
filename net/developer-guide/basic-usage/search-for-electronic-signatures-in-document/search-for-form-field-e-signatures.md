---
id: search-for-form-field-e-signatures
url: signature/net/search-for-form-field-e-signatures
title: Search for Form Field e-signatures
linkTitle: 🔍 Form fields
weight: 5
description: "This article explains how to search for Form Fields signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for form-fields signatures in documents in C#    
        description: Search form-fields in various documents fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search any form-fields in documents using C# 
        description: Get additional information of searching form-fields in documents with C#
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of form-fields 
          text: Invoke method Search providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found form-fields.
---
To search for Form Fields e-signatures inside document you should pass instance of [FormFieldSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsearchoptions) class to a Search method of [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net).  
Here are the guide for searching Form Field e-signatures:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [FormFieldSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsearchoptions) object according to your requirements and specify additional search options (if needed);
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [FormFieldSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsearchoptions) to it.

This example shows how to search for Form Field signatures in the document.

```csharp
using (Signature signature = new Signature("signed.pdf"))
{
    // search for signatures in document
    List<FormFieldSignature> signatures = signature.Search<FormFieldSignature>(SignatureType.FormField);

    foreach (var formFieldSignature in signatures)
    {
        Console.WriteLine("FormField signature found. Name : {0}. Value: {1}", formFieldSignature.Name, formFieldSignature.Value);
    }
}
```

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/net/developer-guide/advanced-usage/_index.md" >}}).

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
