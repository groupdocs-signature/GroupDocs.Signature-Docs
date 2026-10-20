---
id: sign-document-with-xades-digital-signature
url: signature/java/sign-document-with-xades-digital-signature
title: Sign document with XAdES Digital signature
weight: 15
description: " This article explains how to sign Spreadsheet document with XAdES Digital electronic signatures using advanced options with GroupDocs.Signature for Java API."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---
{{< alert style="info" >}}This feature is supported only for Spreadsheet document types{{< /alert >}}

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) class to specify different amount of settings for Digital signature, including the XAdES type set with `setXAdESType` to a value of the [XAdESType](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/xadestype/) class. This setting specifies the implementation of [XAdES format](https://en.wikipedia.org/wiki/XAdES) for Spreadsheet documents only (for now).

Here are the steps to add XAdES type signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.
* Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) object with required certificate and its password.
* Call `setXAdESType` with the value `XAdESType.XAdES`
* Call `sign` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) result to check newly created signatures if needed.

This example shows how to add Digital signature to document. See [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/)

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
