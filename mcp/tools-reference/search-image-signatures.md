---
id: mcp-tool-search-image-signatures
url: signature/mcp/tools-reference/search-image-signatures
title: search_image_signatures
weight: 7
description: "The search_image_signatures MCP tool finds embedded image signatures — logos, stamp images, picture overlays — and returns each as a base64 PNG with page and position."
keywords: search_image_signatures MCP, find logo stamp in PDF, image signature extraction, base64 PNG signature MCP
productName: GroupDocs.Signature MCP Server
generated: true
serverVersion: 26.9.0
toc: True
---

`search_image_signatures` finds embedded image signatures — logos, stamp images, picture overlays — and returns each with its page, position, size, and content as a **base64-encoded PNG** ready to display. Example prompt: *"Show me the stamp images on this document"*.

**Tool description (as the AI agent sees it):**

> Searches a document for embedded image signatures (logo, stamp image, picture overlays) and returns each image's page, position, size, and content as a base64-encoded PNG ready for display. Supports PDF, DOCX, XLSX, PPTX, and 30+ more document formats. Do NOT pre-check whether the file exists — pass the filename the user provided directly. Returns a JSON object with `found` (count) and `signatures` (array with `index`, `page`, position, dimensions, `sizeBytes`, and `imageBase64`). On failure, the response text starts with 'Image signature search failed for' followed by the underlying exception type, message, and inner-exception chain.

## Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| `file` | object | yes |  — [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) |
| `password` | string | no | Password for protected documents. |

## Example call

```json
{
  "name": "search_image_signatures",
  "arguments": {
    "file": {
      "filePath": "contract_signed.pdf"
    }
  }
}
```

## Result

A JSON array of image signatures: page, position, size, and the image as a base64 PNG.

Useful for checking that the right stamp or company seal is present, and for pulling a signature image out for an audit record. Responses can be large — images are returned whether or not you need them, so run it on the document you care about rather than across a folder.

On failure the text starts with `Image signature search failed for`, followed by the exception type and message.

## Example prompts

* *"Show me the stamp images on this document."*
* *"Is the company seal present on the last page?"*
* *"Extract the signature image for the audit file."*
