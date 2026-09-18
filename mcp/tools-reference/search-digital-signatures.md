---
id: mcp-tool-search-digital-signatures
url: signature/mcp/tools-reference/search-digital-signatures
title: search_digital_signatures
weight: 3
description: "The search_digital_signatures MCP tool returns certificate details for each digital signature — signer, issuer, serial number, validity period, timestamp, and status."
keywords: search_digital_signatures MCP, read certificate details PDF, who signed this document, digital signature audit MCP
productName: GroupDocs.Signature MCP Server
generated: true
serverVersion: 26.9.0
toc: True
---

`search_digital_signatures` returns the details behind each digital signature: signer name, issuer, certificate serial number, validity period, signing timestamp, validity status, and any reason or comment attached. This is the tool for *"who signed this, when, and with what?"*

**Tool description (as the AI agent sees it):**

> Searches a document for digital certificate signatures and returns details for each: signer name, issuer, certificate serial number, validity period, sign timestamp, validity status, and any comments or reason attached to the signature. Supports PDF and Office documents (DOCX, XLSX, PPTX). Do NOT pre-check whether the file exists — pass the filename the user provided directly. Returns a JSON object with `found` (count) and `signatures` (array with `signTime`, `isValid`, `comments`, `thumbprint`, and a nested `certificate` object). On failure, the response text starts with 'Digital signature search failed for' followed by the underlying exception type, message, and inner-exception chain.

## Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| `file` | object | yes |  — [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) |
| `password` | string | no | Password for protected documents. |

## Example call

```json
{
  "name": "search_digital_signatures",
  "arguments": {
    "file": {
      "filePath": "contract_signed.pdf"
    }
  }
}
```

## Result

A JSON array, one entry per digital signature, with signer, issuer, serial number, validity window, timestamp, status, and comments.

Where [`verify`]({{< ref "signature/mcp/tools-reference/verify.md" >}}) answers *valid or not*, this answers *by whom and under what certificate* — the data an audit trail actually needs. Supported on PDF and Office formats (DOCX, XLSX, PPTX).

On failure the text starts with `Digital signature search failed for`, followed by the exception type and message.

## Example prompts

* *"Who signed this contract, and when?"*
* *"Show me the certificate details for every signature."*
* *"Has the signing certificate expired?"*
