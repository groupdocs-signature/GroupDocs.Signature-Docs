---
id: skip-external-resources
url: /signature/net/use-cases/skip-external-resources/
title: How to Load Untrusted Documents Safely in .NET - 4 Practical Tutorials
weight: 1
description: "External resources are skipped by default from GroupDocs.Signature 26.9. Four tutorials: the safe default, whitelisting a trusted host, restoring the old behaviour, and signing an untrusted document without any network access."
keywords: external resources, ssrf, skipexternalresources, whitelistedresources, loadoptions, document security, untrusted documents, groupdocs signature, dotnet signing, document preview
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[skip-external-resources-when-signing-dotnet](https://github.com/groupdocs-signature/skip-external-resources-when-signing-dotnet)
{{< /alert >}}

## Getting Started

Safe document loading is a GroupDocs.Signature behaviour for .NET that stops a document's linked resources from being fetched while it is opened. From version 26.9, `LoadOptions.SkipExternalResources` defaults to `true`, which means a Word file whose picture lives on a remote server is rendered with a placeholder rather than a download.

These four tutorials work through what that changes: the default path, the whitelist for documents that legitimately link somewhere, the switch that restores the old behaviour, and the case the change was made for - signing a file that arrived from outside.

## What This Tutorial Covers

Which document features count as external resources, why fetching them on a server is a security problem rather than a performance one, how to allow exactly one trusted host, and how to confirm from output sizes that nothing was downloaded.

## Prerequisites

- .NET SDK 8.0 and GroupDocs.Signature 26.9.0
- A document with a linked, not embedded, picture - the sample ships one
- Outbound access to the whitelisted host, for the one tutorial that needs it

## Understanding the Problem

### Why Loading Linked Resources Is Risky

A document can point at an address and ask whoever opens it to fetch that address. On a desktop that is a convenience. On a server it means an attacker who can upload a file decides which URLs your infrastructure requests.

The consequences are the familiar server-side request forgery set: internal addresses that are not reachable from outside become reachable through your service, a UNC path can prompt a Windows host to send credentials to an attacker-controlled server, and an unreachable host can hang the loading thread until it times out. None of that requires a vulnerability in the document library - it is the documented behaviour of following a link.

### How GroupDocs.Signature Solves This

By not following it. From 26.9 external resources are skipped unless you ask for them, and asking is granular: `WhitelistedResources` names the addresses that may still be fetched, so a company CDN keeps working while everything else stays blocked.

## Tutorial 1: Load with the safe default

### What You'll Learn

What the new default does, and how to see it.

### Step 1: Implementation

```csharp
using var signature = new Signature(sourcePath);
return SavePagePreview(signature, previewPath);
```

### Step 2: Read the size

The preview PNG is smaller than one rendered with the picture, because the picture was never downloaded - the page shows an empty placeholder. Comparing byte sizes is the simplest proof available that no request went out.

### Common Issues and Solutions

If a preview that used to contain a picture is suddenly blank after upgrading, this is why. It is the intended behaviour, and the fix is either to accept it for untrusted input or to whitelist the host in tutorial 2.

## Tutorial 2: Whitelist a trusted address

### What You'll Learn

How to allow one host without allowing all of them.

### Step 1: Implementation

```csharp
var loadOptions = new LoadOptions
{
    WhitelistedResources = new List<string> { trustedAddress }
};

using var signature = new Signature(sourcePath, loadOptions);
return SavePagePreview(signature, previewPath);
```

### Step 2: Choose the fragment carefully

Matching is a case-insensitive substring test against the resource address. That makes short fragments dangerous: `github` matches `github.attacker.example/payload.png` just as happily as the host you meant. Use a scheme, host and path - the sample uses `raw.githubusercontent.com/groupdocs-signature/`.

I shortened a fragment to a bare host name while testing this and it matched an address I had not intended; the test
passed, which was worse than failing.

### Troubleshooting

If the whitelisted preview is the same size as the default one, the fetch did not happen. Check outbound access to the host before suspecting the whitelist: the sample prints a hint for exactly this case rather than failing.

## Tutorial 3: Restore the previous behaviour

### What You'll Learn

How to turn the default off, and when that is defensible.

### Step 1: Implementation

```csharp
var loadOptions = new LoadOptions { SkipExternalResources = false };

using var signature = new Signature(sourcePath, loadOptions);
return SavePagePreview(signature, previewPath);
```

### Best Practices

Reserve this for documents your own systems produced. And watch the naming: the obsolete `LoadExternalResources` property has the opposite polarity, so `SkipExternalResources = false` is what replaces `LoadExternalResources = true`. Setting the new property to the old property's value inverts your intent without any error.

## Tutorial 4: Sign an untrusted document

### What You'll Learn

That signing needs no network access at all.

### Step 1: Implementation

```csharp
using var signature = new Signature(sourcePath);

var options = new QrCodeSignOptions("Approved by GroupDocs.Signature")
{
    EncodeType = QrCodeTypes.QR,
    Left = 400,
    Top = 50,
    Width = 120,
    Height = 120
};

SignResult result = signature.Sign(outputPath, options);
return result.Succeeded.Count;
```

### Step 2: Check what the output keeps

The signed document still contains the link. Nothing was fetched while loading, signing or saving, but the reference is preserved, so a user opening the file in Word later resolves the picture on their own machine. Skipping is a server-side policy, not an edit to the document.

### Security Considerations

This is the flow worth standardising for uploads: accept the file, sign it with the default load settings, store it. The document never gets a chance to make your infrastructure issue a request, and the user-visible result is unchanged.

## Which load mode should I use?

Default for anything that came from outside your systems - users, e-mail, partners, anything you did not generate. Whitelist when your own templates legitimately reference a known host, and make the fragment long enough to be unambiguous. Turn skipping off only for documents your own application produced, and even then ask whether the preview actually needs the remote picture.

| Source of the document | Mode | Why |
|---|---|---|
| User upload | default | the uploader must not choose your outbound requests |
| Partner system | whitelist their host | legitimate links, bounded exposure |
| Your own generator | `SkipExternalResources = false` | you control what the document references |
| Unknown provenance | default | the safe answer when the question is unclear |

### How do I prove nothing was fetched?

Compare output sizes rather than trusting the setting. Render the document under the default and again with the host
whitelisted: if the second preview is larger, the picture came down; if the two match, nothing did. For a stronger check,
point the document at a host you control and watch its access log while the preview runs - a configuration that looks correct
and a request that did not happen are different claims, and only the second one matters.

## Common Questions

**Does this change the document I sign?**
No. The link is preserved in the output; it is simply not followed while your process has the file open. A recipient opening the signed document sees the picture as before.

**Is embedded content affected?**
No. Only linked resources are skipped - embedded pictures are already part of the file and are rendered normally.

**What about SVG style sheets?**
Same rule. The images and style sheets an SVG references are external resources and are skipped under the default, which matters because SVG is a common upload format and a common SSRF vector.

## Summary and Next Steps

The default changed so that the dangerous case needs an explicit decision rather than the safe one. Keep the default for untrusted input, whitelist narrowly when you must, and verify with the output size rather than trusting the setting. Run the sample once and the three preview sizes will tell you, for your own document, exactly what is being fetched and what is not.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/skip-external-resources-net/) - the SSRF reasoning behind the new default
- [Generate Document Pages Preview](https://docs.groupdocs.com/signature/net/generate-document-pages-preview/) - the `PreviewOptions` reference
- [eSign Document with QR Code Signature](https://docs.groupdocs.com/signature/net/esign-document-with-qr-code-signature/) - the signing options used here
- [Product documentation](https://docs.groupdocs.com/signature/net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/net/) - full API details for GroupDocs.Signature for .NET
