---
id: delete-digital-signatures-from-documents
url: signature/net/delete-digital-signatures-from-documents
title: Delete Digital signatures from documents
linkTitle: ✖ Digital
weight: 5
description: "This article explains how to delete Digital electronic signatures with GroupDocs.Signature API."
keywords:  Digital electronic signatures, delete Digital electronic signatures, how to delete Digital electronic signatures
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove digital signatures from documents in C#    
        description: Delete digital signatures presented in documents in convenient way with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to clear any documents from digital signatures using C# 
        description: Information about removing digital signatures from documents by C#
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of digital signatures presented in document 
          text: Create an instance of DigitalSignature class, fill data and call Search method of signature.
        - name: Delete one of found digital signatures and save result 
          text: Invoke Delete method passing found digital signatures and file path for signed file. File stream can be used as well.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [DigitalSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/digitalsignature) class to manipulate digital electronic signatures and delete them from the documents.
Please be aware that [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class.

*Important information*. Please be aware that digitally signed documents with valid certificates (pfx files) are secured and verified. Changing digitally signed document makes them untrusted from the digital verification perspective. At this moment only Pdf documents support deletion of the specific digital signatures in case of many ones were added. Most documents support deletion of all digital signatures at once without separate certificates removal. It's strongly recommened to use deletion of electronic digital signatures by signature type Digital. See example [Delete Signatures of the certain type]

## How to delete Digital signature from the document
Here are the steps to delete Digital signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or its stream as a constructor parameter;
* Instantiate [DigitalSearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsearchoptions) object with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method to obtain list of [DigitalSignatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/digitalsignature);
* Select from list [DigitalSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/digitalsignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.

This example shows how to delete Digital signature that was found using [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method.

```csharp
using (Signature signature = new Signature("signed.pdf"))
{
    // Search for electronic Digital signatures in the document
    List<DigitalSignature> signatures = 
        signature.Search<DigitalSignature>(SignatureType.Digital);

    if (signatures.Count > 0)
    {
        DigitalSignature digitalSignature = signatures[0];
        bool result = signature.Delete(digitalSignature);

        if (result)
        {
            Console.WriteLine(
                $"Digital signature #{digitalSignature.Thumbprint} from " +
                $"{digitalSignature.SignTime.ToShortDateString()} was deleted."
            );
        }
        else
        {
            Console.WriteLine(
                $"Signature was not deleted from the document! " +
                $"Signature# {digitalSignature.Thumbprint} was not found!"
            );
        }
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
