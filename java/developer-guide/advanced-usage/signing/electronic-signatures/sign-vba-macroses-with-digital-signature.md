---
id: sign-vba-macroses-with-digital-signature
url: signature/java/sign-vba-macroses-with-digital-signature
title: Sign VBA macros with Digital signature
weight: 2
description: "This article explains how to e-sign VBA macros in the Excel document using Java with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) class to specify different amount of settings for Digital signature
* Class [DigitalVBA](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.signoptions/digitalvba/) allows to configure certificate settings for macros signing

VBA projects are signed in macro-enabled spreadsheets, such as `.xlsm` files.

Here are the steps to add Digital signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source Excel document path as a constructor parameter.
* Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) object
* Instantiate the [DigitalVBA](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.signoptions/digitalvba/) object with certificate path and password, and add it to the list returned by `getExtensions()` of the options.
* Call `sign` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) to it.

This example shows how to sign only the VBA project of the document. See [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/)

```java
Signature signature = new Signature(excelFilePath);
try
{
    // create digital signature options without a digital certificate
    DigitalSignOptions signOptions = new DigitalSignOptions();
    // add extension for signing VBA project digitally
    DigitalVBA digitalVBA = new DigitalVBA(certificatePath, password);
    // set to true only for signing VBA project
    digitalVBA.setSignOnlyVBAProject(true);
    digitalVBA.setComments("VBA Comment");
    signOptions.getExtensions().add(digitalVBA);

    // sign document to file
    SignResult signResult = signature.sign(outputFilePath, signOptions);
}
finally
{
    signature.dispose();
}
```

To sign both the spreadsheet and its VBA project, create the options with the certificate and do not call `setSignOnlyVBAProject(true)`:

```java
Signature signature = new Signature(excelFilePath);
try
{
    // digital signature options for the document itself
    DigitalSignOptions signOptions = new DigitalSignOptions(certificatePath);
    signOptions.setPassword(password);
    signOptions.getSignature().setComments("Comment");

    // add extension for signing VBA project digitally
    DigitalVBA digitalVBA = new DigitalVBA(certificatePath, password);
    digitalVBA.setComments("VBA Comment");
    signOptions.getExtensions().add(digitalVBA);

    // sign document to file
    SignResult signResult = signature.sign(outputFilePath, signOptions);
}
finally
{
    signature.dispose();
}
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [Sign Spreadsheet document with macro support and VBA Project in it](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java/blob/master/Examples/src/main/java/com/groupdocs/signature/examples/advanced_usage/sign/SignSpreadsheetsVBAProject.java)

### Free Online Apps

Along with the full-featured Java library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
