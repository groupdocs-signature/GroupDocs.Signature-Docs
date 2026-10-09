---
id: certificate-validity-hash-and-logging
url: /signature/python-net/use-cases/certificate-validity-hash-and-logging/
title: Signing PDFs in Python - Certificate Checks, Digests and Log Levels Compared
weight: 1
description: "Five controls over PDF digital signing in GroupDocs.Signature for Python: SHA-2 digests, the 26.9 refusal to sign with an expired certificate, the allow_expired and allow_not_yet_valid overrides, cryptographic verification, and log levels that filter."
keywords: digital signature, certificate validity, allow_expired, allow_not_yet_valid, sha-256, log level, python signing, pdf signing
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
toc: true
draft: true
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[pdf-signing-certificate-checks-python](https://github.com/groupdocs-signature/pdf-signing-certificate-checks-python)
{{< /alert >}}

## Introduction

Certificate validity checking is the GroupDocs.Signature rule for Python that stops a signing call when the certificate's validity window does not cover the present moment. It arrived in version 26.9 together with two related changes - SHA-256 as the default PDF digest, and a log level that finally filters - and together they turn three silent outcomes into decisions you make on purpose.

There is more than one answer here because "sign this PDF" hides several independent choices: which digest goes into the signature, whether an out-of-date certificate is a hard stop or an accepted risk, whether the result is checked afterwards, and how much the library says while it works. This page compares those controls in Python via .NET, using one runnable sample.

## What This Guide Covers

Five controls, each with the code that exercises it, what it changes in the output, and when to reach for it. Every number quoted comes from running the sample against a one-page PDF, not from a specification.

Prerequisites:
- Python 3.9 or later on a 64-bit interpreter, with `groupdocs-signature-net` 26.10.0
- The `cryptography` package, used only to build the sample's throwaway certificates

## Quick Decision Matrix

| Scenario | Reach for | Why |
|---|---|---|
| Signing on behalf of users | the default refusal | an invalid signature is worse than a missing one |
| A policy demands a stronger digest | `hash_algorithm` | SHA-384 and SHA-512 are one assignment away |
| Testing against last year's certificate | `allow_expired` | keeps the test honest without weakening production |
| A certificate issued for next quarter | `allow_not_yet_valid` | separate flag, separate decision |
| A service whose logs are already noisy | `log_level` | warnings without the ten traces per run |

## Option 1 - Choose the digest

Overview: `hash_algorithm` on `DigitalSignOptions` selects the digest written into the signature, from `HashAlgorithm.AUTO`, `SHA1`, `SHA256`, `SHA384` or `SHA512`.

### How It Works

From 26.9 a PDF signature defaults to SHA-256 in the `adbe.pkcs7.detached` format current validators expect; earlier versions wrote SHA-1. A stronger member changes the digest for the signature and for any time stamp.

```python
options = DigitalSignOptions()
options.certificate_stream = io.BytesIO(pfx)
options.password = PASSWORD
options.hash_algorithm = algorithm
options.reason = "Approved"

result = sign.sign(output_path, options)
```

### When to Use

Leave it alone unless something external asks otherwise. Set SHA-384 or SHA-512 when a policy names a digest, and treat `SHA1` as a compatibility setting for validators you cannot change.

Advantages: one assignment, and the same signed-file size either way.
Limitations: a stronger digest buys nothing if the certificate is untrusted.

## Option 2 - Verify what was written

Overview: `verify` with an empty `DigitalVerifyOptions` asks whether the signatures still match the document.

### How It Works

Since 26.9 the check is cryptographic, so a PDF altered after signing is reported invalid. Criteria such as `subject_name`, `issuer_name` or `reason` extend it to who signed and why.

```python
with signature.Signature(signed_path) as sign:
    result = sign.verify(DigitalVerifyOptions())
    return result.is_valid
```

### When to Use

In any pipeline that signs and then stores or forwards the file. It is the cheapest way to catch a corrupted write before a recipient does.

Advantages: two lines, and it now tests the cryptography.
Limitations: `True` means the signature matches the document, not that anyone trusts the issuer - the sample's self-signed certificates verify here and are refused by a PDF reader.

## Option 3 - Let the default refusal stand

Overview: With no overrides, signing with an expired or not-yet-valid certificate raises `GroupDocsSignatureException` and writes nothing.

### How It Works

The validity period is checked before any output is produced, so there is no partial file to clean up. The message names the certificate, the date, the thumbprint and the property that would permit it, which is what an operator needs.

```python
try:
    sign.sign(output_path, options)
    return True
except signature.GroupDocsSignatureException as error:
    print(f"   Rejected: {str(error).splitlines()[0]}")
    return False
```

### When to Use

Everywhere that signs on behalf of someone else. Validators report a signature made with a dead certificate as invalid, so producing one turns a visible failure into an invisible one.

Advantages: the failure arrives where it can be fixed, with the certificate named.
Limitations: the exception text continues with the .NET stack trace from behind the binding, so take the first line before showing a user.

## Option 4 - Override validity, deliberately

Overview: `allow_expired` and `allow_not_yet_valid` permit one signing call to proceed anyway, each emitting a warning.

### How It Works

The two flags are independent: allowing an expired certificate does not allow an early one, and a certificate that is both needs both. The logger named in `SignatureSettings` receives a warning naming the certificate and the date.

```python
settings = signature.SignatureSettings(ConsoleLogger())
settings.log_level = LogLevel.WARNING | LogLevel.ERROR

with signature.Signature(source_path, settings=settings) as sign:
    options.allow_expired = True
    result = sign.sign(output_path, options)
```

### When to Use

For tests against archived certificates, and for the rare production case where renewal is still in progress - with the warning logged where a person reads it.

Advantages: scoped to the call, so nothing else in the process is weakened.
Limitations: validators still report the signature as invalid, so this buys a file, not a trustworthy one. An early certificate usually means the machine's clock is wrong - check that first.

## Option 5 - Set the log level

Overview: `SignatureSettings.log_level` is a flags value deciding which messages reach your logger.

### How It Works

`LogLevel.NONE` logs nothing, `LogLevel.WARNING | LogLevel.ERROR` keeps problems, and `LogLevel.ALL` adds a trace per step. Before 26.9 the value was accepted and ignored, so every level behaved like `ALL`.

```python
logger = CollectingLogger()
settings = signature.SignatureSettings(logger)
settings.log_level = level
```

### When to Use

Warnings and errors in production; `ALL` while diagnosing a signing that works on one machine and not another.

Advantages: one signing run drops from eleven messages to one.
Limitations: the level filters logging only - it never changes which exceptions your code receives.

## Side-by-Side Comparison

| Control | Default | Raises on misuse | Writes a log message | Changes the output file |
|---|---|---|---|---|
| `hash_algorithm` | SHA-256 | no | no | yes, the digest |
| `verify` | no criteria | no | no | no |
| validity check | on | yes | error, when logged | no file at all |
| `allow_expired` | off | no | warning | yes, it exists |
| `log_level` | `ALL` | no | that is its job | no |

## Real-World Use Cases

### An approvals service signing user uploads

Challenge: signing runs unattended, so nobody notices an expiring certificate until recipients complain.
Solution: keep the default refusal, catch the exception, and surface its first line.
Result: the failure appears at upload time, naming the certificate.

### A nightly batch with a renewal in flight

Challenge: the batch must produce signed files tonight; the replacement certificate arrives tomorrow.
Solution: `allow_expired` for that run only, with `LogLevel.WARNING | LogLevel.ERROR` writing the warning to the job log.
Result: the files exist and the compromise is recorded against the certificate's name.

## Common Pitfalls and How to Avoid Them

1. **Assigning to `settings.logger`**
   - Problem: `SignatureSettings.logger` is read-only in Python, so this raises `AttributeError`.
   - Solution: pass the logger to the constructor, `SignatureSettings(logger)`, and set `log_level` afterwards.

2. **Subclassing `ILogger`**
   - Problem: its base wraps a native object and the constructor wants a handle, so subclassing raises `TypeError`.
   - Solution: write a plain class with `error`, `warning` and `trace`; the binding marshals it. I lost an afternoon to this before reading the error properly.

3. **Declaring `exception` as required**
   - Problem: the library does not always pass one, and a logger that insists breaks on the messages that omit it.
   - Solution: give `error` and `warning` an optional `exception=None` parameter.

## Which option should I reach for first?

The validity check, because it is the only one that changes whether a file is produced at all. Confirm the default refusal is what your service wants, then decide about overrides per call. The digest is already correct by default, verification is two lines worth adding to any pipeline, and the log level is the one to tune once something has gone wrong and you need to see more.

## FAQ

Q: Can I combine these controls?
A: Yes, and the sample does. A single `DigitalSignOptions` carries the digest and the validity overrides at once, while `SignatureSettings` is separate and governs logging for the whole `Signature` instance.

Q: Does the log level change what my code receives?
A: No. An expired certificate still raises under `LogLevel.NONE`, and `allow_expired` still signs under `LogLevel.ALL`. Only the messages reaching your logger change.

Q: Are there licensing considerations?
A: The sample runs unlicensed in evaluation mode and still demonstrates every behaviour. A licence removes the evaluation limits.

## Conclusion

Three of these controls changed in 26.9, and each moved a silent outcome into the open: a dead certificate stops the signing, a weak digest is no longer the default, and a log level you set is one you get. Keep the refusal, override per call when you must, and verify afterwards.

Next Steps:
- Run the [complete source code](https://github.com/groupdocs-signature/pdf-signing-certificate-checks-python) against your own PDF
- Review the [API reference](https://reference.groupdocs.com/signature/python-net/) for the rest of `DigitalSignOptions`

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/certificate-validity-hash-and-logging-python/) - the same five controls with the reasoning behind the 26.9 changes
- [Sign Document with Digital Signature](https://docs.groupdocs.com/signature/python-net/sign-document-with-digital-signature/) - the full `DigitalSignOptions` reference
- [Verify Digital Signatures in Document](https://docs.groupdocs.com/signature/python-net/verify-digital-signatures-in-the-document/) - verification criteria beyond the empty options used here
- [Product documentation](https://docs.groupdocs.com/signature/python-net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/python-net/) - full API details for GroupDocs.Signature for Python via .NET
