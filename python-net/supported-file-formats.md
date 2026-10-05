---
id: supported-file-formats
url: signature/python-net/supported-file-formats
title: Supported File Formats
weight: 3
description: "GroupDocs.Signature for Python via .NET supports DOCX, DOCM, DOC, DOT, DOTM, ODT, XLS, XLSX, ODS, PDF, PPT, PPTX, JPG, PNG, TIFF and many more formats."
keywords: DOCX, DOCM, DOC, DOT, DOTM, ODT, XLS, XLSX, ODS, PDF, PPT, PPTX, JPG, PNG, TIFF, Python signature formats
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
---
The following table lists the file formats that GroupDocs.Signature for Python via .NET works with, and the signature types each format supports.

{{< table-filter placeholder="Start typing to find file format" forumUrl="https://forum.groupdocs.com/c/signature/11">}}


{{< include file="/signature/python-net/_includes/supported-signature/formats-brief.md" type="page" >}}


## Get the Supported File Types in Code

`FileType.get_supported_file_types()` returns every file type that the installed version can open. To check a single file, pass its extension to `FileType.from_extension`, which returns `FileType.UNKNOWN` for an extension the library does not support:

```python
import os

from groupdocs.signature.domain import FileType

# Every file type the installed version can open
for file_type in FileType.get_supported_file_types():
    print(f"{file_type.extension}: {file_type.file_format}")

# Check whether one file is supported
extension = os.path.splitext("contract.pdf")[1]
if FileType.from_extension(extension) == FileType.UNKNOWN:
    print(f"{extension} files are not supported")
else:
    print(f"{extension} files are supported")
```

## Example: Working with Different File Formats

The same code signs every supported format; the library detects the format from the file:

```python
import os

from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions

# The same code signs every supported format
for source in ("sample.pdf", "sample.docx", "sample.xlsx"):
    name, extension = os.path.splitext(source)
    with Signature(source) as signature:
        options = TextSignOptions("John Smith")
        options.left = 100
        options.top = 100
        result = signature.sign(f"{name}_signed{extension}", options)
    print(f"{source}: {len(result.succeeded)} signature(s) added")
```
