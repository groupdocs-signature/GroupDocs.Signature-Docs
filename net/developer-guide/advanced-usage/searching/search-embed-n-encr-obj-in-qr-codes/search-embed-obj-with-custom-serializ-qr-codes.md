---
id: search-for-embedded-object-with-custom-serialization-of-qr-code-signatures
url: signature/net/search-for-embedded-object-with-custom-serialization-of-qr-code-signatures
title: Search for embedded object with custom serialization of QR-Code signatures
weight: 2
description: "This article explains how to search for embedded electronic signatures with custom serialization in QR code electronic signatures. This topic contains example of custom serialization, class definition and search for serialized objects in the QR-codes with GroupDocs.Signature."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Search for serialized QR Code signatures in documents in C#    
        description: Advanced search for serialized QR Code electronic signatures in various documents with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: Getting list of serialized QR Code electronic signatures using C# 
        description: Learn how to acquire information about serialized QR Code electronic signatures in documents with C#
        steps:
        - name: Provide document of supported file types.
          text: Instantiate Signature with file as a constructor parameter. You can pass either file path or file stream. 
        - name: Create search options 
          text: Implement IDataSerializer interface and instantiate QrCodeSearchOptions object providing serialization object.
        - name: Get list of items 
          text: Invoke method Search with search options.
        - name: Process list of found items
          text: Process in desired way list of found items.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides following abilities to search for embedded data objects in QR-code signatures ([QrCodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature)) that were embedded with custom encryption and serialization

* ability to search for embedded custom objects into metadata and decrypt them to original source values
* ability to search for custom encrypted QR-code signature and decrypt it
* ability to search for custom serialized QR-code signatures  

Here are the steps to search and decrypt previously encrypted text of QR-Code and decrypt custom object from QR-Code signature with GroupDocs.Signature API:

* Implement (use) custom data serialization class that implements [IDataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/idataencryption) interface.
* Ensure that data class if defined with custom serialization attribute  
* Instantiate the [QrCodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions) object and setup [DataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions/dataencryption) value with custom encryption object implementation
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions) to it.

## Implementation of custom data serialization

 This example shows how to specify custom serialization class. This class should be implemented as Attribute and [IDataSerializer](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/idataserializer) interface.

```csharp
/// <summary>
/// Creates class that implements IDataSerializer interface
/// This implementation is using json library to provide serialization and deserialization
/// </summary>

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
// Class could inherits Attribute to use it with class definition

public class CustomXOREncryption : IDataEncryption
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

This example shows how to define custom class for serialization.

```csharp
// define class with custom serialization attribute
[CustomSerialization]
public class DocumentSignatureData
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

## Search for embedded custom objects in QR-code signatures

This example shows how to decrypt previously embedded encrypted custom objects into [QrCodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature) contains method [GetData](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature/getdata) to retrieve object

```csharp
using (Signature signature = new Signature("QRCodeCustomSerializationObject.pdf"))
{
    // create data encryption
    IDataEncryption encryption = new CustomXOREncryption();
    QrCodeSearchOptions options = new QrCodeSearchOptions()
    {
        // specify special pages to search on
        AllPages = true,
        DataEncryption = encryption
    };
    // search for signatures in document
    List<QrCodeSignature> signatures = signature.Search<QrCodeSignature>(options);
    Console.WriteLine("\nSource document contains following signatures:");
    foreach (var qrCodeSignature in signatures)
    {
        Console.WriteLine("QRCode signature found at page {0} with type {1}.", qrCodeSignature.PageNumber, qrCodeSignature.EncodeType);
        DocumentSignatureData documentSignatureData = qrCodeSignature.GetData<DocumentSignatureData>();
        if (documentSignatureData != null)
        {
            Console.WriteLine("QRCode signature has DocumentSignatureData object:\n ID = {0}, Author = {1}, Signed = {2}, DataFactor {3}",
                documentSignatureData.ID, documentSignatureData.Author, documentSignatureData.Signed.ToShortDateString(), documentSignatureData.DataFactor);
        }
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
