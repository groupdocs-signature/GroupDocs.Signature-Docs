---
id: sdk-cloud-mcp
url: signature/net/sdk-cloud-mcp
title: SDK, Cloud or MCP?
linkTitle: SDK, Cloud or MCP?
weight: 8
description: "Choose between GroupDocs.Signature for .NET (the on-premise SDK), GroupDocs.Signature Cloud (a hosted REST API) and the GroupDocs.Signature MCP server (signing tools for AI agents)."
keywords: GroupDocs.Signature, .NET, C#, SDK, Cloud, REST API, MCP, Model Context Protocol, AI agents, electronic signature, decision guide
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---

GroupDocs.Signature reaches .NET applications in three ways. They share the signing engine but differ in where the documents are processed and who writes the code. This page helps you pick one.

## At a glance

| | GroupDocs.Signature for .NET (SDK) | GroupDocs.Signature Cloud | GroupDocs.Signature MCP server |
|---|---|---|---|
| **What it is** | A NuGet package (`dotnet add package GroupDocs.Signature`) | A hosted REST API with a .NET SDK | A Model Context Protocol server with signing tools |
| **Who calls it** | Your C# code | Your code, over HTTPS | An AI agent (Claude, Cursor, GitHub Copilot and other MCP clients) |
| **Where documents go** | Stay on your machine or server | Uploaded to GroupDocs Cloud storage | Stay on the machine that runs the server |
| **Internet access** | Not needed to sign or verify; time stamps, certificate chain and revocation checks, and metered licences contact their servers when you use them | Required | Not needed once installed |
| **What you can do** | Every signature type and operation: sign, search, verify, update, delete, previews, document info | Signing, verification and search through REST endpoints | Sign with text, QR code, barcode or digital signatures, verify signatures, search existing signatures, read document information |
| **Runs on** | .NET Framework 4.6.2 or later (Windows); .NET 6, .NET 8 and .NET 10 (Windows, Linux, macOS) | Any platform that can make HTTPS calls | .NET server, or its Docker image |
| **Licensing** | GroupDocs.Signature license (evaluation mode without one) | GroupDocs Cloud subscription | GroupDocs.Signature license |

## Choose the SDK when

- Documents must not leave your environment (compliance, air-gapped systems, on-premise deployments). [Network access and data privacy]({{< ref "signature/net/getting-started/network-access-and-data-privacy.md" >}}) lists every request the library can make.
- You need the whole API: all signature types, appearance control, previews, search, update and delete.
- You sign many documents in batch jobs and want no network round trips.

Start with [Installation]({{< ref "signature/net/getting-started/installation.md" >}}) and the [Features overview]({{< ref "signature/net/getting-started/features-overview.md" >}}).

## Choose GroupDocs.Signature Cloud when

- You prefer a managed service to installing and updating a package.
- Your application already works with cloud storage, or runs where installing native dependencies (such as libgdiplus on Linux) is not possible.

See the [GroupDocs.Signature Cloud documentation](https://docs.groupdocs.cloud/signature/).

## Choose the MCP server when

- An AI agent should sign or check documents itself, as a step in a conversation or a workflow, without you writing signing code.
- You want local processing for an agent: the server runs next to your project, and documents stay on that machine.

See the [GroupDocs.Signature MCP server]({{< ref "signature/mcp/_index.md" >}}) documentation.

## Combine them

- **SDK + documentation MCP server**: when an AI coding assistant writes C# against this package, connect it to the [documentation MCP server](https://docs.groupdocs.com/mcp) and point it at the `AGENTS.md` and `llms.txt` of the [.NET examples repository](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET).
- **SDK in production, MCP server for prototyping**: let an agent try signing scenarios through the MCP server, then implement the chosen workflow with the SDK.
