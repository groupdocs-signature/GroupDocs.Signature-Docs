---
id: esign-document-with-stamp-signature
url: signature/python-net/esign-document-with-stamp-signature
title: eSign Document with Stamp Signature
linkTitle: Stamp Signature
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
          text: Provide new FormFieldSignature class instance and fill all demanded data.
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

Each Stamp option contains inner and outer lines. Inner lines represent vertical lines inside the stamp, while outer lines represent circles (or rectangles based on stamp type) around the stamp with their own text, border settings, background etc.

Here are the steps to add a Stamp signature to a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [StampSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/stampsignoptions) object according to your requirements and specify appropriate options.
* Call the [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [StampSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/stampsignoptions) to it.

## How to eSign Document with Stamp Signature

This example shows how to add a Stamp signature to a document using Python:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import StampSignOptions
from groupdocs.signature.domain import StampLine

# Initialize signature
with signature.Signature("sample.docx") as sign:
    # Create stamp signature options
    options = StampSignOptions()
    
    # Set stamp signature position
    options.left = 100
    options.top = 100
    
    # Setup first external line of Stamp
    outer_line = StampLine()
    outer_line.text = " * European Union * European Union  * European Union  *"
    outer_line.font.font_size = 12
    outer_line.height = 22
    outer_line.text_bottom_intent = 6
    outer_line.text_color = signature.Color.WHITE_SMOKE
    outer_line.background_color = signature.Color.DARK_SLATE_BLUE
    options.outer_lines.add(outer_line)
    
    # Inner square lines - horizontal lines inside the rings
    inner_line = StampLine()
    inner_line.text = "John"
    inner_line.text_color = signature.Color.MEDIUM_VIOLET_RED
    inner_line.font.font_size = 20
    inner_line.font.bold = True
    inner_line.height = 40
    options.inner_lines.add(inner_line)
    
    # Sign document
    sign.sign("SampleSigned.docx", options)
```

### Advanced Stamp Signature Options

Here's an example showing how to create a more complex stamp signature with multiple lines and custom styling:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import StampSignOptions
from groupdocs.signature.domain import StampLine

# Initialize signature
with signature.Signature("sample.docx") as sign:
    # Create stamp signature options
    options = StampSignOptions()
    
    # Set stamp signature position and size
    options.left = 100
    options.top = 100
    options.width = 200
    options.height = 200
    
    # Set stamp type (Round or Square)
    options.stamp_type = signature.StampType.ROUND
    
    # Setup outer lines
    outer_line1 = StampLine()
    outer_line1.text = " * APPROVED * "
    outer_line1.font.font_size = 14
    outer_line1.font.bold = True
    outer_line1.height = 30
    outer_line1.text_color = signature.Color.WHITE
    outer_line1.background_color = signature.Color.DARK_BLUE
    options.outer_lines.add(outer_line1)
    
    outer_line2 = StampLine()
    outer_line2.text = " * 2024 * "
    outer_line2.font.font_size = 12
    outer_line2.height = 25
    outer_line2.text_color = signature.Color.WHITE
    outer_line2.background_color = signature.Color.DARK_BLUE
    options.outer_lines.add(outer_line2)
    
    # Setup inner lines
    inner_line1 = StampLine()
    inner_line1.text = "John Smith"
    inner_line1.font.font_size = 20
    inner_line1.font.bold = True
    inner_line1.height = 40
    inner_line1.text_color = signature.Color.DARK_BLUE
    options.inner_lines.add(inner_line1)
    
    inner_line2 = StampLine()
    inner_line2.text = "CEO"
    inner_line2.font.font_size = 16
    inner_line2.height = 30
    inner_line2.text_color = signature.Color.DARK_BLUE
    options.inner_lines.add(inner_line2)
    
    # Sign document
    sign.sign("SampleSigned.docx", options)
```

### Summary
This guide explains how to apply stamp-based signatures to documents using [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net). It covers the process of creating a stamp signature, customizing its appearance, and positioning it on the document. The signed document can then be saved with the stamp signature applied.

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