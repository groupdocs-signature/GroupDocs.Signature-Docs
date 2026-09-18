---
id: mcp-getting-started
url: signature/mcp/getting-started
title: Quick start
weight: 1
description: "Install and register the GroupDocs.Signature MCP server in Claude Desktop, VS Code, Cursor, or any MCP client in three commands using the guided installer — then verify the setup automatically."
keywords: how to install MCP server, set up document MCP server, add MCP server to Claude Desktop, MCP server quick start
productName: GroupDocs.Signature MCP Server
hideChildren: True
toc: True
---

{{< alert style="info" >}}
These steps install the **.NET** build of the server — the only platform available today. Java, Python, and Node.js builds are planned; each will get its own install section under its platform. Platform-independent material (tools, use cases, licensing) lives here and applies to all of them.
{{< /alert >}}

Install and register the GroupDocs.Signature MCP server in Claude Desktop, VS Code, Cursor, or any MCP client in three commands with the guided [installer](https://github.com/groupdocs/GroupDocs.Mcp.Installer) — then verify the setup automatically:

```powershell
git clone https://github.com/groupdocs/GroupDocs.Mcp.Installer.git
cd GroupDocs.Mcp.Installer

# wizard: products, channel, clients, folders, license
./install-groupdocs-mcp.ps1 -Interactive
# preview - prints everything, changes nothing
./install-groupdocs-mcp.ps1 -DryRun
# apply + warm caches + verify the setup in one go
./install-groupdocs-mcp.ps1 -Verify
```

Then **restart your AI client** (Claude Desktop, VS Code, Cursor, …) so it picks up the new server.

## Your first prompt

Put a document to sign (say `contract.pdf`) into the storage folder you chose, then ask your agent:

> Sign contract.pdf with a QR code containing our order reference

The agent calls `sign` and saves the signed copy to your output folder. The document — and, for digital signatures, your certificate — stay on your machine.

## Where to go next

* **Fresh machine?** Follow your OS page — it includes the prerequisite bootstrap:
  [Windows]({{< ref "signature/net/mcp/windows-installation.md" >}}) · [Linux]({{< ref "signature/net/mcp/linux-installation.md" >}}) · [macOS]({{< ref "signature/net/mcp/macos-installation.md" >}})
* **Manual or single-client install** (exact JSON per client): [Register in AI clients]({{< ref "signature/net/mcp/install-in-ai-clients.md" >}})
* **Docker-only shop:** run `./install-groupdocs-mcp.ps1 -EmitCompose -Clients @()` to generate a `docker-compose.yml` instead of client registration — see [Configuration]({{< ref "signature/net/mcp/configuration.md" >}}).
* **Licensing:** the server works in evaluation mode out of the box; your existing GroupDocs.Signature license applies — [Licensing]({{< ref "signature/mcp/getting-started/licensing.md" >}}).
