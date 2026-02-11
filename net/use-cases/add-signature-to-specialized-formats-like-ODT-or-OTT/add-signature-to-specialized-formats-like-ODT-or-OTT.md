---
id: signing-odt-ott
url: groupdocs.signature/net/signing-odt-ott
title: 2 Methods to Add Digital Signature to ODT & OTT Documents
weight: 1
description: "Add digital signatures to ODT and OTT documents with GroupDocs.Signature for .NET while preserving file structure."
keywords: "GroupDocs.Signature, .NET, digital signature, ODT, OTT, OpenDocument, add signature, C#, sample code, document security"
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
toc: true
draft: true
---

## Overview

Many enterprise workflows require signing OpenDocument formats such as ODT (text) and OTT (template) without breaking their internal XML structure. Native office suites can embed signatures, but they often flatten the document, lose custom styles, or cannot be automated from a server environment. GroupDocs.Signature for .NET provides a programmatic way to apply X.509 digital signatures (and optional visual stamps) while leaving the original OpenDocument package untouched. This use‑case demonstrates two straightforward approaches – one for ODT files and one for OTT files – using the same API pattern.

**What you'll learn:**
- How to initialise the `Signature` object for OpenDocument files.
- How to configure `DigitalSignOptions` with a certificate, password, and visual image.
- How to place a signature at a specific coordinate.
- How to generate a signed PDF output that preserves the source structure.
- Tips for handling password‑protected documents.

## What This Use Case Covers

In this guide you will sign ODT and OTT documents programmatically using GroupDocs.Signature for .NET. The examples show the complete workflow from loading a source file, configuring digital signing options, and writing the signed result as a PDF. Understanding these steps helps you integrate secure document signing into backend services, document management systems, or automated batch processes.

**Prerequisites and requirements:**
- .NET 6.0 (or later) runtime installed.
- NuGet package `GroupDocs.Signature` added to your project.
- A valid X.509 certificate (`.pfx`) and its password (temporary license works for evaluation).

**Key concepts in this use case:**
- **Signature object** – Represents the source document and exposes the `Sign` method.
- **DigitalSignOptions** – Holds all settings for a digital signature, including certificate path, visual image, position, and document password.
- **OpenDocument package** – The underlying ZIP‑based container of ODT/OTT; preserving it is crucial for downstream workflows.

## Why Microsoft Word's Built‑in Signing Isn't Reliable for Server‑Side Automation

Microsoft Word can embed digital signatures in ODT files, but the process relies on a UI‑driven wizard and requires the full Office suite to be installed on the server. This model conflicts with headless environments, adds heavy licensing overhead, and often rewrites the ODT package, stripping custom metadata or breaking macros. Moreover, Word does not expose a simple API to sign documents programmatically in a .NET Core context.

These limitations make native Word signing unsuitable for:
- Automated batch processing on Linux containers.
- Scenarios where document layout must remain 100 % unchanged.
- Environments that cannot afford a full Office installation.
- Use cases that require adding a visual stamp alongside the cryptographic signature.

GroupDocs.Signature solves this problem by offering a lightweight, cross‑platform .NET library that works directly with the OpenDocument package, allowing you to add cryptographic signatures and optional visual cues without altering the original structure.

{{< alert style="info" >}} 
For the **complete working code** and detailed explanations, please refer to the [full repository here](https://github.com/groupdocs-signature/GroupDocs.Signature-Docs/tree/master/net/getting-started).  
{{< /alert >}}

## 📂 Repository Structure

```
GroupDocs.Signature-Docs/
│
├── net/
│   └── getting-started/
│       ├── sample-project/
│       │   ├── Program.cs            # Contains both ODT and OTT signing examples
│       │   ├── sample.odt            # Sample ODT document used in the ODT example
│       │   ├── sample.ott            # Sample OTT document used in the OTT example
│       │   ├── certificate.pfx       # X.509 certificate for digital signing
│       │   └── sample.jpg            # Optional image displayed as the visual part of the signature
│       └── README.md                # This documentation page
```

## Method 1: Sign ODT Document

**Complexity Level:** Basic | **Difficulty:** Easy | **Best For:** Simple ODT signing where layout preservation is mandatory

This method adds a digital signature to an ODT file using a certificate and an optional visual image. The signature is placed at coordinates (100, 100) and the signed output is saved as a PDF, ensuring the original ODT package remains intact.

### How It Works

1. A `Signature` instance is created for the source `sample.odt` file.
2. `DigitalSignOptions` is configured with the path to the `.pfx` certificate, an optional stamp image, the desired position, and the document password.
3. The `Sign` method writes a new PDF (`sampleSigned.pdf`) that contains the digital signature while preserving the ODT's internal structure.

### Implementation

```csharp
using GroupDocs.Signature;
using GroupDocs.Signature.Options;

using (Signature signature = new Signature("sample.odt"))
{
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx")
    {
        ImageFilePath = "sample.jpg",   // optional visual representation
        Left = 100,
        Top = 100,
        Password = "1234567890"        // password for the source ODT if protected
    };
    signature.Sign("sampleSigned.pdf", options);
}
```

### Considerations

- **Accuracy:** The visual stamp appears exactly at the coordinates you specify.
- **Use Case:** Ideal when you need a quick, programmatic way to sign ODT files on a server.
- **Advantage:** No Office installation required; works in headless environments.
- **Limitation:** The output is a PDF; if you need a signed ODT, you would need to save to the same format using the `SaveOptions` overload.

## Method 2: Sign OTT Document

**Complexity Level:** Basic | **Difficulty:** Easy | **Best For:** OTT (OpenDocument template) signing while keeping template placeholders unchanged

This approach mirrors the ODT method but targets an OTT file, which is often used as a template for generating multiple documents. The same `DigitalSignOptions` configuration ensures the signature does not interfere with template variables.

### How It Works

1. Initialise `Signature` with `sample.ott`.
2. Configure `DigitalSignOptions` exactly as in the ODT example (certificate, image, position, password).
3. Call `Sign` to produce a signed PDF version of the template.

### Implementation

```csharp
using GroupDocs.Signature;
using GroupDocs.Signature.Options;

using (Signature signature = new Signature("sample.ott"))
{
    DigitalSignOptions options = new DigitalSignOptions("certificate.pfx")
    {
        ImageFilePath = "sample.jpg",
        Left = 100,
        Top = 100,
        Password = "1234567890"
    };
    signature.Sign("sampleSigned.pdf", options);
}
```

### Key Features

- **Uniform API:** The same code pattern works for both ODT and OTT, reducing learning curve.
- **Template Safety:** No internal XML of the OTT is altered, so placeholders remain ready for later population.
- **Ideal For:** Automated workflows that generate signed documents from a master template.

## Choosing the Right Signing Method

| Method | Complexity Level | Difficulty | Best Use Case | Output Format |
|--------|------------------|------------|---------------|---------------|
| Sign ODT | Basic | Easy | When you need to sign a finished ODT document | PDF |
| Sign OTT | Basic | Easy | When you need to sign a template before populating it | PDF |

## Common Questions

**Q: Can I sign an ODT and keep the output as ODT instead of PDF?**  
A: Yes. Use the `SaveOptions` overload of `Sign` and specify `SaveOptions.CreateSaveOptions(LoadOptions.LoadFormatEnum.ODT)`. The API will embed the digital signature directly into the ODT container.

**Q: What type of certificate does `DigitalSignOptions` accept?**  
A: It works with standard X.509 certificates stored in a `.pfx` file. You must provide the certificate path and, if required, the password for the private key.

**Q: How do I change the appearance of the visual stamp?**  
A: Set additional properties on `DigitalSignOptions` such as `SignatureAppearance.ImageScale`, `SignatureAppearance.Opacity`, or provide a different image file.

**Q: Is it possible to sign password‑protected ODT/OTT files?**  
A: Absolutely. Supply the document password via the `Password` property of `DigitalSignOptions`. The library will decrypt, sign, and re‑encrypt the file automatically.

**Q: Does GroupDocs.Signature validate the certificate chain?**  
A: By default, the library embeds the certificate but does not perform revocation checking. You can validate the certificate chain manually using .NET's `X509Chain` class before calling `Sign`.

## Summary and When to Use Which Method

Both methods share the same underlying workflow: initialise a `Signature` instance, configure `DigitalSignOptions`, and call `Sign`. The primary difference lies in the source file type—ODT for finished documents and OTT for templates. Choose the ODT method when you already have a completed document that needs a signature. Opt for the OTT method when you want to secure a template before it is populated with data. In either case, the API ensures the original OpenDocument structure stays intact, making it safe for downstream processing.

## Conclusion

Signing OpenDocument formats without breaking their internal layout can be challenging with native tools. GroupDocs.Signature for .NET offers a concise, server‑friendly solution that works on any platform supporting .NET 6+. By following the two examples above, you can integrate digital signing into your document pipelines quickly and reliably.

Ready to try it yourself? Clone the repository, replace the sample certificate with your own, and run the examples. If you run into issues, the community forum and documentation are just a click away.

## See Also

- [Product documentation](https://docs.groupdocs.com/signature/net/) – getting started and advanced topics
- [API Reference](https://reference.groupdocs.com/signature/net/) – full API details for GroupDocs.Signature for .NET
- [GitHub repository](https://github.com/groupdocs-signature/GroupDocs.Signature-Docs) – complete source code and more examples
