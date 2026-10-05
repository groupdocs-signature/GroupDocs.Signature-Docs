---
id: introducing
url: signature/python-net/introducing
title: Introducing GroupDocs.Signature for Python via .NET
weight: 1
description: "Introduction to GroupDocs.Signature for Python via .NET: what it is, what it can do, and how to sign your first document."
keywords: electronic signature, e-signature, python, sign pdf, digital signature, groupdocs-signature-net
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---
# Introducing GroupDocs.Signature for Python via .NET

GroupDocs.Signature for Python via .NET helps you add electronic signatures to documents in your Python applications. It is easy to use and works with many popular document formats, such as PDF, Word, Excel, PowerPoint, OpenDocument, and images.

## Why Use GroupDocs.Signature for Python?

Need to sign documents in your Python app? GroupDocs.Signature makes it simple. You can:

- Add different types of signatures to documents
- Work with over 45 file formats
- Customize how signatures look and where they appear
- Search for, verify, update, and delete existing signatures
- Render document pages and signatures to images for previews
- Do all of this without Microsoft Office, Adobe Acrobat, or any other software

## Getting Started

### System Requirements

- Python 3.5 to 3.14
- Windows (64-bit), Linux (x86-64 with glibc 2.27 or newer), or macOS 12 or newer (Intel and Apple Silicon)
- No .NET installation: the package bundles the runtime it needs. Linux and macOS need a few system packages; see [System Requirements]({{< ref "signature/python-net/system-requirements" >}}).

### Installation

```bash
pip install groupdocs-signature-net
```

See [Installation]({{< ref "signature/python-net/getting-started/installation.md" >}}) for other ways to install the package.

### Quick Example: Adding a Text Signature

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions

# Open a document
with Signature("sample.pdf") as signature:
    # Create text signature options
    options = TextSignOptions("John Smith")
    options.left = 100
    options.top = 100
    options.font.size = 14

    # Sign the document and save the result to a new file
    signature.sign("signed.pdf", options)

print("Document signed successfully!")
```

The [Quick Start Guide]({{< ref "signature/python-net/getting-started/quick-start-guide.md" >}}) walks through this example step by step.

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

### Form-Field Signature
Add signature fields and other form fields to PDF documents.

## Supported Document Formats

GroupDocs.Signature works with many popular formats, including:

- PDF files
- Word documents (DOCX, DOC)
- Excel spreadsheets (XLSX, XLS)
- PowerPoint presentations (PPTX, PPT)
- OpenDocument files (ODT, ODS, ODP)
- Images (JPEG, PNG, TIFF)
- And many more: see [Supported File Formats]({{< ref "signature/python-net/supported-file-formats" >}}).
