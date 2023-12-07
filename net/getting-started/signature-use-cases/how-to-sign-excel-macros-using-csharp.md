---
id: how-to-sign-excel-macros-using-csharp
url: signature/net/how-to-sign-excel-macros-using-csharp
title: How to sign Excel spreadsheets and their macros using C#
weight: 3
description: "This guide describes how to sign Excel workbooks and/or macros in them using C#. Sign your spreadsheets with digital certificate using GroupDocs.Signature .NET API by GroupDocs."
keywords: Sign spreadsheets in CSharp, Sign workbooks in CSharp, Sign VBA macros with digital certificate in CSharp, Sign Excel document with digital certificate in CSharp
productName: GroupDocs.Signature for .NET
---

You can sign spreadsheets, as well as, Visual Basic for Applications (VBA) macro embedded into spreadsheets with digital certificates. Signing a workbook confirms the identity of the signer and the validity of the content. This enhances security and authentication. Modifying a signed spreadsheet invalidates the signature. When opening a signed workbook, other users could be sure that it came from a reliable source and no one has modified it since. 

## Obtaining a digital certificate

A digital certificate is a cryptographic key pair that consists of a public key and a private key, issued by a trusted third party known as a Certificate Authority (CA). There are many commercial third-party certificate authorities from which you can either purchase a digital certificate or obtain a free digital certificate. Many institutions, governments, and corporations can also issue their own certificates.

You can create your own digital certificate for personal use or testing purposes with the SelfCert.exe tool that is provided with Microsoft Office. However, this certificate is not authenticated by a Certificate Authority (CA).

In this article, we will use a self-created test certificate.

![Test certificate](/signature/net/images/signature-use-cases/how-to-sign-excel-macros-using-csharp/MrSmithSignature.png)

Keep in mind that for production environments, you should obtain a certificate from a trusted CA to ensure secure and trusted communication.

## What Excel files could be signed?

You can sign the following files and projects:
  * workbooks (XLSX),
  * templates (XLTX),
  * macro-enabled workbooks (XLSM),
  * macro-enabled templates (XLTM),
  * VBA macro projects within workbooks or templates.

## Signing spreadsheets with digital certificates in C\#

To sign the content of a particular spreadsheet or template:

* Instantiate the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class providing a path to the source document or document stream.
* Create the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object instance providing a path to the certificate. Specify the certificate password using the `DigitalSignOptions.Password` property.
* Invoke the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method to process the document, providing the output file path and sign options.

```csharp
using GroupDocs.Signature;
using GroupDocs.Signature.Options;

string filePath = @"C:\sample.xlsx"; // NOTE: Put here actual path for your document and certificate
string certificatePath = @"C:\MrSmithSignature.pfx";
string password = "1234567890";
string fileName = Path.GetFileName(filePath);
string outputFilePath = Path.Combine(@"C:\output", fileName);

// Sign a spreadsheet
using (Signature signature = new Signature(filePath))
{
    // Setup digital signature options
    DigitalSignOptions signOptions = new DigitalSignOptions(certificatePath);
    signOptions.Signature.Comments = "Test Signature";
    signOptions.Password = password;

    signature.Sign(outputFilePath, signOptions);
}
```
A spreadsheet signed with a digital certificate would look like below:

![Signed workbook](/signature/net/images/signature-use-cases/how-to-sign-excel-macros-using-csharp/signed-workbook.png)

## Signing macro projects within spreadsheets with digital certificates in C\#

You can sign just the macros embedded into the spreadsheet, or sign both the spreadsheet's content and macros.

To sign only the macros:

* Instantiate the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class providing a path to the source document or document stream.
* Create the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object instance.
* Create the [DigitalVBA](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/digitalvba/) object instance providing certificate path and password as constructor parameters.
* Set the [SignOnlyVBAProject](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/digitalvba/signonlyvbaproject/) property to 'true'.
* Add the `DigitalVBA` object instance as a sign options extension. 
* Invoke the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method to process the document, providing the output file path and sign options.

```csharp
using GroupDocs.Signature;
using GroupDocs.Signature.Options;
using GroupDocs.Signature.Domain.Extensions;

string filePath = @"C:\sample.xlsm"; // NOTE: Put here actual path for your document and certificate
string certificatePath = @"C:\MrSmithSignature.pfx";
string password = "1234567890";
string fileName = Path.GetFileName(filePath);
string outputFilePath = Path.Combine(@"C:\output", fileName);

// Sign macros within the spreadsheet
using (Signature signature = new Signature(filePath))
{
    //Create digital signature options without digital certificate
    DigitalSignOptions signOptions = new DigitalSignOptions();
    //Add extension for signing VBA project digitally
    DigitalVBA digitalVBA = new DigitalVBA(certificatePath, password);
    //Set to true only for signing VBA project
    digitalVBA.SignOnlyVBAProject = true;
    digitalVBA.Comments = "Signed VBA macros";
    signOptions.Extensions.Add(digitalVBA);

    signature.Sign(outputFilePath, signOptions);
}
```

To sign both the content and macros:

* Instantiate the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class providing a path to the source document or document stream.
* Create the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object instance providing a path to the certificate. Specify the certificate password using the `DigitalSignOptions.Password` property.
* Create the [DigitalVBA](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/digitalvba/) object instance providing certificate path and password as constructor parameters.
* Do not specify the [SignOnlyVBAProject](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/digitalvba/signonlyvbaproject/) property, or set it to 'false'.
* Add the `DigitalVBA` object instance as a sign options extension. 
* Invoke the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method to process the document, providing the output file path and sign options.

```csharp
using GroupDocs.Signature;
using GroupDocs.Signature.Options;
using GroupDocs.Signature.Domain.Extensions;

string filePath = @"C:\sample.xlsm"; // NOTE: Put here actual path for your document and certificate
string certificatePath = @"C:\MrSmithSignature.pfx";
string password = "1234567890";
string fileName = Path.GetFileName(filePath);
string outputFilePath = Path.Combine(@"C:\output", fileName);

// Sign macros within the spreadsheet
using (Signature signature = new Signature(filePath))
{
    // Setup digital signature options
    DigitalSignOptions signOptions = new DigitalSignOptions(certificatePath);
    signOptions.Signature.Comments = "Test Signature";
    signOptions.Password = password;
        
    //Add extension for signing VBA project digitally
    DigitalVBA digitalVBA = new DigitalVBA(certificatePath, password);
    digitalVBA.Comments = "Signed VBA macros";
    signOptions.Extensions.Add(digitalVBA);

    signature.Sign(outputFilePath, signOptions);
}
```
## Get a Free API License

In order to use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

In this article, we learned the reasons for signing Excel spreadsheets and macros embedded into them. Leveraging C# within .NET applications significantly enhances the efficiency of these tasks.
In addition, you can use [Online Applications to sign your files](https://products.groupdocs.app/signature/family) from GroupDocs.Signature for free.

Moreover, it is possible to learn how to use GroupDocs.Signature in your .NET applications with [documentation](https://docs.groupdocs.com/signature/net/). Also, you may discuss any questions or issues at [Groupdocs forum](https://forum.groupdocs.com/).
