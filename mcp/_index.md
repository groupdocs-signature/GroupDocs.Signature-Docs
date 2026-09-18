---
id: mcp
url: signature/mcp
title: GroupDocs.Signature MCP Server
weight: 6
description: "GroupDocs.Signature MCP server lets AI agents like Claude, Cursor, and Copilot sign documents, verify signatures, and read QR codes and barcodes — locally on your machine."
keywords: document signing MCP server, sign PDF with AI agent, verify signature MCP, read QR code from document AI, digital signature MCP
productName: GroupDocs.Signature MCP Server
hideChildren: True
toc: True
---

**GroupDocs.Signature MCP server** lets AI agents like Claude, Cursor, and Copilot **sign documents, verify signatures, and read the codes inside them** — PDF, Word, Excel, PowerPoint and 30+ more formats — **locally on your machine**. Documents stay put; so do your signing certificates. 

Run it with one command. The Docker image is self-contained — the runtime and every native dependency the engine needs are inside it:

```bash
docker run --rm -i -v $(pwd)/documents:/data \
  ghcr.io/groupdocs-signature/signature-net-mcp:latest
```

With the .NET 10 SDK installed, the same server also runs without Docker:

```bash
dnx GroupDocs.Signature.Mcp --yes
```

Both are the **.NET** build of the server and run on Windows, Linux, and macOS. Other platforms will each get their own launcher — see [Install for your platform](#install-for-your-platform).

Or use the [guided installer]({{< ref "signature/mcp/getting-started/_index.md" >}}) to register the server in your AI client, verify the setup, and configure shared folders in one pass.

## What you can do

Nine tools in three groups (full details in the [tools reference]({{< ref "signature/mcp/tools-reference/_index.md" >}})):

**Sign** — [`sign`]({{< ref "signature/mcp/tools-reference/sign.md" >}}) applies a `text`, `qrcode`, `barcode`, or `digital` signature and saves a signed copy.

**Check** — [`verify`]({{< ref "signature/mcp/tools-reference/verify.md" >}}) answers *"is this signed and still valid?"*; [`search_digital_signatures`]({{< ref "signature/mcp/tools-reference/search-digital-signatures.md" >}}) returns signer, issuer, serial number, validity window, and timestamp.

**Read** — [`search_qr_codes`]({{< ref "signature/mcp/tools-reference/search-qr-codes.md" >}}) and [`search_barcodes`]({{< ref "signature/mcp/tools-reference/search-barcodes.md" >}}) decode machine-readable codes; [`search_text_signatures`]({{< ref "signature/mcp/tools-reference/search-text-signatures.md" >}}) and [`search_image_signatures`]({{< ref "signature/mcp/tools-reference/search-image-signatures.md" >}}) find stamps, labels, and seals.

Ask in plain language — *"sign this with a QR code holding the order number"*, *"who signed this and is it still valid?"* — and the agent picks the tools.

## Install for your platform

Installation, prerequisites, and client configuration are platform-specific; the tools and licensing model below are the same everywhere.

| Platform | Status | Install and setup |
|---|---|---|
| .NET | **Available** | [MCP server for .NET]({{< ref "signature/net/mcp/_index.md" >}}) |
| Java | Planned | [Tell us you need it](https://forum.groupdocs.com/c/signature/11) |
| Python | Planned | [Tell us you need it](https://forum.groupdocs.com/c/signature/11) |
| Node.js | Planned | [Tell us you need it](https://forum.groupdocs.com/c/signature/11) |

## Visual marks and digital signatures are not the same thing

This is the distinction to get right before automating anything:

| Type | What it is | What it proves |
|---|---|---|
| `text`, `qrcode`, `barcode`, image | A **visual mark** placed on the page | That the mark is there. Excellent for references, routing, and machine reading |
| `digital` | A **certificate-backed** cryptographic signature | Who signed, when, and that the file has not changed since |

Both are useful; only the second one survives a dispute. And because visual marks change the file's bytes, applying one **after** a digital signature invalidates it — sign digitally last.

## Supported AI clients

| Client | How it connects |
|---|---|
| Claude Desktop | `claude_desktop_config.json` |
| Claude Code | `claude mcp add` CLI |
| VS Code / GitHub Copilot | user-level or workspace `mcp.json` |
| Visual Studio 2022 (17.14+) | `.mcp.json` in the solution root |
| Cursor | `~/.cursor/mcp.json` |
| Windsurf | `~/.codeium/windsurf/mcp_config.json` |
| Cline | Cline MCP settings |
| Codex CLI | `codex mcp add` CLI |
| JetBrains Rider | manual registration (Settings → AI Assistant → MCP) |

Exact config blocks for every client: [Register in AI clients]({{< ref "signature/net/mcp/install-in-ai-clients.md" >}}).

## Delivery channels

| | Docker (recommended) | NuGet (`dnx`) |
|---|---|---|
| Prerequisites | Docker only | .NET 10 SDK (+ `libgdiplus` on Linux/macOS) |
| Native dependencies | bundled in the image | installed by you (or the setup script) |
| Package | `ghcr.io/groupdocs-signature/signature-net-mcp` | `GroupDocs.Signature.Mcp` on NuGet |
| Architectures | linux/amd64 + linux/arm64 (Apple Silicon native) | any OS with .NET 10 |

## How it works

The server uses MCP's **local stdio transport**: your AI client starts the server as a child process and talks to it over standard input/output. No inbound ports, no external endpoints, no telemetry — the data path is *agent → local server → local filesystem*. For signing that property is not a nicety: your certificate file and its password are read locally and never transmitted. Details: [On-premise architecture]({{< ref "signature/mcp/use-cases/on-premise-document-signing.md" >}}).

## When you need more than a PDF signing button

A PDF tool signs PDFs, one at a time, by hand. Choose this server when you need: **the same signing and verification model across 30+ formats**; signatures an agent can apply and check **inside a workflow** rather than in a UI; QR and barcode **data extraction** from the documents you already handle; certificate details as structured data for an audit trail; and the fidelity of the commercial GroupDocs engine trusted by enterprise teams for over a decade.

## Resources

* [Quick start]({{< ref "signature/mcp/getting-started/_index.md" >}}) · [Use cases]({{< ref "signature/mcp/use-cases/_index.md" >}}) · [Troubleshooting & FAQ]({{< ref "signature/mcp/troubleshooting-faq.md" >}})
* GitHub: [server source](https://github.com/groupdocs-signature/GroupDocs.Signature.Mcp) · [installer](https://github.com/groupdocs/GroupDocs.Mcp.Installer) · [integration tests](https://github.com/groupdocs-signature/GroupDocs.Signature.Mcp.Tests)
* [NuGet package](https://www.nuget.org/packages/GroupDocs.Signature.Mcp) · [Docker image](https://github.com/orgs/groupdocs-signature/packages/container/package/signature-net-mcp) · [MCP Registry](https://registry.modelcontextprotocol.io/v0/servers?search=io.github.groupdocs-signature/groupdocs-signature-mcp)
* Questions: [Signature forum](https://forum.groupdocs.com/c/signature/11)
