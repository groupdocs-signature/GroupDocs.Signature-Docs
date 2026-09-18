---
id: mcp-tool-sign
url: signature/mcp/tools-reference/sign
title: sign
weight: 1
description: "The sign MCP tool signs a document with a text, QR code, barcode, or digital certificate signature and saves the signed file to storage."
keywords: sign MCP tool, sign PDF with AI agent, add QR code signature, digital signature MCP tool, esign document AI
productName: GroupDocs.Signature MCP Server
generated: true
serverVersion: 26.9.0
toc: True
---

`sign` applies a signature to a document and saves the signed file. Four types: `text`, `qrcode`, `barcode` (visual marks), and `digital` (certificate-backed, the one with legal weight). Example prompt: *"Sign contract.pdf with a QR code holding the order reference"*.

**Tool description (as the AI agent sees it):**

> Signs a document with a text, QR code, barcode, or digital certificate signature and saves the signed file to storage. Supports PDF, DOCX, XLSX, PPTX, and 30+ more document formats. Call this tool immediately whenever the user asks to sign a document, add a signature, or apply a digital signature. Do NOT pre-check whether files exist — just pass the filenames the user provided. The tool resolves files from storage and returns an error with available files if a name is not found. Returns a saved-path message ('Signed <file> with <type> signature') and the download URL or storage path. On failure, the response text starts with 'Signing failed for' followed by the underlying exception type, message, and inner-exception chain.

## Parameters

| Name | Type | Required | Description |
|---|---|---|---|
| `file` | object | yes |  — [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) |
| `type` | string | yes | Signature type: text, qrcode, barcode, digital |
| `text` | string | no | Signature text (for text/qrcode/barcode types) |
| `certificate` | object | no | Digital certificate file (for type 'digital') — [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) |
| `certificatePassword` | string | no | Certificate password |
| `password` | string | no | Password for protected documents |

## Example call

```json
{
  "name": "sign",
  "arguments": {
    "file": {
      "filePath": "contract.pdf"
    },
    "type": "qrcode",
    "text": "ORDER-2026-0418"
  }
}
```

## Result

A saved-path message naming the signed document in your output folder. The original is left as it was.

For `type: "digital"`, pass `certificate` (the certificate file, in the same [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) as the document) and `certificatePassword`. Both are read locally; neither is transmitted anywhere.

A note on ordering: visual signatures change the file's bytes, so applying one **after** a digital signature invalidates that digital signature. Sign digitally last.

On failure the text starts with `Signing failed for`, followed by the exception type and message — a wrong certificate password surfaces here.

## Example prompts

* *"Sign contract.pdf with a QR code containing our order reference."*
* *"Add a text signature with my name and today's date."*
* *"Sign this with the certificate in signing-cert.pfx."*
* *"Put a barcode with the invoice number on the invoice."*

See it used end-to-end: [Sign documents with AI agents]({{< ref "signature/mcp/use-cases/sign-documents-with-ai-agents.md" >}}).
