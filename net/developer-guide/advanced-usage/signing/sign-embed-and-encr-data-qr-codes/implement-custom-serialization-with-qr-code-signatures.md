---
id: implement-custom-serialization-with-qr-code-signatures
url: signature/net/implement-custom-serialization-with-qr-code-signatures
title: Implement custom serialization with QR-Code signatures
linkTitle: ✎ Custom serialization
weight: 2
description: "This article explains how to implement custom serialization for QR-code electronic signatures."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides ability to embed into QR-code signature custom objects. This feature is implemented over object serialization to string and further encryption. There is ability to provide custom encryption. This procedure requires implementation of interface [IDataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/idataencryption) with two methods to encrypt and decrypt data.

Here are the steps to embed into QR-code text with custom encryption with GroupDocs.Signature:

* Define custom data encryption class that implements [IDataEncryption](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/idataencryption) interface. By default GroupDocs.Signature has several encryption implementation you can use but allows user to customize it.
* Implement class with properties and specify if needed class attributes (like custom serialization attribute, custom encryption attribute), specify attributes for properties like [FormatAttribute](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/formatattribute) attribute to specify serialization name and display format, same as [SkipSerializationAttribute](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/skipserializationattribute) to mark property of class as not serialize
* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Create one or several objects of [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) object with [Data](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/data) value  
* Instantiate the [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) object according to your requirements and custom object to [Data](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions/data) property.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of  [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature)  class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/qrcodesignoptions) to it.

This example shows how to specify custom serialization class. This class could be implemented also as Attribute (optional) to specify as class attribute.

```csharp
class CustomSerializationAttribute : Attribute, IDataSerializer
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

## Definition of class

This example shows how to define custom class with serialization and encryption properties and setup Format attributes for properties.

```csharp
// setup CustomSerialization Attribute to setup customer serialization(see example above)
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

## Sign documents with custom encrypted objects and values into QR-code signatures

This example shows how to add custom object into metadata signature to Image document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    // create data encryption
    IDataEncryption encryption = new CustomXOREncryption();
    // create custom object
    DocumentSignatureData documentSignatureData = new DocumentSignatureData()
    {
        ID = Guid.NewGuid().ToString(),
        Author = Environment.UserName,
        Signed = DateTime.Now,
        DataFactor = 11.22M
    };
    // setup QR-Code options
    QrCodeSignOptions options = new QrCodeSignOptions()
    {
        // set custom object to serialize to QR Code
        Data = documentSignatureData,
        // QR-code type
        EncodeType = QrCodeTypes.QR,
        // specify serialization encryption
        DataEncryption = encryption,
        // locate and aligh signature
        Height = 100,
        Width = 100,
        VerticalAlignment = VerticalAlignment.Bottom,
        HorizontalAlignment = HorizontalAlignment.Right,
        Margin = new Padding() { Right = 10, Bottom = 10 }
    };
    // sign document to file
    signature.Sign("QRCodeCustomSerialization.pdf", options);
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

To generate QR codes and/or sign your files with QR codes for free, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.