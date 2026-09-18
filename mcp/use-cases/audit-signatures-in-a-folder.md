---
id: mcp-uc-audit-signatures-in-a-folder
url: signature/mcp/use-cases/audit-signatures-in-a-folder
title: How to audit a folder of signed documents with an AI agent
linkTitle: Audit signed documents
weight: 4
description: "Audit many signed documents in one prompt with an AI agent over MCP: verify each file, collect signer and certificate details, and get one table of what is signed, valid, or missing."
keywords: audit signed documents AI, bulk signature verification MCP, check folder of signed PDFs, compliance signature report agent
productName: GroupDocs.Signature MCP Server
toc: True
structuredData:
    showOrganization: True
    howTo:
        name: "How to audit a folder of signed documents with an AI agent"
        description: "Audit many signed documents in one prompt with an AI agent over MCP: verify each file, collect signer and certificate details, and get one table of what is signed, valid, or missing."
        steps:
        - name: "Install the server"
          text: "Run the GroupDocs.Signature MCP server with Docker or dnx and register it in your AI client."
        - name: "Put the documents in the storage folder"
          text: "Point GROUPDOCS_MCP_STORAGE_PATH at the folder that holds the files the agent should use."
        - name: "Ask the agent"
          text: "For every PDF in my documents folder, check whether it is digitally signed and still valid. Give me a table: file, signer, signed date, status."
---

Compliance questions are rarely about one file. *"Are all of last quarter's contracts signed?"*, *"whose certificate expired?"*, *"which ones were re-saved after signing?"* — one prompt, a folder, one table.

{{< alert style="info" >}}
The commands and config snippets on this page are for the **.NET** build of the server — the only platform available today. Installation and client setup: [MCP server for .NET]({{< ref "signature/net/mcp/_index.md" >}}). Other platforms will expose the same tools with their own launch command; everything else on this page applies unchanged.
{{< /alert >}}

## Setup

Point `GROUPDOCS_MCP_STORAGE_PATH` at the folder ([configuration]({{< ref "signature/net/mcp/configuration.md" >}})). Files are resolved by name, so the agent passes `contract-042.pdf`, not a path from your machine.

## The prompt

> For every PDF in my documents folder, check whether it is digitally signed and still valid. Give me a table: file, signer, signed date, status.

The agent calls [`verify`]({{< ref "signature/mcp/tools-reference/verify.md" >}}) and [`search_digital_signatures`]({{< ref "signature/mcp/tools-reference/search-digital-signatures.md" >}}) per file and assembles the answer. Two calls per document, one table at the end.

## The three findings that matter

* **Unsigned files** — the gap the audit exists to find.
* **Invalid signatures** — almost always "something changed after signing": a stamp added later, a re-save, a page appended. Worth knowing which.
* **Expired certificates** — the signature was valid when made; whether it still counts is your policy, and the validity window is in the data.

## Keep the sweep cheap

* Use `verify` for the yes/no pass, and only run the detail search on the files that need it.
* Skip [`search_image_signatures`]({{< ref "signature/mcp/tools-reference/search-image-signatures.md" >}}) in bulk — it returns base64 images for every hit and inflates the run for nothing.
* Leave `returnImage` off on code searches.
* Under [metered licensing]({{< ref "signature/mcp/getting-started/licensing.md" >}}#metered-pay-per-use-licensing) each call is billed usage, so a targeted sweep is cheaper as well as faster.

## Two honest limits

**The two-page evaluation cap makes bulk audits wrong, not just limited.** A signature on page 4 of an unlicensed run does not appear, so a clean-looking report can be false. Check [`get_license_status`]({{< ref "signature/mcp/tools-reference/get-license-status.md" >}}) first, every time.

**This is a report, not an attestation.** The agent summarizes what the engine found; it is not a notary. For formal evidence, keep the per-file certificate details — signer, issuer, serial, timestamp — rather than the agent's prose summary.

## Then act

> Sign the three unsigned ones with our standard QR reference and list what you did.

Same session, same folder, no uploads — see [Sign documents with AI agents]({{< ref "signature/mcp/use-cases/sign-documents-with-ai-agents.md" >}}).
