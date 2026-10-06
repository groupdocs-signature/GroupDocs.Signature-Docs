# GroupDocs.Signature Docs — AGENTS.md

> Instructions for AI agents working with **GroupDocs.Signature** documentation in this repository.

GroupDocs.Signature is an on-premise SDK for adding, searching, verifying, updating, and deleting electronic signatures (text, image, digital, barcode, QR code, stamp, form field, and metadata) in PDF, Microsoft Office, OpenDocument, and image files.

**Supported formats (canon):** the per-platform tables below. Format lists differ between platforms, so do not quote one platform's list or count for another.

## Platforms in this docs tree

| Platform slug | Docs hub | Formats table |
|---|---|---|
| `net` | [net/_index.md](net/_index.md) | [net/getting-started/supported-document-formats.md](net/getting-started/supported-document-formats.md) |
| `java` | [java/_index.md](java/_index.md) | [java/getting-started/supported-document-formats.md](java/getting-started/supported-document-formats.md) |
| `python-net` | [python-net/_index.md](python-net/_index.md) | [python-net/getting-started/supported-file-formats.md](python-net/getting-started/supported-file-formats.md) |
| `nodejs-java` | [nodejs-java/_index.md](nodejs-java/_index.md) | [nodejs-java/developer-guide/basic-usage/get-supported-document-formats.md](nodejs-java/developer-guide/basic-usage/get-supported-document-formats.md) |
| `mcp` | [mcp/_index.md](mcp/_index.md) | [mcp/supported-formats.md](mcp/supported-formats.md) |

## .NET target frameworks (canon)

When documenting .NET install/runtime requirements, use: **net462** (.NET Framework 4.6.2 or later), **net6.0**, **net8.0**, **net10.0** (do not invent other TFMs). The .NET Standard 2.1 build was removed in 26.9.

## Product lines (do not confuse)

| Line | Where to send readers |
|---|---|
| **On-premise SDK** (this docs tree) | Platform hubs above; examples repos; NuGet / Maven / PyPI / npm packages |
| **GroupDocs.Signature MCP server** (this docs tree, `mcp/` and `net/mcp/`) | An MCP server that signs and verifies documents for AI agents |
| **GroupDocs Cloud** | Separate Cloud product docs/packages — do not mix install snippets |
| **Docs MCP** | Link only: [https://docs.groupdocs.com/mcp](https://docs.groupdocs.com/mcp) — do not edit MCP repos from this surface |

## Editing conventions

- The public URL of a page comes from its `url:` front matter, not from its file path. Keep `url:` unchanged when you move or rename a file.
- `{{< ref "..." >}}` resolves content paths: after moving a file, update every `ref` that points to it.
- Redirects are Hugo `aliases:` front matter on the destination page (see `common/config.toml`).
- Menu titles (`title:`, `linkTitle:`) are plain text: no emoji.
- Code examples on a page have runnable counterparts in the platform's examples repository; keep the two in sync.

## Useful entry URLs

| Resource | URL |
|---|---|
| Docs home | [https://docs.groupdocs.com/signature/](https://docs.groupdocs.com/signature/) |
| Products | [https://products.groupdocs.com/signature/](https://products.groupdocs.com/signature/) |
| Releases | [https://releases.groupdocs.com/signature/](https://releases.groupdocs.com/signature/) |
| Examples (.NET) | [https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET) |
| Examples (Java) | [https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java) |
| Examples (Python) | [https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET) |
| Examples (Node.js) | [https://github.com/groupdocs-signature/GroupDocs.Signature-for-Node.js-via-Java](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Node.js-via-Java) |

Also see [llms.txt](llms.txt) in this repository root for a compact machine-oriented index.
