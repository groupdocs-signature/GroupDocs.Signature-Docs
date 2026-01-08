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

{{< tabs "example-1" >}}
{{< tab "Python" >}}

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSignOptions
from groupdocs.signature.domain import SignatureFont, TextSignature
import groupdocs.signature.domain as gsd
import sys 
import os

def run():
    with signature.Signature("./sample.pdf") as sign:
        # Create text signature options
        text_options = TextSignOptions("John Smith")
        
        # Set advanced options
        text_options.font = gsd.SignatureFont()
        text_options.font.size = 20
        text_options.font.family_name = "Arial"
        text_options.font.bold = True
        text_options.font.italic = True
        text_options.fore_color = gsd.Color.BLUE
        text_options.back_color = gsd.Color.WHITE
        text_options.opacity = 0.8
        text_options.rotation_angle = 45
        
        # Set text alignment
        text_options.horizontal_alignment = gsd.HorizontalAlignment.CENTER
        text_options.vertical_alignment = gsd.VerticalAlignment.CENTER
        
        # Add border
        text_options.border_color = gsd.Color.BLACK
        text_options.border_style = gsd.DashStyle.SOLID
        text_options.border_width = 2
        
        # Sign document
        sign.sign("./sample_signed.pdf", text_options)
```

{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
The following sample file is used in this example: [sample.pdf](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-text-signature/sample.pdf)
{{< /tab-text >}}
{{< /tab >}}
{{< /tabs >}}

### Advanced Text Signature Options

You can customize the text signature further with additional options:

{{< tabs "example-2" >}}
{{< tab "Python" >}}

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSignOptions
from groupdocs.signature.domain import SignatureFont, TextSignature
import groupdocs.signature.domain as gsd
import sys 
import os

def run():
    with signature.Signature("./sample.pdf") as sign:
        # Create text signature options
        text_options = TextSignOptions("John Smith")
        
        # Set advanced options
        text_options.font = gsd.SignatureFont()
        text_options.font.size = 20
        text_options.font.family_name = "Arial"
        text_options.font.bold = True
        text_options.font.italic = True
        text_options.fore_color = gsd.Color.BLUE
        text_options.back_color = gsd.Color.WHITE
        text_options.opacity = 0.8
        text_options.rotation_angle = 45
        
        # Set text alignment
        text_options.horizontal_alignment = gsd.HorizontalAlignment.CENTER
        text_options.vertical_alignment = gsd.VerticalAlignment.CENTER
        
        # Add border
        text_options.border_color = gsd.Color.BLACK
        text_options.border_style = gsd.DashStyle.SOLID
        text_options.border_width = 2
        
        # Sign document
        sign.sign("./sample_signed.pdf", text_options)
```

{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
The following sample file is used in this example: [sample.pdf](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-text-signature/sample.pdf)
{{< /tab-text >}}
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