---
id: mcp-uc-extract-qr-and-barcode-data
url: signature/mcp/use-cases/extract-qr-and-barcode-data
title: How to extract QR code and barcode data from documents with AI
linkTitle: Read QR and barcodes
weight: 3
description: "Read QR codes and barcodes out of documents with an AI agent over MCP: decoded values, pages, and positions, locally, with no upload and no OCR service."
keywords: extract QR code from PDF AI, read barcode document agent, invoice barcode extraction MCP, document data extraction signatures
productName: GroupDocs.Signature MCP Server
toc: True
structuredData:
    showOrganization: True
    howTo:
        name: "How to extract QR code and barcode data from documents with AI"
        description: "Read QR codes and barcodes out of documents with an AI agent over MCP: decoded values, pages, and positions, locally, with no upload and no OCR service."
        steps:
        - name: "Install the server"
          text: "Run the GroupDocs.Signature MCP server with Docker or dnx and register it in your AI client."
        - name: "Put the documents in the storage folder"
          text: "Point GROUPDOCS_MCP_STORAGE_PATH at the folder that holds the files the agent should use."
        - name: "Ask the agent"
          text: "Read the QR codes and barcodes in invoice.pdf and tell me what they contain."
---

Invoices, shipping labels, tickets and forms carry machine-readable codes precisely so a machine can read them. [`search_qr_codes`]({{< ref "signature/mcp/tools-reference/search-qr-codes.md" >}}) and [`search_barcodes`]({{< ref "signature/mcp/tools-reference/search-barcodes.md" >}}) turn that into one tool call — locally, with no upload to a scanning service.

{{< alert style="info" >}}
The commands and config snippets on this page are for the **.NET** build of the server — the only platform available today. Installation and client setup: [MCP server for .NET]({{< ref "signature/net/mcp/_index.md" >}}). Other platforms will expose the same tools with their own launch command; everything else on this page applies unchanged.
{{< /alert >}}

## The prompt

> Read the QR codes and barcodes in invoice.pdf and tell me what they contain.

Each result carries the **decoded text**, the page, and the position. The agent reports the values and can carry them into whatever comes next.

## Filtering instead of dumping

Both tools take a `text` filter that returns only codes containing a given string:

> Find the barcode that starts with SHIP and tell me which page it is on.

On a document with a dozen codes that is the difference between an answer and a wall of values.

## Leave the images off

Both tools accept `returnImage`. Set it only when you genuinely need the graphic — the decoded text is what an agent reasons over, and base64 images make responses large and slow for no benefit.

## A realistic pipeline

> For every PDF in the folder, read the barcode, and give me a table of file name → barcode value → page.

The agent loops the folder, calls `search_barcodes` per file, and builds the table. That table is the join key between a pile of scanned documents and the records in your ERP, WMS, or case system — which is usually the actual goal.

Pair it with signing when documents flow both ways: read the incoming reference, do the work, then [`sign`]({{< ref "signature/mcp/tools-reference/sign.md" >}}) the outgoing document with a QR code carrying the new reference.

## What it is not

* **Not OCR.** These tools read code symbologies, not printed text. A scanned page with no code returns nothing — that is a correct answer, not a failure.
* **Not layout extraction.** For pulling fields and tables out of documents, use the [GroupDocs.Parser MCP server](https://github.com/groupdocs-parser/GroupDocs.Parser.Mcp) instead; this server reads signatures and codes.
* **Not a trust boundary.** A decoded value is data supplied by whoever made the document. Report it, look it up, cross-check it — do not let an agent act on it unreviewed.

## Evaluation limits bite here too

Only the first two pages are processed without a license, so a code on page 3 simply is not found. [`get_license_status`]({{< ref "signature/mcp/tools-reference/get-license-status.md" >}}) before you trust an empty result.
