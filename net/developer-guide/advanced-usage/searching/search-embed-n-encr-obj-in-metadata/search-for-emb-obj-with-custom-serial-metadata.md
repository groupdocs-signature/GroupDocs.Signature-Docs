---
id: search-for-embedded-object-with-custom-serialization-of-metadata-signatures
url: signature/net/search-for-embedded-object-with-custom-serialization-of-metadata-signatures
title: Search for embedded object with custom serialization of Metadata signatures
weight: 2
description: " This article explains how to search for embedded electronic signatures with custom serialization in document metadata. This topic contains example of custom serialization, class definition and search for serialized objects in the document metadata with GroupDocs.Signature."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Search for embedded metadata in documents in C#    
        description: Searching for metadata with custom serialization in various documents with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to get list of metadata signatures using C# 
        description: Learn ways to obtain list of embedded electronic metadata signatures with custom serialization in documents with C#
        steps:
        - name: Load file which has one of supported file types.
          text: Create object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create searching options 
          text: Implement IDataEncryption interface and instantiate MetadataSearchOptions object providing encryption object.
        - name: Get list of items 
          text: Invoke method Search passing search options.
        - name: Process list of found items
          text: Loop through list of found embedded metadata items and process in desired way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides additional features when searching for Metadata Signatures that were previously encrypted and have embedded data objects.

* ability to search for embedded custom objects into metadata and decrypt them to original source values
* ability to search for encrypted text of metadata signature and decrypt it

Here are the steps to search and decrypt previously encrypted text of metadata and decrypt custom object from metadata signature ([MetadataSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignature)) with GroupDocs.Signature API:

* Implement custom data serialization class that implement [IDataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/idataencryption) interface. By default Signature uses embedded json format serialization but allows user to customize it. if object of class was serialized by custom serialization when searching for it, this class should also has same serialization attribute.  
* Implement custom data encryption class that implements [IDataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/idataencryption) interface. By default Signature has several encryption implementation you can use but allows user to customize it. There's ability to specify inline encryption to use
* Define class with proper DataSerialization attribute  
* Instantiate the [MetadataSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions) object value
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [MetadataSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions) to it.
* Process each Metadata signature and set property [DataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/metadatasearchoptions/dataencryption) to specify data encryption and call [GetData](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignature/getdata) method to retrieve object

## Implementation of custom data serialization

This example shows how to specify custom serialization class. This class should be implemented as Attribute and [IDataSerializer](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/idataserializer) interface.

```csharp
public class CustomSerializationAttribute : Attribute, IDataSerializer
{
    public T Deserialize<T>(string source) where T : class
    {
        return JsonConvert.DeserializeObject<T>(source);
    }
    public string Serialize(object data)
    {
        var serializerSettings = new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore };
        return JsonConvert.SerializeObject(data, serializerSettings);
    }
}
```

## Implementation of custom data encryption

This example shows how to specify custom serialization class. This class could be implemented also as Attribute (optional) to specify as class attribute.

```csharp
// Define class that implements IDataEncryption interface
private class CustomXOREncryption : IDataEncryption
{
    /// <summary>
    /// Gets or sets non empty key for encryption (at least one character)
    /// </summary>
    public int Key { get; set; }
    /// <summary>
    /// Encode method to encrypt string.
    /// </summary>
    /// <param name="source">Source string to encode.</param>
    /// <returns>Returns enccrypted string</returns>
    public string Encode(string source)
    {
        return Process(source);
    }
    /// <summary>
    /// Decode method to obtain decrypted string.
    /// </summary>
    /// <param name="source">Source string to decode.</param>
    /// <returns>Returns decrypted string</returns>
    public string Decode(string source)
    {
        return Process(source);
    }
    /// <summary>
    /// Using XOR operation get encoded / decoded string
    /// </summary>
    /// <param name="source"></param>
    /// <returns></returns>
    private string Process(string source)
    {
        StringBuilder src = new StringBuilder(source);
        StringBuilder dst = new StringBuilder(src.Length);
        char chTmp;
        for (int index = 0; index < src.Length; ++index)
        {
            chTmp = src[index];
            chTmp = (char)(chTmp ^ this.Key);
            dst.Append(chTmp);
        }
        return dst.ToString();
    }
}
```

## Definition of class

This example shows how to define custom class with serialization and encryption properties and setup Format attributes for properties.

```csharp
// setup CustomSerialization Attribute to setup customer serialization(see example above)
[CustomSerialization]
private class DocumentSignatureData
{
    [Format("SignID")]
    public string ID { get; set; }
    [Format("SAuth")]
    public string Author { get; set; }
    [Format("SDate", "yyyy-MM-dd")]
    public DateTime Signed { get; set; }
    [Format("SDFact", "N2")]
    public decimal DataFactor { get; set; }
    [SkipSerialization]
    public string Comments { get; set; }
}
```

## Search for embedded custom objects in metadata signatures

 This example shows how to decrypt previously embedded encrypted custom objects into metadata signature. [MetadataSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignature) contains method [GetData](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/metadatasignature/getdata) to retrieve object

```csharp
using (Signature signature = new Signature("MetadataCustomSerializationObject.docx"))
{
    // create data encryption
    IDataEncryption encryption = new CustomXOREncryption();
    MetadataSearchOptions options = new MetadataSearchOptions()
    {
        DataEncryption = encryption
    };
    // search for signatures in document
    List<WordProcessingMetadataSignature> signatures = signature.Search<WordProcessingMetadataSignature>(options);
    Console.WriteLine("\nSource document contains following signatures.");
    // get required metadata signatures
    WordProcessingMetadataSignature mdSignature = signatures.FirstOrDefault(p => p.Name == "Signature");
    if (mdSignature != null)
    {
        DocumentSignatureData documentSignatureData = mdSignature.GetData<DocumentSignatureData>();
        if (documentSignatureData != null)
        {
            Console.WriteLine("Signature has DocumentSignatureData object:\n ID = {0}, Author = {1}, Signed = {2}, DataFactor {3}",
                documentSignatureData.ID, documentSignatureData.Author, documentSignatureData.Signed.ToShortDateString(), documentSignatureData.DataFactor);
        }
    }
    // get required metadata signatures
    WordProcessingMetadataSignature mdAuthor = signatures.FirstOrDefault(p => p.Name == "Author");
    if (mdAuthor != null)
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
