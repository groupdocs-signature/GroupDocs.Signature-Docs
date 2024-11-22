---
id: esign-pdf-with-metadata-signature
url: signature/net/esign-pdf-with-metadata-signature
title: eSign PDF with Metadata signature
linkTitle: eSign PDF
weight: 2
description: "This article explains how to add metadata signatures to PDF document meta info layer with GroupDocs.Signature"
keywords: Pdf metadata, Pdf metadata signatures
productName: GroupDocs.Signature for .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Pdf documents metadata changing in C#    
        description: Update metadata of pdf document with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to append new metadata to pdf document using C# 
        description: Learn all about signing pdf documents by metadata and C#
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Create needed PdfMetadataSignature class instances and add them to array.
        - name: Sign source file and save result 
          text: Invoke Sign method with array of signing options and output file path or stream.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [PdfMetadataSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/pdfmetadatasignature) class to specify different Metadata signature objects for [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) instance.
PDF document metadata is hidden attributes, some of them are visible only over viewing standard document properties like Author, Creation Date, Producer, Entry, Keywords etc.  
PDF document metadata contains 3 fields: Name, Value and TagPrefix, combination of Name and Tag prefix should be unique.

PDF document metadata could keep big amount of data that provides ability to keep serialized custom objects with additional encryption in there. See [Advanced examples how to embed secure data]({{< ref "signature/net/developer-guide/advanced-usage/signing/sign-document-with-secure-custom-metadata-signatures/_index.md" >}}).

### Here are the steps to add metadata signatures into PDF document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) object according to your requirements.
* Instantiate one or several[PdfMetadataSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/pdfmetadatasignature) objects and add them into [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) to metadata signatures collection ([Signatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions/signatures)) via [Add](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignaturecollection/add) or [AddRange](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignaturecollection/addrange) method.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [MetadataSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasignoptions) to it.

## How to eSign PDF with Metadata signature

This example shows how to sign PDF document with several e-signatures as metadata.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    MetadataSignOptions options = new MetadataSignOptions();

    options
       .Add(new PdfMetadataSignature("Author", "Mr.Scherlock Holmes")) // String value
       .Add(new PdfMetadataSignature("CreatedOn", DateTime.Now))       // DateTime values
       .Add(new PdfMetadataSignature("DocumentId", 123456))            // Integer value
       .Add(new PdfMetadataSignature("SignatureId", 123.456D))         // Double value
       .Add(new PdfMetadataSignature("Amount", 123.456M))              // Decimal value
       .Add(new PdfMetadataSignature("Total", 123.456F));              // Float value
    // add these signatures to options
    options.Signatures.AddRange(signatures);
    signature.Sign("SampleSigned.pdf", options);
}
```

## How to eSign PDF with standard metadata signatures

This example shows how to sign PDF document with standard standard embedded PDF document metadata signatures. If PDF metadata signature already exists with same name its value will be overwritten.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    MetadataSignOptions options = new MetadataSignOptions();
    // Using standard Pdf Metadata Signatures with new values
    MetadataSignature[] signatures = new MetadataSignature[]
    {
        PdfMetadataSignatures.Author.Clone("Mr.Scherlock Holmes"),
        PdfMetadataSignatures.CreateDate.Clone(DateTime.Now.AddDays(-1)),
        PdfMetadataSignatures.MetadataDate.Clone(DateTime.Now.AddDays(-2)),
        PdfMetadataSignatures.CreatorTool.Clone("GD.Signature-Test"),
        PdfMetadataSignatures.ModifyDate.Clone(DateTime.Now.AddDays(-13)),
        PdfMetadataSignatures.Producer.Clone("GroupDocs-Producer"),
        PdfMetadataSignatures.Entry.Clone("Signature"),
        PdfMetadataSignatures.Keywords.Clone("GroupDocs, Signature, Metadata, Creation Tool"),
        PdfMetadataSignatures.Title.Clone("Metadata Example"),
        PdfMetadataSignatures.Subject.Clone("Metadata Test Example"),
        PdfMetadataSignatures.Description.Clone("Metadata Test example description"),
        PdfMetadataSignatures.Creator.Clone("GroupDocs.Signature"),
    };
    options.Signatures.AddRange(signatures);
    // sign document to file
    signature.Sign("sample_signed.pdf", options);
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