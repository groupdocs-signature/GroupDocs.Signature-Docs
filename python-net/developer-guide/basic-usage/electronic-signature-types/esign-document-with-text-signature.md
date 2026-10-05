---
id: esign-document-with-text-signature
url: signature/python-net/esign-document-with-text-signature
title:  eSign Document with Text Signature
linktitle: ✍️ Text Signature
weight: 7
description: "This article explains how to sign a document with Text signature using GroupDocs.Signature for Python via .NET API. Learn how to add a digital signature to a PDF programmatically in Python."
keywords: Add digital signature to a PDF programmatically, Text signature, python text signature, python digital signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Documents signing with text in Python    
        description: Put text on any document with Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to sign any documents with text using Python 
        description: Learn all about signing a document by using a text and Python
        steps:
        - name: Load file which is planned to be signed
          text: Create the Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide new TextSignOptions class instance and fill all demanded data.
        - name: Put text on the source file and save the result 
          text: Invoke the Sign method with signing options and output file path or stream.
---
## What is a Text Signature?

A **Text** electronic signature is an arbitrary text that is added to a document in a native way depending on the type of the document. GroupDocs.Signature provides the text signature feature and allows customizing a wide range of text settings - from font name, size and color to alignment, borders, shadow effects etc. This is how a text signature may look like:  

![Text](/signature/python-net/images/esign-document-with-text-signature.png)

## How to eSign Document with Text Signature

Let's try to add a text signature to a PDF programmatically using Python.

To manipulate text signatures programmatically [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides the [TextSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions) class and the whole workflow is as easy as follows:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [TextSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions) object according to your requirements and specify the signature options.
* Call the [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [TextSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions) to it.

This example shows how to add a text signature to a document using Python:

{{< tabs "sign_with_text_signature" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions
from groupdocs.signature.domain import SignatureFont
from groupdocs.pydrawing import Color


def sign_with_text_signature():
    with Signature("sample.pdf") as signature:
        # Create text signature options
        options = TextSignOptions("John Smith")

        # Set signature position and size
        options.left = 100
        options.top = 400
        options.width = 200
        options.height = 50

        # Set text color and font
        options.fore_color = Color.red
        font = SignatureFont()
        font.family_name = "Arial"
        font.size = 24
        options.font = font

        # Sign the document and save the result
        result = signature.sign("signed_text.pdf", options)
        print(f"Signed with {len(result.succeeded)} text signature(s)")


if __name__ == "__main__":
    sign_with_text_signature()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-text-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_text.pdf" >}}  
```text
Binary file (PDF, 122 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-text-signature/sign_with_text_signature/signed_text.pdf)
{{< /tab >}}
{{< /tabs >}}

### Advanced Text Signature Options

You can customize the text signature further with additional options: alignment and margins, font style, background, border, rotation and transparency. When an alignment is set, it replaces the `left` or `top` coordinate, and the `margin` offsets the signature from the page edge.

{{< tabs "sign_with_text_signature_advanced" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions
from groupdocs.signature.domain import (
    Background, Border, DashStyle, HorizontalAlignment, Padding,
    SignatureFont, TextSignatureImplementation, VerticalAlignment)
from groupdocs.pydrawing import Color


def sign_with_text_signature_advanced():
    with Signature("sample.pdf") as signature:
        options = TextSignOptions("John Smith")

        # Put the signature in the bottom right corner of the page
        options.width = 220
        options.height = 60
        options.horizontal_alignment = HorizontalAlignment.RIGHT
        options.vertical_alignment = VerticalAlignment.BOTTOM
        options.margin = Padding(right=40, bottom=60)

        # Font style and text color
        font = SignatureFont()
        font.family_name = "Arial"
        font.size = 20
        font.bold = True
        font.italic = True
        options.font = font
        options.fore_color = Color.dark_blue

        # Background, border, rotation and transparency
        background = Background()
        background.color = Color.light_yellow
        options.background = background
        border = Border()
        border.color = Color.dark_blue
        border.dash_style = DashStyle.DASH
        border.weight = 2
        options.border = border
        options.rotation_angle = -10
        options.transparency = 0.2

        # Render the text as an image, which also draws the border on PDF pages
        options.signature_implementation = TextSignatureImplementation.IMAGE

        result = signature.sign("signed_text_advanced.pdf", options)
        print(f"Signed with {len(result.succeeded)} text signature(s)")


if __name__ == "__main__":
    sign_with_text_signature_advanced()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-text-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_text_advanced.pdf" >}}  
```text
Binary file (PDF, 53 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-text-signature/sign_with_text_signature_advanced/signed_text_advanced.pdf)
{{< /tab >}}
{{< /tabs >}}

### Summary
This guide explains how to add text-based signatures to documents with [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net). It covers configuring text properties such as font, color, size, and position, and applying the text signature to a document. The signed document is then saved with the added text signature.


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.