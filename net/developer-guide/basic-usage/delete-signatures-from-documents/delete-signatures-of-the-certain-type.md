---
id: delete-signatures-of-the-certain-type
url: signature/net/delete-signatures-of-the-certain-type
title: Delete Signatures of the certain type
linkTitle: ✖ By type
weight: 6
description: "This article explains how to delete electronic signatures of the certain type with GroupDocs.Signature API."
keywords: delete signature, how to delete signature of the certain type
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove electronic signatures from documents in C#    
        description: Delete electronic signatures presented in documents in convenient way with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to clear any documents from electronic signatures using C# 
        description: Information about removing electronic signatures from documents by C#
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Delete all signatures of specific type presented in document 
          text: Invoke Delete method passing type of signatures to be deleted.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides overloaded [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method that accepts one [SignatureType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signaturetype) or list of them.
Please be aware that this method modifies the same document that was passed to constructor of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class.
## How to delete signature by specific type from the document
Here are the steps to delete signature by specific type from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or its stream as a constructor parameter;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass certain [SignatureType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signaturetype) enumeration to it.

This example shows how to delete QR-Code signatures from the document.

```csharp
using (Signature signature = new Signature("signed.pdf"))
{
    // Deleting QR-Code signatures from the document
    DeleteResult result = signature.Delete(SignatureType.QrCode);

    if (result.Succeeded.Count > 0)
    {
        Console.WriteLine("Following QR-Code signatures were deleted:");

        int number = 1;
        foreach (QrCodeSignature temp in result.Succeeded)
        {
            Console.WriteLine(
                $"Signature #{number++}: Type: {temp.SignatureType}, " +
                $"Id: {temp.SignatureId}, Text: {temp.Text}"
            );
        }
    }
    else
    {
        Console.WriteLine("No QR-Code signatures were deleted.");
    }
}
```

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [Advanced usage section]({{< ref "signature/net/developer-guide/advanced-usage/_index.md" >}}).

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