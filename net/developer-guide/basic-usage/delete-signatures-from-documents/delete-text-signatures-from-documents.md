---
id: delete-text-signatures-from-documents
url: signature/net/delete-text-signatures-from-documents
title: Delete Text signatures from documents
weight: 4
description: "This article explains how to delete Text electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [TextSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/textsignature) class to manipulate text signatures and delete them from the documents.
Please be aware that [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method modifies the same document that was passed to constructor of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class.

Here are the steps to delete Text signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [TextSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/textsearchoptions) object with desired properties;
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method to obtain list of [TextSignatures](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/textsignature);
* Select from list [TextSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/textsignature) object(s) that should be removed from the document;
* Call [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) object [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method and pass one or several signatures to it.

This example shows how to delete Text signature that was found using [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method.

```csharp
using (Signature signature = new Signature("signed.pptx"))
{
    TextSearchOptions options = new TextSearchOptions();
    // search for text signatures in document
    List<TextSignature> signatures = signature.Search<TextSignature>(options);
    if(signatures.Count > 0)
    {
        TextSignature textSignature = signatures[0];
        bool result = signature.Delete(textSignature);
        if(result)
        {
            Console.WriteLine($"Signature with Text '{textSignature.Text}' was deleted from document.");
        }
        else
        {
            Console.WriteLine($"Signature was not deleted from the document!");
        }
    }
}
```


