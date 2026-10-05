---
id: delete-text-signatures-from-documents
url: signature/python-net/delete-text-signatures-from-documents
title: Delete Text signatures from documents
linkTitle: ❌ Text
weight: 4
description: "This article explains how to delete Text electronic signatures with GroupDocs.Signature API."
keywords: delete Text electronic signatures, how to delete Text electronic signatures
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove Text from documents in Python    
        description: Delete Text presented in documents in convenient way with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to clear any documents from text using Python 
        description: Information about removing text from documents by Python
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of text presented in document 
          text: Create an instance of TextSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found text and save result 
          text: Invoke the delete method passing the found text signature. The document opened by the Signature object is changed in place.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [TextSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignature) class to manipulate text signatures and delete them from the documents over [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class, so the example below copies the signed document first and deletes the signature from the copy.

## How to delete Text signature from the document
Here are the steps to delete Text signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [TextSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsearchoptions) object with desired properties;
* Call [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method; the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found [TextSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignature) objects;
* Select from list [TextSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it; for a single signature it returns `True` when the signature was deleted.

This example shows how to delete Text signature that was found using [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

{{< tabs "delete_text_signature" >}}
{{< tab "Python" >}}
```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import TextSearchOptions


def delete_text_signature():
    # delete() saves the changes into the opened document, so work on a copy
    shutil.copy("signed.docx", "text_signature_deleted.docx")

    with Signature("text_signature_deleted.docx") as signature:
        options = TextSearchOptions()
        # Return only signatures added by GroupDocs.Signature, not the document's own text
        options.skip_external = True
        signatures = signature.search([options]).signatures
        print(f"Found {len(signatures)} text signature(s)")
        if not signatures:
            return

        text_signature = signatures[0]
        if signature.delete(text_signature):
            print(f"Deleted text signature '{text_signature.text}' at "
                  f"({text_signature.left}, {text_signature.top})")
        else:
            print(f"Text signature '{text_signature.text}' was not deleted")


if __name__ == "__main__":
    delete_text_signature()
```
{{< /tab >}}
{{< tab "signed.docx" >}}
{{< tab-text >}}
`signed.docx` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-text-signatures-from-documents/signed.docx) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "text_signature_deleted.docx" >}}  
```text
Binary file (DOCX, 147 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-text-signatures-from-documents/delete_text_signature/text_signature_deleted.docx)
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.