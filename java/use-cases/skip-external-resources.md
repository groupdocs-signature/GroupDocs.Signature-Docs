---
id: skip-external-resources
url: /signature/java/use-cases/skip-external-resources/
title: How to Load Untrusted Documents Safely in Java - 4 Practical Tutorials
weight: 2
description: "External resources are skipped by default from GroupDocs.Signature for Java 26.10. Four tutorials: the safe default, whitelisting a trusted host, restoring the old behaviour, and signing an untrusted document without any network access."
keywords: external resources, ssrf, setskipexternalresources, setwhitelistedresources, loadoptions, document security, untrusted documents, groupdocs signature, java signing, document preview
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
Runnable examples are available on GitHub: the `SkipExternalResourcesWhenLoading` and `LoadWhitelistedExternalResources` classes of the
[GroupDocs.Signature for Java examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java), with a sample Word document that links to a picture instead of storing it.
{{< /alert >}}

## Getting Started

Safe document loading is a GroupDocs.Signature behaviour for Java that stops a document's linked resources from being fetched while it is opened. From version 26.10, `LoadOptions.getSkipExternalResources()` returns `true` by default, which means a Word file whose picture lives on a remote server is rendered with a placeholder rather than a download.

These four tutorials work through what that changes: the default path, the whitelist for documents that legitimately link somewhere, the switch that restores the old behaviour, and the case the change was made for - signing a file that arrived from outside.

## What This Tutorial Covers

Which document features count as external resources, why fetching them on a server is a security problem rather than a performance one, how to allow exactly one trusted host, and how to confirm from output sizes that nothing was downloaded.

## Prerequisites

- Java 8 or later and GroupDocs.Signature for Java 26.10 (Maven artifact `com.groupdocs:groupdocs-signature`)
- A document with a linked, not embedded, picture - the examples repository ships one (`sample_external_image.docx`)
- Outbound access to the whitelisted host, for the one tutorial that needs it

## Understanding the Problem

### Why Loading Linked Resources Is Risky

A document can point at an address and ask whoever opens it to fetch that address. On a desktop that is a convenience. On a server it means an attacker who can upload a file decides which URLs your infrastructure requests.

The consequences are the familiar server-side request forgery set: internal addresses that are not reachable from outside become reachable through your service, a UNC path can prompt a Windows host to send credentials to an attacker-controlled server, and an unreachable host can hang the loading thread until it times out. None of that requires a vulnerability in the document library - it is the documented behaviour of following a link.

### How GroupDocs.Signature Solves This

By not following it. From 26.10 external resources are skipped unless you ask for them, and asking is granular: `setWhitelistedResources` names the addresses that may still be fetched, so a company CDN keeps working while everything else stays blocked.

## A helper: save the page preview

The tutorials compare page previews, so they share one helper. It renders the page of a one-page document as PNG and returns the file size.

```java
static long savePagePreview(Signature signature, final String previewPath) throws Exception
{
    PreviewOptions previewOptions = new PreviewOptions(new PageStreamFactory() {
        @Override
        public OutputStream createPageStream(int pageNumber) {
            try {
                return new FileOutputStream(previewPath);
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        @Override
        public void closePageStream(int pageNumber, OutputStream pageStream) {
            try {
                pageStream.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    });
    previewOptions.setPreviewFormat(PreviewFormats.PNG);
    signature.generatePreview(previewOptions);
    return new File(previewPath).length();
}
```

## Tutorial 1: Load with the safe default

### What You'll Learn

What the new default does, and how to see it.

### Step 1: Implementation

```java
Signature signature = new Signature(sourcePath);
try
{
    return savePagePreview(signature, previewPath);
}
finally
{
    signature.dispose();
}
```

### Step 2: Read the size

The preview PNG is smaller than one rendered with the picture, because the picture was never downloaded - the page shows an empty placeholder. Comparing byte sizes is the simplest proof available that no request went out.

### Common Issues and Solutions

If a preview that used to contain a picture is suddenly blank after upgrading, this is why. It is the intended behaviour, and the fix is either to accept it for untrusted input or to whitelist the host in tutorial 2.

## Tutorial 2: Whitelist a trusted address

### What You'll Learn

How to allow one host without allowing all of them.

### Step 1: Implementation

```java
List<String> whitelistedResources = new ArrayList<String>();
whitelistedResources.add(trustedAddress);

LoadOptions loadOptions = new LoadOptions();
loadOptions.setWhitelistedResources(whitelistedResources);

Signature signature = new Signature(sourcePath, loadOptions);
try
{
    return savePagePreview(signature, previewPath);
}
finally
{
    signature.dispose();
}
```

### Step 2: Choose the fragment carefully

Matching is a case-insensitive substring test against the resource address. That makes short fragments dangerous: `github` matches `github.attacker.example/payload.png` just as happily as the host you meant. Use a scheme, host and path - the `LoadWhitelistedExternalResources` example uses `https://raw.githubusercontent.com/groupdocs-signature/`. Empty entries are ignored, so an empty string cannot open the whitelist to every address.

### Troubleshooting

If the whitelisted preview is the same size as the default one, the fetch did not happen. Check outbound access to the host before suspecting the whitelist.

## Tutorial 3: Restore the previous behaviour

### What You'll Learn

How to turn the default off, and when that is defensible.

### Step 1: Implementation

```java
LoadOptions loadOptions = new LoadOptions();
loadOptions.setSkipExternalResources(false);

Signature signature = new Signature(sourcePath, loadOptions);
try
{
    return savePagePreview(signature, previewPath);
}
finally
{
    signature.dispose();
}
```

### Best Practices

Reserve this for documents your own systems produced. And watch the naming: the deprecated `setLoadExternalResources` method has the opposite polarity, so `setSkipExternalResources(false)` is what replaces `setLoadExternalResources(true)`. Passing the old method's value to the new one inverts your intent without any error.

## Tutorial 4: Sign an untrusted document

### What You'll Learn

That signing needs no network access at all.

### Step 1: Implementation

```java
Signature signature = new Signature(sourcePath);
try
{
    QrCodeSignOptions options = new QrCodeSignOptions("Approved by GroupDocs.Signature");
    options.setEncodeType(QrCodeTypes.QR);
    options.setLeft(400);
    options.setTop(50);
    options.setWidth(120);
    options.setHeight(120);

    SignResult result = signature.sign(outputPath, options);
    return result.getSucceeded().size();
}
finally
{
    signature.dispose();
}
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
| Your own generator | `setSkipExternalResources(false)` | you control what the document references |
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
Same rule. The images and style sheets an SVG references are external resources and are skipped under the default, which matters because SVG is a common upload format and a common SSRF vector. An SVG image that is not well-formed XML is rejected with `GroupDocsSignatureException` while resources are skipped.

**What about documents inside an archive?**
They get the settings you pass for the archive.

## Summary and Next Steps

The default changed so that the dangerous case needs an explicit decision rather than the safe one. Keep the default for untrusted input, whitelist narrowly when you must, and verify with the output size rather than trusting the setting.

## See Also

- [How to control external resources]({{< ref "signature/java/developer-guide/advanced-usage/loading/skip-external-resources.md" >}}) - the `LoadOptions` methods in detail
- [Network access and data privacy]({{< ref "signature/java/getting-started/network-access-and-data-privacy.md" >}}) - every situation in which the library uses the network
- [Generate Document Pages Preview](https://docs.groupdocs.com/signature/java/generate-document-pages-preview/) - the `PreviewOptions` reference
- [eSign Document with QR Code Signature](https://docs.groupdocs.com/signature/java/esign-document-with-qr-code-signature/) - the signing options used here
- [Product documentation](https://docs.groupdocs.com/signature/java/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/java/) - full API details for GroupDocs.Signature for Java
