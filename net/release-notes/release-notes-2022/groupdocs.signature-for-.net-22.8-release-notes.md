---
id: groupdocs-signature-for-net-22-8-release-notes
url: signature/net/groupdocs-signature-for-net-22-8-release-notes
title: GroupDocs.Signature for .NET 22.8 Release Notes
weight: 38
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 22.8{{< /alert >}}

## Major Features

This release contains improvements with the standard QR Code embedded objects processing to support empty or a missing values, especialy with the Event QR Code type support. The important changes were made to provide more secure and update implementation of the AES data encryption for the QR Code and metadata objects. An updates with the webp file format support were made to support its processing over the creating the signatures, verifying and searching them in this image document format. Few issues were fixed and provided internal code optimization. Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.8:

* QR Code standard object scanner was improved to support different version of QR Code data serialization.
* The new AES improved implementation was provided to respect highly secure standards.
* Improved standard QR Code Event object processing to support time and various format versions.
* Fixed an issue with symetric algorithms encoding.
* The referenced libraries were updated to the latest versions.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3913 | Improve QR Code Event object scanner to support empty and missing fields | Feature |
| SIGNATURENET-3892 | Implement advanced AES encryption algorithm for the Net framework version | Feature |
| SIGNATURENET-3855 | Implement webp image file format support for full signature life circle processing | Feature |
| SIGNATURENET-3837 | Adjust standard QR Code entities to support empty values | Improvement |
| SIGNATURENET-3832 | QR Code Event entity does not support time for Start and End dates | Bug |
| SIGNATURENET-3914 | Exception with AES data encryption : Specified key is not a valid size for this algorithm | Bug |

## Public Developer Guide examples changes

The following topics from Developer Guide were changed

[eSign PDF with Metadata signature]({{< ref "signature/net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-pdf-with-metadata-signature.md" >}})

[eSign Image with Metadata signature]({{< ref "signature/net/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-image-with-metadata-signature.md" >}})

## Public API and Backward Incompatible Changes

#### Public enumeration [SymmetricAlgorithmType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricalgorithmtype) was modified with new element AESNew type

Represents symmetric encryption algorithm type with new AESNew type.

**Enumeration type SymmetricAlgorithmType changes**

```csharp
    /// <summary>
    /// Represents symmetric encryption algorithm type.
    /// </summary>
    public enum SymmetricAlgorithmType
    {
        // . . . . 
        /// <summary>Represents improved AES (Advanced Encryption Standard) encryption algorithm.</summary>
        AESNew = 5
    }
```

#### Public class  [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) was updated with the new method to add the existing MetadataSignature object

Prototype is
public MetadataSignOptions Add(MetadataSignature metadataSignature);

**How to add quickly existing MetadataSignature**

```csharp
    public class MetadataSignOptions : SignOptions
    {
        //
        // Summary:
        //     Add existing MetadataSignature instance to collection.
        //
        // Parameters:
        //   metadataSignature:
        //     The existing MetadataSignature instance to be added
        //
        // Returns:
        //     Instance itself
        public MetadataSignOptions Add(MetadataSignature metadataSignature);
    }
    // using sample     
    using (var signature = new Signature("sample.pdf"))
    {
        // create Metadata option with predefined Metadata text
        var options = new MetadataSignOptions();
        options
            .Add(new PdfMetadataSignature("Author", "Mr.Scherlock Holmes")) // String value
            .Add(new PdfMetadataSignature("CreatedOn", DateTime.Now))       // DateTime values
            .Add(new PdfMetadataSignature("DocumentId", 123456))            // Integer value
            .Add(new PdfMetadataSignature("SignatureId", 123.456D))         // Double value
            .Add(new PdfMetadataSignature("Amount", 123.456M))              // Decimal value
            .Add(new PdfMetadataSignature("Total", 123.456F));              // Float value
        
        // sign document to file
        var result = signature.Sign(outputFilePath, options);
        Console.WriteLine($"\nSource document signed successfully with {result.Succeeded.Count}");
    }

```
