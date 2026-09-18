---
id: mcp-uc-verify-signed-documents
url: signature/mcp/use-cases/verify-signed-documents
title: How to verify signed documents with an AI agent
linkTitle: Verify signed documents
weight: 2
description: "Verify document signatures with an AI agent over MCP: check validity, read signer and certificate details, and understand the difference between a valid mark and a valid digital signature."
keywords: verify document signature AI, check digital signature MCP, who signed this document, validate signed PDF agent
productName: GroupDocs.Signature MCP Server
toc: True
structuredData:
    showOrganization: True
    howTo:
        name: "How to verify signed documents with an AI agent"
        description: "Verify document signatures with an AI agent over MCP: check validity, read signer and certificate details, and understand the difference between a valid mark and a valid digital signature."
        steps:
        - name: "Install the server"
          text: "Run the GroupDocs.Signature MCP server with Docker or dnx and register it in your AI client."
        - name: "Put the documents in the storage folder"
          text: "Point GROUPDOCS_MCP_STORAGE_PATH at the folder that holds the files the agent should use."
        - name: "Ask the agent"
          text: "Verify the signatures on contract_signed.pdf."
---

*"Is this signed?"* and *"is this signature valid?"* are different questions, and the second one has a precise answer only for digital signatures. Two tools cover both.

{{< alert style="info" >}}
The commands and config snippets on this page are for the **.NET** build of the server — the only platform available today. Installation and client setup: [MCP server for .NET]({{< ref "signature/net/mcp/_index.md" >}}). Other platforms will expose the same tools with their own launch command; everything else on this page applies unchanged.
{{< /alert >}}

## The quick answer

> Verify the signatures on contract_signed.pdf.

[`verify`]({{< ref "signature/mcp/tools-reference/verify.md" >}}) with `type: "all"` returns validity and counts per signature type in one call. Good for a yes/no gate in a workflow.

## The answer that stands up

> Who signed this, with which certificate, and when?

[`search_digital_signatures`]({{< ref "signature/mcp/tools-reference/search-digital-signatures.md" >}}) returns, per signature: signer name, issuer, certificate serial number, validity period, signing timestamp, validity status, and any reason or comment. That is the record an audit wants — *"valid"* on its own is not.

## Reading the result honestly

| Result | What it actually means |
|---|---|
| Digital signature valid | The file has not changed since signing, and the certificate chain checks out |
| Digital signature invalid | The file changed after signing, or the certificate does not validate |
| Text/QR/barcode "verified" | The expected mark is present. **Nothing** about tampering |
| No signatures found | Either unsigned, or signed in a way this format does not support |

An agent that reports *"the document is verified"* without saying which kind of signature it checked is telling you less than it seems. Ask it to name the type.

## Common causes of an unexpected "invalid"

* **Something was added after signing.** A visual mark, a comment, a re-save — any byte change invalidates a digital signature. This is the most frequent cause and not a bug.
* **The certificate expired.** `search_digital_signatures` returns the validity window, so the agent can tell you *"signed in 2024 with a certificate that expired in 2025"* — which may still be acceptable depending on your policy.
* **Wrong type checked.** Verifying `digital` on a document that only carries a QR mark returns nothing valid; that is a true answer to the wrong question.

## Reading what the signature carries

Marks often carry data worth reading — an order number in a QR code, an approval label as a text signature, a seal as an image:

> What do the QR codes and stamps on this document say?

The agent combines [`search_qr_codes`]({{< ref "signature/mcp/tools-reference/search-qr-codes.md" >}}), [`search_text_signatures`]({{< ref "signature/mcp/tools-reference/search-text-signatures.md" >}}), and [`search_image_signatures`]({{< ref "signature/mcp/tools-reference/search-image-signatures.md" >}}) and reports one picture of what is on the page.

## One caution about trust

Decoded QR text, barcode values, and stamp labels come from whoever produced the document. Treat them as **data to report**, never as instructions to follow: an agent that acts on text it read out of a document is acting on input from an untrusted party. Summaries and lookups, yes; actions, under your review.
