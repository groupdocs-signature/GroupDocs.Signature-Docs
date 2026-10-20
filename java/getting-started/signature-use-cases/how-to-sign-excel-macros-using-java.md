---
id: how-to-sign-excel-macros-using-java
url: signature/java/how-to-sign-excel-macros-using-java
title: How to sign Excel spreadsheets and their macros using Java
weight: 4
description: "This guide describes how to sign Excel workbooks and/or macros in them using Java. Sign your spreadsheets with digital certificate using GroupDocs.Signature for Java API by GroupDocs."
keywords: Sign spreadsheets in Java, Sign workbooks in Java, Sign VBA macros with digital certificate in Java, Sign Excel document with digital certificate in Java
productName: GroupDocs.Signature for Java
toc: True
---

You can sign spreadsheets, as well as, Visual Basic for Applications (VBA) macro embedded into spreadsheets with digital certificates. Signing a workbook confirms the identity of the signer and the validity of the content. This enhances security and authentication. Modifying a signed spreadsheet invalidates the signature. When opening a signed workbook, other users could be sure that it came from a reliable source and no one has modified it since. 

## Obtaining a digital certificate

A digital certificate is a cryptographic key pair that consists of a public key and a private key, issued by a trusted third party known as a Certificate Authority (CA). There are many commercial third-party certificate authorities from which you can either purchase a digital certificate or obtain a free digital certificate. Many institutions, governments, and corporations can also issue their own certificates.

You can create your own digital certificate for personal use or testing purposes with the SelfCert.exe tool that is provided with Microsoft Office, or with the `keytool` utility of the JDK (`keytool -genkeypair -keyalg RSA -storetype PKCS12 ...`). However, such a certificate is not authenticated by a Certificate Authority (CA).

In this article, we will use a self-created test certificate.

![Test certificate](/signature/java/images/signature-use-cases/how-to-sign-excel-macros-using-java/MrSmithSignature.png)

Keep in mind that for production environments, you should obtain a certificate from a trusted CA to ensure secure and trusted communication.

## What Excel files could be signed?

You can sign the following files and projects:
  * workbooks (XLSX),
  * templates (XLTX),
  * macro-enabled workbooks (XLSM),
  * macro-enabled templates (XLTM),
  * VBA macro projects within workbooks or templates.

## Signing spreadsheets with digital certificates in Java

To sign the content of a particular spreadsheet or template:

* Instantiate the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class providing a path to the source document or document stream.
* Create the [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) object instance providing a path to the certificate. Specify the certificate password using the `setPassword` method.
* Invoke the `sign` method to process the document, providing the output file path and sign options.

```java
import com.groupdocs.signature.Signature;
import com.groupdocs.signature.options.sign.DigitalSignOptions;

import java.io.File;

String filePath = "C:\\sample.xlsx"; // NOTE: Put here actual path for your document and certificate
String certificatePath = "C:\\MrSmithSignature.pfx";
String password = "1234567890";
String fileName = new File(filePath).getName();
String outputFilePath = new File("C:\\output", fileName).getPath();

// Sign a spreadsheet
Signature signature = new Signature(filePath);
try {
    // Setup digital signature options
    DigitalSignOptions signOptions = new DigitalSignOptions(certificatePath);
    signOptions.getSignature().setComments("Test Signature");
    signOptions.setPassword(password);

    signature.sign(outputFilePath, signOptions);
} finally {
    signature.dispose();
}
```

A spreadsheet signed with a digital certificate would look like below:

![Signed workbook](/signature/java/images/signature-use-cases/how-to-sign-excel-macros-using-java/signed-workbook.png)

## Signing macro projects within spreadsheets with digital certificates in Java

You can sign just the macros embedded into the spreadsheet, or sign both the spreadsheet's content and macros.

To sign only the macros:

* Instantiate the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class providing a path to the source document or document stream.
* Create the [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) object instance.
* Create the [DigitalVBA](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.signoptions/digitalvba/) object instance providing certificate path and password as constructor parameters.
* Call `setSignOnlyVBAProject(true)`.
* Add the `DigitalVBA` object instance to the list returned by the `getExtensions` method of the sign options.
* Invoke the `sign` method to process the document, providing the output file path and sign options.

```java
import com.groupdocs.signature.Signature;
import com.groupdocs.signature.domain.extensions.signoptions.DigitalVBA;
import com.groupdocs.signature.options.sign.DigitalSignOptions;

import java.io.File;

String filePath = "C:\\sample.xlsm"; // NOTE: Put here actual path for your document and certificate
String certificatePath = "C:\\MrSmithSignature.pfx";
String password = "1234567890";
String fileName = new File(filePath).getName();
String outputFilePath = new File("C:\\output", fileName).getPath();

// Sign macros within the spreadsheet
Signature signature = new Signature(filePath);
try {
    // Create digital signature options without digital certificate
    DigitalSignOptions signOptions = new DigitalSignOptions();
    // Add extension for signing VBA project digitally
    DigitalVBA digitalVBA = new DigitalVBA(certificatePath, password);
    // Set to true only for signing VBA project
    digitalVBA.setSignOnlyVBAProject(true);
    digitalVBA.setComments("Signed VBA macros");
    signOptions.getExtensions().add(digitalVBA);

    signature.sign(outputFilePath, signOptions);
} finally {
    signature.dispose();
}
```

To sign both the content and macros:

* Instantiate the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class providing a path to the source document or document stream.
* Create the [DigitalSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/digitalsignoptions/) object instance providing a path to the certificate. Specify the certificate password using the `setPassword` method.
* Create the [DigitalVBA](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.signoptions/digitalvba/) object instance providing certificate path and password as constructor parameters.
* Do not call `setSignOnlyVBAProject`, or pass `false` to it.
* Add the `DigitalVBA` object instance to the list returned by the `getExtensions` method of the sign options.
* Invoke the `sign` method to process the document, providing the output file path and sign options.

```java
import com.groupdocs.signature.Signature;
import com.groupdocs.signature.domain.extensions.signoptions.DigitalVBA;
import com.groupdocs.signature.options.sign.DigitalSignOptions;

import java.io.File;

String filePath = "C:\\sample.xlsm"; // NOTE: Put here actual path for your document and certificate
String certificatePath = "C:\\MrSmithSignature.pfx";
String password = "1234567890";
String fileName = new File(filePath).getName();
String outputFilePath = new File("C:\\output", fileName).getPath();

// Sign the spreadsheet content and its macros
Signature signature = new Signature(filePath);
try {
    // Setup digital signature options
    DigitalSignOptions signOptions = new DigitalSignOptions(certificatePath);
    signOptions.getSignature().setComments("Test Signature");
    signOptions.setPassword(password);

    // Add extension for signing VBA project digitally
    DigitalVBA digitalVBA = new DigitalVBA(certificatePath, password);
    digitalVBA.setComments("Signed VBA macros");
    signOptions.getExtensions().add(digitalVBA);

    signature.sign(outputFilePath, signOptions);
} finally {
    signature.dispose();
}
```

See also [Sign VBA macros with Digital signature]({{< ref "signature/java/developer-guide/advanced-usage/signing/electronic-signatures/sign-vba-macroses-with-digital-signature.md" >}}).

## Get a Free API License

In order to use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

In this article, we learned the reasons for signing Excel spreadsheets and macros embedded into them. Using GroupDocs.Signature in Java applications significantly enhances the efficiency of these tasks.
In addition, you can use the [Digital Signature - XLSX](https://products.groupdocs.app/signature/xlsx) online application to sign your Excel files with GroupDocs.Signature for free.

Read the [documentation](https://docs.groupdocs.com/signature/java/) to learn how to use GroupDocs.Signature in your Java applications. Also, you may discuss any questions or issues at the [GroupDocs forum](https://forum.groupdocs.com/).
