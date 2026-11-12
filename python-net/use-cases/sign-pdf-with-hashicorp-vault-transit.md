---
id: sign-pdf-with-hashicorp-vault-transit
url: /signature/python-net/use-cases/sign-pdf-with-hashicorp-vault-transit/
title: "Sign PDFs in Python with a HashiCorp Vault Key: Integration Guide"
weight: 1
description: "Integrate GroupDocs.Signature for Python via .NET with the HashiCorp Vault Transit engine so the RSA private key never leaves Vault. Quickstart, three integration patterns, configuration reference, error handling and a production checklist."
keywords: hashicorp vault, vault transit, custom_sign_hash, external signing, pdf digital signature, python digital signature, key management, key rotation
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
Full working example available on GitHub:
[vault-transit-pdf-signing-python](https://github.com/groupdocs-signature/vault-transit-pdf-signing-python)
{{< /alert >}}

## Overview

External signing is a GroupDocs.Signature capability for Python via .NET that passes the
document digest to code you supply instead of signing with a private key the application holds.
Point that code at the HashiCorp Vault Transit engine and the result is a signed PDF whose RSA
private key was generated inside Vault, is not exportable, and is only ever asked to sign a
32-byte hash.

This guide covers the integration itself: how `DigitalSignOptions.custom_sign_hash` is wired to
a Vault client, how to get an X.509 certificate for a key you cannot export, and how to run the
whole thing with a token that holds two rights. Every detail below comes from the sample
repository running against Vault 2.2.1 in dev mode with GroupDocs.Signature 26.10.0 on Python
3.11 and 3.13.

## Quickstart

Start Vault, install the two packages, run the script:

```bash
docker compose up -d
pip install -r requirements.txt
python sign_pdf_with_vault.py
```

The first run enables the Transit engine, creates an RSA-2048 key named `pdf-signing-key`,
builds a certificate for it, signs `Resources/document.pdf` and verifies the output:

```
Vault: http://localhost:8200
Signing key: 'pdf-signing-key', version 1
Creating a self-signed certificate for the Vault key (signed by Vault)...
Signed PDF: ...\Result\signed_document.pdf
Signature valid: True
```

## Prerequisites

- Python 3.11 or 3.13 with `groupdocs-signature-net` 26.10.0 and `asn1crypto`
- Docker, for the dev-mode Vault container in `docker-compose.yml`
- Optional licence; without one, evaluation mode accepts documents of up to 2 pages

## Core Concepts

Three objects carry the whole integration. `VaultTransitClient` speaks HTTP to Vault over
`urllib`, exposing `read_key`, `create_key`, `enable_transit` and `sign_hash`. `VaultSigner`
implements the one method GroupDocs.Signature calls back into. `certificate_helper` turns the
Vault public key into an X.509 certificate that a PDF reader can use.

The division of labour matters for reasoning about security. GroupDocs.Signature prepares the
PDF, decides which byte range the signature covers, hashes it and embeds the result. Vault owns
the key and performs one RSA operation per request. Your code moves a digest between them and
never sees key material at all. Because Transit does not store what it receives, the document
also never leaves the process that opened it.

## Integration Patterns

### Pattern 1: wire the signer into DigitalSignOptions

`custom_sign_hash` accepts an object exposing that method, or a plain function with the same
arguments from 26.10 onward. The signer is bound to one key version at construction:

```python
options = DigitalSignOptions()
options.signature = digital_signature
options.custom_sign_hash = VaultSigner(vault, KEY_NAME, key.version)
options.hash_algorithm = HashAlgorithm.SHA256

with gs.Signature(str(input_pdf)) as signature:
    signature.sign(str(output_pdf), options)
```

Inside the signer, the digest goes straight to Vault with the algorithm name mapped from the
value GroupDocs.Signature passed in. Notes that decide whether the file verifies:

- The request must set `prehashed = true`. The input is already a hash, and Vault would
  otherwise hash it again.
- `signature_algorithm` must be `pkcs1v15`. Vault defaults to PSS for RSA keys, while the PDF
  signature is sha256WithRSAEncryption.
- `hash_algorithm` maps one to one, because the argument is the algorithm actually used and never
  `AUTO`: SHA256 to `sha2-256`, SHA384 to `sha2-384`, SHA512 to `sha2-512`.

### Pattern 2: build the certificate from the public half

A PDF digital signature carries a certificate so a verifier can find the public key. With a
non-exportable key, the certificate has to be assembled around the public half and signed by
Vault:

```python
_, _, public_key_der = pem.unarmor(key.public_key_pem.encode("ascii"))
tbs_certificate = x509.TbsCertificate({...})

digest = hashlib.sha256(tbs_certificate.dump()).digest()
signature = vault.sign_hash(key_name, key.version, digest, "sha2-256")
certificate = x509.Certificate({
    "tbs_certificate": tbs_certificate,
    "signature_algorithm": algorithm,
    "signature_value": signature,
})
```

The Python path differs from the .NET one here, and it is the only place it does. There is no
X.509 type in the binding, so the certificate object comes back out of `DigitalVerifyOptions`:

```python
certificate_object = DigitalVerifyOptions(
    certificate_stream=io.BytesIO(certificate)).certificate
digital_signature = DigitalSignature(certificate=certificate_object)
digital_signature.sign_time = datetime.now().astimezone()
```

Passing a path or stream to `DigitalSignOptions` instead raises "Specified certificate doesn't
contain private key". The certificate is also deliberately valid from one day earlier, and
`sign_time` is time-zone aware so the offset is written into the PDF.

### Pattern 3: run with a least-privilege token

The dev-mode root token can do everything; a signing service needs read on the key and update on
`transit/sign`. The sample ships that policy:

```bash
docker cp vault/sample-signer.hcl vault-dev:/tmp/sample-signer.hcl
docker exec vault-dev vault policy write sample-signer /tmp/sample-signer.hcl
docker exec vault-dev vault token create -policy=sample-signer -ttl=15m -field=token
```

Set the printed value as `VAULT_TOKEN` and the sample signs exactly as before, while rotating or
creating keys returns `403 permission denied`. In a real deployment the token comes from an auth
method such as AppRole rather than being minted by hand, and an administrator enables Transit and
creates the key ahead of time.

## Configuration Reference

| Setting | Where | Default |
|---------|-------|---------|
| Vault address | `VAULT_ADDR` environment variable | `http://localhost:8200` |
| Vault token | `VAULT_TOKEN` environment variable | `dev-only-token` |
| Key name | `KEY_NAME` in `sign_pdf_with_vault.py` | `pdf-signing-key` |
| Key type | argument to `create_key` | `rsa-2048` |
| Hash algorithm | `DigitalSignOptions.hash_algorithm` | SHA256, also the PDF default |
| Certificate validity | `certificate_helper` | from yesterday, one year |

## Error Handling

Vault errors surface with Vault's own text. `VaultError` carries the status code, and the client
flattens Vault's multi-line error list onto one line, which keeps the message readable in a log.

`500 crypto/rsa: input must be hashed message` means the digest length did not match the
`hash_algorithm` you declared - a 20-byte SHA-1 digest sent as `sha2-256`, for example. The
message names the symptom rather than the cause.

`403 permission denied` on `transit/sign` is the least-privilege policy working as intended, or a
token that expired. `404` on reading the key means either the key or the Transit mount is
missing, which is why `read_key` returns `None` instead of raising and the sample treats it as
first-run setup.

An exception from the signer stops `Signature.sign` and comes out of it unchanged, so a Vault
outage is not mistaken for a document problem. The sample deletes the partial output file in that
case, because a failed sign can leave a half-written PDF behind.

## Which failure should I test for first?

The silent one. A wrong algorithm name fails loudly with Vault's 500 and costs a minute. A
missing `prehashed` flag produces a PDF with no error at all: Vault hashes the digest again, the
signature covers the wrong value, and only verification reveals it. Signing a document and then
verifying it in the same run, as the sample does, catches that immediately.

## Production Readiness Checklist

- Replace dev mode with a real Vault: TLS, persistent storage, no root token
- Give the application an AppRole token and the two-permission policy
- Read the key version once and reuse it for the certificate and every signature
- Replace the self-signed certificate with a CA-issued one for the same key, through
  `transit/keys/:name/csr` or the Vault PKI engine
- Enable an audit device so every signature leaves a Vault log entry
- Re-issue the certificate whenever you rotate the key

## Frequently Asked Questions

**Does the document leave my process?**
No. Only the digest is sent, and Transit does not store what it receives.

**Can I use an HSM or a cloud KMS instead?**
Yes. `custom_sign_hash` has no idea what is behind it - replace the Vault client with the other
service's signing call and the rest of the code is unchanged.

**What happens after a key rotation?**
Vault signs with the newest version unless told otherwise, so a certificate built for version 1
and a signature from version 2 produce a PDF that reports no error and does not verify. Pinning
the version, as the sample does, prevents it.

**Why does Acrobat say the signer is unknown?**
The certificate is self-signed, so nobody has vouched for the issuer. The signature itself
verifies; only the identity is untrusted.

## Conclusion

I expected the port to need more rework than it did: the Vault request body, the pinned key
version and the digest rules are identical to the .NET build, and only the certificate hand-off
had to change. Wire a signer, build a certificate for the public half, pin the version, and the
private key has no reason to exist outside Vault.

## See Also

- [Full working example on GitHub](https://github.com/groupdocs-signature/vault-transit-pdf-signing-python) - the complete sample with the Vault compose file and policy
- [In-depth article about this build](https://blog.groupdocs.com/signature/sign-pdf-with-hashicorp-vault-transit-python-net/) - the same pipeline with the reasoning behind each step
- [Certificate validity, digests and log levels](https://docs.groupdocs.com/signature/python-net/use-cases/certificate-validity-hash-and-logging/) - expiry rules and SHA-2 choice when signing PDFs
- [Sign a document with a digital signature](https://docs.groupdocs.com/signature/python-net/sign-document-with-digital-signature/) - the standard PFX path, for comparison
- [Verify digital signatures in a document](https://docs.groupdocs.com/signature/python-net/verify-digital-signatures-in-the-document/) - the verification API in full
- [Product documentation](https://docs.groupdocs.com/signature/python-net/) - getting started and advanced topics
