---
id: mcp-net
url: signature/net/mcp
title: MCP server for .NET
linkTitle: MCP Server
weight: 7
description: "Install and configure the GroupDocs.Signature MCP server for .NET — one-click install links for VS Code and Cursor, per-OS setup for Windows, Linux, and macOS, and the full environment-variable reference."
keywords: GroupDocs.Signature MCP .NET, install MCP server dnx, MCP server Docker image, MCP server configuration, Model Context Protocol .NET
productName: GroupDocs.Signature MCP Server for .NET
hideChildren: True
toc: True
---

Everything needed to **install and run** the GroupDocs.Signature MCP server on the .NET platform. What the server *does* — its tools, use cases, and licensing model — is platform-independent and lives in the [MCP server section]({{< ref "signature/mcp/_index.md" >}}).

| The .NET build at a glance | |
|---|---|
| Package | [`GroupDocs.Signature.Mcp`](https://www.nuget.org/packages/GroupDocs.Signature.Mcp) (current **26.9.0**) |
| One-command run | `dnx GroupDocs.Signature.Mcp --yes` |
| Container images | `ghcr.io/groupdocs-signature/signature-net-mcp` · `groupdocs/signature-net-mcp` |
| Prerequisites | [.NET 10 SDK](https://dotnet.microsoft.com/download/dotnet/10.0) for the NuGet channel, or Docker |
| Source | [GroupDocs.Signature.Mcp on GitHub](https://github.com/groupdocs-signature/GroupDocs.Signature.Mcp) |
| Release notes | [changelog](https://github.com/groupdocs-signature/GroupDocs.Signature.Mcp/tree/master/changelog) · [GitHub releases](https://github.com/groupdocs-signature/GroupDocs.Signature.Mcp/releases) |

## Start here

1. **Install** for your operating system — [Windows]({{< ref "signature/net/mcp/windows-installation.md" >}}) · [Linux]({{< ref "signature/net/mcp/linux-installation.md" >}}) · [macOS]({{< ref "signature/net/mcp/macos-installation.md" >}})
2. **Register it in your AI client** — [one-click links and per-client configs]({{< ref "signature/net/mcp/install-in-ai-clients.md" >}})
3. **Point it at your documents** — [configuration]({{< ref "signature/net/mcp/configuration.md" >}})
4. **License it** — evaluation, a license file, or metered keys: [Licensing]({{< ref "signature/mcp/getting-started/licensing.md" >}})

## In this section

* [Install on Windows]({{< ref "signature/net/mcp/windows-installation.md" >}})
* [Install on Linux]({{< ref "signature/net/mcp/linux-installation.md" >}})
* [Install on macOS]({{< ref "signature/net/mcp/macos-installation.md" >}})
* [Register in AI clients]({{< ref "signature/net/mcp/install-in-ai-clients.md" >}}) — VS Code, Cursor, Claude, Visual Studio, Windsurf, Cline, Codex, Rider
* [Configuration]({{< ref "signature/net/mcp/configuration.md" >}}) — storage, output, license, metered keys
* [System requirements]({{< ref "signature/net/mcp/system-requirements.md" >}})
* [Troubleshooting (.NET)]({{< ref "signature/net/mcp/troubleshooting.md" >}}) — `dnx`, native libraries, Docker daemon

## Platform-independent reference

* [Tools reference]({{< ref "signature/mcp/tools-reference/_index.md" >}}) — `sign`, `verify`, `search_digital_signatures`, `search_qr_codes`, `search_barcodes`, `search_text_signatures`, `search_image_signatures`, `get_document_info`, `get_license_status`
* [Use cases]({{< ref "signature/mcp/use-cases/_index.md" >}}) · [Supported formats]({{< ref "signature/mcp/supported-formats.md" >}}) · [Troubleshooting & FAQ]({{< ref "signature/mcp/troubleshooting-faq.md" >}})
