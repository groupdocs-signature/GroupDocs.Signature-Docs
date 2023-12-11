---
id: sign-vba-macroses-with-digital-signature
url: signature/net/sign-vba-macroses-with-digital-signature
title: Sign VBA macroses with Digital signature
linkTitle: ✎ Signing VBA macroses
weight: 2
description: "This article explains how to e-sign VBA macros in the excel document using .Net C# with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) class to specify different amount of settings for Digital signature
* Class [DigitalVBA](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/digitalvba/) allows to configure certificate settings for macros signing

Here are the steps to add Digital signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source Excel document path as a constructor parameter.
* Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object
* Instantiate the [DigitalVBA](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/digitalvba/) object with certificatePath and password.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of  [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) to it.

This example shows how to add Digital signature to document. See [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult)

```csharp

 using (Signature signature = new Signature(excelFilePath))
{
     DigitalSignOptions signOptions = new DigitalSignOptions();
    //Add extension for signing VBA project digitally
    DigitalVBA digitalVBA = new DigitalVBA(certificatePath, password);
    //Set to true only for signing VBA project
    digitalVBA.SignOnlyVBAProject = true;
    digitalVBA.Comments = "VBA Comment";
    signOptions.Extensions.Add(digitalVBA);

    // sign document to file
    SignResult signResult = signature.Sign(outputFilePath, signOptions);
}

```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [Sign Spreadsheet document with macro support and VBA Project in it](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET/blob/master/Examples/GroupDocs.Signature.Examples.CSharp/AdvancedUsage/Sign/SignSpreadsheetsVBAProject.cs)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
