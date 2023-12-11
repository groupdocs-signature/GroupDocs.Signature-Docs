---
id: preview-certificate-properties
url: signature/net/preview-certificate-properties
title: Preview Digital Certificates properties
weight: 2
description: "This article shows how to receive digital certificates properties over Document Info method."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Receive digital certificate properties using C#    
        description: Receiving digital certificate properties using C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to obtain digital certificate properties with C# 
        description: Getting digital certificate properties in C#
        steps:
        - name: Provide digital certificate.
          text: Create the Signature instance with the corresponding file or stream of the Digital Certificate. 
        - name: Call GetDocumentInfo method.
          text: Using created isntance of the Signature call the GetDocumentInfo. 
        - name: Analyze IDocumentInfo result. 
          text: Check IDocumentInfo result the MetadataSignatures collection that will keep the digital certificate properties.
        - name: Enumerate digital certificate properties
          text: Review and enumarate each Metadata object in the response to analyze the result.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [GetDocumentInfo](https://apireference.groupdocs.com/signature/net/groupdocs.signature/signature/getdocumentinfo) method to receive document information. The response [IDocumentInfo](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/idocumentinfo/).will includes:

* list of [MetadataSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignature/) that for certificate document will keep all its properties;

## Receive digital certificate properties

```csharp
    LoadOptions loadOptions = new LoadOptions()
    {
        Password = "1234567890"
    };

    using (Signature signature = new Signature("certificate.pfx", loadOptions))
    {
        IDocumentInfo documentInfo = signature.GetDocumentInfo();
        Console.WriteLine($"Certificate properties {Path.GetFileName(certificatePath)}:");
        Console.WriteLine($" - format : {documentInfo.FileType.FileFormat}");
        Console.WriteLine($" - extension : {documentInfo.FileType.Extension}");
        Console.WriteLine($" - size : {documentInfo.Size}");
        Console.WriteLine($" - page count : {documentInfo.PageCount}");

        // display document MetaData signatures information
        Console.WriteLine($"Certificate properties:");
        foreach (MetadataSignature metadataSignature in documentInfo.MetadataSignatures)
        {
            Console.WriteLine($" - {metadataSignature.Name}:{metadataSignature.Value} ({metadataSignature.Type})");
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