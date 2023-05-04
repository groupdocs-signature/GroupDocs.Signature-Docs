---
id: esign-presentation-with-metadata-signature
url: signature/java/esign-presentation-with-metadata-signature
title: eSign Presentation with Metadata signature
linkTitle: ✎ Presentation Metadata
weight: 3
description: "This article explains how to add metadata signatures to Presentation document with GroupDocs.Signature"
keywords: Presentation metadata, Presentation metadata signature
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Signing presentations with metadata in Java    
        description: Adding new metadata to presentations with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to create new metadata in presentations using Java 
        description: Learn all about signing a presentation by metadata and Java
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Create demanded PresentationMetadataSignature class instances and add them to array.
        - name: Sign source file and save result 
          text: Invoke Sign method with array of signing options and output file path or stream.
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/java) provides [PresentationMetadataSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures.metadata/PresentationMetadataSignature) class to specify different Metadata signature objects for [MetadataSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions) instance to sign Presentation document files.   
Presentation document metadata is hidden attributes, some of them are visible only over viewing standard document properties like Author, Creation Date, Producer, Entry, Keywords etc.  
Presentation document metadata contains pair of Name and Value, Name should be unique within the document.  
Presentation document metadata could keep big amount of data that allows provides ability to keep serialized custom objects with additional encryption in there. 

 Here are the steps to add metadata signatures into Presentation document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.    
*   Instantiate the [MetadataSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions) object according to your requirements.    
*   Instantiate one or several[PresentationMetadataSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures.metadata/PresentationMetadataSignature) objects and add them into  [MetadataSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions) to metadata signatures collection ([getSignatures](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions#getSignatures())) via [add](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures.metadata/MetadataSignatureCollection#add(com.groupdocs.signature.domain.signatures.metadata.MetadataSignature)) or addRange method.    
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [MetadataSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/MetadataSignOptions) to it.
    

## How to eSign Presentation with Metadata signature

This example shows how to add Metadata signature to Presentation document.

```java
Signature signature = new Signature("sample.ppsx");
// setup options with text of signature
MetadataSignOptions options = new MetadataSignOptions();

// Create few Presentation Metadata signatures
PresentationMetadataSignature[] signatures = new PresentationMetadataSignature[]
        {
                new PresentationMetadataSignature("Author", "Mr.Scherlock Holmes"),
                new PresentationMetadataSignature("DateCreated", new Date()),
                new PresentationMetadataSignature("DocumentId", 123456),
                new PresentationMetadataSignature("SignatureId", 123.456)
        };
options.getSignatures().addRange(signatures);

// sign document to file
signature.sign("SampleSigned.ppsx", options);
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
