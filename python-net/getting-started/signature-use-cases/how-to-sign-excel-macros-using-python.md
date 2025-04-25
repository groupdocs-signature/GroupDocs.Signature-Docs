---
id: how-to-sign-excel-macros-using-python
url: signature/python-net/how-to-sign-excel-macros-using-python
title: How to sign Excel spreadsheets and their macros using Python
weight: 4
description: "This guide describes how to sign Excel workbooks and/or macros in them using Python. Sign your spreadsheets with digital certificate using GroupDocs.Signature Python API by GroupDocs."
keywords: Sign spreadsheets in Python, Sign workbooks in Python, Sign VBA macros with digital certificate in Python, Sign Excel document with digital certificate in Python
productName: GroupDocs.Signature for Python via .NET
toc: True
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

## Signing spreadsheets with digital certificates in Python

To sign the content of a particular spreadsheet or template:

* Instantiate the `Signature` class providing a path to the source document or document stream.
* Create the `DigitalSignOptions` object instance providing a path to the certificate. Specify the certificate password using the `password` property.
* Invoke the `sign` method to process the document, providing the output file path and sign options.

```python
import groupdocs.signature as signature
import os

# File paths
file_path = "sample.xlsx"  # NOTE: Put here actual path for your document and certificate
certificate_path = "MrSmithSignature.pfx"
password = "1234567890"
output_dir = "output"
os.makedirs(output_dir, exist_ok=True)
output_file_path = os.path.join(output_dir, os.path.basename(file_path))

# Sign a spreadsheet
signature_handler = signature.Signature(file_path)

# Setup digital signature options
sign_options = signature.DigitalSignOptions(certificate_path)
sign_options.signature.comments = "Test Signature"
sign_options.password = password

# Sign document
signature_handler.sign(output_file_path, sign_options)
```

A spreadsheet signed with a digital certificate would look like below:

![Signed workbook](/signature/net/images/signature-use-cases/how-to-sign-excel-macros-using-csharp/signed-workbook.png)

## Signing macro projects within spreadsheets with digital certificates in Python

You can sign just the macros embedded into the spreadsheet, or sign both the spreadsheet's content and macros.

To sign only the macros:

* Instantiate the `Signature` class providing a path to the source document or document stream.
* Create the `DigitalSignOptions` object instance.
* Create the `DigitalVBA` object instance providing certificate path and password as constructor parameters.
* Set the `sign_only_vba_project` property to `True`.
* Add the `DigitalVBA` object instance as a sign options extension. 
* Invoke the `sign` method to process the document, providing the output file path and sign options.

```python
import groupdocs.signature as signature
import os

# File paths
file_path = "sample.xlsm"  # NOTE: Put here actual path for your document and certificate
certificate_path = "MrSmithSignature.pfx"
password = "1234567890"
output_dir = "output"
os.makedirs(output_dir, exist_ok=True)
output_file_path = os.path.join(output_dir, os.path.basename(file_path))

# Sign macros within the spreadsheet
signature_handler = signature.Signature(file_path)

# Create digital signature options without digital certificate
sign_options = signature.DigitalSignOptions()

# Add extension for signing VBA project digitally
digital_vba = signature.DigitalVBA(certificate_path, password)
# Set to true only for signing VBA project
digital_vba.sign_only_vba_project = True
digital_vba.comments = "Signed VBA macros"
sign_options.extensions.add(digital_vba)

# Sign document
signature_handler.sign(output_file_path, sign_options)
```

To sign both the content and macros:

* Instantiate the `Signature` class providing a path to the source document or document stream.
* Create the `DigitalSignOptions` object instance providing a path to the certificate. Specify the certificate password using the `password` property.
* Create the `DigitalVBA` object instance providing certificate path and password as constructor parameters.
* Do not specify the `sign_only_vba_project` property, or set it to `False`.
* Add the `DigitalVBA` object instance as a sign options extension. 
* Invoke the `sign` method to process the document, providing the output file path and sign options.

```python
import groupdocs.signature as signature
import os

# File paths
file_path = "sample.xlsm"  # NOTE: Put here actual path for your document and certificate
certificate_path = "MrSmithSignature.pfx"
password = "1234567890"
output_dir = "output"
os.makedirs(output_dir, exist_ok=True)
output_file_path = os.path.join(output_dir, os.path.basename(file_path))

# Sign macros within the spreadsheet
signature_handler = signature.Signature(file_path)

# Setup digital signature options
sign_options = signature.DigitalSignOptions(certificate_path)
sign_options.signature.comments = "Test Signature"
sign_options.password = password
    
# Add extension for signing VBA project digitally
digital_vba = signature.DigitalVBA(certificate_path, password)
digital_vba.comments = "Signed VBA macros"
sign_options.extensions.add(digital_vba)

# Sign document
signature_handler.sign(output_file_path, sign_options)
```

## Get a Free API License

In order to use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

In this article, we learned the reasons for signing Excel spreadsheets and macros embedded into them. Using Python improves the efficiency of these tasks dramatically.
In addition, you can use the [Digital Signature - XLSX](https://products.groupdocs.app/signature/xlsx) online application to sign your Excel files with GroupDocs.Signature for free.

Read the [documentation](https://docs.groupdocs.com/signature/python-net/) to learn how to use GroupDocs.Signature in your Python applications. Also, you may discuss any questions or issues at the [GroupDocs forum](https://forum.groupdocs.com/). 