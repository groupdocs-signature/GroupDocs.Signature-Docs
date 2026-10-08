---
id: sdk-cloud-mcp
url: signature/python-net/sdk-cloud-mcp
title: SDK, Cloud or MCP?
linkTitle: SDK, Cloud or MCP?
weight: 10
description: "Choose between GroupDocs.Signature for Python via .NET (the on-premise SDK), GroupDocs.Signature Cloud (a hosted REST API) and the GroupDocs.Signature MCP server (signing tools for AI agents)."
keywords: GroupDocs.Signature, Python, SDK, Cloud, REST API, MCP, Model Context Protocol, AI agents, electronic signature, decision guide
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

GroupDocs.Signature reaches Python code in three ways. They share the signing engine but differ in where the documents are processed and who writes the code. This page helps you pick one.

## At a glance

| | GroupDocs.Signature for Python via .NET (SDK) | GroupDocs.Signature Cloud | GroupDocs.Signature MCP server |
|---|---|---|---|
| **What it is** | A Python package (`pip install groupdocs-signature-net`) | A hosted REST API with a Python SDK | A Model Context Protocol server with signing tools |
| **Who calls it** | Your Python code | Your code, over HTTPS | An AI agent (Claude, Cursor, GitHub Copilot and other MCP clients) |
| **Where documents go** | Stay on your machine or server | Uploaded to GroupDocs Cloud storage | Stay on the machine that runs the server |
| **Internet access** | Not needed | Required | Not needed once installed |
| **What you can do** | Every signature type and operation: sign, search, verify, update, delete, previews, document info | Signing, verification and search through REST endpoints | Sign with text, QR code, barcode or digital signatures, verify signatures, read QR codes and barcodes |
| **Runs on** | Windows x64, Linux x64, macOS 12+ (Intel and Apple Silicon); Python 3.5 - 3.14 | Any platform that can make HTTPS calls | .NET server, or its Docker image; a Python launcher is planned |
| **Licensing** | GroupDocs.Signature license (evaluation mode without one) | GroupDocs Cloud subscription | GroupDocs.Signature license |

## Choose the SDK when

- Documents must not leave your environment (compliance, air-gapped systems, on-premise deployments).
- You need the whole API: all eight signature types, appearance control, previews, search, update and delete.
- You sign many documents in batch jobs and want no network round trips.

Start with [Installation]({{< ref "signature/python-net/getting-started/installation.md" >}}) and the [Quick Start Guide]({{< ref "signature/python-net/getting-started/quick-start-guide.md" >}}).

## Choose GroupDocs.Signature Cloud when

- You prefer a managed service to installing and updating a package.
- Your application already works with cloud storage, or runs where installing native packages is not possible.

See [GroupDocs.Signature Cloud for Python](https://products.groupdocs.cloud/signature/python/) and its [documentation](https://docs.groupdocs.cloud/signature/).

## Choose the MCP server when

- An AI agent should sign or check documents itself, as a step in a conversation or a workflow, without you writing signing code.
- You want local processing for an agent: the server runs next to your project, and documents stay on that machine.

See the [GroupDocs.Signature MCP server]({{< ref "signature/mcp/_index.md" >}}) documentation.

## Combine them

- **SDK + documentation MCP server**: when an AI coding assistant writes Python code against this package, connect it to the [documentation MCP server](https://docs.groupdocs.com/mcp) and let it read the `AGENTS.md` shipped inside the package. See [Agents and LLM Integration]({{< ref "signature/python-net/agents-and-llm-integration.md" >}}).
- **SDK in production, MCP server for prototyping**: let an agent try signing scenarios through the MCP server, then implement the chosen workflow with the SDK.
