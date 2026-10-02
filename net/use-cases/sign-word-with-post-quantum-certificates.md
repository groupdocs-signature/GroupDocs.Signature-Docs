---
id: sign-word-with-post-quantum-certificates
url: /signature/net/use-cases/sign-word-with-post-quantum-certificates/
title: "Signing Word Documents with Post-Quantum ML-DSA Certificates: Integration Guide"
weight: 1
description: "Add ML-DSA (FIPS 204) signing to a .NET document pipeline with GroupDocs.Signature 26.9: the same DigitalSignOptions call, all three security levels, verification by public certificate, and the platform and validator caveats."
keywords: post-quantum, ml-dsa, fips 204, word signing, docx signature, digital signature, groupdocs signature, dotnet signing, quantum-safe, cnsa 2.0
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[sign-word-with-ml-dsa-certificates-dotnet](https://github.com/groupdocs-signature/sign-word-with-ml-dsa-certificates-dotnet)
{{< /alert >}}

## Overview

Post-quantum signing is a GroupDocs.Signature capability for .NET that signs Word documents with ML-DSA certificates, the NIST signature algorithm standardised as FIPS 204. It landed in 26.9 for Word formats - DOCX, DOC, ODT and the rest of the family - on every supported platform.

The integration question is narrower than "migrate to post-quantum". It is: can the library you already use emit an ML-DSA signature, what does it cost, who can verify it, and what does not work yet. This guide answers those four, with code from a sample that signs one contract at all three security levels and verifies the result two ways.

I expected this to need a separate code path and wrote one before realising the certificate alone decides the algorithm; that discovery is most of why this page is short.

**What this guide covers:**
Signing with an ML-DSA certificate using the same call shape as RSA, choosing between ML-DSA-44, 65 and 87 and what that costs in bytes, verifying with the signer's public certificate while confirming a wrong one fails, and the two limits worth planning around.

## Quickstart

**Step 1: add the package**

```bash
dotnet add package GroupDocs.Signature --version 26.9.0
```

**Step 2: sign with an ML-DSA PFX**

```csharp
using var signature = new Signature(sourcePath);

var options = new DigitalSignOptions(pfxPath)
{
    Password = CertificatePassword
};

SignResult result = signature.Sign(outputPath, options);
```

There is no ML-DSA-specific API. The algorithm comes from the certificate, so the only thing that changes compared with an RSA signature is which PFX you point at.

**Step 3: confirm what signed it**

```csharp
var created = result.Succeeded.OfType<DigitalSignature>().FirstOrDefault();
return created?.Certificate?.Subject ?? "(no certificate returned)";
```

## Prerequisites

.NET SDK 8.0, GroupDocs.Signature 26.9.0 or later, and an ML-DSA certificate in PFX form. The sample ships self-signed test certificates for all three levels, valid 2026 to 2056, plus the public `.cer` for the middle one.

## Core Concepts

**ML-DSA** is a lattice-based signature scheme, FIPS 204, designed to remain secure against an adversary with a large quantum computer. It replaces RSA and ECDSA in that threat model rather than supplementing them.

**The three parameter sets** map to NIST security categories: ML-DSA-44 to category 2, ML-DSA-65 to category 3, ML-DSA-87 to category 5. Keys and signatures grow with the level.

**Certificate reading** is where platforms differ. .NET cannot read ML-DSA keys everywhere - on Linux with .NET 8 it cannot - so GroupDocs.Signature falls back to the certificate as read by the Word engine. Your code does not change; the fallback is internal.

### Why is the format support limited to Word?

Because the signing containers differ per format and each needs its own ML-DSA path. Word formats went first in 26.9; PDF, spreadsheets and presentations cannot be signed with ML-DSA yet. If your pipeline is PDF-first, this release lets you prototype and measure, not switch over - which is still useful, because the certificate procurement is usually the long pole rather than the code.

## Integration Patterns

### Pattern 1: Sign, then confirm the subject

The minimal path. Sign, then read the certificate back out of the result rather than assuming which one was used.

```csharp
using var signature = new Signature(sourcePath);

var options = new DigitalSignOptions(pfxPath)
{
    Password = CertificatePassword
};

SignResult result = signature.Sign(outputPath, options);
var created = result.Succeeded.OfType<DigitalSignature>().FirstOrDefault();
```

The algorithm is a property of the certificate rather than of the options object, and `Succeeded` is a list, so filtering to `DigitalSignature` is what gives you the certificate back.

### Pattern 2: Measure the levels before standardising

Policy may pick the level for you. When it does not, measure rather than guess:

```csharp
var levels = new Dictionary<string, string>
{
    ["ML-DSA-44"] = MlDsa44Pfx,
    ["ML-DSA-65"] = MlDsa65Pfx,
    ["ML-DSA-87"] = MlDsa87Pfx
};
```

Each entry signs the same source and the output size is recorded:

```csharp
sizes[$"{level.Key} -> {fileName}"] = new FileInfo(outputPath).Length;
```

ML-DSA-65 is the sensible default when nothing prescribes a level, and profiles such as CNSA 2.0 name ML-DSA-87 specifically. The size difference is per document, so it compounds in a large archive - which is the reason to measure rather than default to the strongest available.

### Pattern 3: Verify with the public certificate, and prove a wrong one fails

A verification routine that has only ever seen valid input has not been tested.

```csharp
using var signature = new Signature(signedPath);

var options = new DigitalVerifyOptions(certificatePath);
if (password != null)
{
    options.Password = password;
}

VerificationResult result = signature.Verify(options);
return result.IsValid;
```

The sample calls this twice: once with the signer's `.cer`, expecting true, and once with a different signer's PFX, expecting false. Recipients need only the public certificate, which is what makes trust distribution practical.

### Pattern 4: Inventory what a received document already carries

```csharp
List<DigitalSignature> found =
    signature.Search<DigitalSignature>(SignatureType.Digital);
```

Each result carries the certificate, the signing time and `IsValid`. For an ML-DSA signature the certificate returned is the public one.

## Limits Worth Planning Around

| Limit | Detail | What to do |
|---|---|---|
| Format coverage | Word formats only in 26.9 | prototype on DOCX; keep PDF on RSA for now |
| Validator support | no standard XML-DSig identifier for ML-DSA yet | expect Word to show the signature as unvalidated |
| Platform key reading | .NET cannot read ML-DSA keys on Linux with .NET 8 | nothing - the library falls back to the Word engine |
| Certificate supply | public CAs are still rolling out ML-DSA | self-sign for testing, plan procurement early |

The validator point is the one that surprises people. The signature is cryptographically sound and verifies through GroupDocs.Signature; Microsoft Word simply has no identifier to recognise it by. That is a standards gap rather than a defect, and it will close.

### What does a dual-track period look like?

Keep RSA where ML-DSA cannot go yet - PDF, spreadsheets, presentations - and sign Word output with ML-DSA in parallel. The
important part is recording which algorithm was used per document, in whatever metadata or audit table the pipeline already
writes. Without that, a future audit has to open files to find out, and the answer matters: an ML-DSA signature verified
today may need re-verification tooling that an RSA one does not.

## Production Readiness Checklist

- [ ] Certificates come from your CA, their validity window is monitored, and the chosen level is recorded where a policy review can find it
- [ ] Verification is exercised with both a correct and an incorrect certificate in tests
- [ ] The Word-only format limit is reflected in what the pipeline promises its callers, and output sizes are measured if the archive is large

## Frequently Asked Questions

**Do I need different code for ML-DSA than for RSA?**
No. `DigitalSignOptions` takes the PFX path and password either way, and the algorithm follows from the certificate. That is the main practical finding of this sample.

**Will Microsoft Word show the signature as valid?**
Probably not yet. There is no standard XML-DSig identifier for ML-DSA, so Word may report the signature as unrecognised even though it verifies correctly through the API. Verify programmatically rather than by opening the file.

**Can I sign PDFs this way?**
Not in 26.9. Word formats only. PDF, spreadsheets and presentations are not supported with ML-DSA yet.

**Is self-signing good enough to start?**
For testing, yes, and the sample does exactly that. For anything that leaves your organisation you need certificates from a CA, and since public CAs are still rolling out ML-DSA, that is worth starting before the code work rather than after.

## Conclusion

The code change is a different PFX. Everything else - choosing a level, verifying with a public certificate, listing signatures on an incoming file - works the way it already does for RSA. Clone the sample, run it against your own contract, and the three output sizes plus the two verification results tell you most of what a migration plan needs to know.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/sign-word-with-post-quantum-certificates-net/) - what post-quantum readiness looks like for documents today
- [Sign Document with Digital Signature](https://docs.groupdocs.com/signature/net/sign-document-with-digital-signature/) - the `DigitalSignOptions` reference
- [Verify Digital Signatures in the Document](https://docs.groupdocs.com/signature/net/verify-digital-signatures-in-the-document/) - verification by certificate
- [Product documentation](https://docs.groupdocs.com/signature/net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/net/) - full API details for GroupDocs.Signature for .NET
