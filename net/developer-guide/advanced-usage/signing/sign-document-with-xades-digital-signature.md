---
id: sign-document-with-xades-digital-signature
url: signature/net/sign-document-with-xades-digital-signature
title: Sign document with XAdES Digital signature
weight: 15
description: " This article explains how to sign Spreadsheet document with XAdES Digital electronic signatures using advanced options with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This feature is supported only for Spreadsheet document types{{< /alert >}}

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [DigitalSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/digitalsignoptions) class to specify different amount of settings for Digital signature same as property XAdES of [XAdES](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain/xadestype) enumeration type. This property specifies the implementation of [XAdES format](https://en.wikipedia.org/wiki/XAdES) for Spreadsheet documents only (for now).

Here are the steps to add XAdES type signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [DigitalSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/digitalsignoptions) object with required certificate and its password.
* Set property [XAdESType](https://apireference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/properties/xadestype) to value XAdES
* Call [Sign](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/sign) method of  [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [DigitalSignOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/digitalsignoptions) to it.
* Analyze [SignResult](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to add Digital signature to document. See [SignResult](https://apireference.groupdocs.com/net/signature/groupdocs.signature.domain/signresult)

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
}
```


