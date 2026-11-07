---
id: sign-pdf-with-hashicorp-vault-transit
url: /signature/net/use-cases/sign-pdf-with-hashicorp-vault-transit/
title: How to Sign PDFs in .NET with a Key Kept in HashiCorp Vault - 3 Practical Tutorials
weight: 1
description: "Sign PDF documents with GroupDocs.Signature for .NET while the RSA private key stays inside HashiCorp Vault Transit. Three tutorials: the ICustomSignHash signer, a certificate for a non-exportable key, and a least-privilege token."
keywords: hashicorp vault, vault transit, icustomsignhash, external signing, pdf digital signature, key management, dotnet signing, least privilege
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[sign-pdf-with-hashicorp-vault-transit-dotnet](https://github.com/groupdocs-signature/sign-pdf-with-hashicorp-vault-transit-dotnet)
{{< /alert >}}

## Getting Started

External signing is a GroupDocs.Signature capability for .NET that passes the document digest to code you provide instead of signing with a key the application holds. Combined with the HashiCorp Vault Transit engine it produces a signed PDF whose private key never existed outside Vault: the key is generated inside Vault, marked non-exportable, and only ever asked to sign a 32-byte digest.

These three tutorials build that pipeline - the signer itself, the certificate problem that catches everyone first, and the Vault policy that stops the signing application from doing anything except sign.

## What This Tutorial Covers

The `ICustomSignHash` implementation and how GroupDocs.Signature calls it, how to produce an X.509 certificate for a key you cannot export, and how to run the whole thing with a token that holds two rights. Every output quoted here comes from running the sample against Vault 2.2.1 in dev mode with GroupDocs.Signature 26.9.0 on .NET 10.

**Prerequisites:**
- .NET 10 SDK and Docker, for the dev-mode Vault container
- GroupDocs.Signature 26.9.0; without a licence, evaluation mode accepts documents of up to 2 pages

## Understanding the Problem

### Why Native Solutions Fall Short

The ordinary way to sign a PDF in .NET is to hand the library a PFX file and its password. That works, and it means the private key is on the application server - in a file, in a container image, in a secret store that eventually writes it to disk, or in memory where a crash dump can reach it. Anyone with the file and the password is you, permanently, until the certificate is revoked.

Moving the key to a hardware module or a key manager fixes that, but only if the signing library can be told to ask something else for the signature. A library that insists on loading a private key cannot be used that way at all.

### How GroupDocs.Signature Solves This

`DigitalSignOptions.CustomSignHash` takes an `ICustomSignHash` implementation. GroupDocs.Signature does everything up to the cryptography: it prepares the PDF, works out the byte range the signature covers, hashes it, and then calls your code with that digest. You return the signature bytes from wherever you like. Vault Transit is a natural fit because it signs a digest without wanting the document.

## Tutorial 1: The external signer - the basics

### What You'll Learn

The one method that connects GroupDocs.Signature to Vault, and the two details that decide whether the resulting PDF verifies.

### Step 1: Implementation

```csharp
public byte[] CustomSignHash(
    byte[] signableHash,
    HashAlgorithm hashAlgorithm,
    SignatureContext signatureContext)
{
    return _vault.SignHashAsync(
            _keyName, _keyVersion, signableHash, ToVaultHashAlgorithm(hashAlgorithm))
        .GetAwaiter().GetResult();
}
```

### Step 2: Send the digest as already hashed

`signableHash` is the digest of the PDF's signed byte range, not the document. The Vault request therefore sets `prehashed = true`; without it Vault hashes the digest again and the signature covers the wrong value, producing a PDF that opens happily and fails verification.

### Step 3: Map the algorithm rather than assuming it

Since 26.9 the `hashAlgorithm` argument is the algorithm GroupDocs.Signature actually used, never `Auto`, so it maps directly onto Vault's names - `Sha256` to `sha2-256`, `Sha384` to `sha2-384`, `Sha512` to `sha2-512`.

### Common Issues and Solutions

Sending a 20-byte SHA-1 digest while telling Vault `sha2-256` returns `500 crypto/rsa: input must be hashed message`. The error names the real problem only indirectly; it means the digest length did not match the algorithm you declared. I met it while reviewing the first version of this sample, which mapped SHA-1 to `sha2-256` on the assumption that Vault could not sign SHA-1; Vault can, and the fix was to map `Sha1` to `sha1`.

`ICustomSignHash` is synchronous, so an async Vault client has to be waited on. In a console application there is no synchronization context to deadlock against; in a UI application or classic ASP.NET, which have one, give the client a synchronous path instead of blocking.

## Tutorial 2: A certificate for a key you cannot export

### What You'll Learn

Why a non-exportable key still needs a certificate, and how to get one without the private key.

### Step 1: Understand the requirement

A PDF digital signature carries an X.509 certificate so a verifier can find the public key. Vault will not hand over the private key - that is the entire point - so the certificate has to be built around the public key and signed by Vault itself.

### Step 2: Implementation

```csharp
using RSA publicKey = RSA.Create();
publicKey.ImportFromPem(key.PublicKeyPem);   // public half, read from Vault

var subject = new X500DistinguishedName("CN=Vault Transit Signer");
var request = new CertificateRequest(
    subject, publicKey, HashAlgorithmName.SHA256, RSASignaturePadding.Pkcs1);
request.CertificateExtensions.Add(
    new X509KeyUsageExtension(X509KeyUsageFlags.DigitalSignature, false));

// Hashes the certificate data locally; Vault signs the digest with the same key version
var generator =
    new VaultX509SignatureGenerator(publicKey, vault, keyName, key.Version);

DateTimeOffset now = DateTimeOffset.UtcNow;
X509Certificate2 certificate = request.Create(
    subject, generator, now.AddDays(-1), now.AddYears(1),
    RandomNumberGenerator.GetBytes(16));
```

`VaultX509SignatureGenerator` is a small subclass of .NET's `X509SignatureGenerator`: it returns the Vault public key and the sha256WithRSAEncryption identifier, and its `SignData` hashes the certificate bytes and sends only the digest to `transit/sign`. The certificate starts a day early on purpose, for the reason in the Real-World Example below.

### Step 3: Pass the certificate as an object

```csharp
var options = new DigitalSignOptions
{
    Signature = new DigitalSignature(certificate) { SignTime = DateTime.Now },
    CustomSignHash = signer,
    HashAlgorithm = HashAlgorithm.Sha256,
    Reason = "Document signed with HashiCorp Vault Transit",
    Location = "HashiCorp Vault"
};
```

`new DigitalSignature(certificate)` is required here. The `DigitalSignOptions(path)` constructor expects a certificate file that contains a private key, and a public-only certificate makes it fail with "Specified certificate doesn't contain private key" - a confusing message when the whole design is that there is no private key to give.

### Real-World Example

`SignTime = DateTime.Now` matters more than it looks. A local time is written into the PDF with its UTC offset; the default UTC time is written without one, and Adobe Acrobat then reads it as the reader's own local time. If that shifts the signing moment to before the certificate's start, Acrobat reports "Signer's identity is invalid because it has expired or is not yet valid" on a signature that is perfectly good.

### Troubleshooting

A self-signed certificate verifies cryptographically and still shows "Signer's identity is unknown" in Acrobat, because nobody has vouched for the issuer. For production, have a CA issue a certificate for the same key: Transit can sign a CSR through `transit/keys/:name/csr`, or Vault's PKI engine can act as the internal CA.

## Tutorial 3: Least privilege and key rotation

### What You'll Learn

How to run the signer with a token that can do nothing else, and the rotation trap that produces silently invalid PDFs.

### Step 1: Give the application two rights

```bash
docker cp vault/sample-signer.hcl vault-dev:/tmp/sample-signer.hcl
docker exec vault-dev vault policy write sample-signer /tmp/sample-signer.hcl
docker exec vault-dev vault token create -policy=sample-signer -ttl=15m -field=token
```

The policy allows reading the key and signing with it. Running the sample with that token signs exactly as before, while rotating or creating keys returns `403 permission denied`.

### Step 2: Pin the signature to the certificate's key version

```csharp
var signer = new VaultSigner(vault, KeyName, key.Version);
```

After `transit/keys/:name/rotate`, Vault signs with the newest version unless told otherwise. A certificate built for version 1 plus a signature from version 2 produces a PDF with no error and no valid signature. Reading the version once and using it for both sides is what prevents that.

### Step 3: Expect the guard rails

`min_encryption_version=2` makes version 1 unusable for signing: Vault answers "requested version for signing is less than the minimum encryption key version". That is a useful setting after a rotation, provided the certificate moved with it.

## Which part should I get right first?

The digest handling: `prehashed = true` with the correct algorithm name. A wrong name fails loudly with the 500 above; a missing `prehashed` does not. Vault then hashes the digest again, and the PDF gets a signature that fails verification without any error at signing time. The certificate and the policy can be fixed later; a batch of documents signed over the wrong value cannot.

## Common Questions

**Does the document leave my process?**
No. Only the digest is sent, and Transit does not store what it receives.

**Can I use this with an HSM or a cloud KMS instead?**
Yes. `ICustomSignHash` has no idea what is behind it - swap the Vault client for the other service's signing call.

**What happens if Vault is unreachable or refuses?**
The error from the signer comes out of `Signature.Sign` as a `GroupDocsSignatureException` whose message starts with "Sign document error:" followed by the original message. The sample then deletes the partial output file, because a failed sign can leave a half-written PDF behind.

## Summary and Next Steps

Three pieces: a signer that returns bytes for a digest, a certificate built around a key you cannot export, and a token allowed to do only this. The sample runs against a dev-mode Vault in two commands, and the same code points at a production Vault by changing `VAULT_ADDR` and the token.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/sign-pdf-with-hashicorp-vault-transit-csharp/) - the same build with screenshots of the Acrobat and audit-log output
- [Digital signing with custom hash](https://docs.groupdocs.com/signature/net/digital-signing-with-custom-hash/) - the `ICustomSignHash` reference
- [Sign document with digital signature](https://docs.groupdocs.com/signature/net/sign-document-with-digital-signature/) - the full `DigitalSignOptions` surface
- [Iterative digital signing of the PDF document](https://docs.groupdocs.com/signature/net/iterative-digital-signing-of-the-pdf-document/) - adding more than one signature
- [Product documentation](https://docs.groupdocs.com/signature/net/) - getting started and advanced topics
