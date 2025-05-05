---
id: quick-start-guide
url: signature/python-net/getting-started/quick-start-guide
title: Quick Start Guide  
linkTitle: Quick Start Guide    
second_title: A simple example of how to use GroupDocs.Signature for Python via .NET
weight: 2
keywords: "hello world, example, get started"
description: "Sign files in any supported format using GroupDocs.Signature for Python via .NET to experience its simplicity and power in Python."
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

This guide provides a quick overview of how to set up and start using GroupDocs.Signature for Python via .NET. This library enables developers to sing documents various file formats (e.g., DOCX, PDF, PNG) with minimal configuration.

## Prerequisites

To proceed, make sure you have:

1. **Configured** environment as described in the [System Requirements]({{< ref "signature/python-net/system-requirements" >}}) topic.
2. **Optionally** you may [Get a Temporary License](https://purchase.groupdocs.com/temporary-license/) to test all the product features. 

## Set Up Your Development Environment

For best practices, use a virtual environment to manage dependencies in Python applications. Learn more about virtual environment at [Create and Use Virtual Environments](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#create-and-use-virtual-environments) documentation topic.

### Create and Activate a Virtual Environment

Create a virtual environment:

{{< tabs "example1">}}
{{< tab "Windows" >}}
```ps
py -m venv .venv
```
{{< /tab >}}
{{< tab "macOS" >}}
```bash
python3 -m venv .venv
```
{{< /tab >}}
{{< /tabs >}}

Activate a virtual environment:

{{< tabs "example2">}}
{{< tab "Windows" >}}
```ps
.venv\Scripts\activate
```
{{< /tab >}}
{{< tab "macOS" >}}
```bash
source .venv/bin/activate
```
{{< /tab >}}
{{< /tabs >}}

### Install `groupdocs-signature-net` Package

After activating the virtual environment, run the following command in your terminal to install the latest version of the package:

{{< tabs "example3">}}
{{< tab "Windows" >}}
```ps
py -m pip install groupdocs-signature-net
```
{{< /tab >}}
{{< tab "macOS" >}}
```bash
python3 -m pip install groupdocs-signature-net
```
{{< /tab >}}
{{< /tabs >}}

Ensure the package is installed successfully. You should see the message 

```bash
Successfully installed groupdocs-signature-net-*
```

## Example 1: "Hello, word" sample

To quickly test the library, let’s sing a PDF file with text signature. You can also download the app that we're going to buid [here](/signature/python-net/_sample_files/getting-started/quick-start-guide/sign_pdf_with_text_signature.zip).

{{< tabs "sign_pdf_with_text_signature">}}
{{< tab "sign_pdf.py" >}}  
```python
import groupdocs.signature as gs 
import groupdocs.signature.options as gso 
import sys 
import os

def sign_pdf_with_text_signature():
   
    license = gs.License()
    license.set_license("./GroupDocs.Signature.PythonViaNET.lic")
    
    # The path to the file.
    sample_pdf = "./sample.pdf"

    file_name = os.path.basename("./signed_sample_pdf")

    # The path to the output directory.
    output_directory = "./out"

    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    output_file_path = os.path.join(output_directory, file_name)

    # Sign document with text signature.
    with gs.Signature(sample_pdf) as signature:
        text_sign_options = gso.TextSignOptions("Hello world!")
        signature.sign(output_file_path, text_sign_options)

    print(f"\nSource document signed successfully.\nFile saved at {output_file_path}")

if __name__ == "__main__":
    sign_pdf_with_text_signature()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}  
{{< tab-text >}}
`sample.pdf` is sample file used in this example. Click [here](/signature/python-net/_sample_files/getting-started/quick-start-guide/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_sample.pdf" >}}  
{{< tab-text >}}
`signed_sample.pdf` is expected output PDF file. Click [here](/signature/python-net/_sample_files/getting-started/quick-start-guide/signed_sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< /tabs >}}

Your folder tree should look similar to the following directory structure:

```Directory
📂 demo-app
 ├──sample.pdf.py
 ├──business-plan.docx
 └──GroupDocs.Signature.lic (Optionally)
```

### Run the App

{{< tabs "run-the-app">}}
{{< tab "Windows" >}}
```ps
py hello_world.py
```
{{< /tab >}}
{{< tab "macOS" >}}
```bash
python3 hello_world.py
```
{{< /tab >}}
{{< /tabs >}}

After running the app you can deactivate virtual environment by executing `deactivate` or closing your shell.

### Explanation

- `gs.License()`: Creates a license object for the GroupDocs.Signature library.
- `license.set_license("./GroupDocs.Signature.PythonViaNET.lic")`: Applies the license to avoid evaluation limitations.
- `sample_pdf = "./sample.pdf"`: Defines the path to the input PDF document.
- `output_directory = "./out"`: Specifies the directory where the signed file will be saved.
- `os.makedirs(output_directory)`: Creates the output directory if it doesn't exist.
- `gs.Signature(sample_pdf)`: Loads the input PDF file for signing.
- `gso.TextSignOptions("Hello world!")`: Creates text signature options with the specified signature text.
- `signature.sign(output_file_path, text_sign_options)`: Applies the text signature and saves the signed PDF to the output path.
- `print(...)`: Prints a confirmation message with the path to the signed document.

## Next Steps

After completing the basics, explore additional resources to enhance your usage:
- [Supported File Formats]({{< ref "signature/python-net/supported-file-formats" >}}): Review the full list of supported file types.
- [Licensing]({{< ref "signature/python-net/licensing" >}}): Check details on licening and evaluation.
- [Technical Support]({{< ref "signature/python-net/technical-support" >}}): Contact support for assistance if you encounter issues.
