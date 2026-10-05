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

Signing an encrypted PDF is a GroupDocs.Signature capability for Python via .NET that applies a signature to a password-protected document and writes the result still protected, without producing a decrypted copy at any point. The password goes in through [LoadOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/loadoptions/); what happens to the output's protection is decided by [SaveOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/saveoptions/) and its PDF flavour, [PdfSaveOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/pdfsaveoptions/).

That matters because the habitual approach is decrypt, sign, re-encrypt. For the duration of those three steps a readable copy of a deliberately protected document sits on disk, usually in a temp directory nobody audits. This page compares the four password strategies the API gives you instead, including the two that fail on purpose, because telling those two failures apart is what makes an automated pipeline usable.

## What This Guide Covers

Every example below is a complete script. The examples sign `protected.pdf`, a one-page PDF opened with the user password `1234567890`, with a QR code, and the last one reads the signature back through that password. The comparison tables below are about behaviour and cost - what each path needs, what it writes, and how it reports failure - not benchmarks.

**Prerequisites:**
- Python 3 with `groupdocs-signature-net==26.10.0`
- A PDF protected with a user password; the sample `protected.pdf` opens with `1234567890`

## Quick Decision Matrix

| Scenario | Recommended Strategy | Why |
|---|---|---|
| Signing a protected document in a pipeline | Keep the original password | no `SaveOptions` needed, nothing written in the clear |
| Handing the signed copy to a different party | Re-key with `PdfSaveOptions` | source keeps its credential, the copy gets a new one |
| Password came from a user form | Inspect first, then sign | a bad credential fails on a cheap call, not mid-batch |
| Password may be missing entirely | Catch `PasswordRequiredException` | it means prompt, not retry |
| Credential rejected | Catch `IncorrectPasswordException` | it means the secret is stale |

## Strategy Comparison Overview

| Strategy | Complexity | Cost | Output protection | Best For |
|---|---|---|---|---|
| **No password** | none | fails on open, nothing written | n/a | demonstrating the contract |
| **Wrong password** | none | fails on open, nothing written | n/a | distinguishing a stale credential |
| **Keep original** | low | one open plus one save | same passwords as the source | the default pipeline path |
| **Re-key on save** | low | one open plus one save | the new passwords only | handover and rotation |

## Detailed Strategy Analysis

### Strategy 1: Open with no password

The baseline, and worth running once so the error is familiar. `Signature` is constructed without `LoadOptions`, so the encrypted source cannot be opened and the call fails before any signing work begins.

{{< tabs "sign_protected_pdf_without_password" >}}
{{< tab "Python" >}}
```python
import os

from groupdocs.signature import PasswordRequiredException, Signature
from groupdocs.signature.domain import QrCodeTypes
from groupdocs.signature.options import QrCodeSignOptions


def sign_protected_pdf_without_password():
    options = QrCodeSignOptions("Approved by John Smith", QrCodeTypes.QR)
    try:
        with Signature("protected.pdf") as signature:
            signature.sign("signed_no_password.pdf", options)
    except PasswordRequiredException:
        print("PasswordRequiredException: the document needs a password")
    print(f"Output written: {os.path.exists('signed_no_password.pdf')}")


if __name__ == "__main__":
    sign_protected_pdf_without_password()
```
{{< /tab >}}
{{< tab "protected.pdf" >}}
{{< tab-text >}}
`protected.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/use-cases/sign-password-protected-pdf/protected.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "sign-protected-pdf-without-password.txt" >}}  
```text
PasswordRequiredException: the document needs a password
Output written: False
```
[Download full output](/signature/python-net/_output_files/use-cases/sign-password-protected-pdf/sign_protected_pdf_without_password/sign-protected-pdf-without-password.txt)
{{< /tab >}}
{{< /tabs >}}

The result is [PasswordRequiredException](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/passwordrequiredexception/), and no file is written. The exception is a real Python class imported from `groupdocs.signature`, so it can be named in an `except` clause like any other.

### Strategy 2: Open with the wrong password

Same code shape, one changed value, and a different exception comes back.

{{< tabs "sign_protected_pdf_with_wrong_password" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import IncorrectPasswordException, Signature
from groupdocs.signature.domain import QrCodeTypes
from groupdocs.signature.options import LoadOptions, QrCodeSignOptions


def sign_protected_pdf_with_wrong_password():
    load_options = LoadOptions()
    load_options.password = "wrong-password"
    options = QrCodeSignOptions("Approved by John Smith", QrCodeTypes.QR)
    try:
        with Signature("protected.pdf", load_options) as signature:
            signature.sign("signed_wrong_password.pdf", options)
    except IncorrectPasswordException:
        print("IncorrectPasswordException: the password is wrong")


if __name__ == "__main__":
    sign_protected_pdf_with_wrong_password()
```
{{< /tab >}}
{{< tab "protected.pdf" >}}
{{< tab-text >}}
`protected.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/use-cases/sign-password-protected-pdf/protected.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "sign-protected-pdf-with-wrong-password.txt" >}}  
```text
IncorrectPasswordException: the password is wrong
```
[Download full output](/signature/python-net/_output_files/use-cases/sign-password-protected-pdf/sign_protected_pdf_with_wrong_password/sign-protected-pdf-with-wrong-password.txt)
{{< /tab >}}
{{< /tabs >}}

The failure is [IncorrectPasswordException](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/incorrectpasswordexception/). A pipeline that can see the difference between this and the previous one can prompt in the first case and raise an alert about a stale secret in the second. An empty string counts as no password: `load_options.password = ""` raises `PasswordRequiredException`, not `IncorrectPasswordException`.

### Strategy 3: Keep the original password

The path most services want, and the one that needs the least code.

{{< tabs "sign_protected_pdf_keeping_password" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.domain import QrCodeTypes
from groupdocs.signature.options import LoadOptions, QrCodeSignOptions


def sign_protected_pdf_keeping_password():
    load_options = LoadOptions()
    load_options.password = "1234567890"
    options = QrCodeSignOptions("Approved by John Smith", QrCodeTypes.QR)
    options.left = 420
    options.top = 560
    options.width = 120
    options.height = 120
    with Signature("protected.pdf", load_options) as signature:
        result = signature.sign("signed_original_password.pdf", options)
        print(f"Signatures added: {len(result.succeeded)}")


if __name__ == "__main__":
    sign_protected_pdf_keeping_password()
```
{{< /tab >}}
{{< tab "protected.pdf" >}}
{{< tab-text >}}
`protected.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/use-cases/sign-password-protected-pdf/protected.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_original_password.pdf" >}}  
```text
Binary file (PDF, 68 KB)
```
[Download full output](/signature/python-net/_output_files/use-cases/sign-password-protected-pdf/sign_protected_pdf_keeping_password/signed_original_password.pdf)
{{< /tab >}}
{{< /tabs >}}

There is no `SaveOptions` in that snippet on purpose. `use_original_password` defaults to `True`, so the signed output is written protected with the source's encryption: the same user password, and the same owner password, which you never had to supply. The printed value is the number of signatures written.

### Strategy 4: Re-key the signed copy

Rotation: the source keeps its current password, the signed copy opens only with a new one.

{{< tabs "sign_protected_pdf_with_new_password" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import PasswordRequiredException, Signature
from groupdocs.signature.domain import QrCodeTypes
from groupdocs.signature.options import LoadOptions, PdfSaveOptions, QrCodeSignOptions


def sign_protected_pdf_with_new_password():
    load_options = LoadOptions()
    load_options.password = "1234567890"
    save_options = PdfSaveOptions()
    save_options.password = "new-password"
    save_options.permissions_password = "new-owner-password"
    save_options.use_original_password = False
    options = QrCodeSignOptions("Approved by John Smith", QrCodeTypes.QR)
    with Signature("protected.pdf", load_options) as signature:
        result = signature.sign("signed_new_password.pdf", options, save_options)
        print(f"Signatures added: {len(result.succeeded)}")

    # The copy must not open without a password
    try:
        with Signature("signed_new_password.pdf") as signed:
            signed.get_document_info()
        print("The signed copy opens without a password!")
    except PasswordRequiredException:
        print("The signed copy asks for a password")


if __name__ == "__main__":
    sign_protected_pdf_with_new_password()
```
{{< /tab >}}
{{< tab "protected.pdf" >}}
{{< tab-text >}}
`protected.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/use-cases/sign-password-protected-pdf/protected.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_new_password.pdf" >}}  
```text
Binary file (PDF, 69 KB)
```
[Download full output](/signature/python-net/_output_files/use-cases/sign-password-protected-pdf/sign_protected_pdf_with_new_password/signed_new_password.pdf)
{{< /tab >}}
{{< /tabs >}}

`password` becomes the user password of the copy, the one a reader types to open it. `permissions_password` is the owner password, and it is not optional here. Without it - and always with plain `SaveOptions`, which has no such property - the engine writes the new user password with an **empty owner password**, and an empty owner password unlocks the file: GroupDocs.Signature itself opens such a copy with no password at all, and so does any PDF library that tries an empty owner password. The check at the end of the example catches exactly that mistake.

`use_original_password = False` states the intent; it is not what applies the new password. A password you set wins whatever the flag says. The flag matters on its own only in the other direction: `use_original_password = False` with no new password writes the signed copy **unprotected**.

## The Failure Contract

The engine reports password problems with three exception classes, all importable from `groupdocs.signature`:

- `PasswordRequiredException` - no password, or an empty one, for an encrypted document;
- `IncorrectPasswordException` - a password the document does not accept;
- [GroupDocsSignatureException](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/groupdocssignatureexception/) - the base class of both, and of every other engine error.

They derive from `Exception`, not from `RuntimeError`. Code written for version 26.1, which reported every engine error as a `RuntimeError` with a `Proxy error(<Name>):` prefix in the message, no longer catches them. Catch the specific classes before the base class:

```python
try:
    with Signature("protected.pdf", load_options) as signature:
        signature.sign("signed.pdf", options)
except PasswordRequiredException:
    ...  # no password supplied: prompt for one
except IncorrectPasswordException:
    ...  # the stored secret is stale: raise an alert
except GroupDocsSignatureException:
    ...  # any other engine error
```

Branch on the exception type, not on the message body, which is meant for people and can change between versions. `str(error)` starts with the engine's message, such as `Specified password is incorrect.`, and continues with the .NET exception type and stack trace, which is useful in a log but not as a value to compare.

### Can I inspect a protected document without signing it?

Yes, and it is the cheapest way to validate a password before a batch. Opening with `LoadOptions.password` and calling `get_document_info` returns the format, page count and size while the file on disk stays encrypted. A wrong password raises the same `IncorrectPasswordException` here as it would in `sign`, so a pipeline can reject a bad credential before it does any real work.

{{< tabs "inspect_protected_pdf" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import LoadOptions


def inspect_protected_pdf():
    load_options = LoadOptions()
    load_options.password = "1234567890"
    with Signature("protected.pdf", load_options) as signature:
        info = signature.get_document_info()
        print(f"{info.file_type.file_format}, {info.page_count} page(s), {info.size} bytes")


if __name__ == "__main__":
    inspect_protected_pdf()
```
{{< /tab >}}
{{< tab "protected.pdf" >}}
{{< tab-text >}}
`protected.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/use-cases/sign-password-protected-pdf/protected.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "inspect-protected-pdf.txt" >}}  
```text
Portable Document Format File, 1 page(s), 38869 bytes
```
[Download full output](/signature/python-net/_output_files/use-cases/sign-password-protected-pdf/inspect_protected_pdf/inspect-protected-pdf.txt)
{{< /tab >}}
{{< /tabs >}}

## Verifying the Result

Reading the signature back doubles as proof that the output is still protected, because the read has to supply the password to get in. The sample `signed_protected.pdf` is `protected.pdf` signed exactly as in Strategy 3.

{{< tabs "verify_signed_protected_pdf" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import LoadOptions, QrCodeVerifyOptions


def verify_signed_protected_pdf():
    load_options = LoadOptions()
    load_options.password = "1234567890"
    with Signature("signed_protected.pdf", load_options) as signature:
        options = QrCodeVerifyOptions()
        options.text = "Approved by John Smith"
        options.all_pages = True
        result = signature.verify(options)
        print(f"Verified: {result.is_valid}, matching QR codes: {len(result.succeeded)}")


if __name__ == "__main__":
    verify_signed_protected_pdf()
```
{{< /tab >}}
{{< tab "signed_protected.pdf" >}}
{{< tab-text >}}
`signed_protected.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/use-cases/sign-password-protected-pdf/signed_protected.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "verify-signed-protected-pdf.txt" >}}  
```text
Verified: True, matching QR codes: 1
```
[Download full output](/signature/python-net/_output_files/use-cases/sign-password-protected-pdf/verify_signed_protected_pdf/verify-signed-protected-pdf.txt)
{{< /tab >}}
{{< /tabs >}}

The QR code text has to match exactly. A zero count is usually a licensing problem rather than a signing one: without a license the library reads the QR code back through an evaluation decoder that masks part of the text, so no text matches whatever `match_type` you choose, while the sign call would have raised if it had genuinely failed.

### What do the examples print?

Strategy 1 prints `PasswordRequiredException` and `Output written: False`; Strategy 2 prints `IncorrectPasswordException`. Each signing strategy prints the number of signatures it added, and Strategy 4 adds `The signed copy asks for a password`. The inspection prints one line of document info, and the verification prints `Verified: True` with one matching QR code. Two protected PDFs are written: `signed_original_password.pdf` keeps the original passwords, `signed_new_password.pdf` opens only with the new one.

## Common Pitfalls

Catching `RuntimeError` is the one that costs the most time after an upgrade from 26.1: the password exceptions are no longer `RuntimeError` subclasses, so the old handler lets them through. After that: re-keying with plain `SaveOptions`, which leaves the copy with an empty owner password that opens it without any password; setting `use_original_password = False` without a new password, which writes the signed copy unprotected; assuming a zero verification count means signing failed, when it usually means the build is unlicensed; and writing the signed output over the source path, which leaves you with no original to fall back on if the password was wrong in a way the library accepted.

## Summary

Four strategies, two of which exist to fail. Keep the original password unless you are deliberately rotating, re-key with `PdfSaveOptions` and both passwords when you are, catch `PasswordRequiredException` and `IncorrectPasswordException` to tell a missing password from a wrong one, inspect first when the credential came from a user, and verify through the password afterwards. Run the examples once: each path prints its outcome, which is faster than reading about them.

## See Also

- [In-depth blog article about this project](https://blog.groupdocs.com/signature/sign-password-protected-pdf-python-net/) - the decrypt-sign-reencrypt habit and why it is avoidable
- [eSign Document with QR Code Signature](https://docs.groupdocs.com/signature/python-net/esign-document-with-qr-code-signature/) - reference for `QrCodeSignOptions`
- [How to Search for QR Code Signatures](https://docs.groupdocs.com/signature/python-net/search-for-qr-code-e-signatures/) - the read-back side of the same API
- [Product documentation](https://docs.groupdocs.com/signature/python-net/) - getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/python-net/) - full API details for GroupDocs.Signature for Python via .NET
