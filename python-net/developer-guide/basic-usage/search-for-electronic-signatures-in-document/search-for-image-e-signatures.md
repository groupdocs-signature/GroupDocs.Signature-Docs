---
id: search-for-image-e-signatures
url: signature/python-net/search-for-image-e-signatures
title: Search for Image e-Signatures
linkTitle: Images
weight: 3
description: "This article explains how to search for image electronic signatures within document pages using GroupDocs.Signature for Python via .NET API."
keywords: image signature search, python image signature, search image signatures
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
structuredData:
    showOrganization: True
    application:    
        name: Search for image signatures in documents using Python    
        description: Search image signatures in various documents fast and easily with Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to search any image signatures in documents using Python 
        description: Get additional information of searching image signatures in documents with Python
        steps:
        - name: Load file which belongs to various supported file types
          text: Create an instance of the Signature object by passing file path or stream as a constructor parameter.
        - name: Get list of image signatures 
          text: Call the search method providing appropriate signature type.
        - name: Process list of found signatures
          text: Loop through list of found image signatures.
---
[GroupDocs.Signature](https://products.groupdocs.com/signature/python-net) provides the ability to search for image electronic signatures in documents. Image signatures allow you to add visual elements like logos, stamps, or handwritten signatures to your documents.

## What is an Image Signature?

An image signature is a graphical element that can be added to a document to represent a signature. It can be:
- A scanned handwritten signature
- A company logo
- A stamp or seal
- Any other graphical element used for signing

## How to Search for Image Signatures

The [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class provides the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method which allows you to search for image signatures in documents. Here's how to use it:

1. Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass the source document path as a parameter.
2. Create an instance of [ImageSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesearchoptions/) class.
3. Call the [search](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/search/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass a list with the search options to it.
4. Process the search results: the `signatures` property of the returned [SearchResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/searchresult/) holds the found [ImageSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/imagesignature/) objects.

Here's an example of how to search for image signatures in a document:

{{< tabs "search_images" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import ImageSearchOptions


def search_images():
    with Signature("signed.pdf") as signature:
        result = signature.search([ImageSearchOptions()])

        print(f"Found {len(result.signatures)} image signature(s)")
        for image in result.signatures:
            print(f"Page {image.page_number}: {image.size} bytes at ({image.left}, {image.top}), "
                  f"size {image.width}x{image.height}")


if __name__ == "__main__":
    search_images()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-image-e-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "search-images.txt" >}}  
```text
Found 1 image signature(s)
Page 1: 14552 bytes at (50, 415), size 150x50
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-image-e-signatures/search_images/search-images.txt)
{{< /tab >}}
{{< /tabs >}}

## Advanced Search Options

You can customize the search process with the properties of [ImageSearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/imagesearchoptions/):

- `min_content_size` and `max_content_size` limit the size of the image data, in bytes;
- `return_content` returns the image data in the `content` property of each found signature, and `return_content_type` converts it to the given [FileType](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/filetype/);
- `all_pages` and `page_number` search a single page instead of the whole document (page numbers start at 1).

This example saves every image signature found on the first page to a PNG file:

{{< tabs "extract_image_signatures" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import FileType
from groupdocs.signature.options import ImageSearchOptions


def extract_image_signatures():
    with Signature("signed.pdf") as signature:
        options = ImageSearchOptions()
        # Search the first page only
        options.all_pages = False
        options.page_number = 1
        # Skip images smaller than 1 KB
        options.min_content_size = 1024
        # Return the image data as PNG
        options.return_content = True
        options.return_content_type = FileType.PNG

        result = signature.search([options])

        print(f"Found {len(result.signatures)} matching image signature(s)")
        for number, image in enumerate(result.signatures, start=1):
            file_name = f"image_signature_{number}.png"
            with open(file_name, "wb") as output:
                output.write(image.content)
            print(f"Saved {file_name} ({len(image.content)} bytes)")


if __name__ == "__main__":
    extract_image_signatures()
```
{{< /tab >}}
{{< tab "signed.pdf" >}}
{{< tab-text >}}
`signed.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-image-e-signatures/signed.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "image_signature_1.png" >}}  
```text
Binary file (PNG, 14 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-image-e-signatures/extract_image_signatures/image_signature_1.png)
{{< /tab >}}
{{< /tabs >}}

## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
