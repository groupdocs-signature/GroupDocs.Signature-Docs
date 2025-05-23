---
id: search-for-encrypted-object-in-qr-code-signatures
url: signature/net/search-for-encrypted-object-in-qr-code-signatures
title: Search for encrypted object in QR code signatures
weight: 3
description: " This article explains how to search for encrypted electronic signatures in QR code electronic signatures. This topic contains example of using standard encryption, serialization, class definition and search for embedded objects in QR-codes with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Search for encrypted objects in QR Code signatures in documents in C#    
        description: Advanced search for encrypted objects in QR Code electronic signatures in various documents with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: Getting list of encrypted objects in QR Code signatures using C# 
        description: Learn how to get information about encrypted objects in QR Code electronic signatures in documents with C#
        steps:
        - name: Provide document of supported file types.
          text: Instantiate Signature with file as a constructor parameter. You can pass either file path or file stream. 
        - name: Create search options 
          text: Instantiate QrCodeSearchOptions providing encryption instance such as SymmetricEncryption.
        - name: Get list of items 
          text: Call method Search with search options.
        - name: Process list of found items
          text: Process in desired way list of found items.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides ability to search for embedded data objects in QR-code signatures ([QrCodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature)) with standard or custom encryption. Standard encryption is implemented over class [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption) class. Creation of this object expects 3 arguments like encryption algorithm enumeration [SymmetricAlgorithmType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricalgorithmtype) with one of following values ([DES, TripleDES, RC2, Rijndael](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricalgorithmtype)), string value key and string value salt.

Here are the steps to search for embedded objects in QR-code with standard encryption with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Compose object of [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption) class with same parameters as secured QR-code was signed with.
* Create objects of [QrCodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions) class and setup property [DataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions/dataencryption) with object of [SymmetricEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricencryption).
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [QrCodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesearchoptions) to it.

## Definition of class that was embedded into into QR-Code signature

```csharp
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

## Searching for embedded object in QR-code signature

This example shows how to search for embedded object in QR-code signatures.

```csharp
using (Signature signature = new Signature("QRCodeEncryptedObject.pdf"))
{
    // setup key and pasphrase
    string key = "1234567890";
    string salt = "1234567890";
    // create data encryption
    IDataEncryption encryption = new SymmetricEncryption(SymmetricAlgorithmType.Rijndael, key, salt);
    QrCodeSearchOptions options = new QrCodeSearchOptions()
    {
        // specify special pages to search on
        AllPages = true,
        PageNumber = 1,
        PagesSetup = new PagesSetup() { FirstPage = true, LastPage = true, OddPages = false, EvenPages = false },
        // specify special QRCode type to search
        EncodeType = QrCodeTypes.QR,
        //
        DataEncryption = encryption
    };
    // search for signatures in document
    List<QrCodeSignature> signatures = signature.Search<QrCodeSignature>(options);
    Console.WriteLine("\nSource document contains following signatures.");
    foreach (var qrCodeSignature in signatures)
    {
        Console.WriteLine("QRCode signature found at page {0} with type {1}.", qrCodeSignature.PageNumber,qrCodeSignature.EncodeType);
        DocumentSignatureData documentSignatureData = qrCodeSignature.GetData<DocumentSignatureData>();
        if(documentSignatureData != null)
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
