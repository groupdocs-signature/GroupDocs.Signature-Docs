---
id: mcp-tool-search-qr-codes
url: signature/mcp/tools-reference/search-qr-codes
title: search_qr_codes
weight: 4
description: "The search_qr_codes MCP tool finds QR code signatures in a document and returns their decoded text, page, position, and optionally the graphic as a base64 PNG."
keywords: search_qr_codes MCP, read QR code from PDF AI, extract QR data document, QR code signature search
productName: GroupDocs.Signature MCP Server
generated: true
serverVersion: 26.9.0
toc: True
---

`search_qr_codes` finds QR codes in a document and returns each one's **decoded text**, page, and position — optionally the graphic itself as a base64 PNG. Filter with `text` to return only codes containing a given string. Example prompt: *"What does the QR code on this invoice say?"*

**Tool description (as the AI agent sees it):**

> Searches a document for QR code signatures and returns each QR code's decoded text, page, position, and — when returnImage is true — the QR code graphic as a base64-encoded PNG. Supports PDF, DOCX, XLSX, PPTX, and 30+ more document formats. Optionally filters results to QR codes whose decoded text contains a specific string. Do NOT pre-check whether the file exists — pass the filename the user provided directly. Returns a JSON object with `found` (count) and `signatures` (array with `page`, `type`, `text`, position, dimensions, and optional `imageBase64`). On failure, the response text starts with 'QR code search failed for' followed by the underlying exception type, message, and inner-exception chain.

## Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| `file` | object | yes |  — [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) |
| `text` | string | no | Return only QR codes whose decoded text contains this string. Omit to return all QR codes. |
| `returnImage` | boolean | no | Include the QR code graphic as a base64 PNG in the response. |
| `password` | string | no | Password for protected documents. |

## Example call

```json
{
  "name": "search_qr_codes",
  "arguments": {
    "file": {
      "filePath": "invoice.pdf"
    },
    "returnImage": false
  }
}
```

## Result

A JSON array of QR codes: decoded text, page, position, and — when `returnImage` is `true` — the code rendered as a base64 PNG.

Leave `returnImage` off unless you actually need the picture: the decoded text is what an agent reasons over, and the image inflates the response considerably.

On failure the text starts with `QR code search failed for`, followed by the exception type and message.

## Example prompts

* *"What does the QR code on this invoice say?"*
* *"Find every QR code containing 'ORDER' and list the pages."*
* *"Extract the tracking reference from the QR code."*

See it used end-to-end: [Extract QR and barcode data]({{< ref "signature/mcp/use-cases/extract-qr-and-barcode-data.md" >}}).
