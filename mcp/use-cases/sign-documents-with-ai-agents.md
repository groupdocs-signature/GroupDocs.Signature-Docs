---
id: mcp-uc-sign-documents-with-ai-agents
url: signature/mcp/use-cases/sign-documents-with-ai-agents
title: How to sign documents with AI agents using MCP
linkTitle: Sign with AI agents
weight: 1
description: "Sign documents with an AI agent over MCP: apply text, QR code, barcode, or certificate-backed digital signatures locally, with the document and the certificate staying on your machine."
keywords: sign documents with AI agent, MCP document signing, Claude sign PDF, esign with AI
productName: GroupDocs.Signature MCP Server
toc: True
structuredData:
    showOrganization: True
    howTo:
        name: "How to sign documents with AI agents using MCP"
        description: "Sign documents with an AI agent over MCP: apply text, QR code, barcode, or certificate-backed digital signatures locally, with the document and the certificate staying on your machine."
        steps:
        - name: "Install the server"
          text: "Run the GroupDocs.Signature MCP server with Docker or dnx and register it in your AI client."
        - name: "Put the documents in the storage folder"
          text: "Point GROUPDOCS_MCP_STORAGE_PATH at the folder that holds the files the agent should use."
        - name: "Ask the agent"
          text: "Sign contract.pdf digitally using signing-cert.pfx."
---

Signing through an agent works because the **agent** understands *"sign this with our order reference"* while the **engine** produces a real signature in a real document, locally — including certificate-backed digital signatures.

{{< alert style="info" >}}
The commands and config snippets on this page are for the **.NET** build of the server — the only platform available today. Installation and client setup: [MCP server for .NET]({{< ref "signature/net/mcp/_index.md" >}}). Other platforms will expose the same tools with their own launch command; everything else on this page applies unchanged.
{{< /alert >}}

## The pattern

1. Put the document in the storage folder the server can see.
2. Ask: *"Sign contract.pdf with a QR code containing ORDER-2026-0418."*
3. The agent calls [`sign`]({{< ref "signature/mcp/tools-reference/sign.md" >}}) with `type` and `text`.
4. The engine writes a signed copy to your output folder; the original is untouched.

## Choosing the type

| You want | `type` | Notes |
|---|---|---|
| A visible name/date stamp | `text` | A mark, not proof |
| A machine-readable reference | `qrcode` | Scannable; carries structured text |
| A scan-line reference | `barcode` | Code39/Code128/EAN family |
| Legal, tamper-evident signing | `digital` | Needs a certificate + password |

The first three place a **mark**. Only `digital` binds identity to the bytes: it proves who signed and that nothing changed afterwards. When someone says "we need this signed", ask which of the two they actually mean.

## Digital signing, concretely

> Sign contract.pdf digitally using signing-cert.pfx.

The agent passes `certificate` (the certificate file, in the same [FileInput shape]({{< ref "signature/mcp/tools-reference/_index.md#the-fileinput-shape" >}}) as the document) and `certificatePassword`. Both are read from local disk by the local process. The password is a secret like any other — put it in an environment variable rather than a literal in a committed client config ([how]({{< ref "signature/mcp/getting-started/licensing.md" >}}#keeping-the-private-key-out-of-committed-files)).

## Order matters

Visual marks rewrite the file. Apply one after a digital signature and that digital signature becomes invalid — the bytes it covered have changed. So: **all visual marks first, digital signature last.** If an agent is chaining signatures, say so explicitly in the prompt.

## The evaluation trap

Unlicensed, only the **first two pages** are processed and every page gets a trial badge. A signature destined for page 5 of a contract silently never lands. Before any signing run that matters:

> What is the license status of the signature server?

[`get_license_status`]({{< ref "signature/mcp/tools-reference/get-license-status.md" >}}) answers in one call. See [Licensing]({{< ref "signature/mcp/getting-started/licensing.md" >}}).

## Setup

```bash
dnx GroupDocs.Signature.Mcp --yes
```

with `GROUPDOCS_MCP_STORAGE_PATH` pointing at your documents folder — [per-client config]({{< ref "signature/net/mcp/install-in-ai-clients.md" >}}) or the [installer]({{< ref "signature/mcp/getting-started/_index.md" >}}).

## Where to go next

* [Verify signed documents]({{< ref "signature/mcp/use-cases/verify-signed-documents.md" >}}) — proving a signature, and reading what it says.
* [Extract QR and barcode data]({{< ref "signature/mcp/use-cases/extract-qr-and-barcode-data.md" >}}) — documents as data sources.
* [Audit a folder of signed documents]({{< ref "signature/mcp/use-cases/audit-signatures-in-a-folder.md" >}}) — one prompt, many files.
* [On-premise architecture]({{< ref "signature/mcp/use-cases/on-premise-document-signing.md" >}}) — where the certificate lives.
