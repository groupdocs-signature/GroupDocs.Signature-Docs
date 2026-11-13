---
id: sign-pdf-with-hashicorp-vault-transit
url: /signature/java/use-cases/sign-pdf-with-hashicorp-vault-transit/
title: 5 Methods to Sign PDFs in Java with a Key Held in HashiCorp Vault
weight: 1
description: "Sign PDF documents with GroupDocs.Signature for Java while the RSA private key stays inside HashiCorp Vault Transit. Five methods: reading the Transit key, building a certificate with BouncyCastle, the external signing callback, signing and verifying."
keywords: hashicorp vault, vault transit, custom sign hash, external signing, pdf digital signature, java digital signature, bouncycastle, key rotation
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
Full working example available on GitHub:
[sign-pdf-with-vault-managed-key-java](https://github.com/groupdocs-signature/sign-pdf-with-vault-managed-key-java)
{{< /alert >}}

## Overview

External signing is a GroupDocs.Signature capability for Java that hands the document digest to
a callback you provide instead of signing with a private key the application loads. Combined
with the HashiCorp Vault Transit engine it produces a signed PDF whose RSA private key was
created inside Vault, is not exportable, and is only ever asked to sign a 32-byte hash.

Five methods make up the pipeline. Each is shown with the code from the sample and the
considerations that decide whether it behaves in production. Everything here was run with
GroupDocs.Signature for Java 26.10, BouncyCastle 1.86 and Vault 2.2.1 in dev mode, on JDK 25
under Windows and JDK 17 under Linux.

## What This Use Case Covers

Reading a Transit key and creating it on first use, building an X.509 certificate for a key
that cannot be exported, the signing callback itself, the `DigitalSignOptions` setup, and
verification. It is written for Java developers who have to move a signing key off the
application host.

**Prerequisites:**
- JDK 8 or later, Maven 3, and Docker for the dev-mode Vault container
- On Linux, the font Arial, because the visible signature is drawn with it
- GroupDocs.Signature for Java 26.10; without a licence, evaluation mode accepts up to 2 pages

## Why the JDK's Own Signing Path Is Not Enough

Java can sign bytes with a `PrivateKey` from a `KeyStore`, and that is the model most PDF
tooling follows: give it a PFX, give it a password, get a signed file. The key then lives on the
application host, in a file, an image layer, a backup, or the memory of the signing process.
Permissions and encrypted volumes narrow the exposure; they do not remove the copy.

A key manager removes the copy, but only for a library that can delegate. The JDK has no
mechanism for building a certificate whose signature comes from an external service either,
which is the second half of the problem and the part developers usually discover later.

## Repository Structure

```
SignPdfWithVault.java      entry point: key, certificate, sign, verify
VaultSigner.java           the callback GroupDocs.Signature invokes
CertificateHelper.java     BouncyCastle certificate, signed by Vault
VaultTransitClient.java    Vault Transit HTTP calls
vault/sample-signer.hcl    least-privilege policy example
docker-compose.yml         Vault in dev mode, local only
```

## Method 1: Read or Create the Transit Key

### How It Works

`GET /v1/transit/keys/{name}` returns every key version with its public key in PEM form, plus
`latest_version`. The private half is never part of the answer. A 404 means the key or the
Transit mount does not exist, which the sample treats as first-run setup rather than an error.

### Implementation

```java
VaultKey key = vault.readKey(KEY_NAME);
if (key == null) {
    vault.enableTransit();
    vault.createKey(KEY_NAME, "rsa-2048");
    key = vault.readKey(KEY_NAME);
}
```

### Important Considerations

Read the version once. A certificate holds one public key, so the certificate and every
signature have to come from the same version. In production an administrator enables Transit and
creates the key, and the application's token has no right to do either.

## Method 2: Build a Certificate for a Non-Exportable Key

### How It Works

BouncyCastle's `X509v3CertificateBuilder` assembles the certificate and delegates the signature
to a `ContentSigner`. Implementing that interface against Vault yields a certificate carrying
the Vault public key and signed by the matching private key, which never leaves Vault.

### Implementation

```java
X509v3CertificateBuilder builder = new X509v3CertificateBuilder(
    subject, new BigInteger(127, new SecureRandom()),
    new Date(now - ONE_DAY), new Date(now + 365 * ONE_DAY), subject,
    SubjectPublicKeyInfo.getInstance(pemToDer(key.getPublicKeyPem())));
builder.addExtension(Extension.keyUsage, false,
    new KeyUsage(KeyUsage.digitalSignature));

return new JcaX509CertificateConverter().getCertificate(
    builder.build(new VaultContentSigner(vault, keyName, key.getVersion())));
```

### Important Considerations

The certificate starts a day early on purpose. A PDF reader compares the signing time with the
start date, and on a machine two hours east of UTC a certificate minted seconds before signing
was reported by Adobe Acrobat as expired or not yet valid. `ContentSigner` declares no checked
exceptions, so a Vault error is wrapped in `UncheckedIOException` and unwrapped by the caller.
For production, have a CA issue a certificate for the same key through
`transit/keys/{name}/csr`.

## Method 3: The External Signing Callback

### How It Works

GroupDocs.Signature calls the callback once per signature with the digest of the signed byte
range. The callback forwards it to `transit/sign` and returns the raw bytes.

### Implementation

```java
public byte[] customSignHash(
        byte[] signableHash, int hashAlgorithm, SignatureContext signatureContext)
        throws Exception {
    return vault.signHash(
        keyName, keyVersion, signableHash, toVaultHashAlgorithm(hashAlgorithm));
}
```

### Important Considerations

`hashAlgorithm` arrives as an `int` constant from `HashAlgorithm` and is the algorithm the
library really used, so it maps one to one: `Sha256` to `sha2-256`, `Sha384` to `sha2-384`,
`Sha512` to `sha2-512`, `Sha1` to `sha1`. The Vault request must set `prehashed = true`, because
the input is already a hash, and `signature_algorithm` must be `pkcs1v15`, because Vault
defaults to PSS for RSA keys while the PDF signature is sha256WithRSAEncryption.

## Method 4: Sign the PDF

### How It Works

`DigitalSignOptions` carries the public-only certificate and the callback. The signed document
goes to a stream, and the file is written only after signing succeeds.

### Implementation

```java
DigitalSignature digitalSignature = new DigitalSignature();
digitalSignature.setX509Certificate(certificate);

DigitalSignOptions options = new DigitalSignOptions();
options.setSignature(digitalSignature);
options.setCustomSignHash(signer::customSignHash);
options.setHashAlgorithm(HashAlgorithm.Sha256);
options.setVisible(true);

ByteArrayOutputStream signedPdf = new ByteArrayOutputStream();
signature.sign(signedPdf, options);
Files.write(outputPdf, trimTrailingZeros(signedPdf.toByteArray()));
```

### Important Considerations

The callback goes in as a method reference because the `ICustomSignHash` method carries an
obfuscated name in the 26.10 jar and cannot be implemented by name. Version 26.10 also pads the
signed output with zero bytes past the end of the PDF, outside the signed range, so the sample
trims them. The signing time is a Java `Date` and therefore has no time zone, unlike the
offset-aware value the Python port writes.

## Method 5: Verify Before Anything Is Released

### How It Works

`DigitalVerifyOptions` built from the certificate ties the result to the expected signer, and
`isValid()` answers whether the signature covers the file as it stands.

### Implementation

```java
return signature.verify(new DigitalVerifyOptions(certificateFile.toString()))
    .isValid();
```

### Important Considerations

In 26.10 the certificate must be a file path; the stream form throws a `NullPointerException`.
The sample therefore writes `Result/vault-signer.cer` and verifies against it. A self-signed
certificate satisfies the cryptographic check, while Acrobat additionally wants a trusted issuer
and reports the signer's identity as unknown without one.

## Which failure should I guard against first?

The silent one. A wrong algorithm name fails loudly, with Vault answering
`500 crypto/rsa: input must be hashed message`. A missing `prehashed` flag produces no error at
all: Vault hashes the digest again, the signature covers the wrong value, and the PDF looks
finished. Method 5 in the same run is what turns that into an immediate failure.

## Common Questions

**Does the document leave the JVM?**
No. Only the digest is sent, and Transit does not store what it receives.

**Can the same code use an HSM or a cloud KMS?**
Yes. The callback has no idea what is behind it; replace the Vault client with the other
service's signing call.

**What happens after a key rotation?**
Vault signs with the newest version unless told otherwise, so a certificate for version 1 and a
signature from version 2 give a PDF that reports no error and does not verify. Pinning the
version prevents it.

**Why does signing fail on a Linux container?**
The visible signature box is drawn with Arial. Install the font, or turn the visible box off.

## Summary and When to Use Which Method

Methods 1 and 2 are setup and run once per key; methods 3 to 5 are the signing path. Use the
whole set when the key must stay in a key manager. If the key may live in a PFX, the standard
digital-signature options are simpler and these five methods are unnecessary.

I kept the version pinning from the .NET build when porting this, and that choice is what makes
the certificate and the signature agree after somebody rotates the key in Vault.

## See Also

- [Full working example on GitHub](https://github.com/groupdocs-signature/sign-pdf-with-vault-managed-key-java) - the sample with the Vault compose file and policy
- [In-depth article about this build](https://blog.groupdocs.com/signature/sign-pdf-with-hashicorp-vault-transit-java/) - from the old PFX approach to the finished pipeline
- [Certificate validity, digests and logging in Java signing](https://docs.groupdocs.com/signature/java/use-cases/certificate-validity-hash-and-logging/) - expiry rules and digest choice
- [eSign a document with a digital signature](https://docs.groupdocs.com/signature/java/esign-document-with-digital-signature/) - the standard PFX path, for comparison
- [Verify digital signatures in a document](https://docs.groupdocs.com/signature/java/verify-digital-signatures-in-the-document/) - the verification API in full
- [Iterative digital signing of a PDF document](https://docs.groupdocs.com/signature/java/iterative-digital-signing-of-the-pdf-document/) - adding a second signature
- [Product documentation](https://docs.groupdocs.com/signature/java/) - getting started and advanced topics
