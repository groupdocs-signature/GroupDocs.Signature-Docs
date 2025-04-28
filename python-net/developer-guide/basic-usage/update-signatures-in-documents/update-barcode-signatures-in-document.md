---
id: update-barcode-signatures-in-document
url: signature/python-net/update-barcode-signatures-in-document
title: Update Barcode Signatures in Document
linkTitle: ✎ Barcode
weight: 1
description: "This article explains how to update Barcode electronic signatures with GroupDocs.Signature for Python via .NET API."
keywords: python barcode signature, update barcode signature, python digital signature
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Update barcode signatures in documents using Python    
        description: Update barcode signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to update any barcode signatures in documents using Python 
        description: Get additional information of updating barcode signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature class by passing file path or stream as a constructor parameter.
        - name: Get list of barcode signatures
          text: Create BarcodeSearchOptions object and call the search method with it.
        - name: Update found signature
          text: Select one of found signatures and update its properties as needed.
        - name: Update document
          text: Call the update method passing the updated signature.
---
[**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) provides functionality to manipulate barcode signatures' location, size, and textual content.
Please note that the [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method modifies the same document that was passed to the constructor of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class.

### Here are the steps to update a Barcode signature in a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter
* Instantiate the [BarcodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/barcodesearchoptions) object with desired properties
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method to obtain a list of barcode signatures
* Select from the list the [BarcodeSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/barcodesignature) object(s) that should be updated
* Call the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) object's [update](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/update/) method and pass one or several signatures to it

This example shows how to update a Barcode signature that was found using the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import BarcodeSearchOptions

# Initialize signature
with signature.Signature("sample_signed.pdf") as sign:
    # Create search options
    options = BarcodeSearchOptions()
    
    # Search for barcode signatures in document
    signatures = sign.search(options)
    
    if len(signatures) > 0:
        # Get first barcode signature
        barcode_signature = signatures[0]
        
        # Change position
        barcode_signature.left = 100
        barcode_signature.top = 100
        
        # Update the signature
        result = sign.update(barcode_signature)
        
        if result.updated_count > 0:
            print(f"Signature with barcode '{barcode_signature.text}' was updated!")
        else:
            print("Signature was not updated in the document!")
```

<!-- ### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/python-net/developer-guide/advanced-usage/_index.md" >}}). -->
## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [Document Signature for Python Web API Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Web-API)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To generate barcodes and/or sign your files with barcodes for free, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.