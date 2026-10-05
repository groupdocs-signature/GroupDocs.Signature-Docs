---
id: update-text-signatures-in-document
url: signature/python-net/update-text-signatures-in-document
title: Update Text Signatures in Document
linkTitle: 📝 Text
weight: 4
description: "This article explains how to update Text electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python text signature, update text signature, python digital signature
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Update text signatures in documents using Python    
        description: Update text signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to update any text signatures in documents using Python 
        description: Get additional information of updating text signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature class by passing file path or stream as a constructor parameter.
        - name: Get list of text signatures
          text: Create TextSearchOptions object and call the search method with it.
        - name: Update found signature
          text: Select one of found signatures and update its properties as needed.
        - name: Update document
          text: Call the update method passing the updated signature.
---
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to manipulate text signatures' location, size, and textual content.  
Please note that the [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method modifies the same document that was passed to the constructor of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class, so the example below copies the signed document first and updates the copy.

Here are the steps to update a Text signature in a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter
* Instantiate the [TextSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsearchoptions) object with desired properties
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method; the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found text signatures
* Select from the list the [TextSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignature) object(s) that should be updated and change their properties
* Call the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object's [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method and pass one or several signatures to it; for a single signature it returns `True` when the signature was updated

This example shows how to update a Text signature that was found using the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method:

{{< tabs "update_text_signature" >}}
{{< tab "Python" >}}
```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import TextSearchOptions


def update_text_signature():
    # update() saves the changes into the opened document, so work on a copy
    shutil.copy("signed.docx", "updated_text_signature.docx")

    with Signature("updated_text_signature.docx") as signature:
        options = TextSearchOptions()
        # Return only signatures added by GroupDocs.Signature, not the document's own text
        options.skip_external = True
        signatures = signature.search([options]).signatures
        print(f"Found {len(signatures)} text signature(s)")
        if not signatures:
            return

        text_signature = signatures[0]
        old_text = text_signature.text
        # Change the text
        text_signature.text = "John Walkman"
        # Change the position
        text_signature.left = text_signature.left + 10
        text_signature.top = text_signature.top + 10
        # Change the size. Not all document formats support resizing a signature
        text_signature.width = 200
        text_signature.height = 100

        if signature.update(text_signature):
            print(f"Updated '{old_text}' to '{text_signature.text}' at "
                  f"({text_signature.left}, {text_signature.top}), "
                  f"size {text_signature.width}x{text_signature.height}")
        else:
            print(f"Text signature '{old_text}' was not updated")


if __name__ == "__main__":
    update_text_signature()
```
{{< /tab >}}
{{< tab "signed.docx" >}}
{{< tab-text >}}
`signed.docx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/update-signatures-in-documents/update-text-signatures-in-document/signed.docx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "updated_text_signature.docx" >}}  
```text
Binary file (DOCX, 147 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/update-signatures-in-documents/update-text-signatures-in-document/update_text_signature/updated_text_signature.docx)
{{< /tab >}}
{{< /tabs >}}

{{< alert style="info" >}}
Not every document format accepts every change. In PDF documents, a text signature added with the default (native) implementation can be moved, but its text and size stay as they were, although `update` still returns `True`. Text signatures added to a PDF as annotations or stickers accept text, position and size changes.
{{< /alert >}}


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.