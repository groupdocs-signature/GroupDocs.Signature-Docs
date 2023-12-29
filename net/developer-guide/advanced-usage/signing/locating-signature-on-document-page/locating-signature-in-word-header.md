---
id: locating-signature-in-word-header
url: signature/net/locating-signature-in-word-header
title: Locating signature in the Word header or footer
weight: 4
description: "This article explains how to locate signature in the footer and header of Word document."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---

A Word document offers a diverse selection of pre-designed headers and footers, providing you with options to enhance the design and layout of your document effortlessly. The header, positioned in the top margin, and the footer, located in the bottom margin, serve as integral sections of the document layout. Typically, headers and footers play host to supplementary details like page numbers, dates, author identification, and footnotes.

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides ability to locate signature in the footer and header of Word document. Use enumeration [ShapePosition](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/shapeposition) contains following valuesks

* Default - signature will be placed in the docx document body
* Header - signature will be placed in the word document header
* Footer - signature will be placed in the word document footer

Here are the steps to set signature mode with adding text into Word document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions) and setup [ShapePosition](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/shapeposition) property
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance.

## Locate Signature Area in the Word header/footer
Now, users can easily create and customize text signatures directly within the headers and footers of their Word documents.

```csharp
    using (Signature signature = new Signature("sample.docx"))
    {
        var listOptions = new List<SignOptions>();

        var headerSign = new TextSignOptions("Hello header!")
        {
            ShapePosition = ShapePosition.Header
        };

        var footerSign = new TextSignOptions("Hello footer!")
        {
            ShapePosition = ShapePosition.Footer
        };

        listOptions.Add(headerSign);
        listOptions.Add(footerSign);

        signature.Sign(outputFilePath, listOptions);
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
