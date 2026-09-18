---
id: mcp-troubleshooting-faq
url: signature/mcp/troubleshooting-faq
title: Troubleshooting & FAQ
weight: 5
description: "Solutions to the most common GroupDocs.Signature MCP server issues — server not appearing in the client, startup failures, missing native dependencies, and first-launch timeouts."
keywords: MCP server not showing up in Claude Desktop, Claude can't see MCP tools, MCP server failed to start, dnx command not found, libgdiplus not found error, sign documents AI agent, verify signature MCP, read QR code from PDF AI, digital signature MCP server
productName: GroupDocs.Signature MCP Server
toc: True
---

Solutions to the most common GroupDocs.Signature MCP server issues — server not appearing in the client, startup failures, missing native dependencies, and first-launch timeouts.

{{< alert style="info" >}}
**Platform-specific troubleshooting:** runtime problems depend on which build you run. For the `dnx` runner, native graphics libraries, and the Docker channel, see [Troubleshooting (.NET)]({{< ref "signature/net/mcp/troubleshooting.md" >}}). The issues on this page apply to every platform.
{{< /alert >}}

## Why is my MCP server not showing up in Claude Desktop?

1. **Restart the client** — every client reads its MCP config only at startup.
2. Check the config file location for your OS ([per-client reference]({{< ref "signature/net/mcp/install-in-ai-clients.md" >}})) and that the entry sits under the right root key (`mcpServers` for Claude Desktop/Cursor/Windsurf, `servers` for VS Code/VS 2022).
3. Validate the JSON — a trailing comma silently breaks the whole file. If you used the [installer](https://github.com/groupdocs/GroupDocs.Mcp.Installer), a timestamped `.bak` of your previous config sits next to the file for comparison.

## The first tool call is slow or fails once, then works

A **cold cache**: on the very first use the server's package or image is still downloading while the client is already waiting on the connection. Warming it once fixes it for good — the exact command depends on your build: [.NET]({{< ref "signature/net/mcp/troubleshooting.md" >}}#the-first-tool-call-is-slow-or-fails-once-and-then-works).

## The server fails to start, or a runtime dependency is missing

These are properties of the build you run rather than of MCP, so the fixes live with the platform:

| Symptom | Where the fix is |
|---|---|
| `dnx: command not found` | [.NET troubleshooting]({{< ref "signature/net/mcp/troubleshooting.md" >}}#dnx-command-not-found) — `dnx` ships inside the .NET 10 SDK |
| `DllNotFoundException: libgdiplus` on Linux/macOS | [.NET troubleshooting]({{< ref "signature/net/mcp/troubleshooting.md" >}}#dllnotfoundexception-libgdiplus) — install the native graphics libraries, or use the Docker image |
| "docker daemon not reachable" | [.NET troubleshooting]({{< ref "signature/net/mcp/troubleshooting.md" >}}#docker-daemon-not-reachable) — start Docker Desktop or `dockerd` |

## The agent says a file does not exist

Pass the **file name**, not a full path from your machine: the server resolves names inside its configured storage folder. When a name is not found the tool responds with the list of files it can see, so the agent can correct itself — check that list against [`GROUPDOCS_MCP_STORAGE_PATH`]({{< ref "signature/net/mcp/configuration.md" >}}).

## Is a QR code signature a legally binding signature?

No. **Text, QR code, barcode, and image signatures are visual marks** — they carry information and are excellent for tracking, routing, and machine-readable references, but they do not prove who signed or that the file is unaltered. Only a **digital** signature, backed by a certificate, does that. Ask for `type: "digital"` when the legal property matters, and use [`verify`]({{< ref "signature/mcp/tools-reference/verify.md" >}}) or [`search_digital_signatures`]({{< ref "signature/mcp/tools-reference/search-digital-signatures.md" >}}) to check it.

## Where does my certificate live?

On your machine. A digital signature takes a certificate file and its password, both resolved locally by the local server process — nothing about the certificate is transmitted anywhere. Treat the password like any other secret: prefer an environment variable over a literal in a committed client config, exactly as for [metered keys]({{< ref "signature/mcp/getting-started/licensing.md" >}}#keeping-the-private-key-out-of-committed-files).

## Why did signing only affect the first two pages?

Evaluation mode: only the first two pages are processed, and every page gets a trial badge. On a longer document that means a signature you asked for on page 5 silently never lands. Check with [`get_license_status`]({{< ref "signature/mcp/tools-reference/get-license-status.md" >}}) before trusting any signing run.

## Which search tool do I need?

`search_qr_codes` and `search_barcodes` read machine-readable codes; `search_text_signatures` finds embedded text stamps and labels — **not** ordinary body text; `search_image_signatures` returns embedded logos and stamp images as PNGs; `search_digital_signatures` returns certificate details. If you only want "is this signed and is it valid", [`verify`]({{< ref "signature/mcp/tools-reference/verify.md" >}}) answers in one call.

## Can it sign a document that is already signed?

Yes — signatures accumulate. Be aware that adding a visual signature to a digitally signed file invalidates the existing digital signature, because the bytes change. Sign digitally **last**.

## Verifying an installation end-to-end

Ask your agent *"list your GroupDocs signature tools and the license status"* — it should name `sign`, `verify`, `search_digital_signatures`, `search_qr_codes`, `search_barcodes`, `search_text_signatures`, `search_image_signatures`, `get_document_info`, `get_license_status`. For a scripted check that performs the real MCP handshake and a live call through the engine, see [verifying a .NET installation]({{< ref "signature/net/mcp/troubleshooting.md" >}}#verifying-an-installation-end-to-end).

## Still stuck?

Post your config (redact license paths) and the client name in the [Signature forum](https://forum.groupdocs.com/c/signature/11) — we answer MCP questions daily. Bugs: [GitHub issues](https://github.com/groupdocs-signature/GroupDocs.Signature.Mcp/issues).
