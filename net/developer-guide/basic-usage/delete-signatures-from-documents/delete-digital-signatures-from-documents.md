---
id: delete-digital-signatures-from-documents
url: signature/net/delete-digital-signatures-from-documents
title: Delete Digital signatures from documents
weight: 5
description: "This article explains how to delete Digital electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [DigitalSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/digitalsignature) class to manipulate digital electronic signatures and delete them from the documents.
Please be aware that [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method modifies the same document that was passed to constructor of the [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class.

*Important information*. Please be aware that digitally signed documents with valid certificates (pfx files) are secured and verified. Changing digitally signed document makes them untrusted from the digital verification perspective. At this moment only Pdf documents support deletion of the specific digital signatures in case of many ones were added. Most documents support deletion of all digital signatures at once without separate certificates removal. It's strongly recommened to use deletion of electronic digital signatures by signature type Digital. See example [Delete Signatures of the certain type]

Here are the steps to delete Digital signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path or its stream as a constructor parameter;
* Instantiate [DigitalSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/digitalsearchoptions) object with desired properties;
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method to obtain list of [DigitalSignatures](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/digitalsignature);
* Select from list [DigitalSignature](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/digitalsignature) object(s) that should be removed from the document;
* Call [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) object [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method and pass one or several signatures to it.

This example shows how to delete Digital signature that was found using [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method.

```csharp
using (Signature signature = new Signature("signed.pdf"))
{
    // search for electronic Digital signatures in the document
    List<DigitalSignature> signatures = signature.Search<DigitalSignature>(SignatureType.Digital);
    if (signatures.Count > 0)
    {
        DigitalSignature digitalSignature = signatures[0];
        bool result = signature.Delete(digitalSignature);
        if (result)
        {
            Console.WriteLine($"Digital signature #{digitalSignature.Thumbprint} from the {digitalSignature.SignTime.ToShortDateString()} was deleted.");
        }
        else
        {
            Helper.WriteError($"Signature was not deleted from the document! Signature# {digitalSignature.Thumbprint} was not found!");
        }
    }
}
```


