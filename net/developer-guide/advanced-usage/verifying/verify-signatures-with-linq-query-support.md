---
id: verify-signatures-with-predicate-functions
url: signature/net/verify-signatures-with-predicate-functions
title: How to verify signatures with predicate functions
weight: 19
description: "This article explains how to verify signatures using predicate functions (Func<BaseSignature, bool>) with GroupDocs.Signature API to filter signatures before verification, optimizing performance by skipping unnecessary verification operations."
keywords: verify signatures, predicate functions, filter signatures, lambda expressions, custom verification criteria, LINQ queries, signature validation
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify Signatures in Documents with Predicate Functions
        description: This article explains how to verify signatures using predicate functions to filter signatures before verification with GroupDocs.Signature for .NET APIs.
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to verify signatures with predicate functions
        description: This topic explains how to verify signatures in documents using predicate functions (lambda expressions) to filter signatures before verification in C#. 
        steps:
        - name: Load the document for verification.
          text: Create an instance of the `Signature` class by passing the local file path as a parameter.
        - name: Define verification options.
          text: Create `VerifyOptions` (e.g., `TextVerifyOptions`, `DigitalVerifyOptions`) to specify which signatures to search for and verify.
        - name: Define predicate function.
          text: Create a predicate function (lambda expression) that defines the filtering criteria, such as filtering by page number, signature type, position, text content, or any other signature property. This predicate is applied before verification to optimize performance.
        - name: Execute the verification with predicate.
          text: Call the `Verify` method with the verification options and predicate function. The method will first search for signatures matching the options, then filter them using the predicate, and finally verify only the filtered signatures.
        - name: Process the verified results.
          text: Inspect the returned `List<BaseSignature>` containing only the verified signatures that match your predicate criteria, and process them as needed.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides LINQ query support for verification process.

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
