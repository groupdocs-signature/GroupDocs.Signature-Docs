---
id: mcp-supported-formats
url: signature/mcp/supported-formats
title: Supported formats
weight: 4
description: "The MCP server exposes the full GroupDocs.Signature engine: every format the .NET library can sign, verify, and search — PDF, Word, Excel, PowerPoint, images and 30+ more — is available to your AI agent."
keywords: MCP server supported formats, sign pdf MCP, sign docx MCP, verify signature formats, barcode search formats
productName: GroupDocs.Signature MCP Server
toc: True
---

The MCP server exposes the **full GroupDocs.Signature engine**: every format the .NET library can sign, verify, and search — 30+ document, spreadsheet, presentation, image, and archive formats — is available to your AI agent. The canonical matrix lives in the library documentation: [supported document formats]({{< ref "signature/net/getting-started/supported-document-formats.md" >}}).

What agents are asked for most:

* **PDF** — the full range: text, QR, barcode, image, and digital signatures, plus verification.
* **DOCX / XLSX / PPTX** — Office documents support digital signatures as well as visual marks, so a signed contract stays a Word file if that is what your process expects.
* **Images (PNG, JPG, TIFF)** — visual marks and code search work on scans; digital signing does not apply.

**Not every type works on every format.** Digital certificate signatures are supported on PDF and Office documents; visual marks (`text`, `qrcode`, `barcode`) work far more widely. If a signing call fails with an unsupported-format message, that mismatch is usually why — [`get_document_info`]({{< ref "signature/mcp/tools-reference/get-document-info.md" >}}) tells you what you are actually holding.

Not sure what is already in a file? Ask — *"what signatures does this document have?"* — and the agent runs the search tools and reports back.
