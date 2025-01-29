---
id: verify-signatures-with-linq-query-support
url: signature/net/verify-signatures-with-linq-query-support
title: How to verify signatures with LINQ queries
weight: 4
description: " This article explains how to verify signatures with LINQ query with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify Signatures in Documents with LINQ query
        description: This article explains how to verify signatures with LINQ query and GroupDocs.Signature for .NET APIs.
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to verify signatures with LINQ query
        description: This topic explains how to verify signatures in documents by using LINQ query in C#. 
        steps:
        - name: Load the document for verification from the local file.
          text: Create an instance of the `Signature` class by passing the local file path as a parameter.
        - name: Define verification conditions.
          text: Use a LINQ query with the `Verify` method to specify signature validation criteria, such as matching the `SignatureType` to `Barcode` and a specific `SignatureId`.
        - name: Execute the verification.
          text: Call the `Verify` method to check whether the document contains signatures that match the provided criteria.
        - name: Analyze the verification result.
          text: Inspect the returned list of verified signatures to determine their validity and review additional signature details.
---
Here are the steps to verify Barcode signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Use a LINQ query inside the [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) method method to define verification criteria, such as checking that the signature type is Barcode and that the SignatureId equals "123".
* Execute the verification by calling the [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) method and passing the query.
* Process the verification result by iterating through the returned signatures if needed.

This example shows how to verify Barcode signature with LINQ query in the document

```csharp
// Define the path to the PDF file.
string filePath = Constants.SAMPLE_PDF;
string fileName = Path.GetFileName(filePath);

// Use the 'using' statement for automatic resource management.
using (var signature = new Signature(filePath))
{
    // Perform a varify to validate signatures of type Barcode with a specific SignatureId.
    var signatures = signature.Verify(signatureItem => 
        signatureItem.SignatureType == SignatureType.Barcode && 
        signatureItem.SignatureId.Equals("123", StringComparison.Ordinal)
    );
   // Optionally, process the verified signatures here.
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
