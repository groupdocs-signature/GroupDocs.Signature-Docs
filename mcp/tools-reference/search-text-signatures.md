---
id: mcp-tool-search-text-signatures
url: signature/mcp/tools-reference/search-text-signatures
title: search_text_signatures
weight: 6
description: "The search_text_signatures MCP tool finds embedded text signatures, stamps, and labels in a document — not ordinary body text."
keywords: search_text_signatures MCP, find stamps in PDF, text signature search document, embedded labels MCP
productName: GroupDocs.Signature MCP Server
generated: true
serverVersion: 26.9.0
toc: True
---

`search_text_signatures` finds **embedded text signatures** — stamps, labels, and native text annotations applied as signatures. It does not search the body text of the document; it looks for signature objects. Example prompt: *"Is there an APPROVED stamp on this?"*

**Tool description (as the AI agent sees it):**

> Searches a document for embedded text signatures (stamps, labels, native text annotations) and returns each signature's text content, page, position, and implementation type. Supports PDF, DOCX, XLSX, PPTX, and 30+ more document formats. Optionally filters to signatures whose text contains a specific string. Note: this searches for signature objects — to search for arbitrary text inside document content use a text-extraction tool instead. Do NOT pre-check whether the file exists — pass the filename the user provided directly. Returns a JSON object with `found` (count) and `signatures` (array with `page`, `text`, `implementation`, `left`, `top`, `width`, `height` per signature). On failure, the response text starts with 'Text signature search failed for' followed by the underlying exception type, message, and inner-exception chain.

## Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| `file` | object | yes |  — [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) |
| `text` | string | no | Return only text signatures whose content contains this string. Omit to return all text signatures. |
| `password` | string | no | Password for protected documents. |

## Example call

```json
{
  "name": "search_text_signatures",
  "arguments": {
    "file": {
      "filePath": "contract_signed.pdf"
    },
    "text": "APPROVED"
  }
}
```

## Result

A JSON array of text signatures: content, page, position, and implementation type.

The distinction that saves confusion: a sentence typed into the document is *content*; a signature object placed on the page is what this tool returns. If a search comes back empty on a document that visibly says "Approved", the text is probably body content — not a signature.

On failure the text starts with `Text signature search failed for`, followed by the exception type and message.

## Example prompts

* *"Is there an APPROVED stamp on this document?"*
* *"List the text signatures and which page each is on."*
* *"Find any signature containing my name."*
