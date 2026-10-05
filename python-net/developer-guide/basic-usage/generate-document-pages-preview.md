---
id: generate-document-pages-preview
url: signature/python-net/generate-document-pages-preview
title: Generate document pages preview
weight: 6
description: "This topic explains how to get document pages preview as images with various options by GroupDocs.Signature for Python via .NET."
keywords: preview as images, get document pages preview as images
productName: GroupDocs.Signature for Python via .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate documents preview using Python    
        description: Getting pages previews of document pages using Python language and GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to generate previews of particular document pages with Python 
        description: Get images with pages content of various document types in Python
        steps:
        - name: Implement functions to create and release image stream for each page.
          text: We don't know how you are going to process and release images, so you need to provide create_page_stream and, optionally, release_page_stream functions. 
        - name: Load particular file with supported type.
          text: Construct Signature class instance by passing either file path or stream. 
        - name: Provide preview options. 
          text: Set type of result image in PreviewOptions instance.
        - name: Get pages images
          text: Invoke generate_preview method passing options and save page images by method from create_page_stream function.
---
## Overview

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/python-net) provides [PreviewOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/previewoptions/) class to specify different options to manage document pages preview generation process. The feature also supports archives previewing.
  
Here are the steps to generate document preview with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class and pass source document path or stream as a constructor parameter.
* Instantiate the [PreviewOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/previewoptions/) object with:
* a function that creates a stream for each page image (see [CreateDocPageStream](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/createdocpagestream/));
* image preview format - PNG / JPEG / BMP,
* page numbers to process;
* custom resolution of preview images (if needed).
{{< alert style="info" >}}
The stream returned by the create function is closed automatically as soon as the page image is written: a file is closed, and an `io.BytesIO` already holds the complete image. If you need to process each finished image or clean up resources yourself, pass a release function as an additional argument (see [ReleaseDocPageStream](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/releasedocpagestream/)).
{{< /alert >}}
* Call `generate_preview` method of [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/) class instance and pass [PreviewOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/previewoptions/) to it.

## CreatePageStream delegate implementation

GroupDocs.Signature calls the create function once for each page and writes the page image into the stream it returns: a writable file object, an `io.BytesIO`, or a .NET stream. The `page_data` argument is a [PreviewPageData](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/previewpagedata/) object with the `page_number`, the `file_name` of the document and the `preview_format`.

Page numbers are 0-based: `page_data.page_number` is `0` for the first page of the document.

```python
def create_page_stream(page_data):
    # 0-based: preview_page_0.png is the first page
    return open(f"preview_page_{page_data.page_number}.png", "wb")
```

When you preview an archive, the function is called for the pages of every document in it. Page numbers start at `0` again for each document, so use `page_data.file_name` as well when you name the images.

## ReleasePageStream delegate implementation

The release function receives the same `page_data` and the same object the create function returned. By the time it is called, the image is complete.

```python
def release_page_stream(page_data, page_stream):
    # page_stream is the object create_page_stream returned
    print(f"Image file {page_stream.name} is ready for preview")
```

## Generate document preview from file on local disk

{{< tabs "generate_document_preview" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import PreviewOptions


def create_page_stream(page_data):
    # Page numbers are 0-based: preview_page_0.png is the first page
    image_name = f"preview_page_{page_data.page_number}.png"
    print(f"Saving page {page_data.page_number + 1} to {image_name}")
    return open(image_name, "wb")


def generate_document_preview():
    with Signature("sample.pdf") as signature:
        # Create preview options object: one PNG image per page
        preview_options = PreviewOptions(create_page_stream)
        preview_options.preview_format = PreviewOptions.PreviewFormats.PNG
        # Generate preview
        signature.generate_preview(preview_options)


if __name__ == "__main__":
    generate_document_preview()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/generate-document-pages-preview/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "generate-document-preview-outputs.zip" >}}  
```text
preview_page_0.png (75 KB)
preview_page_1.png (64 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/generate-document-pages-preview/generate_document_preview/generate-document-preview-outputs.zip)
{{< /tab >}}
{{< /tabs >}}

## Generate document preview from stream with custom stream releasing delegate

This example reads the document from a stream and keeps the page images in memory: the create function returns an `io.BytesIO`, and the release function receives it filled with the complete image.

{{< tabs "generate_document_preview_from_stream" >}}
{{< tab "Python" >}}
```python
import io

from groupdocs.signature import Signature
from groupdocs.signature.options import PreviewOptions


def create_page_stream(page_data):
    # Keep each page image in memory instead of writing a file
    return io.BytesIO()


def release_page_stream(page_data, page_stream):
    # page_stream is the BytesIO returned above, already holding the whole image
    image = page_stream.getvalue()
    print(f"Page {page_data.page_number}: {len(image)} bytes of JPEG")


def generate_document_preview_from_stream():
    with open("sample.pdf", "rb") as stream:
        with Signature(stream) as signature:
            # Create preview options object with both functions
            preview_options = PreviewOptions(create_page_stream, release_page_stream)
            preview_options.preview_format = PreviewOptions.PreviewFormats.JPEG
            # Generate preview
            signature.generate_preview(preview_options)


if __name__ == "__main__":
    generate_document_preview_from_stream()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/generate-document-pages-preview/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "generate-document-preview-from-stream.txt" >}}  
```text
Page 0: 276044 bytes of JPEG
Page 1: 224194 bytes of JPEG
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/generate-document-pages-preview/generate_document_preview_from_stream/generate-document-preview-from-stream.txt)
{{< /tab >}}
{{< /tabs >}}

## Generate preview of particular pages

Set `page_numbers` to preview only some pages. The numbers are 0-based, so `[1]` selects the second page.

{{< tabs "generate_document_preview_of_selected_pages" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import PreviewOptions


def create_page_stream(page_data):
    return open(f"preview_page_{page_data.page_number}.png", "wb")


def release_page_stream(page_data, page_stream):
    print(f"Image file {page_stream.name} is ready for preview")


def generate_document_preview_of_selected_pages():
    with Signature("sample.pdf") as signature:
        preview_options = PreviewOptions(create_page_stream, release_page_stream)
        # Page numbers are 0-based: [1] is the second page
        preview_options.page_numbers = [1]
        signature.generate_preview(preview_options)


if __name__ == "__main__":
    generate_document_preview_of_selected_pages()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/generate-document-pages-preview/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "preview_page_1.png" >}}  
```text
Binary file (PNG, 64 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/generate-document-pages-preview/generate_document_preview_of_selected_pages/preview_page_1.png)
{{< /tab >}}
{{< /tabs >}}

## Creating a document preview with custom Resolution

The default resolution is 96 DPI. Pass the resolution as the third argument of `PreviewOptions`, or set the `resolution` property.

{{< tabs "generate_document_preview_with_resolution" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import PreviewOptions


def create_page_stream(page_data):
    return open(f"preview_page_{page_data.page_number}_150dpi.jpg", "wb")


def release_page_stream(page_data, page_stream):
    print(f"Image file {page_stream.name} is ready for preview")


def generate_document_preview_with_resolution():
    with Signature("sample.pdf") as signature:
        resolution = 150
        # Create preview options object: 150 DPI instead of the default 96
        preview_options = PreviewOptions(create_page_stream, release_page_stream, resolution)
        preview_options.preview_format = PreviewOptions.PreviewFormats.JPEG
        # Generate preview
        signature.generate_preview(preview_options)


if __name__ == "__main__":
    generate_document_preview_with_resolution()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/generate-document-pages-preview/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "generate-document-preview-with-resolution-outputs.zip" >}}  
```text
preview_page_0_150dpi.jpg (495 KB)
preview_page_1_150dpi.jpg (425 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/generate-document-pages-preview/generate_document_preview_with_resolution/generate-document-preview-with-resolution-outputs.zip)
{{< /tab >}}
{{< /tabs >}}



## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python)



### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
