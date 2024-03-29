---
id: esign-pdf-with-metadata-signature
url: signature/java/esign-pdf-with-metadata-signature
title: eSign PDF with Metadata signature
linkTitle: ✎ PDF Metadata
weight: 2
description: "This article explains how to add metadata signatures to PDF document meta info layer with GroupDocs.Signature"
keywords: Pdf metadata, Pdf metadata signatures
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Pdf documents metadata changing in Java    
        description: Update metadata of pdf document with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to append new metadata to pdf document using Java 
        description: Learn all about signing pdf documents by metadata and Java
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Create needed PdfMetadataSignature class instances and add them to array.
        - name: Sign source file and save result 
          text: Invoke Sign method with array of signing options and output file path or stream.
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides [PdfMetadataSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures.metadata/PdfMetadataSignature) class to specify different Metadata signature objects for [MetadataSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions) instance.   
PDF document metadata is hidden attributes, some of them are visible only over viewing standard document properties like Author, Creation Date, Producer, Entry, Keywords etc.  
PDF document metadata contains 3 fields: Name, Value and TagPrefix, combination of Name and Tag prefix should be unique.

PDF document metadata could keep big amount of data that provides ability to keep serialized custom objects with additional encryption in there. See [Advanced examples how to embed secure data]({{< ref "signature/java/developer-guide/advanced-usage/_index.md" >}}).

Here are the steps to add metadata signatures into PDF document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [MetadataSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions) object according to your requirements.    
*   Instantiate one or several[PdfMetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/PdfMetadataSignature) objects and add them into [MetadataSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions) to metadata signatures collection ([getSignatures](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions#getSignatures())) via [add](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures.metadata/MetadataSignatureCollection#add(com.groupdocs.signature.domain.signatures.metadata.MetadataSignature)) or addRange method.
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [MetadataSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions) to it.
    

## How to eSign PDF with Metadata signature

This example shows how to sign PDF document with several e-signatures as metadata.

```java
Signature signature = new Signature("sample.pdf");

// create Metadata option with predefined Metadata text
MetadataSignOptions options = new MetadataSignOptions();

// Create few Pdf Metadata signatures
PdfMetadataSignature[] signatures = new PdfMetadataSignature[]
        {
                new PdfMetadataSignature("Author", "Mr.Scherlock Holmes"),
                new PdfMetadataSignature("DateCreated", new Date()),
                new PdfMetadataSignature("DocumentId", 123456),
                new PdfMetadataSignature("SignatureId", 123.456)//decimal value
        };
options.getSignatures().addRange(signatures);

// sign document to file
signature.sign("SampleSigned.pdf", options);
```

## How to eSign PDF with standard metadata signatures

This example shows how to sign PDF document with standard standard embedded PDF document metadata signatures. If PDF metadata signature already exists with same name its value will be overwritten.

```java
Signature signature = new Signature("sample.pdf");
// setup options with text of signature
MetadataSignOptions options = new MetadataSignOptions();

// Using standard Pdf Metadata Signatures with new values
MetadataSignature[] signatures = new MetadataSignature[]
        {
                PdfMetadataSignatures.getAuthor().deepClone("Mr.Scherlock Holmes"),
                PdfMetadataSignatures.getCreateDate().deepClone(DateUtils.addDays(new Date(), -1)),
                PdfMetadataSignatures.getMetadataDate().deepClone(DateUtils.addDays(new Date(), -2)),
                PdfMetadataSignatures.getCreatorTool().deepClone("GD.Signature-Test"),
                PdfMetadataSignatures.getModifyDate().deepClone(DateUtils.addDays(new Date(), -13)),
                PdfMetadataSignatures.getProducer().deepClone("GroupDocs-Producer"),
                PdfMetadataSignatures.getEntry().deepClone("Signature"),
                PdfMetadataSignatures.getKeywords().deepClone("GroupDocs, Signature, Metadata, Creation Tool"),
                PdfMetadataSignatures.getTitle().deepClone("Metadata Example"),
                PdfMetadataSignatures.getSubject().deepClone("Metadata Test Example"),
                PdfMetadataSignatures.getDescription().deepClone("Metadata Test example description"),
                PdfMetadataSignatures.getCreator().deepClone("GroupDocs.Signature"),
        };
options.getSignatures().addRange(signatures);

// sign document to file
signature.sign("sample_signed.pdf", options);
```

## More resources

### Advanced Usage Topics 

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/java/developer-guide/advanced-usage/_index.md" >}}).

### GitHub Examples  

You may easily run the code above and see the feature in action in our GitHub examples:

*   [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)    
*   [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)    
*   [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)    
*   [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)    
*   [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)   
*   [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
    

### Free Online App  

Along with full-featured .NET library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
