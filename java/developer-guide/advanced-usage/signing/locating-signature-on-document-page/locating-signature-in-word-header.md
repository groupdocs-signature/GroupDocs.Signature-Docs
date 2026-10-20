---
id: locating-signature-in-word-header
url: signature/java/locating-signature-in-word-header
title: Locating signature in the Word header or footer
weight: 4
description: "This article explains how to locate signature in the footer and header of Word document with GroupDocs.Signature for Java."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---

A Word document offers a diverse selection of pre-designed headers and footers, providing you with options to enhance the design and layout of your document effortlessly. The header, positioned in the top margin, and the footer, located in the bottom margin, serve as integral sections of the document layout. Typically, headers and footers play host to supplementary details like page numbers, dates, author identification, and footnotes.

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides ability to locate signature in the footer and header of Word document. The [ShapePosition](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/shapeposition/) class contains the following values

* `ShapePosition.Default` - signature will be placed in the Word document body
* `ShapePosition.Header` - signature will be placed in the Word document header
* `ShapePosition.Footer` - signature will be placed in the Word document footer

The position is set with the `setShapePosition` method of [TextSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/textsignoptions/) and [ImageSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/), so it is also available for the options classes derived from them, such as barcode, QR code and stamp signature options.

Here are the steps to set signature mode with adding text into Word document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.
* Instantiate the [TextSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/textsignoptions/) and call its `setShapePosition` method
* Call `sign` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance.

## Locate Signature Area in the Word header/footer
Now, users can easily create and customize text signatures directly within the headers and footers of their Word documents.

```java
Signature signature = new Signature("sample.docx");
try
{
    List<SignOptions> listOptions = new ArrayList<SignOptions>();

    TextSignOptions headerSign = new TextSignOptions("Hello header!");
    headerSign.setShapePosition(ShapePosition.Header);

    TextSignOptions footerSign = new TextSignOptions("Hello footer!");
    footerSign.setShapePosition(ShapePosition.Footer);

    listOptions.add(headerSign);
    listOptions.add(footerSign);

    signature.sign(outputFilePath, listOptions);
}
finally
{
    signature.dispose();
}
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)

### Free Online Apps

Along with the full-featured Java library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
