---
id: search-signatures-with-linq-query-support
url: signature/net/search-signatures-with-linq-query-support
title: How to search signatures with LINQ queries
weight: 4
description: " This article explains how to search signatures with LINQ query with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Search Signatures in Documents with LINQ query
        description: This article explains how to search signatures with LINQ query and GroupDocs.Signature for .NET APIs.
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search signatures with LINQ query
        description: This topic explains how to search signatures in documents by using LINQ query in C#. 
        steps:
        - name: Load the document for searching.
          text: Create an instance of the `Signature` class by passing the local file path as a parameter.
        - name: Define search conditions.
          text: Use a LINQ query with the `Search` method to specify search criteria, such as filtering for `SignatureType.Text` and matching a specific name ("John Smith") in a case-insensitive manner.
        - name: Execute the search.
          text: Call the `Search` method to retrieve signatures that match the specified criteria.
        - name: Analyze the search result.
          text: Inspect the returned list of found text signatures, and optionally process their details or perform additional operations.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides LINQ query support for search process.

Here are the steps to search Barcode signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Use a LINQ query inside the [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method to define search criteria, such as filtering for text signatures and matching a specific name ("John Smith") in a case-insensitive manner.
* Execute the search by calling the [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method and passing the query.
* Process the found signatures if needed, such as reviewing their properties or performing additional operations.

This example shows how to search Text signature with LINQ query in the document

```csharp
// Define the path to the documents directory.
string filePath = Constants.SAMPLE_PDF;
string fileName = Path.GetFileName(filePath);

// Create a new Signature instance using the specified file.
using (var signature = new Signature(filePath))
{
    // Perform a search for signatures of type Text that match the specified name.
    var signatures = signature.Search(signatureItem => 
        signatureItem.SignatureType == SignatureType.Text && 
        (signatureItem as TextSignature)?.Text.Equals("John Smith", StringComparison.OrdinalIgnoreCase) == true
    );

    // Optionally, process the found signatures here.
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
