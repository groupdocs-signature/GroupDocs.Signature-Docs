---
id: delete-barcode-signatures-from-documents
url: signature/net/delete-barcode-signatures-from-documents
title: Delete Barcode signatures from documents
linkTitle: ✖ Barcode
weight: 1
description: "This article explains how to delete Barcode electronic signatures with GroupDocs.Signature API."
keywords: delete Barcode,delete Barcode electronic signatures, how to delete Barcode electronic signatures
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Remove Barcodes from documents in C#    
        description: Delete Barcodes presented in documents in convenient way with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to clear any documents from barcodes using C# 
        description: Information about removing barcodes from documents by C#
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of barcodes presented in document 
          text: Create an instance of BarcodeSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found barcodes and save result 
          text: Invoke Delete method passing found barcode and file path for signed file. File stream can be used as well.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [BarcodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodesignature) class to manipulate barcode signatures and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method.  
Please be aware that [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class.

Here are the steps to delete Barcode signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [BarcodeSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/barcodesearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method to obtain list of [BarcodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodesignature);
* Select from list [BarcodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/barcodesignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.

This example shows how to delete Barcode signature that was found using [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method.

```csharp
using (Signature signature = new Signature("signed.docx"))
{
    BarcodeSearchOptions options = new BarcodeSearchOptions();
    // search for Barcode signatures in document
    List<BarcodeSignature> signatures = signature.Search<BarcodeSignature>(options);
    if (signatures.Count > 0)
    {
        BarcodeSignature barcodeSignature = signatures[0];
        bool result = signature.Delete(barcodeSignature);
        if (result)
        {
            Console.WriteLine($"Signature with Barcode '{barcodeSignature.Text}' and encode type '{barcodeSignature.EncodeType.TypeName}' was deleted from document ['{fileName}'].");
        }
        else
        {
            Console.WriteLine($"Signature was not deleted from the document! Signature with Barcode '{barcodeSignature.Text}' and encode type '{barcodeSignature.EncodeType.TypeName}' was not found!");
        }
    }
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
