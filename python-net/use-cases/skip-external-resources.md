---
id: skip-external-resources
url: /signature/python-net/use-cases/skip-external-resources/
title: Integrating Safe Document Loading into a Python Upload Pipeline
weight: 1
description: "External resources are skipped by default from GroupDocs.Signature 26.9. How to wire the three load modes into a Python service that renders and signs uploaded documents, with the whitelist rules and the measured proof that nothing was fetched."
keywords: external resources, ssrf, skip_external_resources, whitelisted_resources, loadoptions, untrusted documents, python signing, document preview
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[load-untrusted-documents-safely-python](https://github.com/groupdocs-signature/load-untrusted-documents-safely-python)
{{< /alert >}}

## Overview

Skipping external resources is the GroupDocs.Signature load policy for Python that keeps a document's linked addresses from being requested while the file is opened. Since version 26.9 it is the default, which changes what an upload pipeline does on its own: a Word file whose picture sits on a remote server now renders with a placeholder, and no request leaves the machine.

This page is about wiring that into a service rather than demonstrating it. Where the load policy belongs, how to allow the one host you trust without allowing the rest, what to log, and how to prove from the output that nothing was fetched.

## Quickstart

The policy is a constructor argument, so the smallest useful change to an existing pipeline is no change at all - the safe behaviour arrives with the upgrade:

```python
with signature.Signature(source_path) as sign:
    return save_page_preview(sign, preview_path)
```

To allow a known host, build a `LoadOptions` and pass it second:

```python
load_options = LoadOptions()
load_options.whitelisted_resources = [trusted_address]

with signature.Signature(source_path, load_options) as sign:
    return save_page_preview(sign, preview_path)
```

## Prerequisites

- Python 3.9 or later, 64-bit, with `groupdocs-signature-net` 26.10.0
- A document whose picture is linked rather than embedded, if you want to see the difference
- Outbound access to the whitelisted host, for the whitelist pattern only

## Core Concepts

Three properties carry the whole policy. `skip_external_resources` is `True` by default and decides whether linked addresses are requested at all. `whitelisted_resources` is a list of address fragments that may still be fetched while everything else stays blocked. `load_external_resources` is the obsolete property that means the opposite, and is the single most likely source of a mistake here.

What counts as external: linked pictures rather than embedded ones, INCLUDEPICTURE fields, linked pictures in presentations and spreadsheets, and the images and style sheets an SVG references. Embedded content is untouched, because it is already in the file.

## Integration Patterns

### Pattern 1: Untrusted intake

Anything a user, an e-mail or a partner system sent you. Open with no `LoadOptions` and let the default stand. There is nothing to configure, which is the point - the pattern survives a developer who has never heard of this page. Render thumbnails, sign, store, and the document never gets to choose an outbound request.

### Pattern 2: Your own templates with a known host

Documents your systems generate often link to a company CDN. Whitelist that host and nothing else. Keep the fragment long - a scheme, host and path - because matching is a case-insensitive substring test, so `github` would also match `github.attacker.example/payload.png`. Store the fragment in configuration rather than in code, since a CDN move should not need a deployment.

### Pattern 3: Trusted internal rendering

For documents your own application produced and stores, `skip_external_resources = False` restores the pre-26.9 behaviour. Scope it to that code path only. If this value is ever computed from configuration shared with Pattern 1, you have moved the decision away from the place that can judge it.

## Configuration Reference

| Property | Type | Default | Effect |
|---|---|---|---|
| `skip_external_resources` | bool | `True` | when true, no linked address is requested during load |
| `whitelisted_resources` | list of str | empty | address fragments that may still be fetched, matched case-insensitively |
| `load_external_resources` | bool | obsolete | the inverse of the above; `skip_external_resources = False` replaces `load_external_resources = True` |

## Error Handling

The quiet failure mode here is not an exception - it is a preview that silently lacks a picture, or one that silently has it. Neither raises. That is why the sample compares output sizes rather than trusting the settings: on its one-page document the default preview is 16,435 bytes and the whitelisted one 51,738, so the linked picture accounts for 35,303 bytes of evidence.

When the two come back identical, nothing was fetched in either case. The usual cause is that the host is unreachable from that machine rather than that the whitelist failed, and a pipeline should say so rather than conclude the policy worked. The sample prints exactly that hint.

I only believed the policy once the two previews were side by side at 16,435 and 51,738 bytes. Reading the property back tells you what you configured, not what the process did, and those are not the same thing on a machine with no outbound access. For a stronger check than file size, point a test document at a host you control and watch its access log while the preview runs.

## What Changes When You Upgrade

For most services, nothing visible, and that is worth stating plainly because a security default that altered behaviour everywhere would not survive an upgrade review. Signing, verification and search are untouched. The exception is anywhere a preview or a thumbnail used to show a linked picture and now shows a placeholder.

That is the change doing its job, and there are only two honest responses: whitelist the host if it is yours, or accept the placeholder if the document came from outside. Before upgrading, the cheapest way to find out whether it affects you is to grep for documents in your corpus that carry linked pictures rather than embedded ones - if none do, the default costs you nothing at all.

## Performance Tips

The default removes a network round trip from every load, and more importantly removes the worst case: a link to a host that never answers, which ties up the loading thread until it times out. If you have ever seen a preview worker pool exhaust itself on documents that looked harmless, this is the shape of that incident. Whitelisting reintroduces the round trip for the allowed host only, so keep the list short and treat each entry as a dependency with its own availability.

## Production Readiness Checklist

- Untrusted intake paths open documents with no `LoadOptions`, and a test asserts that
- Whitelist fragments include a scheme, a host and a path, and live in configuration
- No code path assigns `skip_external_resources` from a value once used for `load_external_resources`
- Preview sizes, or a request log on a host you control, are what verify the policy - not the setting

## Which mode should an upload pipeline use?

The default, for anything that came from outside your systems. Whitelist only when your own templates legitimately reference a host you run, and make the fragment long enough to be unambiguous. Turn skipping off only for documents your application produced, and even then ask whether the preview actually needs the remote picture to be correct.

## Frequently Asked Questions

Q: Does this change the document I sign?
A: No. The link is preserved in the output and simply not followed while your process holds the file. A recipient opening the signed document resolves the picture on their own machine.

Q: Is embedded content affected?
A: No. Only linked resources are skipped; embedded pictures are part of the file and render normally.

Q: What about SVG?
A: Same rule, and worth calling out because SVG is both a common upload format and a common SSRF vector. The images and style sheets an SVG references are external resources and are skipped under the default.

Q: Does signing need the resources?
A: No. A QR-code signature is applied with no outbound request at all, which is what makes the untrusted-intake pattern practical.

## Conclusion

The default changed so that the dangerous case needs an explicit decision and the safe one needs nothing. Keep it for intake, whitelist narrowly where your own hosts are involved, and verify with output sizes rather than with the setting - a configuration that looks correct and a request that did not happen are different claims, and only the second one matters.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/skip-external-resources-python-net/) - the before-and-after of the 26.9 default change
- [Generate Document Pages Preview](https://docs.groupdocs.com/signature/python-net/generate-document-pages-preview/) - the `PreviewOptions` reference
- [eSign Document with QR Code Signature](https://docs.groupdocs.com/signature/python-net/esign-document-with-qr-code-signature/) - the signing options used here
- [Product documentation](https://docs.groupdocs.com/signature/python-net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/python-net/) - full API details for GroupDocs.Signature for Python via .NET
