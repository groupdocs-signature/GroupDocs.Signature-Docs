---
id: mcp-tool-get-document-info
url: signature/mcp/tools-reference/get-document-info
title: get_document_info
weight: 8
description: "The get_document_info MCP tool returns file type, page count, size, and per-page dimensions for a document, without modifying it."
keywords: get_document_info MCP, MCP document info tool, page count before signing, ai agent inspect document
productName: GroupDocs.Signature MCP Server
generated: true
serverVersion: 26.9.0
toc: True
---

`get_document_info` returns the file type, page count, size, and per-page dimensions without touching the file — a sensible precondition check before signing. Example prompt: *"How many pages is this, before I sign it?"*

**Tool description (as the AI agent sees it):**

> Returns the file type, page count, size, and per-page dimensions of a document as JSON, without modifying the file. Supports PDF, DOCX, XLSX, PPTX, images, and 30+ more document formats. Call this tool whenever the user asks to inspect a document, check its page count, or get its details — useful as a precondition check before sign / verify / search (e.g. 'how many pages does this PDF have?'). Do NOT pre-check whether the file exists — just pass the filename the user provided. Returns a JSON object with fields `fileName`, `fileType`, `pageCount`, `size`, and `pages` (array of `{ number, width, height }`). On failure, the response text starts with 'Document-info lookup failed for' followed by the underlying exception type, message, and inner-exception chain.

## Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| `file` | object | yes |  — [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) |
| `password` | string | no | Password for protected documents |

## Example call

```json
{
  "name": "get_document_info",
  "arguments": {
    "file": {
      "filePath": "contract.pdf"
    }
  }
}
```

## Result

A JSON object with `fileName`, `fileType`, `pageCount`, `sizeBytes`, and `pages` — width and height per page.

Worth calling before a signing run in evaluation mode: only the first two pages are processed, so knowing the document has thirty is the difference between a signed contract and a silently unsigned one.

On failure the text starts with `Document-info lookup failed for`, followed by the exception type and message.

## Example prompts

* *"How many pages does contract.pdf have?"*
* *"What format is this, and how big?"*
* *"Check the page size before I place the signature."*
