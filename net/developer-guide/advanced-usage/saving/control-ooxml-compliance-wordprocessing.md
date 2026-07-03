---
id: control-ooxml-compliance-wordprocessing
url: signature/net/control-ooxml-compliance-wordprocessing
title: How to control OOXML compliance for WordProcessing documents
weight: 4
description: "This article explains how to preserve or override the OOXML compliance level (ECMA-376, ISO/IEC 29500 Transitional, ISO/IEC 29500 Strict) when saving signed WordProcessing documents."
keywords: OOXML compliance, ECMA-376, ISO 29500, Transitional, Strict, DOCX, DOCM, DOTX, DOTM
productName: GroupDocs.Signature for .NET
toc: True
structuredData:
    showOrganization: True
    application:
        name: Control OOXML compliance for WordProcessing documents using C#
        description: This article explains how to preserve or override the OOXML compliance level of signed WordProcessing documents using C# and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net
    showVideo: True
    howTo:
        name: How to control OOXML compliance for WordProcessing documents using C#
        description: This article explains how to preserve or override the OOXML compliance level of a signed WordProcessing document using C#
        steps:
        - name: Load document for signing from the local file or stream.
          text: Create a Signature class instance by passing either local or network file path or stream.
        - name: Provide signature options together with WordProcessingSaveOptions.
          text: Instantiate WordProcessingSaveOptions and set the nullable OoxmlCompliance property to Ecma, Transitional, or Strict to override the source compliance, or leave it null to keep the loaded document's compliance.
        - name: Run signing process and retrieve output document.
          text: Call the Sign method passing the signature options and the WordProcessingSaveOptions.
        - name: Obtain signed document with the required OOXML compliance level.
          text: Get the signed document saved in the requested OOXML compliance level.
---
Some downstream OOXML tooling supports only specific compliance levels. For example, [Docx4j](https://github.com/plutext/docx4j/issues/321) does not read ISO/IEC 29500:2008 Strict output, so consumers that rely on such libraries need the signed document produced in Transitional (or ECMA-376) form instead.

Starting with GroupDocs.Signature for .NET 26.6, the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class preserves the OOXML compliance level of the source WordProcessing document on save, and lets you override it through [WordProcessingSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/wordprocessingsaveoptions/).

## How OOXML compliance is handled

* The source `OoxmlCompliance` value is detected when the document is loaded and preserved on save by default.
* [WordProcessingSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/wordprocessingsaveoptions/) exposes a nullable `OoxmlCompliance` property.
  * `null` (default) — keep the loaded document's compliance.
  * set — override the source value with the specified compliance level.
* Only honoured for OOXML output formats: `Docx`, `Docm`, `Dotx`, `Dotm` and their `FlatOpc` variants.

## Supported compliance levels

The `OoxmlCompliance` enum defines the levels you can request on save:

```csharp
public enum OoxmlCompliance
{
    /// <summary>Specifies ECMA-376 compliance level.</summary>
    Ecma,
    /// <summary>Specifies ISO/IEC 29500:2008 Transitional compliance level.</summary>
    Transitional,
    /// <summary>Specifies ISO/IEC 29500:2008 Strict compliance level.</summary>
    Strict
}
```

## Steps to override OOXML compliance on save

* Create a new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required signature options (for example [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/)).
* Instantiate [WordProcessingSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/wordprocessingsaveoptions/) and set the `OoxmlCompliance` property to the required level (`Ecma`, `Transitional`, or `Strict`).
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass signature options and `WordProcessingSaveOptions` object to it.

## Example — force ISO/IEC 29500:2008 Strict on save

```csharp
using (Signature signature = new Signature(filePath))
{
    TextSignOptions signOptions = new TextSignOptions("John Smith")
    {
        Left = 100,
        Top = 100,
        Width = 200,
        Height = 60
    };

    // Force ISO 29500:2008 Strict on save regardless of the source's compliance.
    // Other allowed values: OoxmlCompliance.Ecma, OoxmlCompliance.Transitional.
    WordProcessingSaveOptions saveOptions = new WordProcessingSaveOptions(WordProcessingSaveFileFormat.Docx)
    {
        OoxmlCompliance = OoxmlCompliance.Strict
    };

    SignResult result = signature.Sign(outputFilePath, signOptions, saveOptions);
}
```

## Example — save as Transitional for downstream compatibility

Use `OoxmlCompliance.Transitional` when the consumer of the signed document only reads ISO/IEC 29500:2008 Transitional (or ECMA-376) DOCX — for example when the file will be post-processed by a library that does not support Strict.

```csharp
using (Signature signature = new Signature(filePath))
{
    TextSignOptions signOptions = new TextSignOptions("John Smith")
    {
        Left = 100,
        Top = 100,
        Width = 200,
        Height = 60
    };

    WordProcessingSaveOptions saveOptions = new WordProcessingSaveOptions(WordProcessingSaveFileFormat.Docx)
    {
        OoxmlCompliance = OoxmlCompliance.Transitional
    };

    signature.Sign(outputFilePath, signOptions, saveOptions);
}
```

## Example — keep the source document's compliance

Leave `OoxmlCompliance` unset (or explicitly `null`) to preserve whatever compliance level the loaded document was authored in.

```csharp
using (Signature signature = new Signature(filePath))
{
    TextSignOptions signOptions = new TextSignOptions("John Smith")
    {
        Left = 100,
        Top = 100,
        Width = 200,
        Height = 60
    };

    // OoxmlCompliance not set => source compliance is preserved on save.
    WordProcessingSaveOptions saveOptions = new WordProcessingSaveOptions(WordProcessingSaveFileFormat.Docx);

    signature.Sign(outputFilePath, signOptions, saveOptions);
}
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
