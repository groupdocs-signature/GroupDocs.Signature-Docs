---
id: sign-document-with-xml-advanced-electronic-signature
url: signature/java/sign-document-with-xml-advanced-electronic-signature
title: Sign document with XML Advanced Electronic Signature
weight: 16
description: " This article explains how to sign document with XML advanced electronic signatures (XAdES) using GroupDocs.Signature for Java API."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---
{{< alert style="info" >}}XML Advanced Electronic Signature feature is supported only for Spreadsheet documents{{< /alert >}}

**GroupDocs.Signature** provides [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) class to specify different amount of settings for Digital signature. One of these settings is the XAdES type, set with `setXAdESType` to a value of the [XAdESType](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/xadestype/) class

Here are the steps to add XML Advanced Electronic Signature with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.
* Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) object with required certificate and its password.
* Call `setXAdESType` with the value **XAdESType.XAdES**.
* Call `sign` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) result to check newly created signatures if needed.

## Sign Spreadsheet document with XML Advanced Electronic Signature

This example shows how to add Digital signature to document.

```java
Signature signature = new Signature("sample.xlsx");
try
{
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx");
    // set XAdES type
    options.setXAdESType(XAdESType.XAdES);
    // certificate password
    options.setPassword("1234567890");
    // digital certificate details
    options.setReason("Sign");
    options.setContact("JohnSmith");
    options.setLocation("Office1");

    SignResult signResult = signature.sign(outputFilePath, options);
    System.out.println("Source document was signed successfully with "
            + signResult.getSucceeded().size() + " signature(s). File saved at " + outputFilePath + ".");
}
finally
{
    signature.dispose();
}
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [Sign document with XML Advanced Electronic Signatures (XAdES)](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java/blob/master/Examples/src/main/java/com/groupdocs/signature/examples/advanced_usage/sign/SignWithXAdESTypes.java)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)

### Free Online Apps

Along with the full-featured Java library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
