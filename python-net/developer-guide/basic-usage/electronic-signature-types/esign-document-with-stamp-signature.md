---
id: esign-document-with-stamp-signature
url: signature/python-net/esign-document-with-stamp-signature
title:  eSign Document with Stamp Signature
linktitle: ✍️ Stamp Signature
weight: 8
description: "This article explains how to sign a document electronically with generated Stamp signatures by GroupDocs.Signature for Python via .NET API."
keywords: sign document electronically, Stamp signatures, python stamp signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Signing documents with stamps in Python    
        description: Sign documents with generated stamps and Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to sign any documents with stamps using Python 
        description: Learn all about signing a document by using stamps and Python
        steps:
        - name: Load file which is planned to be signed
          text: Create the Signature object by passing the file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide new StampSignOptions class instance and fill all demanded data.
        - name: Sign source file with just painted stamp and save result 
          text: Invoke the Sign method with signing options and output file path or stream.
---
## What is a Stamp Signature?

A **stamp** signature is a special type of electronic signature that has the visual appearance of a round seal and its visual parameters can be set programmatically.
Every stamp signature can have multiple "stamp lines" with custom text and different line thicknesses, colors, font weights and sizes. Here is an example of how a stamp signature created with [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) may look like:

![Stamp](/signature/python-net/images/esign-document-with-stamp-signature.png)

GroupDocs.Signature provides the [StampSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/stampsignoptions) class to specify different options for Stamp signature:

* Stamp type - Round or Square;
* Height and width in pixels;
* Alignment and position within the document page;
* and many more.

Each Stamp option contains inner and outer lines. Inner lines represent horizontal lines of text inside the stamp, while outer lines represent circles (or rectangles based on stamp type) around the stamp with their own text, border settings, background etc.

Here are the steps to add a Stamp signature to a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [StampSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/stampsignoptions) object according to your requirements and specify appropriate options.
* Call the [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [StampSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/stampsignoptions) to it.

## How to eSign Document with Stamp Signature

This example shows how to add a Stamp signature to a document using Python:

{{< tabs "sign_with_stamp_signature" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import StampSignOptions
from groupdocs.signature.domain import StampLine
from groupdocs.pydrawing import Color


def sign_with_stamp_signature():
    with Signature("sample.docx") as signature:
        # Create stamp signature options
        options = StampSignOptions()

        # Set stamp position and size
        options.left = 380
        options.top = 520
        options.width = 160
        options.height = 160

        # Outer line: a ring of text around the stamp
        outer_line = StampLine()
        outer_line.text = " * European Union * European Union  * European Union  *"
        outer_line.font.size = 12
        outer_line.height = 22
        outer_line.text_bottom_intent = 6
        outer_line.text_color = Color.white_smoke
        outer_line.background_color = Color.dark_slate_blue
        options.outer_lines.append(outer_line)

        # Inner line: a horizontal line of text inside the ring
        inner_line = StampLine()
        inner_line.text = "John"
        inner_line.text_color = Color.medium_violet_red
        inner_line.font.size = 20
        inner_line.font.bold = True
        inner_line.height = 40
        options.inner_lines.append(inner_line)

        # Sign the document and save the result
        result = signature.sign("signed_stamp.docx", options)
        print(f"Signed with {len(result.succeeded)} stamp signature(s)")


if __name__ == "__main__":
    sign_with_stamp_signature()
```
{{< /tab >}}
{{< tab "sample.docx" >}}
{{< tab-text >}}
`sample.docx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-stamp-signature/sample.docx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_stamp.docx" >}}  
```text
Binary file (DOCX, 55 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-stamp-signature/sign_with_stamp_signature/signed_stamp.docx)
{{< /tab >}}
{{< /tabs >}}

### Advanced Stamp Signature Options

Here's an example showing how to create a more complex stamp signature with multiple lines and custom styling. It draws a square stamp instead of the default round one, and repeats the text of each outer line to fill the whole frame:

{{< tabs "sign_with_stamp_signature_advanced" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import StampSignOptions
from groupdocs.signature.domain import StampLine, StampTextRepeatType, StampTypes
from groupdocs.pydrawing import Color


def create_stamp_line(text, font_size, height, text_color):
    line = StampLine()
    line.text = text
    line.font.size = font_size
    line.font.bold = True
    line.height = height
    line.text_color = text_color
    return line


def sign_with_stamp_signature_advanced():
    with Signature("sample.docx") as signature:
        options = StampSignOptions()

        # Set stamp position, size and type
        options.left = 340
        options.top = 480
        options.width = 220
        options.height = 160
        options.stamp_type = StampTypes.SQUARE

        # Two outer lines: frames of repeated text around the stamp
        for text, font_size, height in ((" APPROVED *", 11, 22), (" 2026 *", 9, 18)):
            line = create_stamp_line(text, font_size, height, Color.white)
            line.background_color = Color.dark_blue
            line.text_bottom_intent = 4
            line.text_repeat_type = StampTextRepeatType.FULL_TEXT_REPEAT
            options.outer_lines.append(line)

        # Two inner lines of text in the middle of the stamp
        options.inner_lines.append(create_stamp_line("John Smith", 16, 32, Color.dark_blue))
        options.inner_lines.append(create_stamp_line("CEO", 12, 24, Color.dark_blue))

        result = signature.sign("signed_stamp_advanced.docx", options)
        print(f"Signed with {len(result.succeeded)} stamp signature(s)")


if __name__ == "__main__":
    sign_with_stamp_signature_advanced()
```
{{< /tab >}}
{{< tab "sample.docx" >}}
{{< tab-text >}}
`sample.docx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-stamp-signature/sample.docx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_stamp_advanced.docx" >}}  
```text
Binary file (DOCX, 62 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-stamp-signature/sign_with_stamp_signature_advanced/signed_stamp_advanced.docx)
{{< /tab >}}
{{< /tabs >}}

### Summary
This guide explains how to apply stamp-based signatures to documents using [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net). It covers the process of creating a stamp signature, customizing its appearance, and positioning it on the document. The signed document can then be saved with the stamp signature applied.


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.