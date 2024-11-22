---
id: advanced-search-certificate-documents
url: signature/net/advanced-search-certificate-documents
title: Advanced search certificate documents
linkTitle: 🌐 Certificate
weight: 18
description: "This article explains how to make advanced search for Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for data within the certificate files in C#    
        description: Advanced search for data within the certificates fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search for data in the certificates using C# 
        description: Get additional information of advanced searching for data within the certificate documents with C#
        steps:
        - name: Upload PFX certificate file.
          text: Instantiate object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create search options 
          text: Instantiate CertificateSearchOptions object providing all demanded data like text or match type.
        - name: Get list of the metadata signatures 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [CertificateSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/certificatesearchoptions) class to specify different options to search text data within the certificate docuemnts. 
Please be aware that the search result will be always as the MetadataSignature.

Here are the steps to search for the values within the certificate document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [CertificateSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/certificatesearchoptions) object according to your requirements and specify search options.
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [CertificateSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/certificatesearchoptions) to it.

This example shows how to make advanced search for text data within the certificate documents.

```csharp
var loadOptions = new LoadOptions()
{
    Password = "1234567890"
};

using (var signature = new Signature("certificate.pfx", loadOptions))
{
    var options = new CertificateSearchOptions()
    {
        // check the serial number
        Text = "AAD0D15C628A",
        // find exact math
        MatchType = TextMatchType.Contains,
    };

    // search for certificate data
    var result = signature.Search<MetadataSignature>(options);
    if (result.Count>0)
    {
        Console.WriteLine("\nCertificate contains following search results");
        foreach (MetadataSignature temp in result)
        {
            Console.WriteLine($"\t\t-{temp.Name} - {temp.Value}");
        }
    }
    else
    {
        Helper.WriteError("\nCertificate failed search process.");
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

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
