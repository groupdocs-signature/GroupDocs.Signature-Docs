---
id: sign-document-with-ordering
url: signature/java/sign-document-with-ordering
title: Sign document with ordering the signatures
weight: 15
description: "This article shows how to create electronic signatures with specific ordering on the document page"
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**com.groupdocs.signature**](https://products.groupdocs.com/signature/java) provides with [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/) property ZOrder that expects integer values as Z-order position. The signatures with a higher number of this property will be displayed above the others.

Here are the steps to manually adjust the ordering of signatures on the document page with com.groupdocs.signature:

* Create a new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/) class and pass the source document path as a constructor parameter.
* Instantiate the [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/) object with the required options and set the ZOrder property.
* Call [sign](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#sign-java.lang.String-com.groupdocs.signature.options.sign.SignOptions-) method of  [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/) to it.

## Sign document with ordered signatures

This example adds a barcode and a QR code that overlap. The barcode has the higher `ZOrder`, so it is drawn on top.

```java
Signature signature = new Signature("sample.pdf");
try {
    // create several signatures that intersect

    // #1 barcode options: this signature is placed on top
    BarcodeSignOptions options1 = new BarcodeSignOptions("12345678");
    options1.setEncodeType(BarcodeTypes.Code128);
    options1.setLeft(100);
    options1.setTop(100);
    options1.setWidth(100);
    options1.setHeight(100);
    options1.setZOrder(2);

    // #2 QR code options: this signature is placed below
    QrCodeSignOptions options2 = new QrCodeSignOptions("12345678");
    options2.setEncodeType(QrCodeTypes.QR);
    options2.setLeft(150);
    options2.setTop(150);
    options2.setZOrder(1);

    List<SignOptions> options = new ArrayList<SignOptions>();
    options.add(options1);
    options.add(options2);

    // sign document to file
    SignResult signResult = signature.sign("signed.pdf", options);
    System.out.println("Source document signed successfully with " + signResult.getSucceeded().size() + " signature(s).");
} finally {
    signature.dispose();
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

### Free Online App

Along with full-featured Java library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
