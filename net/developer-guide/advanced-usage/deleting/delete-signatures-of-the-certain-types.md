---
id: delete-signatures-of-the-certain-types
url: signature/net/delete-signatures-of-the-certain-types
title: Delete Signatures of the certain types
linkTitle: ✖ By type
weight: 6
description: "This article explains how to delete electronic signatures of the certain types with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Delete signatures from document with C#    
        description: Remove all signatures of specific type from particular document with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to remove signatures from documents using C# 
        description: Investigate ways of deletion specific signatures from document using C#
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Specify signature types to delete. 
          text: Create List instance and fill it with signature types which must be removed.
        - name: Delete demanded signature types. 
          text: Invoke Delete method and analyze DeleteResult instance.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides overloaded [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method that accepts list of the [SignatureType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signaturetype) enumeration values.
Please be aware that this method modifies the same document that was passed to constructor of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class.

Here are the steps to delete signature by certain types from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or its stream as a constructor parameter;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass list of the required [SignatureType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signaturetype) enumerations to it.

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
