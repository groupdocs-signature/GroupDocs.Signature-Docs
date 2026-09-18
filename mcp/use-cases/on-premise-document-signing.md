---
id: mcp-uc-on-premise-document-signing
url: signature/mcp/use-cases/on-premise-document-signing
title: "Running GroupDocs MCP servers on-premise: architecture and security model"
linkTitle: On-premise deployment
weight: 5
description: "Run document signing for AI agents fully on-premise: local stdio transport, no external endpoints, no telemetry, and signing certificates that never leave your machine."
keywords: on-premise MCP server, air-gapped document signing, MCP security model, local certificate signing AI, no cloud esign
productName: GroupDocs.Signature MCP Server
toc: True
structuredData:
    showOrganization: True
    howTo:
        name: "Running GroupDocs MCP servers on-premise: architecture and security model"
        description: "Run document signing for AI agents fully on-premise: local stdio transport, no external endpoints, no telemetry, and signing certificates that never leave your machine."
        steps:
        - name: "Run the pinned image inside the perimeter"
          text: "Start the GroupDocs.Signature MCP server from its versioned Docker image as a child process of the AI client."
        - name: "Mount only the folders the agent may reach"
          text: "Map the document folder read-write and the license folder read-only."
        - name: "Choose the license mode"
          text: "Use a license file for fully offline operation; metered licensing needs outbound egress for usage reports."
---

Run document signing for AI agents **fully on-premise**: the GroupDocs.Signature MCP server uses local stdio transport with **no external endpoints, no inbound ports, and no telemetry** — suitable for regulated environments where neither documents nor signing certificates may leave the network. This page is the one to send your security reviewer.

{{< alert style="info" >}}
The commands and config snippets on this page are for the **.NET** build of the server — the only platform available today. Installation and client setup: [MCP server for .NET]({{< ref "signature/net/mcp/_index.md" >}}). Other platforms will expose the same tools with their own launch command; everything else on this page applies unchanged.
{{< /alert >}}

## The architecture in one picture

```text
+--------------+          +--------------------+         +------------------+
|  AI client   |  stdio   | MCP server process | reads / | local filesystem |
| (Claude, VS  | <----->  | (GroupDocs engine) | <-----> | storage / output |
| Code, agent) | JSON-RPC |   child process    |  writes |     folders      |
+--------------+          +--------------------+         +------------------+
```

* **Transport:** the AI client *starts the server as a child process* and communicates over standard input/output. The server never listens on a network socket — there is nothing to firewall, nothing to expose.
* **Data path:** agent → local server → local filesystem. Documents and signed copies are read and written in the folders you configure; no document content is transmitted anywhere.
* **Network use:** only at install time (pulling the package from nuget.org or the image from ghcr.io/docker.io). At runtime the server makes no outbound calls. In an air-gapped segment, pre-pull the image or pre-cache the package and pin the version.
* **Telemetry:** none. The server does not phone home, and the engine processes documents in-process.

## The certificate question

For a signing server this is the question a reviewer will ask first: **where does the private key go?**

It stays on your machine. A `digital` signing call takes a certificate file path and a password; both are resolved locally by the local server process, the signing happens in-process, and neither the key nor the password is transmitted anywhere. There is no signing service in this architecture — no HSM proxy, no cloud key vault, no round trip.

Two practical consequences:

* **Protect the password like any other secret.** Prefer an environment variable over a literal in a committed client config; the same guidance as for [metered keys]({{< ref "signature/mcp/getting-started/licensing.md" >}}#keeping-the-private-key-out-of-committed-files) applies.
* **Mount deliberately in Docker.** Give the container the certificate folder read-only, and only the document folders the agent should reach.

What *does* travel to your model provider is the conversation: file names, decoded QR values the agent reports back, and any signature details it quotes. With a cloud-hosted model, assume anything the agent says out loud has left the building. Pair with a locally-hosted model and the whole loop stays inside the perimeter.

## Docker deployment inside the perimeter

```bash
docker run --rm -i \
  -v /srv/contracts:/data \
  -v /srv/certs:/certs:ro \
  -v /srv/licenses:/license:ro \
  -e GROUPDOCS_MCP_STORAGE_PATH=/data \
  -e GROUPDOCS_LICENSE_PATH=/license/GroupDocs.Signature.lic \
  ghcr.io/groupdocs-signature/signature-net-mcp:26.9.0
```

* Pin the tag (`:26.9.0`, not `:latest`) so a rebuild cannot change behaviour underneath you.
* Certificates and licence read-only; documents read-write.
* Images are multi-arch (linux/amd64 + linux/arm64) and carry every native dependency.

## License management

* **License file** — read from local disk by the local process. Fully offline; the right answer for air-gapped deployments.
* **Metered (pay-per-use)** — reports *usage* to GroupDocs servers, so it needs outbound egress. Document content and certificates are never part of that report, but the connection must be allowed.

Both are covered in [Licensing]({{< ref "signature/mcp/getting-started/licensing.md" >}}).

## What this fits — honestly

**A good fit:** internal signing and verification workflows, compliance checks over document archives, regulated industries, air-gapped networks, and any team whose policy forbids sending documents or certificates to a third-party service.

**Not what this is:** a signing service or a qualified trust service provider. It applies signatures with the certificate you give it, on one machine, for one client process. Whether a resulting signature satisfies a particular legal regime (eIDAS qualified, for example) depends on the certificate and the process around it, not on this server.

## FAQ

**Does my certificate or its password leave the machine?** No. Both are read locally and used in-process.

**Does any document content leave the machine?** Not from the server. What the agent quotes back to you travels in the conversation to your model provider.

**Does it need internet at runtime?** No — only to fetch the package or image at install time, and only when metered licensing is enabled.

**What ports does it open?** None. stdio only.

**How do I prove that?** Run it and watch: no listening sockets, no outbound connections while signing. The [verification script]({{< ref "signature/net/mcp/troubleshooting.md" >}}#verifying-an-installation-end-to-end) performs a real handshake and a real engine call so you can observe exactly what happens.
