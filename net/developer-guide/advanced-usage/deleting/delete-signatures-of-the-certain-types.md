---
id: delete-signatures-of-the-certain-types
url: signature/net/delete-signatures-of-the-certain-types
title: Delete Signatures of the certain types
weight: 6
description: "This article explains how to delete electronic signatures of the certain types with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides overloaded [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method that accepts list of the [SignatureType](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/signaturetype) enumeration values.
Please be aware that this method modifies the same document that was passed to constructor of the [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class.

Here are the steps to delete signature by certain types from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path or its stream as a constructor parameter;
* Call [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) object [Delete](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/delete) method and pass list of the required [SignatureType](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/signaturetype) enumerations to it.

This example shows how to delete various signatures types from the document at once.

```csharp
using (Signature signature = new Signature("signed.pdf"))
{
    // compose the list of signature types to delete
    var signedTypes = new List<SignatureType>
    {
        SignatureType.Text, 
        SignatureType.Image,
        SignatureType.Barcode,
        SignatureType.QrCode,
        SignatureType.Digital
    };
    // deleting QR-Code signatures from the document by signature types
    DeleteResult result = signature.Delete(signedTypes);
    if (result.Succeeded.Count > 0)
    {
        Console.WriteLine("Following signatures were removed:");
        int number = 1;
        foreach (BaseSignature temp in result.Succeeded)
        {
            Console.WriteLine($"Signature #{number++}: Type: {temp.SignatureType} Id:{temp.SignatureId}. Created: {temp.CreatedOn.ToShortDateString()}");
        }
    }
    else
    {
        Helper.WriteError("No one signature was deleted.");
    }
}
```


