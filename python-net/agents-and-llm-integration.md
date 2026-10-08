---
id: agents-and-llm-integration
url: signature/python-net/agents-and-llm-integration
title: Agents and LLM Integration
linkTitle: Agents and LLMs
description: "GroupDocs.Signature for Python via .NET is AI agent and LLM friendly: machine-readable documentation, MCP servers, AGENTS.md shipped inside the pip package, and runnable code examples for signing and verification steps in AI pipelines."
weight: 9
keywords: AI, LLM, agent, MCP, machine-readable, documentation, Claude, GPT, Copilot, AGENTS.md, electronic signature, verify signature
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

## AI agent and LLM friendly

GroupDocs.Signature for Python via .NET is designed to work with AI agents, LLMs, and code generation tools. The library ships machine-readable documentation in several formats, including an `AGENTS.md` file inside the pip package itself, so that AI assistants can discover and use the API without manual guidance.

## MCP server for the documentation

GroupDocs provides an [MCP (Model Context Protocol) server](https://docs.groupdocs.com/mcp) that lets LLMs query the documentation on demand instead of loading it all at once. This saves tokens and lets your AI assistant fetch only what it needs for the current task.

To connect your AI tool to the MCP server, add the GroupDocs endpoint to your MCP configuration:

{{< tabs "mcp-setup">}}
{{< tab "Claude Code / Claude Desktop" >}}
```json
// Claude Code:    ~/.claude/settings.json (or project .mcp.json)
// Claude Desktop: ~/Library/Application Support/Claude/claude_desktop_config.json
{
  "mcpServers": {
    "groupdocs-docs": {
      "url": "https://docs.groupdocs.com/mcp"
    }
  }
}
```
{{< /tab >}}
{{< tab "GitHub Copilot" >}}
```json
// .vscode/mcp.json in your project root
{
  "servers": {
    "groupdocs-docs": {
      "url": "https://docs.groupdocs.com/mcp"
    }
  }
}
```
{{< /tab >}}
{{< tab "Cursor" >}}
```json
// .cursor/mcp.json in your project root
{
  "mcpServers": {
    "groupdocs-docs": {
      "url": "https://docs.groupdocs.com/mcp"
    }
  }
}
```
{{< /tab >}}
{{< tab "Generic MCP" >}}
```json
// Any MCP-compatible client
{
  "mcpServers": {
    "groupdocs-docs": {
      "url": "https://docs.groupdocs.com/mcp"
    }
  }
}
```
{{< /tab >}}
{{< /tabs >}}

See [https://docs.groupdocs.com/mcp](https://docs.groupdocs.com/mcp) for full setup instructions and the list of available tools.

## MCP server for signing documents

The [GroupDocs.Signature MCP server]({{< ref "signature/mcp/_index.md" >}}) is a separate server that does the work itself: it lets an AI agent sign documents with text, QR code, barcode, or digital signatures, verify signatures, and read the QR codes and barcodes inside documents, locally on your machine. The server is the .NET build of GroupDocs.Signature; its Docker image bundles every dependency, so it runs alongside a Python project without a .NET installation. A Python launcher is planned.

Use the documentation MCP server when an agent writes Python code against this library, and the signing MCP server when the agent itself signs or checks documents. [SDK, Cloud or MCP?]({{< ref "signature/python-net/sdk-cloud-mcp.md" >}}) compares the options.

## AGENTS.md: built into the package

The `groupdocs-signature-net` pip package includes an `AGENTS.md` file at `groupdocs/signature/AGENTS.md`. AI coding assistants that scan installed packages (such as Claude Code, Cursor, and GitHub Copilot) can read it to learn the imports, key patterns, licensing, platform requirements, and troubleshooting tips.

After installing the package, you can find it with:

```bash
pip show -f groupdocs-signature-net | grep AGENTS
```

## Machine-readable documentation

Every documentation page is available as a plain Markdown file that AI tools can fetch and process directly:

| Resource | URL |
|---|---|
| Full documentation (single file) | `https://docs.groupdocs.com/signature/python-net/llms-full.txt` |
| Full documentation (all products) | `https://docs.groupdocs.com/llms-full.txt` |
| Individual page (any page) | Append `.md` to the page URL |
| Quick start guide | `https://docs.groupdocs.com/signature/python-net/getting-started/quick-start-guide.md` |

### How to use with AI tools

Point your AI assistant to the full documentation file for comprehensive context:

```
Fetch https://docs.groupdocs.com/signature/python-net/llms-full.txt and use it
as a reference for GroupDocs.Signature for Python via .NET API.
```

## Why GroupDocs.Signature is a good building block for AI pipelines

Agents that handle documents often need to answer two questions: *is this document signed?* and *can I sign it now?* GroupDocs.Signature answers both with the same API across PDF, Office, OpenDocument, and image files:

- **Check inbound documents**: search incoming files for signatures and verify the expected ones before an agent acts on them.
- **Sign approved documents**: add a text, image, QR code, or certificate-based digital signature once a workflow step is approved.
- **Report signatures as data**: turn the signatures a document carries into structured records for a review queue, an index, or an agent's context.
- **Read machine codes**: decode the barcodes and QR codes on invoices, labels, and forms.

A typical reporting step looks like this:

```python
import json

from groupdocs.signature import Signature
from groupdocs.signature.options import BarcodeSearchOptions, QrCodeSearchOptions, TextSearchOptions

with Signature("signed.pdf") as signature:
    info = signature.get_document_info()
    result = signature.search([TextSearchOptions(), BarcodeSearchOptions(), QrCodeSearchOptions()])
    record = {
        "format": str(info.file_type.file_format),
        "pages": info.page_count,
        "signatures": [
            {
                "type": found.signature_type.name,
                "page": found.page_number,
                "text": found.text,
            }
            for found in result.signatures
        ],
    }
    # feed `record` into your index, an agent's context, or a review queue
    print(json.dumps(record, indent=2))
```

For the [quick start sample](/signature/python-net/_sample_files/getting-started/quick-start-guide/signed.pdf) it prints:

```json
{
  "format": "Portable Document Format File",
  "pages": 1,
  "signatures": [
    {
      "type": "TEXT",
      "page": 1,
      "text": "John Smith"
    }
  ]
}
```

For end-to-end examples of signing, searching, verifying, updating, and deleting signatures, see the [Developer Guide]({{< ref "signature/python-net/developer-guide/_index.md" >}}). Every code example has a runnable counterpart in the [examples repository](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET).

{{< alert style="info" >}}
Without a license, found signatures report masked values and verification of text, barcode, and QR code signatures fails. Set the `GROUPDOCS_LIC_PATH` environment variable before an agent runs these steps. See [Evaluation Limitations and Licensing]({{< ref "signature/python-net/getting-started/evaluation-limitations-and-licensing.md" >}}).
{{< /alert >}}

## Pair with other GroupDocs products

For richer AI document pipelines, chain GroupDocs.Signature with:

- [GroupDocs.Viewer for Python via .NET](https://docs.groupdocs.com/viewer/python-net/): render documents to HTML, PNG, or PDF for vision models and human review.
- [GroupDocs.Conversion for Python via .NET](https://docs.groupdocs.com/conversion/python-net/): convert legacy and exotic formats to PDF before signing.

## See also

- [Quick Start Guide]({{< ref "signature/python-net/getting-started/quick-start-guide.md" >}}): your first signing script in five minutes
- [Developer Guide]({{< ref "signature/python-net/developer-guide/_index.md" >}}): runnable examples for every signature type and operation
- [API Reference](https://reference.groupdocs.com/signature/python-net): full class and method documentation
- [SDK, Cloud or MCP?]({{< ref "signature/python-net/sdk-cloud-mcp.md" >}}): which GroupDocs.Signature product line fits your project
