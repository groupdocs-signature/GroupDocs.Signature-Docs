---
id: delete-signatures-of-the-certain-type
url: signature/net/delete-signatures-of-the-certain-type
title: Delete Signatures of the certain type
weight: 6
description: "This article explains how to delete electronic signatures of the certain type with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides overloaded [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method that accepts one [SignatureType](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/signaturetype) or list of them.
Please be aware that this method modifies the same document that was passed to constructor of the [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class.

Here are the steps to delete signature by specific type from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path or its stream as a constructor parameter;
* Call [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) object [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method and pass certain [SignatureType](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/signaturetype) enumeration to it.

This example shows how to delete QR-Code signatures from the document.

```csharp
using (Signature signature = new Signature("signed.pdf"))
{
    // deleting QR-Code signatures from the document
    DeleteResult result = signature.Delete(SignatureType.QrCode);
    if (result.Succeeded.Count > 0)
    {
        Console.WriteLine("Following QR-Code signatures were deleted:");                    
        int number = 1;
        foreach (QrCodeSignature temp in result.Succeeded)
        {
            Console.WriteLine($"Signature #{number++}: Type: {temp.SignatureType} Id:{temp.SignatureId}, Text: {temp.Text}");
        }
    }
    else
    {
        Helper.WriteError("No one QR-Code signature was deleted.");
    }
}
```

