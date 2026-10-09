---
id: sign-word-with-post-quantum-certificates
url: /signature/python-net/use-cases/sign-word-with-post-quantum-certificates/
title: Which ML-DSA Level Should You Sign Word Documents With? A Python Comparison
weight: 1
description: "Compare the three ML-DSA security levels for signing DOCX with GroupDocs.Signature for Python: the same DigitalSignOptions call for each, measured file sizes, verification by public certificate, and the Word validator caveat."
keywords: post-quantum, ml-dsa, fips 204, word signing, docx signature, python signing, quantum-safe, cnsa 2.0
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
toc: true
draft: true
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[sign-docx-with-mldsa-certificates-python](https://github.com/groupdocs-signature/sign-docx-with-mldsa-certificates-python)
{{< /alert >}}

## Introduction

Post-quantum document signing is the GroupDocs.Signature feature for Python that puts an ML-DSA certificate on a Word file in place of an RSA or ECDSA one. ML-DSA is FIPS 204, standardised by NIST in 2024, and Word-format support landed in GroupDocs.Signature 26.9.

The decision this page exists for is not whether to use it but which of its three parameter sets to use. ML-DSA-44, ML-DSA-65 and ML-DSA-87 are the same algorithm at three strengths, they are selected the same way - by handing over a different certificate - and they differ in output size by a few kilobytes. That makes the choice a policy question with a measurable cost, which is the kind worth putting numbers on.

## What This Guide Covers

The one call that signs, the three levels compared on measured output rather than description, how a recipient verifies with nothing but a public certificate, and how to read an existing signature back out of a document. Every size quoted comes from running the sample on a 132 KB contract.

Prerequisites:
- Python 3.9 or later, 64-bit, with `groupdocs-signature-net` 26.10.0
- An ML-DSA certificate as a PFX; the sample ships three self-signed test ones

## Quick Decision Matrix

| Scenario | Level | Why |
|---|---|---|
| No policy names a level | ML-DSA-65 | NIST category 3, the balanced default |
| National-security systems | ML-DSA-87 | CNSA 2.0 requires it |
| Millions of small signed files | ML-DSA-44 | smallest output, category 2 |
| Recipients validate inside Word | stay with RSA | no XML-DSig identifier for ML-DSA yet |
| PDF, Excel or PowerPoint | stay with RSA | ML-DSA covers Word formats only |

## The Call That Does the Signing

All three levels run through the same two lines. The level is a property of the certificate, not of the API:

```python
with signature.Signature(source_path) as sign:
    options = DigitalSignOptions(pfx_path)
    options.password = CERTIFICATE_PASSWORD

    result = sign.sign(output_path, options)
```

That is the whole adoption story for existing code: a pipeline already signing with RSA through `DigitalSignOptions` switches by pointing at a different PFX. Reading the subject back off `result.succeeded` has one quirk worth knowing - the certificate is a bridge object that resolves attributes dynamically, so `certificate.subject` works while `dir()` on it lists nothing.

## Level 1 - ML-DSA-44

Overview: the smallest parameter set, at NIST security category 2.

When to use: high-volume signing where the per-file overhead is multiplied by a very large number, and no policy demands more. Category 2 is not weak - it is the floor NIST considers adequate - but it is the level you would have to justify if asked.

Advantages: smallest signed output of the three, same API, same verification path.
Limitations: the least headroom if security categories are revised upward over the document's life, which for a long-retention file is the whole point of moving.

## Level 2 - ML-DSA-65

Overview: NIST security category 3, and the level the sample signs with by default.

When to use: as the default. It sits in the middle on both strength and size, and costs about 2.5 KB more per file than ML-DSA-44 on the sample contract.

Advantages: no justification needed in either direction; a reasonable answer when the requirement is "post-quantum" with no level attached.
Limitations: not sufficient where a profile explicitly names category 5.

## Level 3 - ML-DSA-87

Overview: NIST security category 5, the strongest of the three.

When to use: where a profile requires it - CNSA 2.0 does for national-security systems - and, honestly, wherever the extra few kilobytes do not matter. For contracts, deeds and consent forms, they do not.

Advantages: the most margin against future revision of the categories, which matters most for the documents that live longest.
Limitations: largest output, about 6 KB above ML-DSA-44 per signature on the sample.

## Side-by-Side Comparison

Measured on the same 132 KB `contract.docx`, one signature each:

| Level | NIST category | Signed file | Over ML-DSA-44 |
|---|---|---|---|
| ML-DSA-44 | 2 | 138,202 bytes | - |
| ML-DSA-65 | 3 | 140,650 bytes | +2,448 bytes |
| ML-DSA-87 | 5 | 143,971 bytes | +5,769 bytes |

The spread is under 6 KB across the full range of strengths. I had expected the gap between the weakest and strongest to be the kind of number that forces a trade-off, and on a document of this size it simply is not one.

## Verifying a Signed Document

A recipient needs the signer's public certificate and nothing else:

```python
with signature.Signature(signed_path) as sign:
    options = DigitalVerifyOptions(certificate_path)
    if password is not None:
        options.password = password

    return sign.verify(options).is_valid
```

The sample runs this twice against the same signed file: once with `mldsa65.cer`, the public certificate matching the signing key, and once with a different signer's PFX. The first is `True`, the second `False`. A wrong certificate produces a `False` rather than an exception, because being signed by somebody else is an answer. The check covers the document content together with the certificate's serial number and thumbprint, so a file altered after signing also comes back `False`.

## Reading the Signatures Back

```python
with signature.Signature(signed_path) as sign:
    found = sign.search(SignatureType.DIGITAL)
    for item in found:
        print(item.sign_time, item.is_valid)
```

`search` with `SignatureType.DIGITAL` returns `DigitalSignature` objects carrying the certificate, the signing time and a validity flag. Use it on an incoming document when you do not know in advance which certificate to expect - it answers who signed and whether the signature still holds, before you process the file.

## Which level should I sign with?

ML-DSA-65 unless something tells you otherwise. It is NIST category 3, it costs about 2.5 KB per signature over the smallest option, and it needs no explanation in a review. Move to ML-DSA-87 when a profile such as CNSA 2.0 requires category 5, or whenever output size is irrelevant - which for contracts it usually is. Choose ML-DSA-44 only when file count makes kilobytes matter.

## Common Pitfalls and How to Avoid Them

1. **Expecting Microsoft Word to show the signature as valid**
   - Problem: there is no standard XML-DSig identifier for ML-DSA yet, so Word may not validate it even though the signature is correct.
   - Solution: verify with GroupDocs.Signature, and keep RSA for documents whose recipients rely on Word's own indicator.

2. **Trying ML-DSA on a PDF or spreadsheet**
   - Problem: ML-DSA signing covers Word formats only in 26.9 - DOCX, DOC, ODT and the rest.
   - Solution: check the format before choosing the certificate; other formats still sign with RSA or ECDSA.

3. **Shipping the test certificates**
   - Problem: the sample's three PFX files are self-signed and carry a published password, so anything signed with them proves nothing.
   - Solution: replace them with certificates from your own CA before signing anything that matters.

## FAQ

Q: Does switching to ML-DSA change my signing code?
A: No. The same `DigitalSignOptions` takes the PFX path and password; only the certificate differs. That is the main practical argument for migrating early.

Q: Can one document carry both an RSA and an ML-DSA signature?
A: Yes, Word documents hold multiple digital signatures, and `search` reports each one with its own certificate and validity flag.

Q: Why does the certificate returned for an ML-DSA signature look different?
A: It is the public certificate rather than the full signing certificate, which is all a recipient needs to verify.

## Conclusion

The level is the only real decision, and it is cheaper than it looks: under 6 KB separates category 2 from category 5 on a typical contract. Default to ML-DSA-65, go to ML-DSA-87 where a profile requires it or size is free, and keep RSA where the format is not a Word format or the recipient validates in Word itself.

Next steps:
- Run the [complete source code](https://github.com/groupdocs-signature/sign-docx-with-mldsa-certificates-python) against one of your own documents
- Review the [API reference](https://reference.groupdocs.com/signature/python-net/) for the rest of `DigitalSignOptions`

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/sign-word-with-post-quantum-certificates-python-net/) - the same four operations with the migration reasoning
- [Sign Document with Digital Signature](https://docs.groupdocs.com/signature/python-net/sign-document-with-digital-signature/) - the full `DigitalSignOptions` reference
- [Verify Digital Signatures in Document](https://docs.groupdocs.com/signature/python-net/verify-digital-signatures-in-the-document/) - verification criteria beyond a certificate file
- [Search for Digital e-Signatures](https://docs.groupdocs.com/signature/python-net/search-for-digital-e-signatures/) - the search API and its options
- [Product documentation](https://docs.groupdocs.com/signature/python-net/) - getting started and advanced topics
