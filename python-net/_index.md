---
id: home
url: signature/python-net
title: GroupDocs.Signature for Python via .NET
linkTitle: GroupDocs.Signature for Python
weight: 1
description: "Add, search, verify, update and delete electronic signatures in PDF, Word, Excel, PowerPoint, OpenDocument and image files from Python: text, image, digital, barcode, QR code, stamp, form-field and metadata signatures."
keywords: electronic signature, e-signature, digital signature, sign PDF, sign DOCX, QR code signature, barcode signature, verify signature, python, groupdocs-signature-net
productName: GroupDocs.Signature for Python via .NET
hideChildren: True
fullWidth: True
structuredData:
    showOrganization: True
---
<img src="/logo/128x128/groupdocs-signature-python.png" alt="groupdocs-signature-python-net-home" align="left" style="width:110px; margin: 0 30px 30px 0"/>

<img src="https://img.shields.io/pypi/v/groupdocs-signature-net?label=GroupDocs.Signature%20for%20Python%20PyPI" alt="PyPI package">
<img src="https://img.shields.io/pypi/dm/groupdocs-signature-net?label=pypi%20downloads" alt="PyPI downloads">

{{< button style="primary" link="https://releases.groupdocs.com/signature/python-net/release-notes/" >}} <svg class="gdoc-icon gdoc-product-doc__btn-icon"><use xlink:href="/img/groupdocs-stack.svg#document"></use></svg> Release notes {{< /button >}} 
{{< button style="primary" link="https://pypi.org/project/groupdocs-signature-net" >}} {{< icon "gdoc_download" >}} Package repository {{< /button >}}

GroupDocs.Signature for Python via .NET is an electronic signature API for Python applications. It adds text, image, digital, barcode, QR code, stamp, form-field, and metadata signatures to documents, and finds, verifies, updates, and removes the signatures a document already carries. It works the same way for every supported format and needs no Microsoft Office or Adobe Acrobat installation.

GroupDocs.Signature works with [PDF, Microsoft Word, Excel and PowerPoint, OpenDocument, and image files]({{< ref "signature/python-net/getting-started/supported-file-formats.md" >}}).

## Quick example

Install the package with `pip install groupdocs-signature-net`, then sign a PDF in a few lines:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions

# Open a document and add a text signature to its first page
with Signature("sample.pdf") as signature:
    options = TextSignOptions("John Smith")
    options.left = 100
    options.top = 100
    result = signature.sign("signed_sample.pdf", options)
    print(f"Signatures added: {len(result.succeeded)}")
```

See the [Quick Start Guide]({{< ref "signature/python-net/getting-started/quick-start-guide.md" >}}) for searching and verifying signatures.

------

{{< columns >}}
<p><b>About GroupDocs.Signature</b></p>
<hr><p>OVERVIEW</p></hr>
<ul>
    <li><a href='{{< ref "/signature/python-net/product-overview.md" >}}'>Product overview</a></li>
    <li><a href='{{< ref "/signature/python-net/getting-started/features-overview.md" >}}'>Main features</a></li>
    <li><a href='{{< ref "/signature/python-net/getting-started/supported-file-formats.md" >}}'>Supported file formats</a></li>
</ul>

<p>GET STARTED</p>
<ul>
    <li><a href='{{< ref "/signature/python-net/getting-started/system-requirements.md" >}}'>System requirements</a></li>
    <li><a href='{{< ref "/signature/python-net/getting-started/installation.md" >}}'>Installation</a></li>
    <li><a href='{{< ref "/signature/python-net/getting-started/evaluation-limitations-and-licensing.md" >}}'>Licensing</a></li>
</ul>

<--->

<p><b>Developer Guide</b></p>
<hr><p>BASIC USAGE</p></hr>
<ul>
    <li><a href='{{< ref "/signature/python-net/developer-guide/basic-usage/electronic-signature-types/_index.md" >}}'>Sign documents with different signature types</a></li>
    <li><a href='{{< ref "/signature/python-net/developer-guide/basic-usage/search-for-electronic-signatures-in-document/_index.md" >}}'>Search for signatures</a></li>
    <li><a href='{{< ref "/signature/python-net/developer-guide/basic-usage/verify-document-for-signatures/_index.md" >}}'>Verify signatures</a></li>
    <li><a href='{{< ref "/signature/python-net/developer-guide/basic-usage/update-signatures-in-documents/_index.md" >}}'>Update signatures</a></li>
    <li><a href='{{< ref "/signature/python-net/developer-guide/basic-usage/delete-signatures-from-documents/_index.md" >}}'>Delete signatures</a></li>
    <li><a href='{{< ref "/signature/python-net/developer-guide/basic-usage/generate-document-pages-preview.md" >}}'>Generate document page previews</a></li>
</ul>

<p>API REFERENCE</p>
<ul>
    <li><a href="https://reference.groupdocs.com/signature/python-net/">GroupDocs.Signature for Python via .NET API Reference</a></li>
</ul>

<--->

<p><b>Useful Resources</b></p>
<hr><p>DEMOS AND EXAMPLES</p></hr>
<ul>
    <li><a href="https://products.groupdocs.app/signature/family">Sign documents online</a></li>
    <li><a href="https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET">Download examples and demos from GitHub</a></li>
    <li><a href='{{< ref "/signature/python-net/getting-started/how-to-run-examples.md" >}}'>How to run examples</a></li>
</ul>

<p>VERSION HISTORY</p>
<ul>
    <li><a href='https://releases.groupdocs.com/signature/python-net/release-notes/'>GroupDocs.Signature for Python via .NET Release Notes</a></li>
</ul>

<p>TECHNICAL SUPPORT</p>
<ul>
    <li><a href="https://forum.groupdocs.com/c/signature">Free Support Forum for GroupDocs.Signature</a></li>
    <li><a href="https://helpdesk.groupdocs.com/">Paid Support Helpdesk for GroupDocs Products</a></li>
</ul>

{{< /columns >}}
