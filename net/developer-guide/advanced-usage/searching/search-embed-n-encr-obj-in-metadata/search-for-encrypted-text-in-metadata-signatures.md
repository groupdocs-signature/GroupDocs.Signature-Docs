---
id: search-for-encrypted-text-in-metadata-signatures
url: signature/net/search-for-encrypted-text-in-metadata-signatures
title: Search for encrypted text in Metadata signatures
weight: 4
description: " This article explains how to search for encrypted text electronic signatures in the document metadata. This topic contains example of using standard encryption and search for encrypted text in the document metadata with further decryption by GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for encrypted text signatures in documents in C#    
        description: Advanced search for encrypted text electronic signatures in various documents with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: Getting list of encrypted text electronic signatures using C# 
        description: Learn how to obtain information about encrypted text electronic signatures in documents with C#
        steps:
        - name: Provide document of supported file types.
          text: Instantiate Signature with file as a constructor parameter. You can pass either file path or file stream. 
        - name: Create search options 
          text: Instantiate MetadataSearchOptions object and pass IDataEncryption instance such as SymmetricEncryption.
        - name: Get list of items 
          text: Invoke method Search with search options.
        - name: Process list of found items
          text: Process in desired way list of found items.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides ability to search encrypted Metadata signatures with standard or custom encryption. Standard encryption is implemented over class [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption) class. Creation of this object expects 3 arguments like encryption algorithm enumeration [SymmetricAlgorithmType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricalgorithmtype) with one of following values (DES, TripleDES, RC2, Rijndael), string value key and string value salt.

Here are the steps to search for encrypted Metadata signature with standard encryption with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or   as a constructor parameter.
* Compose object of [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption) class with same parameters as secured QR-code was signed with.  
* Create objects of [MetadataSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions) class and setup property  [DataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions/dataencryption) with object of [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption)
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [MetadataSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions)  to it.
* Call method [GetData<string>](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignature/getdata) of encrypted [MetadataSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignature) object that was found.

## Search for encrypted Metadata signature text

This example shows how to search for secure Metadata signature text.

```csharp
using (Signature signature = new Signature("MetadataEncryptedText.docx"))
{
    // setup key and passphrase
    string key = "1234567890";
    string salt = "1234567890";
    // create data encryption
    IDataEncryption encryption = new SymmetricEncryption(SymmetricAlgorithmType.Rijndael, key, salt);
    MetadataSearchOptions options = new MetadataSearchOptions()
    {
        DataEncryption = encryption
    };
    // search for signatures in document
    List<WordProcessingMetadataSignature> signatures = signature.Search<WordProcessingMetadataSignature>(options);
    Console.WriteLine("\nSource document contains following signatures.");
    // get required metadata signatures
    WordProcessingMetadataSignature mdAuthor = signatures.FirstOrDefault(p => p.Name == "Author");
    if(mdAuthor != null)
    {
        Console.WriteLine("Metadata signature found. Name : {0}. Value: {1}", mdAuthor.Name, mdAuthor.GetData<string>());
    }
    // get required metadata signatures
    WordProcessingMetadataSignature mdDocId = signatures.FirstOrDefault(p => p.Name == "DocumentId");
    if (mdDocId != null)
    {
        Console.WriteLine("Metadata signature found. Name : {0}. Value: {1}", mdDocId.Name, mdDocId.GetData<string>());
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
