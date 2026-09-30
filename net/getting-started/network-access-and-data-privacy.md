---
id: network-access-and-data-privacy
url: signature/net/network-access-and-data-privacy
title: Network access and data privacy
weight: 7
description: "When GroupDocs.Signature for .NET makes network requests, what they contain, and how to run it with no network access at all."
keywords: network access, offline, air-gapped, external resources, SSRF, CA certificate, OCSP, CRL, time stamp, LTV, data privacy
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---
Explains when GroupDocs.Signature for .NET accesses the network, what data leaves your machine, and how to prevent outbound requests in air-gapped or security-sensitive deployments.

## Summary

GroupDocs.Signature for .NET is an **on-premise library**. It runs entirely inside your own process, on your own machine and network. It does not send your documents, your signatures, or any customer information to GroupDocs.

As stated in the [GroupDocs Customer Data and Security policy](https://about.groupdocs.com/security/customer-data-and-security/):

> GroupDocs products run on customer's own machines, infrastructure and network and do not send any files back to GroupDocs for processing and therefore does not have access to them.

The library can still make outbound network requests in the situations described below. Most of them happen only when your code asks for them. This topic describes each of them so that you can audit and restrict them.

{{< alert style="info" >}}
**Short version.** GroupDocs.Signature never transmits document content. Starting with version 26.9 it does not load the external resources a document links to unless you allow them. It contacts certificate and time-stamp services only for digital signatures: to download the certificate of the certificate authority (CA) that issued a PDF signing certificate, to request a time stamp or long-term validation data that you asked for, and to validate the chain of a certificate file. To guarantee that no request is made, block egress at the network or process level. See [Running with no network access](#running-with-no-network-access).
{{< /alert >}}

| Situation | Default | How to avoid it |
| --- | --- | --- |
| A document refers to external resources (linked images, style sheets) | **not loaded** (since 26.9) | nothing to do. `SkipExternalResources = false` or `WhitelistedResources` turn loading on |
| Signing a PDF document with a certificate that names the address of its CA certificate | **on** | block egress. The signature is still created |
| A time-stamp authority is set for a PDF signature | off | do not set `PdfDigitalSignature.TimeStamp` |
| Long-term validation (`UseLtv`) for a PDF signature | off | do not set `UseLtv` |
| Verifying a certificate file (`.pfx`) with chain validation | **on** | `CertificateVerifyOptions.PerformChainValidation = false` |
| Metered licensing | only with a metered licence | use a licence file |

## What never leaves your machine

Regardless of configuration, GroupDocs.Signature does **not**:

* upload documents, document fragments, signatures, or extracted data to GroupDocs or any third party;
* transmit file names, file paths, or directory listings;
* collect telemetry, analytics, or usage statistics about the *content* of your documents.

Outbound requests, where they occur, go to addresses written inside the document you supplied, to addresses written inside the certificates you use, to the time-stamp authority your code sets, or, with a metered licence, to the GroupDocs licensing service.

## When GroupDocs.Signature accesses the network

### 1. External resources referenced by a document - skipped by default

A document can refer to resources stored outside it: linked images and INCLUDEPICTURE fields in Word Processing documents, linked pictures in presentations, pictures linked to a file or an address in spreadsheets, and images and `@import` style sheets in SVG images. Documents inside archives can refer to them too.

Loading such a resource means requesting the address written in the document. On a server that processes documents from other people, that is a security risk: a document can make the server send requests to internal addresses (server-side request forgery), and a UNC path can make Windows send the account's credentials to another host.

**Starting with GroupDocs.Signature for .NET 26.9, external resources are not loaded unless you allow them.** Hyperlinks are never followed.

| Setting of [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions) | Effect |
| --- | --- |
| `SkipExternalResources = true` (default) | nothing outside the document is loaded, except addresses in `WhitelistedResources` |
| `WhitelistedResources` | parts of addresses that may be loaded while skipping. An address is loaded when it contains one of them, ignoring case |
| `SkipExternalResources = false` | everything is loaded. Use it for trusted documents only |

{{< alert style="warning" >}}
**`LoadExternalResources` has the opposite meaning.** Earlier versions had `LoadOptions.LoadExternalResources`, where `true` meant "load". It still works but is obsolete: `LoadExternalResources = false` is the same as `SkipExternalResources = true`. If you copy code from other GroupDocs products, check which of the two properties it sets.
{{< /alert >}}

See [How to control external resources]({{< ref "signature/net/developer-guide/advanced-usage/loading/skip-external-resources.md" >}}) for code examples.

### 2. Downloading the CA certificate when signing a PDF document - implicit

A signing certificate usually names the address of the certificate of the CA that issued it (the "CA Issuers" address of its Authority Information Access extension). While it creates a PDF digital signature, GroupDocs.Signature builds the certificate chain of the signing certificate, and this downloads the CA certificate from that address. In our measurement this happened even when the PFX file also contained the CA certificate.

* The request is an HTTP `GET` of the address written in the certificate. It contains no document data.
* Signing Word Processing, Spreadsheet and Presentation documents made no request.
* If the address cannot be reached, the PDF document is still signed, and the signature is valid. In our measurement on Windows, the first signature with such a certificate waited 15 to 25 seconds for the download to fail; later signatures with the same certificate did not wait.

### 3. Time stamps - explicit

A time-stamp authority (TSA) is contacted only when you set [PdfDigitalSignature.TimeStamp](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/pdfdigitalsignature/timestamp/). The request contains a hash of the signature, not the document. The user name and password, when you set them, are sent with HTTP Basic authentication, so use an `https://` address. If the TSA cannot be reached, `Sign` throws and nothing is signed. See [Sign PDF document with a time stamp]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/sign-pdf-document-with-timestamp.md" >}}).

### 4. Long-term validation (LTV) - explicit

With `DigitalSignOptions.UseLtv = true`, a PDF signature embeds validation data. To get the revocation part of it, GroupDocs.Signature requests the OCSP or CRL addresses that the CA publishes in the certificates, so those addresses must be reachable at signing time. There is no option to choose a different OCSP server. See [Pdf Digitally signing]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/sign-document-with-digital-signature-advanced.md" >}}).

### 5. Verifying certificate files with chain validation - on by default

When you open a certificate file (`.pfx`) with `Signature` and verify it with [CertificateVerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/certificateverifyoptions), `PerformChainValidation` is `true` by default. The chain is then validated the way the operating system does it, which can download missing CA certificates and check revocation over OCSP or CRL, from the addresses written in the certificates. Set `PerformChainValidation = false` to stay offline; the chain is then not validated at all.

### 6. Metered licensing - explicit, opt-in

A **file-based or stream-based licence** is validated entirely offline, inside the process. It opens no socket at any time.

A **metered licence** is the one deliberate exception. When you call `Metered.SetMeteredKey(publicKey, privateKey)`, the product periodically reports **usage counters only** - the number of operations performed and the total size of data processed - to the GroupDocs licensing service for billing. **No document content, file names, or extracted data are sent.** For a fully offline deployment, use a licence file instead. See [Evaluation limitations and licensing]({{< ref "signature/net/getting-started/evaluation-limitations-and-licensing-of-groupdocs.signature.md" >}}).

## What each operation can request

Measured with GroupDocs.Signature for .NET 26.9 for digital signatures in PDF, Word Processing, Spreadsheet and Presentation documents:

| Request | Sign (PDF) | Sign (other formats) | Verify | Search |
| --- | --- | --- | --- | --- |
| External resources of the document | only if allowed | only if allowed | only if allowed | only if allowed |
| CA certificate named in the signing certificate | yes | no | no | no |
| Time-stamp authority | only if `TimeStamp` is set | no | no | no |
| Revocation data (OCSP, CRL) | only if `UseLtv` is set | no | no | no |
| Chain validation of a certificate file (`.pfx`) | no | no | **by default** | no |

Verifying or searching the digital signatures of a document checks each signature cryptographically, on the machine. It makes no network request and does not check whether the signing certificate has been revoked.

`GetDocumentInfo`, `GeneratePreview`, `Update` and `Delete` load the document in the same way, so the external-resources setting applies to them too.

## Documents you open

GroupDocs.Signature opens documents from a file path or a stream. It never downloads a document from a URL. If you pass a network path, such as `\\server\share\file.pdf`, the operating system opens it. If your application must accept URLs, download them in your own code, where you can apply your own validation and your own time-out, and pass the result to `Signature` as a `Stream`, as in [Load document from URL]({{< ref "signature/net/developer-guide/advanced-usage/loading/loading-documents-from-different-sources/load-document-from-url.md" >}}).

## Running with no network access

**Block egress at the network or process level.** Run the signing component in a container, network namespace, VM, or subnet with no outbound route, or apply an outbound firewall rule to the process. This is the only control that covers every path, and the only one that cannot be affected by a change in product behaviour.

Alongside it, reduce the surface in application code:

1. Keep `SkipExternalResources = true`, the default, and leave `WhitelistedResources` empty.
2. Do not set `PdfDigitalSignature.TimeStamp` or `UseLtv`.
3. Verify certificate files with `PerformChainValidation = false`.
4. Use a licence file, not a metered licence.
5. Expect PDF signing to try to download the CA certificate named in the signing certificate. The document is still signed, but the first signature can wait for the download to fail.

## Data privacy

GroupDocs.Signature never sends document content over the network. The requests described above contain only:

* the addresses written in documents, when you allow external resources;
* the addresses of CA certificates written in the certificates you use;
* a hash of the signature, sent to the time-stamp authority you set, with the credentials you set for it;
* certificate identifiers, sent to the revocation services named in the certificates;
* usage counters, with a metered licence.

## Diagnosing unexpected requests

If you observe outbound traffic from an application that uses GroupDocs.Signature and want to know whether the library is responsible:

1. **Capture the requests** with Fiddler, Wireshark, or a logging proxy, and record the destination addresses.
2. **Compare them with your input documents and certificates.** An address that appears inside a document came from external resource loading. An address that appears in a certificate (CA Issuers, OCSP or CRL) came from certificate processing.
3. **Re-run with outbound traffic blocked.** If you still get the output you need, blocking egress is a complete fix.

## More resources

### Advanced usage topics

To learn more about the features mentioned above, please refer to the following articles:

* [How to control external resources]({{< ref "signature/net/developer-guide/advanced-usage/loading/skip-external-resources.md" >}})
* [Sign PDF document with a time stamp]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/sign-pdf-document-with-timestamp.md" >}})
* [Pdf Digitally signing]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/sign-document-with-digital-signature-advanced.md" >}})
* [Evaluation limitations and licensing]({{< ref "signature/net/getting-started/evaluation-limitations-and-licensing-of-groupdocs.signature.md" >}})
* [GroupDocs Customer Data and Security](https://about.groupdocs.com/security/customer-data-and-security/)

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
