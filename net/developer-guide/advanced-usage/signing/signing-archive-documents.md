---
id: signing-archive-documents
url: signature/net/signing-archive-documents
title: Signing archive documents in batch
linkTitle: ✎ Archives
weight: 20
description: "This article shows how to sign documents in batch mode within the archive files with one or multiple electronic signatures"
keywords: ZIP archive, TAR archive, 7z archive
productName: GroupDocs.Signature for .NET
hideChildren: False
structuredData:
    showOrganization: True
    application:    
        name: Archive signing with form fields in C#    
        description: Sign archives with one or more signatures and C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign archive documents using C# 
        description: Learn all about signing archives with multiple documents in C#
        steps:
        - name: Load archive 
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide new FormFieldSignature class instance and fill all demanded data.
        - name: Sign source file with form fields and save result 
          text: Invoke Sign method with signing options and output file path or stream.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) supports signing archive files with formats like ZIP, TAR, 7Z the same way as usual documents. The only difference in the [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult/) of the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method will contain for archive files the lists of [Succeeded](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult/succeeded) and [Failed](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult/failed) signatures as the  
list of the [DocumentResultSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentresultsignature/) instances.

Here are the steps to sign the archive files like ZIP, TAR, 7z with GroupDocs.Signature:

* Create a new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass the source archive path or stream of the archive as a constructor parameter.
* Instantiate the single [SignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions) object or list of this class with the required options.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of  [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [SignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions) to it.
* The passed signature options will be applied to the all documents within the archive.
* Analyze response [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult/) over the properties [Succeeded](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult/succeeded) and [Failed](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult/failed) signatures as the instances of the [DocumentResultSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/documentresultsignature/)

## Sign archive document

This example shows how to sign archive document with few SignOptions.

```csharp
/// <summary>
/// Support Succeeded and Failed list as result of processing archives
/// </summary>
using (var signature = new Signature("sample.zip"))
{
    // create sign options
    var options = new TextSignOptions("signed!")
    {
        // set signature position
        Left = 100,
        Top = 100
    };
    // sign archive to new zip file
    SignResult result = signature.Sign("output.zip", options);
    // analyze signed documents
    foreach (DocumentResultSignature document in result.Succeeded)
    {
        Console.WriteLine($"Document {document.FileName}. Processed: {document.ProcessingTime}, mls");
    }
    if (signResult.Failed.Count > 0)
    {
        Console.WriteLine("\nList of failed documents:");
        number = 1;
        foreach (DocumentResultSignature document in result.Failed)
        {
            Console.WriteLine($"Document {document.FileName}. Processed: {document.ProcessingTime}, mls");
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

### Free Online App

Along with full-featured .NET library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
