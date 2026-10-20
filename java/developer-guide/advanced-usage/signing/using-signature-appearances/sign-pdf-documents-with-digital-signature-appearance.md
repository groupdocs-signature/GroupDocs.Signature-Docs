---
id: sign-pdf-documents-with-digital-signature-appearance
url: signature/java/sign-pdf-documents-with-digital-signature-appearance
title: Sign Pdf documents with custom digital signature appearance
weight: 4
description: " This article explains how to customize PDF digital electronic signature on document page with GroupDocs.Signature for Java."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) contains classes that implements for Pdf document special signature appearances.

Base signature options [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/) has the `setAppearance` method that accepts the instance of following class

* [PdfDigitalSignatureAppearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.appearances/pdfdigitalsignatureappearance/) class implements properties to customize digital signature appearance: labels, background and foreground colors, font family and font size.

Here are the steps to add digital signature to PDF document and customize signature appearance with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.
* Compose object of [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) object with all required properties.
* Call `setAppearance` of [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) with instance of [PdfDigitalSignatureAppearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.appearances/pdfdigitalsignatureappearance/) class
* Call `sign` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass created [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) result to check newly created signatures if needed.

## Sign Pdf document with customized appearance of digital signature

This example shows how to add electronic Digital signature to Pdf document with customized appearance. Colors are `java.awt.Color` values.

```java
// initialize Signature instance
Signature signature = new Signature("sample.pdf");
try
{
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx");
    // certificate password
    options.setPassword("1234567890");
    // digital certificate details
    options.setReason("Approved");
    options.setLocation("New York");

    // apply custom PDF signature appearance
    PdfDigitalSignatureAppearance appearance = new PdfDigitalSignatureAppearance();
    // do not show contact details
    appearance.setContactInfoLabel("");
    // simplify reason label
    appearance.setReasonLabel("?");
    // change location label
    appearance.setLocationLabel("From");
    appearance.setDigitalSignedLabel("By");
    appearance.setDateSignedAtLabel("On");
    // apply custom appearance color
    appearance.setBackground(Color.RED);
    options.setAppearance(appearance);

    options.setAllPages(true);
    options.setWidth(160);
    options.setHeight(80);

    // setup signature border
    Border border = new Border();
    border.setVisible(true);
    border.setColor(Color.RED);
    border.setDashStyle(DashStyle.DashDot);
    border.setWeight(2);
    options.setBorder(border);

    SignResult signResult = signature.sign("signed.pdf", options);
}
finally
{
    signature.dispose();
}
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [Sign PDF document with custom digital signature appearance](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java/blob/master/Examples/src/main/java/com/groupdocs/signature/examples/advanced_usage/sign/sign_with_digital_advanced/SignWithDigitalAdvancedPdfAppearance.java)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)

### Free Online Apps

Along with the full-featured Java library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
