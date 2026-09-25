---
id: sign-password-protected-pdf
url: /signature/python-net/use-cases/sign-password-protected-pdf/
title: 4 Password Strategies for Signing Encrypted PDFs - Complete Comparison Guide
weight: 1
description: "Compare four ways an encrypted PDF responds to signing with GroupDocs.Signature for Python via .NET: no password, wrong password, keep the original, and re-key the signed copy. Code, failure contracts and a decision table."
keywords: sign password protected pdf, qr code signature, python signing, encrypted pdf, load options password, save options, password rotation, groupdocs signature, python via net, pdf security
productName: GroupDocs.Signature for Python via .NET
structuredData:
    showOrganization: True
toc: true
draft: false
---

{{< alert style="info" >}}
💡 Full working example available on GitHub:
[qr-sign-password-protected-pdf-python](https://github.com/groupdocs-signature/qr-sign-password-protected-pdf-python)
{{< /alert >}}

## Introduction

Signing an encrypted PDF is a GroupDocs.Signature capability for Python via .NET that applies a signature to a password-protected document and writes the result still protected, without producing a decrypted copy at any point. The password goes in through `LoadOptions`; what happens to the output's protection is decided by `SaveOptions`.

That matters because the habitual approach is decrypt, sign, re-encrypt. For the duration of those three steps a readable copy of a deliberately protected document sits on disk, usually in a temp directory nobody audits. This page compares the four password strategies the API gives you instead, including the two that fail on purpose, because telling those two failures apart is what makes an automated pipeline usable.

## What This Guide Covers

Every code block comes from a single runnable script that signs `documents/protected.pdf` with a QR code, exercises all four paths in one run, and reads the signature back through the original password. The comparison tables below are about behaviour and cost - what each path needs, what it writes, and how it reports failure - not benchmarks.

**Prerequisites:**
- Python 3 with `groupdocs-signature-net==26.1`
- A PDF protected with a user password; the sample ships one opened with `1234567890`

## Quick Decision Matrix

| Scenario | Recommended Strategy | Why |
|---|---|---|
| Signing a protected document in a pipeline | Keep the original password | no `SaveOptions` needed, nothing written in the clear |
| Handing the signed copy to a different party | Re-key with `SaveOptions` | source keeps its credential, the copy gets a new one |
| Password came from a user form | Inspect first, then sign | a bad credential fails on a cheap call, not mid-batch |
| Password may be missing entirely | Branch on the proxy name | `PasswordRequiredException` means prompt, not retry |
| Credential rejected | Branch on the proxy name | `IncorrectPasswordException` means the secret is stale |

## Strategy Comparison Overview

| Strategy | Complexity | Cost | Output protection | Best For |
|---|---|---|---|---|
| **No password** | none | fails on open, nothing written | n/a | demonstrating the contract |
| **Wrong password** | none | fails on open, nothing written | n/a | distinguishing a stale credential |
| **Keep original** | low | one open plus one save | same password as the source | the default pipeline path |
| **Re-key on save** | low | one open plus one save | the new password only | handover and rotation |

## Detailed Strategy Analysis

### Strategy 1: Open with no password

The baseline, and worth running once so the error is familiar. `Signature` is constructed without `LoadOptions`, so the encrypted source cannot be opened and the call fails before any signing work begins.

```python
options = _build_qr_options(qr_text)
try:
    with signature.Signature(source_path) as sign:
        sign.sign(output_path, options)
    return ""
except RuntimeError as error:
    return proxy_error_name(error)
```

The result is `PasswordRequiredException`, and no file is written. Note the `except RuntimeError` - that is not a shortcut, it is the only thing that works on this binding.

### Strategy 2: Open with the wrong password

Same code shape, one changed value, and a different name comes back.

```python
load_options = LoadOptions()
load_options.password = wrong_password
```

The failure is `IncorrectPasswordException`. A pipeline that can see the difference between this and the previous one can prompt in the first case and raise an alert about a stale secret in the second; a pipeline that only sees `RuntimeError` has to treat both the same way.

### Strategy 3: Keep the original password

The path most services want, and the one that needs the least code.

```python
load_options = LoadOptions()
load_options.password = password
options = _build_qr_options(qr_text)
with signature.Signature(source_path, load_options) as sign:
    result = sign.sign(output_path, options)
    return len(result.succeeded)
```

There is no `SaveOptions` in that snippet on purpose. `use_original_password` defaults to `True`, so the signed output is re-protected with the source password automatically. Nothing unprotected reaches the disk, not even for an instant, and the return value is the number of signatures written.

### Strategy 4: Re-key the signed copy

Rotation: the source keeps its current password, the signed copy opens only with a new one.

```python
load_options = LoadOptions()
load_options.password = password
save_options = SaveOptions()
save_options.password = new_password
save_options.use_original_password = False
options = _build_qr_options(qr_text)
with signature.Signature(source_path, load_options) as sign:
    result = sign.sign(output_path, options, save_options)
    return len(result.succeeded)
```

Both lines of `SaveOptions` are required. Setting `password` while leaving `use_original_password` at its default does nothing visible - the flag wins and the output keeps the old credential, which is a quiet way to hand someone a file they cannot open with the password you sent them.

## The Failure Contract

The Python binding exposes `PasswordRequiredException`, `IncorrectPasswordException` and `GroupDocsSignatureException` as bare names that do not inherit from `BaseException`. Naming one in an `except` clause raises `TypeError: catching classes that do not inherit from BaseException is not allowed`, so the intuitive code replaces the real error with a different one.

What actually arrives is a `RuntimeError` whose message starts with `Proxy error(<Name>): `. Parsing that prefix recovers the original cause:

```python
message = str(error)
marker = "Proxy error("
if not message.startswith(marker):
    return ""
start = len(marker)
end = message.find(")", start)
if end < 0:
    return ""
return message[start:end]
```

Branch on the returned name, not on the message body, which carries file paths and varies between runs. I lost an afternoon to the intuitive version of this handler before reading the message closely enough to notice the prefix.

### Can I inspect a protected document without signing it?

Yes, and it is the cheapest way to validate a password before a batch. Opening with `LoadOptions.password` and calling `get_document_info` returns the format, page count and size while the file on disk stays encrypted. Nothing is decrypted to a temporary copy, so a pipeline that is not permitted to store plaintext can still report on the document.

```python
load_options = LoadOptions()
load_options.password = password
with signature.Signature(source_path, load_options) as sign:
    info = sign.get_document_info()
    return info.file_type.file_format, info.page_count, info.size
```

## Verifying the Result

Reading the signature back doubles as proof that the output is still protected, because the read has to supply the password to get in.

```python
load_options = LoadOptions()
load_options.password = password
with signature.Signature(signed_path, load_options) as sign:
    options = QrCodeVerifyOptions()
    options.text = expected_text
    options.match_type = gsd.TextMatchType.CONTAINS
    options.all_pages = True
    result = sign.verify(options)
    return len(result.succeeded)
```

`CONTAINS` rather than an exact match, because in evaluation mode the library adds its own text to the page. A zero count is usually a licensing problem rather than a signing one: the sign call would have raised if it had genuinely failed.

### What does the sample actually print?

One line of document info, then `PasswordRequiredException` and `IncorrectPasswordException` from the two deliberate failures,
then a signature count for each working path, then the number of QR codes recovered from the signed file. Two PDFs land in
`Result/`: one still protected by the original password, one by the replacement. Reading those six lines is faster than
reasoning about which path does what.

## Common Pitfalls

Catching the named exception types directly is the one that costs the most time, because the `TypeError` it produces points at your `except` line rather than at the password. After that: setting `SaveOptions.password` without clearing `use_original_password`, which silently keeps the old credential; assuming a zero verification count means signing failed, when it usually means the build is unlicensed; and writing the signed output over the source path, which leaves you with no original to fall back on if the password was wrong in a way the library accepted.

## Summary

Four strategies, two of which exist to fail. Keep the original password unless you are deliberately rotating, parse the proxy name to tell a missing password from a wrong one, inspect first when the credential came from a user, and verify through the password afterwards. Clone the sample and run it once: all four paths print their outcome in a single run, which is faster than reading about them.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/sign-password-protected-pdf-python-net/) - the decrypt-sign-reencrypt habit and why it is avoidable
- [eSign Document with QR Code Signature](https://docs.groupdocs.com/signature/python-net/esign-document-with-qr-code-signature/) - reference for `QrCodeSignOptions`
- [How to Search for QR Code Signatures](https://docs.groupdocs.com/signature/python-net/search-for-qr-code-e-signatures/) - the read-back side of the same API
- [Product documentation](https://docs.groupdocs.com/signature/python-net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/python-net/) - full API details for GroupDocs.Signature for Python via .NET
