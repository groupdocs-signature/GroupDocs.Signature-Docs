---
id: evaluation-limitations-and-licensing-of-groupdocs-signature
url: signature/python-net/evaluation-limitations-and-licensing-of-groupdocs-signature
title: Evaluation Limitations and Licensing of GroupDocs.Signature
weight: 5
description: "Free electronic signature API version is available to evaluate the API which will be similar as licensed but with few limitations"
keywords: electronic signature api, free electronic signature api, signature api, python signature license, python digital signature
productName: GroupDocs.Signature for Python via .NET
hideChildren: False 
toc: True
---
{{< alert style="info" >}}
You can use GroupDocs.Signature for Python via .NET without the license. The usage and functionalities are pretty much same as the licensed one but you will face few limitations while using the non-licensed API.
{{< /alert >}}

## Evaluation Limitations

You can easily install GroupDocs.Signature for Python via .NET for evaluation using pip:

```bash
pip install groupdocs-signature
```

The evaluation version is the same as the purchased version. The evaluation version simply becomes licensed when you add a few lines of code to apply the license. You will face following limitations while using the API without the license:

* Only first 2 pages are processed.
* Trial badges are placed in the document on the top of each page.

## Licensing

The license file contains details such as the product name, number of developers it is licensed to, subscription expiry date and so on. It contains the digital signature, so don't modify the file. Even inadvertent addition of an extra line break into the file will invalidate it. You need to set a license before utilizing GroupDocs.Signature API if you want to avoid its evaluation limitations.

The license can be loaded from a file or stream object. The easiest way to set a license is to put the license file in the same folder as your Python script and specify the file name, without a path, as shown in the examples below.

### Setting License from File

The code below will explain how to set product license in Python:

```python
import groupdocs.signature as signature

# Setup license
license = signature.License()
license.set_license("GroupDocs.Signature.lic")
```

### Setting License from Stream

The following example shows how to load a license from a stream in Python:

```python
import groupdocs.signature as signature

# Load license from stream
with open("GroupDocs.Signature.lic", "rb") as file_stream:
    license = signature.License()
    license.set_license(file_stream)
```

{{< alert style="info" >}}
Calling License.set_license multiple times is not harmful but simply wastes processor time. If you are developing a Python script or application, call License.set_license at the beginning of your script, before using GroupDocs.Signature classes.
When developing a web application, you can call License.set_license when the application starts. It is called once when the application starts.  
Do not call License.set_license from within request handlers since it means the license will be loaded every time a request is processed.
{{< /alert >}}

### Setting Metered License

{{< alert style="info" >}}
You can also set [Metered](https://reference.groupdocs.com/signature/net/groupdocs.signature/metered) license as an alternative to license file. It is a new licensing mechanism that will be used along with existing licensing method. It is useful for the customers who want to be billed based on the usage of the API features. For more details, please refer to [Metered Licensing FAQ](https://purchase.groupdocs.com/faqs/licensing/metered) section.
{{< /alert >}}

Here are the simple steps to use the `Metered` class in Python:

1. Create an instance of `Metered` class.
2. Pass public & private keys to `set_metered_key` method.
3. Do processing (perform task).
4. Call method `get_consumption_quantity` of the `Metered` class.
5. It will return the amount/quantity of API requests that you have consumed so far.
6. Call method `get_consumption_credit` of the `Metered` class.
7. It will return the credit that you have consumed so far.

Following is the sample code demonstrating how to use `Metered` class in Python:

```python
import groupdocs.signature as signature

# Your license keys
public_key = ""  # Your public license key
private_key = ""  # Your private license key

# Initialize metered license
metered = signature.Metered()
metered.set_metered_key(public_key, private_key)

# Get amount (MB) consumed
amount_consumed = signature.Metered.get_consumption_quantity()
print(f"Amount (MB) consumed: {amount_consumed}")

# Get count of credits consumed
credits_consumed = signature.Metered.get_consumption_credit()
print(f"Credits consumed: {credits_consumed}")
```

## License File Location

When deploying your application, you can place the license file in any folder and specify the path to the license file. However, when you're developing your application, you might want to keep the license file in your project directory. Here's a recommended structure:

```
your_project/
├── src/
│   ├── main.py
│   └── GroupDocs.Signature.lic
├── requirements.txt
└── README.md
```

And in your `main.py`, you can load the license like this:

```python
import os
import groupdocs.signature as signature

# Get the directory containing the script
script_dir = os.path.dirname(os.path.abspath(__file__))
license_path = os.path.join(script_dir, "GroupDocs.Signature.lic")

# Set the license
license = signature.License()
license.set_license(license_path)
```
