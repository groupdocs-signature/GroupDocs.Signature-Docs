---
id: sign-document-with-xml-advanced-electronic-signature
url: signature/net/sign-document-with-xml-advanced-electronic-signature
title: Sign document with XML Advanced Electronic Signature
linkTitle: ✎ Advanced
weight: 16
description: " This article explains how to sign document with XML advanced electronic signatures (XAdES) using GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
hideChildren: False
---
{{< alert style="info" >}}XML Advanced Electronic Signature feature is now supported under .Net Framework only for Spreadsheet documents{{< /alert >}}

**GroupDocs.Signature** provides [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) class to specify different amount of settings for Digital signature. One of these properties is the field of enumeration type [XAdESType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/xadestype)

Here are the steps to add XML Advanced Electronic Signature with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object with required certificate and its password.
* Set property XAdESType to enumeration value **XAdESType.XAdES.**
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.

## Sign Spreadsheet document with XML Advanced Electronic Signature

This example shows how to add Digital signature to document.

```csharp
using (Signature signature = new Signature("sample.xlsx"))
{
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx")
    {
        // set XAdES type
        XAdESType = XAdESType.XAdES,
        // certificate password
        Password = "1234567890",
        // digital certificate details
        Reason = "Sign",
        Contact = "JohnSmith",
        Location = "Office1"
    };
    SignResult signResult = signature.Sign(outputFilePath, options);
    Console.WriteLine($"\nSource document was signed successfully with {signResult.Succeeded.Count} signature(s).\nFile saved at {outputFilePath}.");
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
