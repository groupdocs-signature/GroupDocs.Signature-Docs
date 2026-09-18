---
id: mcp-tool-verify
url: signature/mcp/tools-reference/verify
title: verify
weight: 2
description: "The verify MCP tool checks the signatures in a document and returns valid/invalid results and counts as JSON."
keywords: verify MCP tool, verify document signature AI, check if document is signed, validate digital signature MCP
productName: GroupDocs.Signature MCP Server
generated: true
serverVersion: 26.9.0
toc: True
---

`verify` checks signatures in a document and reports whether they are valid, with counts. Pass `type` as `text`, `qrcode`, `barcode`, `digital`, or `all`. It is the single call behind *"is this signed, and is it still valid?"*. Example prompt: *"Verify the signatures on contract_signed.pdf"*.

**Tool description (as the AI agent sees it):**

> Verifies signatures in a document and returns the result (valid/invalid, counts) as JSON. Supports text, QR code, barcode, and digital signatures. Supports PDF, DOCX, XLSX, PPTX, and 30+ more document formats. Call this tool immediately whenever the user asks to verify a signature, check if a document is signed, or validate a signature. Do NOT pre-check whether files exist — just pass the filename the user provided. The tool resolves files from storage and returns an error with available files if a name is not found. Returns a JSON object with `isValid`, `succeeded` (count), and `failed` (count) fields. On failure, the response text starts with 'Verification failed for' followed by the underlying exception type, message, and inner-exception chain.

## Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| `file` | object | yes |  — [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) |
| `type` | string | no | Signature type to verify: text, qrcode, barcode, digital, all |
| `password` | string | no | Password for protected documents |

## Example call

```json
{
  "name": "verify",
  "arguments": {
    "file": {
      "filePath": "contract_signed.pdf"
    },
    "type": "all"
  }
}
```

## Result

A JSON object with the verification outcome and counts per signature type.

Read the result precisely: a **valid digital** signature means the document has not changed since it was signed and the certificate chain checks out. A **valid text or QR** result means the expected mark is present — it says nothing about tampering. The distinction matters whenever the answer feeds a compliance decision.

On failure the text starts with `Verification failed for`, followed by the exception type and message.

## Example prompts

* *"Verify the signatures on contract_signed.pdf."*
* *"Is this document digitally signed and still valid?"*
* *"Check every signature type and tell me which ones pass."*

See it used end-to-end: [Verify signed documents]({{< ref "signature/mcp/use-cases/verify-signed-documents.md" >}}).
