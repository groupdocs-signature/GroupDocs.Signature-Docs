---
id: get-document-information
url: signature/net/get-document-information
title: Get document information
weight: 2
description: "This article explains how to detect document file type, obtain document details,  retrieve list of existing form fields and added signatures, calculate pages count when processing document file with GroupDocs.Signature."
keywords: document properties, document information, document details, get document information
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) allows to get document information which includes:

* [FileType](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/documentinfo/properties/filetype)
* [Size](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/documentinfo/properties/size)
* [PageCount](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/documentinfo/properties/pagecount)
* Pages dimensions - [Height](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/pageinfo/properties/height) and [Width](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/pageinfo/properties/width) for each page in a document [Pages](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/idocumentinfo/properties/pages) collection.

## Get document information from file on local disk

The following code snippet demonstrates how to obtain information about document stored on local disk.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    IDocumentInfo documentInfo = signature.GetDocumentInfo();
    Console.WriteLine("Document properties {0}:", Path.GetFileName("sample.pdf"));
    Console.WriteLine(" - format : {0}", documentInfo.FileType.FileFormat);
    Console.WriteLine(" - extension : {0}", documentInfo.FileType.Extension);
    Console.WriteLine(" - size : {0}", documentInfo.Size);
    Console.WriteLine(" - page count : {0}", documentInfo.PageCount);
    foreach(PageInfo pageInfo in documentInfo.Pages)
    {
        Console.WriteLine(" - page-{0} Width {1}, Height {2}", pageInfo.PageNumber, pageInfo.Width, pageInfo.Height);
    }
}
```

## Get document information from a stream

The following code snippet demonstrates how to obtain information about document provided as a stream.

```csharp
using (var stream = File.OpenRead("sample.pdf"))
{
    using (Signature signature = new Signature(stream))
    {
        IDocumentInfo documentInfo = signature.GetDocumentInfo();
        Console.WriteLine("Document properties {0}:", Path.GetFileName(filePath));
        Console.WriteLine(" - format : {0}", documentInfo.FileType.FileFormat);
        Console.WriteLine(" - extension : {0}", documentInfo.FileType.Extension);
        Console.WriteLine(" - size : {0}", documentInfo.Size);
        Console.WriteLine(" - page count : {0}", documentInfo.PageCount);
        foreach (PageInfo pageInfo in documentInfo.Pages)
        {
            Console.WriteLine(" - page-{0} Width {1}, Height {2}", pageInfo.PageNumber, pageInfo.Width, pageInfo.Height);
        }
    }
}
```

{{< alert style="info" >}}
**GroupDocs.Signature** also provides an abilityto obtain extended information of document form fields and existing signatures.  
To learn more about please refer to the following guides:
[Obtain document form fields and signatures information]({{< ref "signature/net/developer-guide/advanced-usage/common/obtain-document-form-fields-and-signatures-information.md" >}})
{{< /alert >}}
