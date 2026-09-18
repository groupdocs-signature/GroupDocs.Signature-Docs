---
id: mcp-tools-reference
url: signature/mcp/tools-reference
title: Tools reference
weight: 2
description: "Complete reference of every tool the GroupDocs.Signature MCP server exposes to AI agents, with parameters, example prompts, and results."
keywords: MCP tools list document signing, sign MCP tool parameters, verify signature MCP, search QR codes MCP, MCP tools reference
productName: GroupDocs.Signature MCP Server
generated: true
serverVersion: 26.9.0
toc: True
---

Complete reference of every tool the GroupDocs.Signature MCP server exposes to AI agents, with parameters, example prompts, and results. Captured from a live `tools/list` call against server version **26.9.0** (raw capture: `tools-list.generated.json` in this section's source).

| Tool | What it does |
|---|---|
| [`sign`]({{< ref "signature/mcp/tools-reference/sign.md" >}}) | Signs a document with a text, QR code, barcode, or digital certificate signature |
| [`verify`]({{< ref "signature/mcp/tools-reference/verify.md" >}}) | Verifies signatures in a document and reports valid/invalid counts |
| [`search_digital_signatures`]({{< ref "signature/mcp/tools-reference/search-digital-signatures.md" >}}) | Returns certificate details — signer, issuer, serial, validity, timestamp |
| [`search_qr_codes`]({{< ref "signature/mcp/tools-reference/search-qr-codes.md" >}}) | Finds QR codes and returns their decoded text, page, and position |
| [`search_barcodes`]({{< ref "signature/mcp/tools-reference/search-barcodes.md" >}}) | Finds barcodes and returns their decoded values, page, and position |
| [`search_text_signatures`]({{< ref "signature/mcp/tools-reference/search-text-signatures.md" >}}) | Finds embedded text signatures, stamps, and labels |
| [`search_image_signatures`]({{< ref "signature/mcp/tools-reference/search-image-signatures.md" >}}) | Finds embedded image signatures and returns them as base64 PNGs |
| [`get_document_info`]({{< ref "signature/mcp/tools-reference/get-document-info.md" >}}) | Returns file type, page count, size, and per-page dimensions |
| [`get_license_status`]({{< ref "signature/mcp/tools-reference/get-license-status.md" >}}) | Reports the active licensing mode and, under metered licensing, consumption |

## The FileInput shape

Every tool takes its document through the same `file` object — pass **either** a name from your storage folder **or** inline content:

```json
{ "file": { "filePath": "contract.pdf" } }
```

| Field | Type | Description |
|---|---|---|
| `filePath` | string | File path or name in the configured storage folder |
| `fileContent` | string | Base64-encoded file content (alternative to `filePath`) |
| `fileName` | string | Original filename with extension — required with `fileContent`. Since **26.9.0** it also works on its own, resolved from the storage folder exactly like `filePath` |

You rarely write this JSON yourself: the AI agent does, from your plain-language prompt. Missing files are not an error to fear — the tool responds with the list of available files so the agent can correct itself.
