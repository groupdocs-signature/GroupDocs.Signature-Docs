---
id: evaluation-limitations-and-licensing
url: signature/python-net/licensing
title: Evaluation Limitations and Licensing
linkTitle: Licensing
weight: 6
description: "GroupDocs.Signature for Python via .NET offers a Free Trial and a 30-day Temporary License for evaluation. Learn the evaluation limitations and how to apply a license from an environment variable, a file, a stream, or metered keys."
keywords: free signature, license, temporary license, evaluation, trial, metered, GROUPDOCS_LIC_PATH, signature, API
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

To help you explore the library quickly, GroupDocs.Signature offers a Free Trial and a 30-day Temporary License for evaluation, along with various purchase plans.

{{< alert style="info" >}}
General policies and practices for evaluating, licensing, and purchasing our products are described in the [Purchase Policies and FAQ](https://purchase.groupdocs.com/policies/) section.
{{< /alert >}}

## Free Trial or Temporary License

You can try GroupDocs.Signature without purchasing a license.

### Free Trial

The evaluation version is the same package as the licensed one: it becomes fully licensed when you apply a license, as described below. Without a license, the following limitations apply:

| Operation | Limitation |
| --- | --- |
| Every operation | Documents with more than two pages are not processed. Signing, searching, verifying, previewing, or reading document information raises `GroupDocsSignatureException` with the message "The number of pages cannot exceed 2 in a trial version". |
| Sign | An evaluation line ("Created with evaluation version of GroupDocs.Signature") is added to every page of the signed document. |
| Search | Found signatures report masked values. A text signature's text is replaced by the evaluation notice, and a barcode or QR code value keeps only its first six characters, followed by an evaluation notice. |
| Verify | Text, barcode, and QR code verification compares against the masked values, so it reports `is_valid` as `False` even for a document that carries the expected signature. |

### Temporary License

To test GroupDocs.Signature without these limitations, request a 30-day Temporary License. For more information, see the [Get a Temporary License](https://purchase.groupdocs.com/temporary-license) page.

## How to Set Up a License

{{< alert style="info" >}}
For information on pricing, visit the [Pricing Information](https://purchase.groupdocs.com/pricing/) page.
{{< /alert >}}

Once you have a license, apply it in one of the ways below. A license should be set:

- only once per application, and
- before you use any other GroupDocs.Signature class.

{{< alert style="tip" >}}
The license can be set more than once per application, but set it only once: each `set_license` call takes processing time.
{{< /alert >}}

### Set an Environment Variable

Set the `GROUPDOCS_LIC_PATH` environment variable to the full path of the license file. The license is then applied automatically when `groupdocs.signature` is imported, and your code needs no license call at all. The variable may also hold an HTTPS URL: the license is downloaded once and cached in the system's temporary folder.

{{< tabs "set-license-env-var">}}
{{< tab "Windows (Command Prompt)" >}}
```ps
set GROUPDOCS_LIC_PATH=C:\path\to\GroupDocs.Signature.lic
```
{{< /tab >}}
{{< tab "Windows (PowerShell)" >}}
```ps
$env:GROUPDOCS_LIC_PATH = "C:\path\to\GroupDocs.Signature.lic"
```
{{< /tab >}}
{{< tab "Linux" >}}
```bash
export GROUPDOCS_LIC_PATH="/path/to/GroupDocs.Signature.lic"
```
{{< /tab >}}
{{< tab "macOS" >}}
```bash
export GROUPDOCS_LIC_PATH="/path/to/GroupDocs.Signature.lic"
```
{{< /tab >}}
{{< /tabs >}}

{{< alert style="warning" >}}
A missing or unreadable file in `GROUPDOCS_LIC_PATH` does not raise an error, because a license problem must not break the import. The library then runs in evaluation mode. If outputs still carry the evaluation line, check the path.
{{< /alert >}}

### Set License from a File

The following code sets a license from a file:

{{< tabs "set_license_from_file">}}
{{< tab "Python" >}}
```python
import os

from groupdocs.signature import License


def set_license_from_file():
    # The license file next to the script; change the name to match yours
    license_path = os.path.abspath("GroupDocs.Signature.lic")
    if os.path.exists(license_path):
        # Apply the license once, before using any other GroupDocs.Signature API
        License().set_license(license_path)
        print("License set successfully.")
    else:
        print("License file not found; running in evaluation mode.")


if __name__ == "__main__":
    set_license_from_file()
```
{{< /tab >}}
{{< /tabs >}}

{{< alert style="warning" >}}
`set_license` raises `GroupDocsSignatureException` ("License file not found") when the file does not exist. It does not validate the file's contents, though: a damaged or wrong license file is accepted without an error, and the library stays in evaluation mode. To confirm that a license works, sign a test document and check that no evaluation line appears on its pages.
{{< /alert >}}

### Set License from a Stream

`set_license` also accepts a readable binary stream, such as an open file or an `io.BytesIO` holding the license bytes:

{{< tabs "set_license_from_stream">}}
{{< tab "Python" >}}
```python
import os

from groupdocs.signature import License


def set_license_from_stream():
    license_path = os.path.abspath("GroupDocs.Signature.lic")
    if os.path.exists(license_path):
        with open(license_path, "rb") as stream:
            License().set_license(stream)
        print("License set successfully.")
    else:
        print("License file not found; running in evaluation mode.")


if __name__ == "__main__":
    set_license_from_stream()
```
{{< /tab >}}
{{< /tabs >}}

### Set Metered License

A [Metered License](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/metered/) is an alternative to a license file. It is a usage-based licensing model that may suit customers who prefer to be billed for actual API usage. For more information, refer to the [Metered Licensing FAQ](https://purchase.groupdocs.com/faqs/licensing/metered).

To use it:

1. Create an instance of the `Metered` class.
2. Pass your public and private keys to the `set_metered_key` method.
3. Process your documents.
4. Call `Metered.get_consumption_quantity()` to get the amount of data processed so far, in megabytes.
5. Call `Metered.get_consumption_credit()` to get the number of credits consumed so far.

{{< tabs "set_metered_license">}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Metered


def set_metered_license():
    public_key = "*****"  # Your public key
    private_key = "*****"  # Your private key

    # Skip the call while the placeholder keys are still in place
    if "*" in public_key or "*" in private_key:
        print("Provide your real metered keys to activate metered licensing.")
        return

    # Activate metered (pay-as-you-go) billing for this process
    Metered().set_metered_key(public_key, private_key)
    print("Metered license set successfully.")

    # ... process your documents here ...

    print(f"MB processed: {Metered.get_consumption_quantity()}")
    print(f"Credits used: {Metered.get_consumption_credit()}")


if __name__ == "__main__":
    set_metered_license()
```
{{< /tab >}}
{{< /tabs >}}
