---
id: sign-specific_pages_in_multipage-document
url: signature/java/sign-specific_pages_in_multipage-document
title: Signing specific pages in the multipage document
weight: 5
description: "This article explains how to sign specific pages in the multipage documents with GroupDocs.Signature for Java"
keywords: 
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---
Base signature options [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/) has the `setPagesSetup` method that takes a [PagesSetup](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options/pagessetup/) object, which allows to set up specific page numbers.

This example shows how to sign specific pages in the multipage Tiff document through the list of page numbers passed to `PagesSetup.setPageNumbers`.

```java
Signature signature = new Signature("multipage.tiff");
try
{
    QrCodeSignOptions options = new QrCodeSignOptions("Patient #36363393. R: No-Issues");
    // set signature position
    options.setLeft(10);
    options.setTop(10);
    // set signature rectangle
    options.setWidth(200);
    options.setHeight(200);
    // specify page numbers which we want to sign
    PagesSetup pagesSetup = new PagesSetup();
    pagesSetup.setPageNumbers(Arrays.asList(1, 3));
    options.setPagesSetup(pagesSetup);

    // sign document to file
    SignResult signResult = signature.sign(outputFilePath, options);
    System.out.println("Document signed with " + signResult.getSucceeded().size() + " signatures");
    System.out.println("List of newly created signatures:");
    for (BaseSignature temp : signResult.getSucceeded())
    {
        System.out.println(temp.getSignatureType() + " at page #" + temp.getPageNumber() + ": Id:" + temp.getSignatureId() + ".");
    }
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
