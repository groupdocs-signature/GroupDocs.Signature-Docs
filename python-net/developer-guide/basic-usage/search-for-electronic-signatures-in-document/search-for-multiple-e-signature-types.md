---
id: search-for-multiple-e-signature-types
url: signature/python-net/search-for-multiple-e-signature-types
title: Search for Multiple e-Signature Types
weight: 9
description: "This article explains how to search for multiple types of electronic signatures within document pages using GroupDocs.Signature for Python via .NET API"
keywords: multiple signature search, python signature search, search multiple signatures
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
---
# Search for Multiple e-Signature Types

[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to search for multiple types of electronic signatures in documents simultaneously. This allows you to find different types of signatures like text, image, digital, barcode, QR code, and form field signatures in a single search operation.

## How to Search for Multiple Signature Types

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for multiple types of signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create search options for each type of signature you want to search for.
3. Call the [Search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass the search options to it.
4. Process the search results.

Here's an example of how to search for multiple types of signatures in a document:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSearchOptions, ImageSearchOptions, BarcodeSearchOptions, QrCodeSearchOptions, FormFieldSearchOptions
from groupdocs.signature.domain import TextSignature, ImageSignature, BarcodeSignature, QrCodeSignature, FormFieldSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options for different signature types
    text_options = TextSearchOptions()
    image_options = ImageSearchOptions()
    barcode_options = BarcodeSearchOptions()
    qr_code_options = QrCodeSearchOptions()
    form_field_options = FormFieldSearchOptions()
    
    # Search for signatures
    text_result = signature.search(text_options)
    image_result = signature.search(image_options)
    barcode_result = signature.search(barcode_options)
    qr_code_result = signature.search(qr_code_options)
    form_field_result = signature.search(form_field_options)
    
    # Process found signatures
    print(f"Found {len(text_result)} text signatures")
    for text_signature in text_result:
        print(f"Text: {text_signature.text}")
        print(f"Page: {text_signature.page_number}")
    
    print(f"\nFound {len(image_result)} image signatures")
    for image_signature in image_result:
        print(f"Image Size: {image_signature.width}x{image_signature.height}")
        print(f"Page: {image_signature.page_number}")
    
    print(f"\nFound {len(barcode_result)} barcode signatures")
    for barcode_signature in barcode_result:
        print(f"Barcode Type: {barcode_signature.encode_type}")
        print(f"Barcode Text: {barcode_signature.text}")
        print(f"Page: {barcode_signature.page_number}")
    
    print(f"\nFound {len(qr_code_result)} QR code signatures")
    for qr_code_signature in qr_code_result:
        print(f"QR Code Text: {qr_code_signature.text}")
        print(f"Page: {qr_code_signature.page_number}")
    
    print(f"\nFound {len(form_field_result)} form field signatures")
    for form_field_signature in form_field_result:
        print(f"Field Name: {form_field_signature.name}")
        print(f"Field Type: {form_field_signature.type}")
        print(f"Field Value: {form_field_signature.value}")
```

## Advanced Search Options

You can customize the search process for each signature type by setting specific options:

```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSearchOptions, ImageSearchOptions, BarcodeSearchOptions, QrCodeSearchOptions, FormFieldSearchOptions
from groupdocs.signature.domain import TextSignature, ImageSignature, BarcodeSignature, QrCodeSignature, FormFieldSignature

# Initialize Signature with input document
with Signature("sample.pdf") as signature:
    # Create search options for different signature types
    text_options = TextSearchOptions()
    text_options.text = "John Doe"  # Search for specific text
    
    image_options = ImageSearchOptions()
    image_options.min_content_size = 100  # Minimum image size in pixels
    
    barcode_options = BarcodeSearchOptions()
    barcode_options.encode_type = "Code128"  # Search for specific barcode type
    
    qr_code_options = QrCodeSearchOptions()
    qr_code_options.text = "https://example.com"  # Search for specific QR code text
    
    form_field_options = FormFieldSearchOptions()
    form_field_options.field_names = ["signature1", "signature2"]  # Search for specific form fields
    
    # Search for signatures
    text_result = signature.search(text_options)
    image_result = signature.search(image_options)
    barcode_result = signature.search(barcode_options)
    qr_code_result = signature.search(qr_code_options)
    form_field_result = signature.search(form_field_options)
    
    # Process found signatures
    # ... (same as above)
```

## Additional Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our examples:

* [GroupDocs.Signature for Python via .NET Examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)
* [GroupDocs.Signature for Python via .NET Plugins](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Plugins)
* [GroupDocs.Signature for Python via .NET Showcase Apps](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET-Showcase)

### Free Online Apps

Along with full Python library we provide simple but powerful free Apps.

You are welcome to search for multiple types of signatures in documents with our free online apps:

* [Search for Multiple Signature Types Online](https://products.groupdocs.app/signature/search/multiple)