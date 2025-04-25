---
id: search-for-qr-code-e-signatures
url: signature/python-net/search-for-qr-code-e-signatures
title: How to Search for QR Code Signatures
linkTitle: 🔍 QR Codes
weight: 3
description: "This article explains how to search for QR-code electronic signatures using GroupDocs.Signature for Python via .NET API."
keywords: qr code signature search, python qr code signature, search qr code signatures
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
    application:    
        name: Search for QR-code signatures in documents using Python    
        description: Search QR-code signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to search any QR-code signatures in documents using Python 
        description: Get additional information of searching QR-code signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature object by passing file path or stream as a constructor parameter.
        - name: Get list of QR-code signatures 
          text: Call the search method providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found QR-code signatures.
---
When you search for electronic signatures of QR-Code type inside a document with [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net), you only need to pass a [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) object to the search method.

Here's a quick guide on how to search for QR-code signatures:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) object according to your requirements and specify search options.
* Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [QrCodeSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/qrcodesearchoptions) to it.

The code snippet below demonstrates how to search for QR-code signatures in a document using Python:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import QrCodeSearchOptions

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Search for signatures in document
    signatures = sign.search(signature.SignatureType.QR_CODE)
    
    print("\nSource document contains the following signatures:")
    for qr_code_signature in signatures:
        print(f"QR Code signature found at page {qr_code_signature.page_number} "
              f"with type {qr_code_signature.encode_type} and text {qr_code_signature.text}")
```

### Advanced Search Options

Here's an example showing how to use more advanced search options for QR codes:

```python
import groupdocs.signature as signature
from groupdocs.signature.options import QrCodeSearchOptions
from groupdocs.signature.domain import QrCodeTypes

# Initialize signature
with signature.Signature("sample.pdf") as sign:
    # Create search options
    search_options = QrCodeSearchOptions()
    
    # Search on specific pages
    search_options.page_number = 1
    search_options.all_pages = False
    
    # Search for specific QR code type
    search_options.encode_type = QrCodeTypes.QR
    
    # Search for specific text in QR code
    search_options.text = "John"
    
    # Search document
    signatures = sign.search(search_options)
    
    # Process found signatures
    for qr_code_signature in signatures:
        print(f"Found QR Code signature: {qr_code_signature.text}")
        print(f"Page number: {qr_code_signature.page_number}")
        print(f"Position: X={qr_code_signature.left}, Y={qr_code_signature.top}")
        print(f"Size: {qr_code_signature.width}x{qr_code_signature.height}")
        print(f"Encode type: {qr_code_signature.encode_type}")
        print(f"Error correction level: {qr_code_signature.error_correction_level}")
```

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
