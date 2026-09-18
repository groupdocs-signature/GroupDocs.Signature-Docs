---
id: mcp-tool-search-barcodes
url: signature/mcp/tools-reference/search-barcodes
title: search_barcodes
weight: 5
description: "The search_barcodes MCP tool finds barcode signatures in a document and returns each decoded value, page, position, and optionally the barcode graphic."
keywords: search_barcodes MCP, read barcode from PDF, extract barcode data AI agent, Code128 EAN document search
productName: GroupDocs.Signature MCP Server
generated: true
serverVersion: 26.9.0
toc: True
---

`search_barcodes` finds 1D barcodes — Code39, Code128, EAN and friends — and returns each decoded value with its page and position. Filter with `text`; set `returnImage` to include the graphic. Example prompt: *"Read the barcodes on these shipping documents"*.

**Tool description (as the AI agent sees it):**

> Searches a document for barcode signatures (Code39, Code128, EAN, QR-adjacent 1D barcodes, etc.) and returns each barcode's decoded text value, page, position, and — when returnImage is true — the barcode graphic as a base64-encoded PNG. Supports PDF, DOCX, XLSX, PPTX, and 30+ more document formats. Optionally filters results to barcodes whose text contains a specific string. Do NOT pre-check whether the file exists — pass the filename the user provided directly. Returns a JSON object with `found` (count) and `signatures` (array with `page`, `type`, `text`, position, dimensions, and optional `imageBase64`). On failure, the response text starts with 'Barcode search failed for' followed by the underlying exception type, message, and inner-exception chain.

## Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| `file` | object | yes |  — [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) |
| `text` | string | no | Return only barcodes whose decoded text contains this string. Omit to return all barcodes. |
| `returnImage` | boolean | no | Include the barcode graphic as a base64 PNG in the response. |
| `password` | string | no | Password for protected documents. |

## Example call

```json
{
  "name": "search_barcodes",
  "arguments": {
    "file": {
      "filePath": "shipping-label.pdf"
    },
    "returnImage": false
  }
}
```

## Result

A JSON array of barcodes: decoded text, page, position, and — when `returnImage` is `true` — the barcode as a base64 PNG.

Barcodes are where document automation usually starts: the decoded value is the key that joins a scanned page to a record in another system, and an agent can carry it straight into the next step.

On failure the text starts with `Barcode search failed for`, followed by the exception type and message.

## Example prompts

* *"Read the barcodes on this shipping document."*
* *"Find the barcode that starts with 'SHIP' and tell me which page it is on."*
* *"List every barcode value in the batch."*

See it used end-to-end: [Extract QR and barcode data]({{< ref "signature/mcp/use-cases/extract-qr-and-barcode-data.md" >}}).
