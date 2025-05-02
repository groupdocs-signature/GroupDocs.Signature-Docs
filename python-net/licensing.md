---
id: licensing
url: signature/python-net/licensing
title: Licensing 
weight: 5
description: GroupDocs.Signature for Python via .NET free signature API version is available to evaluate the API which will be similar to licensed version but with few limitations.
keywords: free signature, license, signature, API
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

To help you quickly explore library and its features, GroupDocs.Signature provides a Free Trial and a 30-day Temporary License for evaluation, as well as various purchase plans.

Sometimes, to get familiar with the system quickly, you may want to dive into the code right away. To make this easier, GroupDocs.Signature offers a Free Trial and a 30-day Temporary License for evaluation, along with various purchase plans.

{{< alert style="info" >}}
Please note that general policies and practices guide you on evaluating, licensing, and purchasing our products. See the [Purchase Policies and FAQ](https://purchase.groupdocs.com/policies/) section for details.
{{< /alert >}}

## Free Trial or Temporary License

You can try GroupDocs.Signature without purchasing a license.

### Free Trial

The evaluation version is identical to the full version — it simply becomes fully licensed when you apply a license. Instructions for setting a license are provided in the following sections.

The evaluation version has the following limitations:
* Only the first three pages are processed.
* Documents with more than three pages are not supported.
* A trial watermark is placed at the top of each page.

### Temporary License

If you'd like to test GroupDocs.Signature without the limitations of the trial version, you can request a 30-day Temporary License. For more information, see the [Get a Temporary License](https://purchase.groupdocs.com/temporary-license) page.

## How to Set Up a License

{{< alert style="info" >}}
For information on pricing, visit the [Pricing Information](https://purchase.groupdocs.com/pricing/) page.
{{< /alert >}}

Once you’ve obtained a license, follow these instructions to set it up. 

A license should be set:
- Only once per application, and
- Before using any other GroupDocs.Signature classes.

{{< alert style="tip" >}}
Though the license can be set multiple times per application, it is recommended to set it only once, as repeated calls to the `set_license` method will use unnecessary processing time.
{{< /alert >}}

### Set Environment Variable

You can set the `GROUPDOCS_LIC_PATH` environment variable to the absolute path of the license file. GroupDocs.Signature will then read this value and apply the license.

{{< tabs "set-license-env-var">}}
{{< tab "Windows (Command Prompt)" >}}
```ps
set GROUPDOCS_LIC_PATH "C:\path\to\your\license\file.lic"
```
{{< /tab >}}
{{< tab "Windows (Powershell)" >}}
```ps
$env:GROUPDOCS_LIC_PATH="C:\path\to\your\license\file.lic"
```
{{< /tab >}}
{{< tab "macOS" >}}
```bash
export GROUPDOCS_LIC_PATH="/path/to/your/license/file.lic"
```
{{< /tab >}}
{{< /tabs >}}

### Copy License into Project Root Folder

GroupDocs.Signature can also read a license from the project’s root directory. Consider a simple Python app structure:

```Directory
📂 my-app
 ├──app.py
 ├──source.docx
 ├──groupdocs_signature_net-25.4-py3-none-*.whl
 └──GroupDocs.Signature.PythonViaNET.lic
```

When you run the application from the `my-app` folder, GroupDocs.Signature will check for files with a `.lic` extension in this folder. It will read the `GroupDocs.Signature.PythonViaNET.lic` file to apply the license.

### Set License from a File

The following code demonstrates setting a license from a file:

```python
import os
from groupdocs.signature import License

def set_license_from_file():
    # Get absolution path to license file
    license_path = os.path.abspath("./GroupDocs.Signature.PythonViaNET.lic")

    # Instantiate License and set the license
    license = License()
    license.set_license(license_path)

if __name__ == "__main__":
    set_license_from_file()
```

### Set License from a Stream

This example shows how to set a license from a stream:

```python
import os
from groupdocs.signature import License

def set_license_from_stream():
    # Get absolution path to license file
    license_path = os.path.abspath("./GroupDocs.Signature.PythonViaNET.lic")

    # Create a readable steam
    with open(license_path, "rb") as license_stream:
        # Instantiate License and set the license
        # Instantiate License and set the license
        license = License()
        license.set_license(license_stream)

if __name__ == "__main__":
    set_license_from_stream()
```

### Set Metered License

A [Metered License](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/metered) is also available as an alternative to a traditional license file. It is a usage-based licensing model that may be more suitable for customers who prefer to be billed based on actual API feature usage. For more information, refer to the [Metered Licensing FAQ](https://purchase.groupdocs.com/faqs/licensing/metered).

The following sample demonstrates how to use metered licensing:

```python
from groupdocs.signature import Metered

def set_metered_license():
    # Set your public and private keys
    public_key = "******" 
    private_key = "******" 

    # Instantiate Metered and set keys
    metered = Metered()
    metered.set_metered_key(public_key, private_key)

    # Get a number of MBs processed 
    mb_processed = metered.get_consumption_quantity()
    print("MB processed: ", mb_processed)

    # Get a number of credits used
    credits_used = metered.get_consumption_credit()
    print("Credits used: ", credits_used)

if __name__ == "__main__":
    set_metered_license()
```
