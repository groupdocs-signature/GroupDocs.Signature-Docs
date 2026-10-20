---
id: network-access-and-data-privacy
url: signature/java/network-access-and-data-privacy
title: Network access and data privacy
weight: 7
description: "When GroupDocs.Signature for Java makes network requests, what they contain, and how to run it with no network access at all."
keywords: network access, offline, air-gapped, external resources, SSRF, CA certificate, OCSP, CRL, time stamp, LTV, data privacy
productName: GroupDocs.Signature for Java
hideChildren: False
toc: True
---
Explains when GroupDocs.Signature for Java accesses the network, what data leaves your machine, and how to prevent outbound requests in air-gapped or security-sensitive deployments.

## Summary

GroupDocs.Signature for Java is an **on-premise library**. It runs entirely inside your own JVM, on your own machine and network. It does not send your documents, your signatures, or any customer information to GroupDocs.

As stated in the [GroupDocs Customer Data and Security policy](https://about.groupdocs.com/security/customer-data-and-security/):

> GroupDocs products run on customer's own machines, infrastructure and network and do not send any files back to GroupDocs for processing and therefore does not have access to them.

The library can still make outbound network requests in the situations described below. Most of them happen only when your code asks for them. This topic describes each of them so that you can audit and restrict them.

{{< alert style="info" >}}
**Short version.** GroupDocs.Signature never transmits document content. Starting with version 26.10 it does not load the external resources a document links to unless you allow them. It contacts time-stamp and revocation services only for PDF digital signatures, and only when you ask for a time stamp or long-term validation data. A metered licence reports usage counters. To guarantee that no request is made, block egress at the network or process level. See [Running with no network access](#running-with-no-network-access).
{{< /alert >}}

| Situation | Default | How to avoid it |
| --- | --- | --- |
| A document refers to external resources (linked images, style sheets) | **not loaded** (since 26.10) | nothing to do. `setSkipExternalResources(false)` or `setWhitelistedResources` turn loading on |
| A time-stamp authority is set for a PDF signature | off | do not call `PdfDigitalSignature.setTimeStamp` |
| Long-term validation (`setUseLtv`) for a PDF signature | off | do not call `setUseLtv(true)` |
| Signing a PDF document with a certificate that names the address of its CA certificate | not measured for Java | block egress, and test signing with your certificate where egress is blocked |
| Verifying a certificate file (`.pfx`) with chain validation | off, and no request with the default JDK settings | keep `CertificateVerifyOptions.setPerformChainValidation(false)`, the default |
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

Loading such a resource means requesting the address written in the document. On a server that processes documents from other people, that is a security risk: a document can make the server send requests to internal addresses (server-side request forgery), and on Windows a UNC path can make the operating system send the account's credentials to another host.

**Starting with GroupDocs.Signature for Java 26.10, external resources are not loaded unless you allow them.** Hyperlinks are never followed.

| Setting of [LoadOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.loadoptions/loadoptions/) | Effect |
| --- | --- |
| `setSkipExternalResources(true)` (default) | nothing outside the document is loaded, except addresses passed to `setWhitelistedResources` |
| `setWhitelistedResources(List<String>)` | parts of addresses that may be loaded while skipping. An address is loaded when it contains one of them, ignoring case |
| `setSkipExternalResources(false)` | everything is loaded. Use it for trusted documents only |

{{< alert style="warning" >}}
**`setLoadExternalResources` has the opposite meaning.** Earlier versions had `LoadOptions.setLoadExternalResources`, where `true` meant "load". It still works but is deprecated: `setLoadExternalResources(false)` is the same as `setSkipExternalResources(true)`. If you copy code from other GroupDocs products, check which of the two methods it calls.
{{< /alert >}}

See [How to control external resources]({{< ref "signature/java/developer-guide/advanced-usage/loading/skip-external-resources.md" >}}) for code examples.

### 2. Time stamps - explicit

A time-stamp authority (TSA) is contacted only when you set a time stamp with `PdfDigitalSignature.setTimeStamp` and pass that `PdfDigitalSignature` to `DigitalSignOptions.setSignature`. The request contains a hash of the signature, not the document. The user name and password, when you set either of them, are sent to the server with the request, so use an `https://` address.

### 3. Long-term validation (LTV) - explicit

With `DigitalSignOptions.setUseLtv(true)`, a PDF signature embeds validation data. To get the revocation part of it, the OCSP or CRL addresses that the CA publishes in the certificates are requested, so those addresses must be reachable at signing time. There is no option to choose a different OCSP server. See [Sign document with Digital signature - advanced]({{< ref "signature/java/developer-guide/advanced-usage/signing/sign-document-with-digital-signature-advanced.md" >}}).

### 4. The CA certificate when signing a PDF document - not measured for Java

A signing certificate usually names the address of the certificate of the CA that issued it (the "CA Issuers" address of its Authority Information Access extension). GroupDocs.Signature passes the signing certificate to its PDF engine to create a PDF digital signature, and its own code requests no address for it. Whether the PDF engine downloads the CA certificate from that address while it builds the certificate chain has not been measured for GroupDocs.Signature for Java. If your deployment allows no egress, block it and test PDF signing with your certificate in that environment.

### 5. Verifying certificate files with chain validation - off by default

When you open a certificate file (`.pfx`) with `Signature` and verify it with [CertificateVerifyOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.verify/certificateverifyoptions/), the chain is validated only after you call `setPerformChainValidation(true)`. The certificate path is then built to the trust store of the Java runtime, with the other certificates of the file as intermediates. Revocation is not checked. With the default JDK settings this makes no network request: the JDK downloads missing CA certificates from the addresses written in the certificates only when the `com.sun.security.enableAIAcaIssuers` system property is `true`.

### 6. Metered licensing - explicit, opt-in

A **file-based or stream-based licence** is validated entirely offline, inside the process. It opens no socket at any time.

A **metered licence** is the one deliberate exception. When you call `new Metered().setMeteredKey(publicKey, privateKey)`, the product periodically reports **usage counters only** - the number of operations performed and the total size of data processed - to the GroupDocs licensing service for billing. **No document content, file names, or extracted data are sent.** For a fully offline deployment, use a licence file instead. See [Evaluation limitations and licensing]({{< ref "signature/java/getting-started/evaluation-limitations-and-licensing-of-groupdocs.signature.md" >}}).

## What each operation can request

| Request | Sign (PDF) | Sign (other formats) | Verify | Search |
| --- | --- | --- | --- | --- |
| External resources of the document | only if allowed | only if allowed | only if allowed | only if allowed |
| Time-stamp authority | only if a time stamp is set | no | no | no |
| Revocation data (OCSP, CRL) | only if `setUseLtv(true)` is set | no | no | no |
| CA certificate named in the signing certificate | not measured | no | no | no |
| Chain validation of a certificate file (`.pfx`) | no | no | only with `setPerformChainValidation(true)`, and no request with the default JDK settings | no |

Verifying the digital signatures of a PDF document checks each signature cryptographically, on the machine. GroupDocs.Signature does not ask for a revocation check of the signing certificate.

`getDocumentInfo`, `generatePreview`, `update` and `delete` load the document in the same way, so the external-resources setting applies to them too.

## Documents you open

GroupDocs.Signature opens documents from a file path or an `InputStream`. It never downloads a document from a URL. If you pass a network path, such as `\\server\share\file.pdf` on Windows, the operating system opens it. If your application must accept URLs, download them in your own code, where you can apply your own validation and your own time-out, and pass the result to `Signature` as an `InputStream`, as in [Load document from URL]({{< ref "signature/java/developer-guide/advanced-usage/loading/loading-documents-from-different-sources/load-document-from-url.md" >}}).

## Running with no network access

**Block egress at the network or process level.** Run the signing component in a container, network namespace, VM, or subnet with no outbound route, or apply an outbound firewall rule to the JVM process. This is the only control that covers every path, and the only one that cannot be affected by a change in product behaviour.

Alongside it, reduce the surface in application code:

1. Keep `setSkipExternalResources(true)`, the default, and leave the whitelist empty.
2. Do not set a time stamp, and do not call `setUseLtv(true)`.
3. Verify certificate files without chain validation, the default, or keep the `com.sun.security.enableAIAcaIssuers` system property unset.
4. Use a licence file, not a metered licence.
5. Test PDF signing with your certificate where egress is blocked, because the download of the CA certificate has not been measured for Java.

## Data privacy

GroupDocs.Signature never sends document content over the network. The requests described above contain only:

* the addresses written in documents, when you allow external resources;
* a hash of the signature, sent to the time-stamp authority you set, with the credentials you set for it;
* certificate identifiers, sent to the revocation services named in the certificates, when you ask for LTV data;
* usage counters, with a metered licence.

## Diagnosing unexpected requests

If you observe outbound traffic from an application that uses GroupDocs.Signature and want to know whether the library is responsible:

1. **Capture the requests** with Fiddler, Wireshark, or a logging proxy, and record the destination addresses.
2. **Compare them with your input documents and certificates.** An address that appears inside a document came from external resource loading. An address that appears in a certificate (CA Issuers, OCSP or CRL) came from certificate processing.
3. **Re-run with outbound traffic blocked.** If you still get the output you need, blocking egress is a complete fix.

## More resources

### Advanced usage topics

To learn more about the features mentioned above, please refer to the following articles:

* [How to control external resources]({{< ref "signature/java/developer-guide/advanced-usage/loading/skip-external-resources.md" >}})
* [Sign document with Digital signature - advanced]({{< ref "signature/java/developer-guide/advanced-usage/signing/sign-document-with-digital-signature-advanced.md" >}})
* [Evaluation limitations and licensing]({{< ref "signature/java/getting-started/evaluation-limitations-and-licensing-of-groupdocs.signature.md" >}})
* [GroupDocs Customer Data and Security](https://about.groupdocs.com/security/customer-data-and-security/)

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)

### Free Online Apps

Along with the full-featured Java library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
