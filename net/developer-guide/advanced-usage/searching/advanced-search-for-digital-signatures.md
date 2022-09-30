---
id: advanced-search-for-digital-signatures
url: signature/net/advanced-search-for-digital-signatures
title: Advanced search for Digital signatures
weight: 2
description: " This article explains how to make advanced search for digital electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for digital signatures in documents in C#    
        description: Advanced search for digital signatures in various documents fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search digital signatures in advanced way using C# 
        description: Get additional information of advanced searching digital signatures in documents with C#
        steps:
        - name: Upload document which has one of supported types.
          text: Instantiate Signature object passing either file path or file stream as a constructor parameter.
        - name: Create search options 
          text: Instantiate DigitalSearchOptions object providing all demanded data like Comments or IssuerName.
        - name: Get list of items 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [DigitalSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsearchoptions) class to specify different options to search for Digital Signatures.

Here are the steps to search for digital signatures within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [DigitalSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsearchoptions) object according to your requirements and specify search options  
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [DigitalSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsearchoptions) to it.

This example shows how to make advanced search for Digital signature in the document.

```csharp
using (Signature signature = new Signature("signed.pdf"))
{
    DigitalSearchOptions options = new DigitalSearchOptions()
    {
        // specify special search criteria
        Comments = "Test comment",
        // certificate issues criteria
        IssuerName = "John",
        // digital certificate subject
        SubjectName = "Test",
        // specify date range period of signature
        SignDateTimeFrom = DateTime.Now.AddMonths(-1),
        SignDateTimeTo = DateTime.Now,
        //
    };
    // search for signatures in document
    List<DigitalSignature> signatures = signature.Search<DigitalSignature>(options);
    Console.WriteLine("\nSource document contains following signatures.");
    foreach (var digitalSignature in signatures)
    {
        Console.WriteLine("Digital signature found from {0} with validation flag {1}. Certificate SN {2}",
            digitalSignature.SignTime, digitalSignature.IsValid, digitalSignature.Certificate?.SerialNumber);
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
