---
id: delete-digital-signatures-from-documents
url: signature/python-net/delete-digital-signatures-from-documents
title: Delete Digital signatures from documents
linkTitle: ❌ Digital
weight: 6
description: "This article explains how to delete Digital electronic signatures with GroupDocs.Signature API."
keywords: delete Digital electronic signatures, how to delete Digital electronic signatures
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Remove Digital signatures from documents in Python    
        description: Delete Digital signatures presented in documents in convenient way with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to clear any documents from Digital signatures using Python 
        description: Information about removing Digital signatures from documents by Python
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of Digital signatures presented in document 
          text: Create an instance of DigitalSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found Digital signatures and save result 
          text: Invoke the delete method passing the found Digital signature. The document opened by the Signature object is changed in place.
---
## Overview
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [DigitalSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/digitalsignature) class to manipulate digital signatures and delete them from the documents over [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method.  
Please be aware that [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class, so the example below copies the signed document first and deletes the signature from the copy.

*Important information*. Please be aware that digitally signed documents with valid certificates (pfx files) are secured and verified. Changing digitally signed document makes them untrusted from the digital verification perspective. At this moment only Pdf documents support deletion of the specific digital signatures in case of many ones were added. Most documents support deletion of all digital signatures at once without separate certificates removal. It's strongly recommended to delete digital signatures by the `SignatureType.DIGITAL` signature type. See the example [Delete signatures of the certain type]({{< ref "signature/python-net/developer-guide/basic-usage/delete-signatures-from-documents/delete-signatures-of-the-certain-type.md" >}}).

## How to delete Digital signature from the document
Here are the steps to delete Digital signature from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate [DigitalSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/digitalsearchoptions) object with desired properties;
* Call [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method; the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found [DigitalSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/digitalsignature) objects;
* Select from list [DigitalSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/digitalsignature) object(s) that should be removed from the document;
* Call [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object [delete](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/delete) method and pass one or several signatures to it; for a single signature it returns `True` when the signature was deleted.

This example shows how to delete Digital signature that was found using [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method.

{{< tabs "delete_digital_signature" >}}
{{< tab "Python" >}}
```python
import shutil

from groupdocs.signature import Signature
from groupdocs.signature.options import DigitalSearchOptions


def delete_digital_signature():
    # delete() saves the changes into the opened document, so work on a copy
    shutil.copy("signed.pdf", "digital_signature_deleted.pdf")

    with Signature("digital_signature_deleted.pdf") as signature:
        signatures = signature.search([DigitalSearchOptions()]).signatures
        print(f"Found {len(signatures)} digital signature(s)")
        if not signatures:
            return

        digital_signature = signatures[0]
        subject = digital_signature.certificate.subject
        if signature.delete(digital_signature):
            print(f"Deleted the digital signature of '{subject}', signed on {digital_signature.sign_time}")
        else:
            print(f"Digital signature of '{subject}' was not deleted")


if __name__ == "__main__":
    delete_digital_signature()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-digital-signatures-from-documents/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "digital_signature_deleted.pdf" >}}  
```text
Binary file (PDF, 197 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/delete-signatures-from-documents/delete-digital-signatures-from-documents/delete_digital_signature/digital_signature_deleted.pdf)
{{< /tab >}}
{{< /tabs >}}

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
