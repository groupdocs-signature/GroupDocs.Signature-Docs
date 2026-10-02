---
id: certificate-validity-hash-and-logging
url: /signature/net/use-cases/certificate-validity-hash-and-logging/
title: 6 Methods for Certificate Validity, Digests and Logging in .NET Signing
weight: 1
description: "Six runnable methods covering the GroupDocs.Signature 26.9 changes: SHA-2 digests for PDF signatures, AllowExpired and AllowNotYetValid, cryptographic verification, and a LogLevel that finally filters."
keywords: digital signature, certificate validity, allowexpired, allownotyetvalid, sha-256, hash algorithm, log level, groupdocs signature, dotnet signing, pdf signing
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[digital-signing-certificate-validity-dotnet](https://github.com/groupdocs-signature/digital-signing-certificate-validity-dotnet)
{{< /alert >}}

## Overview

Certificate validity enforcement is a GroupDocs.Signature capability for .NET that refuses to sign with a certificate outside its validity window unless you say otherwise. It arrived in 26.9 alongside two related changes: PDF digital signatures now default to SHA-256 rather than SHA-1, and `SignatureSettings.LogLevel` actually filters what reaches your logger.

All three matter for the same reason. Each one used to let a pipeline produce output that looked correct and was not: a SHA-1 signature current validators reject, a signature made with a certificate that expired last year, or a log that was either empty or unreadable. This page walks the six methods that demonstrate the new behaviour, including the two that fail on purpose.

**What you'll learn:**
- Which digest a PDF signature gets now, and when to override it
- How an expired or not-yet-valid certificate is rejected, and the two independent flags that permit it
- How to route the library's messages into your own logging at a level you choose

## What This Use Case Covers

Every method below comes from a runnable console sample that signs one PDF six ways and exits non-zero if any step misbehaves. The sample creates its own certificates in memory - valid, expired and not-yet-valid - so it ships no private key and keeps working whatever today's date is.

**Prerequisites and requirements:**
- .NET SDK 8.0 and GroupDocs.Signature 26.9.0 or later
- A PDF to sign; the sample ships one
- No certificate of your own is needed to run it

## Why the Pre-26.9 Defaults Weren't Enough

The old behaviour was permissive in three places at once. SHA-1 was the default digest for PDF signatures, and validators have been deprecating it for years. An expired certificate signed without complaint. And `LogLevel` was accepted but ignored, so the logger received everything.

That combination made failures land somewhere other than where they were caused. The signing service reported success; the recipient's validator reported an invalid signature; and the log that should have explained it was either switched off or buried in trace output.

This makes the pre-26.9 defaults unsuitable for:
- Pipelines whose output is validated by someone else
- Any workflow where certificate renewal is a scheduled, forgettable task
- Services that need diagnostics without drowning in them

## 📂 Repository Structure

```
digital-signing-certificate-validity-dotnet/
│
├── Program.cs                     # the six methods below
├── CollectingLogger.cs            # an ILogger that counts messages per level
├── TestCertificates.cs            # in-memory self-signed PFXs, no key committed
├── documents/document.pdf         # the input
└── Result/                        # one signed PDF per demonstration
```

## Method 1: Choose the hash algorithm

**Scope:** every PDF signature | **Difficulty:** low | **Best For:** meeting a digest policy

### How It Works

`DigitalSignOptions.HashAlgorithm` sets the digest. Since 26.9 the default is SHA-256 in the `adbe.pkcs7.detached` format; `Sha384` and `Sha512` are available when a policy requires more, and `Sha1` remains only for legacy validators.

### Implementation

```csharp
var options = new DigitalSignOptions(certificate)
{
    Password = TestCertificates.Password,
    HashAlgorithm = algorithm,
    Reason = "Approved",
    Location = "Head office"
};

SignResult result = signature.Sign(outputPath, options);
return result.Succeeded.Count;
```

### Considerations

A time stamp added to the signature uses the same digest. If you were relying on the old default without setting this property, your signatures changed in 26.9 - which is almost certainly an improvement, but it is a change worth noting in a release log.

## Method 2: Verify the signature cryptographically

**Scope:** incoming documents | **Difficulty:** low | **Best For:** trusting what you receive

### How It Works

`DigitalVerifyOptions` with no criteria now performs a full cryptographic check rather than a no-op comparison. A document altered after signing comes back invalid.

### Implementation

```csharp
using var signature = new Signature(signedPath);

VerificationResult result = signature.Verify(new DigitalVerifyOptions());
return result.IsValid;
```

### Considerations

Add `SubjectName`, `IssuerName` or `Reason` when the question is who signed rather than whether the content is intact. The two checks are complementary: content integrity without identity tells you the file was not tampered with, not that it came from the right party.

## Method 3: Let an expired certificate be rejected

**Scope:** the default path | **Difficulty:** none | **Best For:** catching renewal failures at the source

### How It Works

`Sign` throws `GroupDocsSignatureException` when the certificate's validity has ended or not started. Nothing is written.

### Implementation

```csharp
try
{
    signature.Sign(outputPath, options);
    return true;
}
catch (GroupDocsSignatureException ex)
{
    Console.WriteLine($"   Rejected: {ex.Message}");
    return false;
}
```

### Considerations

The message names the certificate and the property that would allow it, so an operator reading the log can act without consulting the documentation. Catch this specifically and tell the user to renew, rather than letting it surface as a generic failure.

## Method 4: Allow an expired certificate deliberately

**Scope:** exceptions | **Difficulty:** low | **Best For:** tests and archived certificates

### How It Works

`DigitalSignOptions.AllowExpired = true` permits the signature and writes a warning to the configured logger.

### Implementation

```csharp
var settings = new SignatureSettings(new ConsoleLogger())
{
    LogLevel = LogLevel.Warning | LogLevel.Error
};

using var signature = new Signature(sourcePath, settings);

var options = new DigitalSignOptions(certificate)
{
    Password = TestCertificates.Password,
    AllowExpired = true
};
```

### Considerations

Validators still reject the result. This flag changes what the library permits, not what the signature is worth, so treat it as a testing tool rather than a production workaround.

## Method 5: Allow a not-yet-valid certificate

**Scope:** exceptions | **Difficulty:** low | **Best For:** certificates issued for a future start date

### How It Works

`AllowNotYetValid` is a separate flag covering the other end of the window. `AllowExpired` does not imply it.

### Implementation

```csharp
var options = new DigitalSignOptions(certificate)
{
    Password = TestCertificates.Password,
    AllowNotYetValid = true
};
```

### Considerations

Check the machine clock first. In my experience this error is more often a wrong system time on a build agent than a genuinely future-dated certificate, and overriding it hides a problem that will affect time stamps too.

## Method 6: Compare the log levels

**Scope:** diagnostics | **Difficulty:** low | **Best For:** sizing production logging

### How It Works

The same document is signed three times with a counting `ILogger` at `None`, `Warning | Error` and `All`. Signing with an allowed expired certificate guarantees exactly one warning, which makes the filtering visible.

### Implementation

```csharp
var logger = new CollectingLogger();
var settings = new SignatureSettings(logger) { LogLevel = level.Value };
```

### Considerations

`None` yields zero messages, `Warning | Error` keeps the warning, `All` adds a trace per step. Before 26.9 every level behaved like `All`, which is why services that wired up a logger often turned it off again.

### Does the log level affect which exceptions I get?

No. The level filters what reaches the `ILogger` and nothing else. An expired certificate without `AllowExpired` still throws `GroupDocsSignatureException` at `LogLevel.None`; your catch block runs exactly the same way, the logger simply never hears about it. Keep exceptions for control flow and the logger for diagnostics.

## Choosing Between the Validity Flags

| Situation | Flag | Also do this |
|---|---|---|
| Certificate expired, production signing | neither | renew it; the rejection is the correct outcome |
| Reproducing an archived signature | `AllowExpired` | record why in the audit trail |
| Certificate starts next month | `AllowNotYetValid` | verify the host clock first |
| Automated tests with fixed certificates | both, deliberately | generate certificates in memory instead, as this sample does |

## Common Questions

**My pipeline upgraded to 26.9 and started failing. What changed?**
Most likely the certificate check. Signing with an expired certificate now throws instead of succeeding. The fix is renewal; `AllowExpired` exists for the cases where you genuinely need the old behaviour, and it logs a warning so the decision stays visible.

**Do I need to set HashAlgorithm to get SHA-256?**
No, it is the default from 26.9. Set it only to request SHA-384 or SHA-512, or to keep SHA-1 for a validator that cannot handle anything newer.

**Can I send the library's messages to Serilog?**
Yes. Implement `ILogger` with its three methods and pass an instance to `SignatureSettings`; `CollectingLogger` in the sample is that interface implemented as a counter. The level you set decides which of the three methods the library calls.

## Summary and When to Use Which Method

Leave the defaults alone and the 26.9 behaviour is the one you want: SHA-256 digests, a hard stop on invalid certificates, and a logger you can tune. Reach for `AllowExpired` or `AllowNotYetValid` only as deliberate exceptions, verify incoming documents with `DigitalVerifyOptions` rather than trusting the file, and pick a log level before deploying rather than after the first incident.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/certificate-validity-hash-and-logging-net/) - what the 26.9 changes mean for an existing pipeline
- [Sign Document with Digital Signature](https://docs.groupdocs.com/signature/net/sign-document-with-digital-signature/) - the `DigitalSignOptions` reference
- [Verify Digital Signatures in the Document](https://docs.groupdocs.com/signature/net/verify-digital-signatures-in-the-document/) - verification options in detail
- [Product documentation](https://docs.groupdocs.com/signature/net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/net/) - full API details for GroupDocs.Signature for .NET
