---
id: supported-file-formats
url: signature/python-net/supported-file-formats
title: Supported File Formats
weight: 3
description: "GroupDocs.Signature for Python via .NET supports DOCX, DOCM, DOC, DOT, DOTM, XLS, XLSX, PDF, PPT, JPG, PNG, HTML, EML and many more formats."
keywords: DOCX, DOCM, DOC, DOT, DOTM, XLS, XLSX, PDF, PPT, JPG, PNG, HTML, EML, Python signature formats
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
---
The following table indicates the file formats that GroupDocs.Signature for Python via .NET can work with. Here's a simple example of how to check if a file format is supported:

```python
import groupdocs.signature as signature

# Check if file format is supported
file_path = "document.pdf"
if signature.FileType.from_extension(file_path).is_supported():
    print(f"File format {file_path} is supported")
else:
    print(f"File format {file_path} is not supported")
```

{{< table-filter placeholder="Start typing to find file format" forumUrl="https://forum.groupdocs.com/c/signature/11">}}


{{< include file="/signature/python-net/_includes/supported-signature/formats-brief.md" type="page" >}}


## Example: Working with Different File Formats

Here's an example of how to work with different file formats in Python:

```python
import groupdocs.signature as signature

def sign_document(input_path, output_path, signature_type="text"):
    # Initialize signature handler
    signature_handler = signature.Signature(input_path)
    
    if signature_type == "text":
        # Create text signature options
        options = signature.TextSignOptions("John Smith")
        options.set_left(100)
        options.set_top(100)
    elif signature_type == "image":
        # Create image signature options
        options = signature.ImageSignOptions("signature.png")
        options.set_left(100)
        options.set_top(100)
    elif signature_type == "digital":
        # Create digital signature options
        options = signature.DigitalSignOptions("certificate.pfx", "password")
    
    # Sign document
    signature_handler.sign(output_path, options)
    print(f"Document signed successfully: {output_path}")

# Example usage
sign_document("document.pdf", "signed.pdf", "text")
sign_document("document.docx", "signed.docx", "image")
sign_document("document.xlsx", "signed.xlsx", "digital")
```
