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

In this article, we will use a self-created test certificate, `certificate.pfx`, protected with the password `1234567890`.

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
* Create the [DigitalSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsignoptions/) object instance providing a path to the certificate. Specify the certificate password using the `password` property.
* Invoke the `sign` method to process the document, providing the output file path and sign options.

{{< tabs "sign_spreadsheet_with_certificate" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalSignOptions


def sign_spreadsheet_with_certificate():
    # Sign a spreadsheet
    with Signature("sample.xlsx") as signature:
        # Setup digital signature options
        sign_options = DigitalSignOptions("certificate.pfx")
        sign_options.password = "1234567890"
        sign_options.signature.comments = "Test Signature"

        # Sign document
        result = signature.sign("signed_spreadsheet.xlsx", sign_options)
        print(f"Digital signatures added: {len(result.succeeded)}")


if __name__ == "__main__":
    sign_spreadsheet_with_certificate()
```
{{< /tab >}}
{{< tab "sample.xlsx" >}}
{{< tab-text >}}
`sample.xlsx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python/sample.xlsx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_spreadsheet.xlsx" >}}  
```text
Binary file (XLSX, 45 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python/sign_spreadsheet_with_certificate/signed_spreadsheet.xlsx)
{{< /tab >}}
{{< /tabs >}}

A spreadsheet signed with a digital certificate would look like below:

![Signed workbook](/signature/net/images/signature-use-cases/how-to-sign-excel-macros-using-csharp/signed-workbook.png)

## Signing macro projects within spreadsheets with digital certificates in Python

You can sign just the macros embedded into the spreadsheet, or sign both the spreadsheet's content and macros.

To sign only the macros:

* Instantiate the `Signature` class providing a path to the source document or document stream.
* Create the `DigitalSignOptions` object instance.
* Create the [DigitalVBA](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain.extensions/digitalvba/) object instance providing certificate path and password as constructor parameters.
* Set the `sign_only_vba_project` property to `True`.
* Add the `DigitalVBA` object instance as a sign options extension with `extensions.append`. 
* Invoke the `sign` method to process the document, providing the output file path and sign options.

The macro signature is stored in the `xl/vbaProjectSignature.bin` part of the workbook package, next to the macros themselves. Searching the document for digital signatures does not report it, so the example below looks for that part to confirm the macros are signed.

{{< tabs "sign_spreadsheet_macros_only" >}}
{{< tab "Python" >}}
```python
import zipfile

from groupdocs.signature import Signature
from groupdocs.signature.domain.extensions import DigitalVBA
from groupdocs.signature.options import DigitalSignOptions


def sign_spreadsheet_macros_only():
    # Sign macros within the spreadsheet
    with Signature("sample.xlsm") as signature:
        # Create digital signature options without digital certificate
        sign_options = DigitalSignOptions()

        # Add extension for signing VBA project digitally
        digital_vba = DigitalVBA("certificate.pfx", "1234567890")
        # Set to True only for signing VBA project
        digital_vba.sign_only_vba_project = True
        digital_vba.comments = "Signed VBA macros"
        sign_options.extensions.append(digital_vba)

        # Sign document
        result = signature.sign("signed_macros.xlsm", sign_options)
        print(f"Signatures added: {len(result.succeeded)}")

    # The VBA project signature is a separate part of the package
    with zipfile.ZipFile("signed_macros.xlsm") as package:
        print("VBA project signed:", "xl/vbaProjectSignature.bin" in package.namelist())


if __name__ == "__main__":
    sign_spreadsheet_macros_only()
```
{{< /tab >}}
{{< tab "sample.xlsm" >}}
{{< tab-text >}}
`sample.xlsm` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python/sample.xlsm) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_macros.xlsm" >}}  
```text
Binary file (XLSM, 94 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python/sign_spreadsheet_macros_only/signed_macros.xlsm)
{{< /tab >}}
{{< /tabs >}}

To sign both the content and macros:

* Instantiate the `Signature` class providing a path to the source document or document stream.
* Create the `DigitalSignOptions` object instance providing a path to the certificate. Specify the certificate password using the `password` property.
* Create the `DigitalVBA` object instance providing certificate path and password as constructor parameters.
* Do not specify the `sign_only_vba_project` property, or set it to `False`.
* Add the `DigitalVBA` object instance as a sign options extension with `extensions.append`. 
* Invoke the `sign` method to process the document, providing the output file path and sign options.

The workbook signature is found by a search for digital signatures, while the macro signature again shows up as the `xl/vbaProjectSignature.bin` part.

{{< tabs "sign_spreadsheet_and_macros" >}}
{{< tab "Python" >}}
```python
import zipfile

from groupdocs.signature import Signature
from groupdocs.signature.domain.extensions import DigitalVBA
from groupdocs.signature.options import DigitalSearchOptions, DigitalSignOptions


def sign_spreadsheet_and_macros():
    # Sign the spreadsheet and the macros within it
    with Signature("sample.xlsm") as signature:
        # Setup digital signature options
        sign_options = DigitalSignOptions("certificate.pfx")
        sign_options.password = "1234567890"
        sign_options.signature.comments = "Test Signature"

        # Add extension for signing VBA project digitally
        digital_vba = DigitalVBA("certificate.pfx", "1234567890")
        digital_vba.comments = "Signed VBA macros"
        sign_options.extensions.append(digital_vba)

        # Sign document
        signature.sign("signed_spreadsheet_and_macros.xlsm", sign_options)

    with Signature("signed_spreadsheet_and_macros.xlsm") as signed:
        found = signed.search([DigitalSearchOptions()]).signatures
        print(f"Workbook signatures found: {len(found)}")
    with zipfile.ZipFile("signed_spreadsheet_and_macros.xlsm") as package:
        print("VBA project signed:", "xl/vbaProjectSignature.bin" in package.namelist())


if __name__ == "__main__":
    sign_spreadsheet_and_macros()
```
{{< /tab >}}
{{< tab "sample.xlsm" >}}
{{< tab-text >}}
`sample.xlsm` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python/sample.xlsm) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "certificate.pfx" >}}
{{< tab-text >}}
`certificate.pfx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python/certificate.pfx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_spreadsheet_and_macros.xlsm" >}}  
```text
Binary file (XLSM, 99 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/signature-use-cases/how-to-sign-excel-macros-using-python/sign_spreadsheet_and_macros/signed_spreadsheet_and_macros.xlsm)
{{< /tab >}}
{{< /tabs >}}

## Get a Free API License

In order to use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

In this article, we learned the reasons for signing Excel spreadsheets and macros embedded into them. Using Python improves the efficiency of these tasks dramatically.
In addition, you can use the [Digital Signature - XLSX](https://products.groupdocs.app/signature/xlsx) online application to sign your Excel files with GroupDocs.Signature for free.

Read the [documentation](https://docs.groupdocs.com/signature/python-net/) to learn how to use GroupDocs.Signature in your Python applications. Also, you may discuss any questions or issues at the [GroupDocs forum](https://forum.groupdocs.com/). 