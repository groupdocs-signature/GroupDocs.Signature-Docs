---
id: esign-document-with-text-signature
url: signature/python-net/esign-document-with-text-signature
title: eSign Document with Text Signature
linkTitle: Text Signature
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

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSignOptions
from groupdocs.signature.domain import SignatureFont

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create text signature options
    text_options = TextSignOptions("John Smith")
    
    # Set signature position
    text_options.left = 100
    text_options.top = 100
    
    # Set signature rectangle
    text_options.width = 100
    text_options.height = 30
    
    # Set text color and font
    text_options.font = SignatureFont(size=12, family_name="Comic Sans MS")
    text_options.fore_color = signature.Color.RED
    
    # Sign document to file
    sign.sign("sample_signed.pdf", text_options)
```

### Advanced Text Signature Options

You can customize the text signature further with additional options:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import TextSignOptions
from groupdocs.signature.domain import SignatureFont, TextSignature

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create text signature options
    text_options = TextSignOptions("John Smith")
    
    # Set advanced options
    text_options.font = SignatureFont(
        size=20,
        family_name="Arial",
        bold=True,
        italic=True
    )
    text_options.fore_color = signature.Color.BLUE
    text_options.back_color = signature.Color.WHITE
    text_options.opacity = 0.8
    text_options.rotation_angle = 45
    
    # Set text alignment
    text_options.horizontal_alignment = signature.HorizontalAlignment.CENTER
    text_options.vertical_alignment = signature.VerticalAlignment.CENTER
    
    # Add border
    text_options.border_color = signature.Color.BLACK
    text_options.border_style = signature.DashStyle.SOLID
    text_options.border_width = 2
    
    # Sign document
    sign.sign("sample_signed.pdf", text_options)
```

### Summary
This guide explains how to add text-based signatures to documents with [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net). It covers configuring text properties such as font, color, size, and position, and applying the text signature to a document. The signed document is then saved with the added text signature.

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/python-net/developer-guide/advanced-usage/_index.md" >}}).

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [Document Signature for Python Web API Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Web-API)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.