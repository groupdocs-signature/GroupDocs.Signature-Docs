---
id: delete-text-signatures-from-documents
url: signature/python-net/delete-text-signatures-from-documents
title: Delete Text signatures from documents
linkTitle: ✖ Text
weight: 4
description: "This article explains how to delete Text electronic signatures with GroupDocs.Signature API."
keywords: delete text signature, how to delete Text electronic signatures
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove Text electronic signatures from documents in C#    
        description: Delete Text electronic signatures presented in documents in convenient way with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to clear any documents from text electronic signatures using C# 
        description: Information about removing text electronic signatures from documents by C#
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of text electronic signatures presented in document 
          text: Create an instance of TextSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found text electronic signatures and save result 
          text: Invoke Delete method passing found text electronic signature and file path for signed file. File stream can be used as well.

---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignature) class to manipulate text signatures and delete them from the documents.
Please be aware that [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class.
## How to delete Text signature from the document
Here are the steps to delete Text signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [TextSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method to obtain list of [TextSignatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignature);
* Select from list [TextSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.

This example shows how to delete Text signature that was found using [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method.

```csharp
using (Signature signature = new Signature("signed.pptx"))
{
    TextSearchOptions options = new TextSearchOptions();
    
    // Search for text signatures in the document
    List<TextSignature> signatures = 
        signature.Search<TextSignature>(options);

    if (signatures.Count > 0)
    {
        TextSignature textSignature = signatures[0];
        bool result = signature.Delete(textSignature);

        if (result)
        {
            Console.WriteLine(
                $"Signature with text '{textSignature.Text}' " +
                $"was deleted from the document."
            );
        }
        else
        {
            Console.WriteLine("Signature was not deleted from the document!");
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