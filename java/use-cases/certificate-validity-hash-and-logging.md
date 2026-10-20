---
id: certificate-validity-hash-and-logging
url: /signature/java/use-cases/certificate-validity-hash-and-logging/
title: 7 Methods for Certificate Validity, Digests and Logging in Java Signing
weight: 3
description: "Seven methods covering the GroupDocs.Signature for Java 26.10 changes: SHA-2 digests for PDF signatures, setAllowExpired and setAllowNotYetValid, cryptographic verification, certificate checks, and a LogLevel that finally filters."
keywords: digital signature, certificate validity, setallowexpired, setallownotyetvalid, sha-256, hash algorithm, log level, certificateverifyoptions, groupdocs signature, java signing, pdf signing
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
Runnable examples are available on GitHub: the `SignWithDigitalAdvancedPdfHashAlgorithm`, `SignWithDigitalExpiredCertificate`, `VerifyCertificateAdvanced` and `ConsoleLoggingWithLogLevels` classes of the
[GroupDocs.Signature for Java examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java).
{{< /alert >}}

## Overview

Certificate validity enforcement is a GroupDocs.Signature capability for Java that refuses to sign with a certificate outside its validity window unless you say otherwise. It arrived in 26.10 alongside related changes: PDF digital signatures now default to SHA-256 rather than SHA-1, PDF verification checks each signature cryptographically, `CertificateVerifyOptions` checks a certificate file, and `SignatureSettings.setLogLevel` actually filters what reaches your logger.

They matter for the same reason. Each one used to let a pipeline produce output that looked correct and was not: a SHA-1 signature current validators reject, a signature made with a certificate that expired last year, a changed document that still verified, or a logger that received nothing at all. This page walks the seven methods that demonstrate the new behaviour, including the one that fails on purpose.

**What you'll learn:**
- Which digest a PDF signature gets now, and when to override it
- How an expired or not-yet-valid certificate is rejected, and the two independent settings that permit it
- How to check a certificate file before you sign with it
- How to route the library's messages into your own logging at a level you choose

## What This Use Case Covers

The methods below follow the Java examples listed above. They sign a PDF document with a valid certificate and with an expired one, verify the result, check a certificate file and compare the log levels.

**Prerequisites and requirements:**
- Java 8 or later and GroupDocs.Signature for Java 26.10 or later (Maven artifact `com.groupdocs:groupdocs-signature`)
- A PDF to sign and a `.pfx` certificate; the examples repository ships both, including an expired certificate (`acer.pfx`)

## Why the Pre-26.10 Defaults Weren't Enough

The old behaviour was permissive in several places at once. SHA-1 was the digest of every PDF signature, and `setHashAlgorithm` was ignored. An expired certificate signed without complaint. Verifying a PDF with no criteria reported any signature field as valid, even after the document was changed. And `setLogLevel` was compared as a single value instead of a set of flags, so with the default `LogLevel.All` the logger received nothing.

That combination made failures land somewhere other than where they were caused. The signing service reported success; the recipient's validator reported an invalid signature; and the log that should have explained it was empty.

This makes the pre-26.10 defaults unsuitable for:
- Pipelines whose output is validated by someone else
- Any workflow where certificate renewal is a scheduled, forgettable task
- Services that need diagnostics without drowning in them

## Method 1: Choose the hash algorithm

**Scope:** every PDF digital signature | **Difficulty:** low | **Best For:** meeting a digest policy

### How It Works

`DigitalSignOptions.setHashAlgorithm` sets the digest with an `int` constant of the `HashAlgorithm` class. Since 26.10 the default, `HashAlgorithm.Auto`, gives SHA-256 in the `adbe.pkcs7.detached` format; `Sha384` and `Sha512` are available when a policy requires more, and `Sha1` remains only for legacy validators.

### Implementation

```java
DigitalSignOptions options = new DigitalSignOptions(certificatePath);
options.setPassword("1234567890");
options.setHashAlgorithm(algorithm);   // for example HashAlgorithm.Sha512
options.setReason("Approved");
options.setLocation("Head office");

SignResult result = signature.sign(outputPath, options);
return result.getSucceeded().size();
```

### Considerations

A time stamp added to the signature uses the same digest. If you were relying on the old behaviour without setting this method, your signatures changed in 26.10 - which is almost certainly an improvement, but it is a change worth noting in a release log. Setting a hash algorithm on a signature type that is not digital has no effect, and a warning is logged.

## Method 2: Verify the signature cryptographically

**Scope:** incoming documents | **Difficulty:** low | **Best For:** trusting what you receive

### How It Works

`DigitalVerifyOptions` with no criteria now performs a full cryptographic check of PDF signatures rather than a no-op comparison. A document altered after signing comes back invalid.

### Implementation

```java
Signature signature = new Signature(signedPath);
try
{
    VerificationResult result = signature.verify(new DigitalVerifyOptions());
    return result.isValid();
}
finally
{
    signature.dispose();
}
```

### Considerations

Add `setSubjectName` or `setIssuerName` when the question is who signed rather than whether the content is intact; for PDF documents they are applied since 26.10, and `setSignDateTimeFrom` and `setSignDateTimeTo` limit the signing time. The checks are complementary: content integrity without identity tells you the file was not tampered with, not that it came from the right party.

## Method 3: Let an expired certificate be rejected

**Scope:** the default path | **Difficulty:** none | **Best For:** catching renewal failures at the source

### How It Works

`sign` throws `GroupDocsSignatureException` when the certificate's validity has ended or not started. Nothing is written.

### Implementation

```java
try
{
    signature.sign(outputPath, options);
    return true;
}
catch (GroupDocsSignatureException ex)
{
    System.out.println("   Rejected: " + ex.getMessage());
    return false;
}
```

### Considerations

The message names the certificate by subject and thumbprint, gives the date in UTC and names the setting that would allow it, so an operator reading the log can act without consulting the documentation. Catch this specifically and tell the user to renew, rather than letting it surface as a generic failure.

## Method 4: Allow an expired certificate deliberately

**Scope:** exceptions | **Difficulty:** low | **Best For:** tests and archived certificates

### How It Works

`DigitalSignOptions.setAllowExpired(true)` permits the signature and writes a warning to the configured logger.

### Implementation

```java
SignatureSettings settings = new SignatureSettings(new ConsoleLogger());
settings.setLogLevel(LogLevel.Warning | LogLevel.Error);

Signature signature = new Signature(sourcePath, settings);
try
{
    DigitalSignOptions options = new DigitalSignOptions(certificatePath);
    options.setAllowExpired(true);

    signature.sign(outputPath, options);
}
finally
{
    signature.dispose();
}
```

### Considerations

Validators still reject the result. This setting changes what the library permits, not what the signature is worth, so treat it as a testing tool rather than a production workaround.

## Method 5: Allow a not-yet-valid certificate

**Scope:** exceptions | **Difficulty:** low | **Best For:** certificates issued for a future start date

### How It Works

`setAllowNotYetValid` is a separate setting covering the other end of the window. `setAllowExpired` does not imply it.

### Implementation

```java
DigitalSignOptions options = new DigitalSignOptions(certificatePath);
options.setPassword("1234567890");
options.setAllowNotYetValid(true);
```

### Considerations

Check the machine clock first. A wrong system time on a build agent is a common reason for this error, and overriding it hides a problem that will affect time stamps too. Both settings also govern the certificate that signs the VBA project of a spreadsheet.

## Method 6: Check a certificate file before you sign with it

**Scope:** certificate management | **Difficulty:** low | **Best For:** catching a wrong or expired certificate before a batch run

### How It Works

Open the `.pfx` file with `Signature` and verify it with `CertificateVerifyOptions`. Since 26.10 the issuer, subject, serial number and thumbprint are compared with the option's match type, and `getExpired()` tells whether the validity period has ended, compared in UTC.

### Implementation

```java
LoadOptions loadOptions = new LoadOptions();
loadOptions.setPassword("1234567890");

Signature signature = new Signature(certificatePath, loadOptions);
try
{
    CertificateVerifyOptions options = new CertificateVerifyOptions();
    options.setPerformChainValidation(false);
    options.setMatchType(TextMatchType.Exact);
    options.setSerialNumber("00AAD0D15C628A13C7");

    VerificationResult result = signature.verify(options);
    System.out.println("Valid: " + result.isValid() + ", expired: " + options.getExpired());
}
finally
{
    signature.dispose();
}
```

### Considerations

The serial number and thumbprint use the upper-case hexadecimal form. `setPerformChainValidation(true)` also builds the certificate path to the trust store of the Java runtime; unlike GroupDocs.Signature for .NET, revocation is not checked.

## Method 7: Compare the log levels

**Scope:** diagnostics | **Difficulty:** low | **Best For:** sizing production logging

### How It Works

The same document is signed three times with a counting `ILogger` at `LogLevel.None`, `LogLevel.Warning | LogLevel.Error` and `LogLevel.All`. Signing with an allowed expired certificate writes exactly one warning, which makes the filtering visible.

### Implementation

```java
CountingLogger logger = new CountingLogger();
SignatureSettings settings = new SignatureSettings(logger);
settings.setLogLevel(level);   // LogLevel.None, LogLevel.Warning | LogLevel.Error or LogLevel.All
```

```java
/** An ILogger that counts the messages it receives. */
public static class CountingLogger implements ILogger
{
    public int errors;
    public int warnings;
    public int traces;

    public void error(String message, Exception exception) { errors++; }
    public void warning(String message) { warnings++; }
    public void trace(String message) { traces++; }
}
```

### Considerations

`LogLevel.None` yields zero messages, `LogLevel.Warning | LogLevel.Error` keeps the warning, and `LogLevel.All` adds a trace per step. Before 26.10 the default `LogLevel.All` and every combination of flags yielded nothing, which is why services that wired up a logger saw an empty log.

### Does the log level affect which exceptions I get?

No. The level filters what reaches the `ILogger` and nothing else. An expired certificate without `setAllowExpired(true)` still throws `GroupDocsSignatureException` at `LogLevel.None`; your catch block runs exactly the same way, the logger simply never hears about it. Keep exceptions for control flow and the logger for diagnostics.

## Choosing Between the Validity Settings

| Situation | Setting | Also do this |
|---|---|---|
| Certificate expired, production signing | neither | renew it; the rejection is the correct outcome |
| Reproducing an archived signature | `setAllowExpired(true)` | record why in the audit trail |
| Certificate starts next month | `setAllowNotYetValid(true)` | verify the host clock first |
| Automated tests with fixed certificates | both, deliberately | keep the test certificates out of production configuration |

## Common Questions

**My pipeline upgraded to 26.10 and started failing. What changed?**
Most likely the certificate check. Signing with an expired certificate now throws instead of succeeding. The fix is renewal; `setAllowExpired(true)` exists for the cases where you genuinely need the old behaviour, and it logs a warning so the decision stays visible.

**Do I need to call setHashAlgorithm to get SHA-256?**
No, it is the default from 26.10. Call it only to request SHA-384 or SHA-512, or to keep SHA-1 for a validator that cannot handle anything newer.

**Can I send the library's messages to my logging framework?**
Yes. Implement `ILogger` with its three methods, forward the messages to your framework, and pass an instance to `SignatureSettings`; `CountingLogger` above is that interface implemented as a counter. The level you set decides which of the three methods the library calls.

## Summary and When to Use Which Method

Leave the defaults alone and the 26.10 behaviour is the one you want: SHA-256 digests, a hard stop on invalid certificates, cryptographic verification of PDF signatures, and a logger you can tune. Reach for `setAllowExpired` or `setAllowNotYetValid` only as deliberate exceptions, verify incoming documents with `DigitalVerifyOptions` rather than trusting the file, and pick a log level before deploying rather than after the first incident.

## See Also

- [Set up logging]({{< ref "signature/java/developer-guide/advanced-usage/logging/how-to-set-up-logging.md" >}}) - the loggers, the log levels and the warnings you may see
- [Sign Document with Digital Signature](https://docs.groupdocs.com/signature/java/esign-document-with-digital-signature/) - the `DigitalSignOptions` reference
- [Verify Digital Signatures in the Document](https://docs.groupdocs.com/signature/java/verify-digital-signatures-in-the-document/) - verification options in detail
- [Product documentation](https://docs.groupdocs.com/signature/java/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/java/) - full API details for GroupDocs.Signature for Java
