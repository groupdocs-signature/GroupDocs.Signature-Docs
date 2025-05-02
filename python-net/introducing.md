---
id: introducing
url: signature/python-net/introducing
title: Introducing GroupDocs.Signature for Python via .NET
weight: 1
description: "Introduction to GroupDocs.Signature for Python via .NET - what is it and why to use"
keywords: 
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---
# Introducing GroupDocs.Signature for Python via .NET

GroupDocs.Signature for Python via .NET helps you add electronic signatures to documents in your Python applications. It's easy to use and works with many popular document formats like PDF, Word, Excel, PowerPoint, and images.

## Why Use GroupDocs.Signature for Python?

Need to sign documents in your Python app? GroupDocs.Signature makes it simple! You can:

- Add different types of signatures to documents
- Work with over 45 file formats
- Customize how signatures look and where they appear
- Search for and verify signatures
- All this without needing other software

## Getting Started

### System Requirements

- Python 3.5 or later
- .NET Core 3.1 or later
- Works on Windows, Linux, or macOS

### Installation

```bash
pip install groupdocs-signature
```

### Quick Example: Adding a Text Signature

```python
import groupdocs_signature as gs
import groupdocs_signature.options as options

# Open a document
with gs.Signature("sample.pdf") as signature:
    # Create text signature options
    opts = options.TextSignOptions("John Smith")
    opts.page_number = 1
    opts.position_x = 100
    opts.position_y = 100
    opts.font.font_size = 14
    
    # Sign the document
    signature.sign("signed.pdf", opts)
    
print("Document signed successfully!")
```

## Signature Types You Can Add

### Text Signature
Add text with custom fonts and colors.

### Image Signature
Put images like your handwritten signature on documents.

### Digital Signature
Use secure certificate-based signatures.

### Barcode Signature
Add barcodes to your documents.

### QR Code Signature
Put QR codes containing text or links in documents.

### Stamp Signature
Add official-looking stamps to documents.

### Metadata Signature
Hide signatures in document properties.

## Supported Document Formats

GroupDocs.Signature works with many popular formats including:

- PDF files
- Word documents (DOCX, DOC)
- Excel spreadsheets (XLSX, XLS)
- PowerPoint presentations (PPTX, PPT)
- Images (JPEG, PNG, TIFF)
- And many more!