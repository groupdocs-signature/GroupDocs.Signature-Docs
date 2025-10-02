---
id: signing-pdf-with-pkcs11-standard
url: signature/net/signing-pdf-with-pkcs11-standard
title: Sign Documents with PKCS#11 in .NET
weight: 1
description: "Learn how to sign PDF and other documents in .NET using PKCS#11 hardware tokens, USB dongles, or smart cards with GroupDocs.Signature. A free electronic signature API version is available for evaluation with limited features."
keywords: electronic signature api, pkcs11 signature .net, pdf signature api, digital signing .net, hardware token signing, usb dongle signature, smart card signature, signature api
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---

{{< alert style="info" >}} 💡For the **complete working code** and detailed explanations, please refer to the [full repository here](https://github.com/groupdocs-signature/esign-documents-with-pkcs11-using-groupdocs-signature-dotnet).  
This repository contains all source files, helper classes, and configuration examples to implement PKCS#11 digital signing in your .NET applications.{{< /alert >}}


This article demonstrates how to sign documents with **PKCS#11 hardware tokens** (HSMs, smart cards, USB tokens) using **GroupDocs.Signature for .NET**.\
The sample project integrates the [Pkcs11Interop](https://github.com/Pkcs11Interop/Pkcs11Interop) library, which provides a .NET interface for PKCS#11 devices.

PKCS#11 devices can include **hardware security modules (HSMs)**, **smart cards**, and **USB dongles**.  
USB dongles are often used in corporate environments as a portable way to securely store private keys.  
With GroupDocs.Signature for .NET, you can use a dongle in the same way as other PKCS#11 tokens to apply digital signatures to your documents.


> 💡 Use this approach when you need to securely sign documents with a private key stored in hardware rather than in a local file.

## Prerequisites

Before proceeding, make sure you have:

-   **GroupDocs.Signature for .NET** installed. [Get a free trial](https://releases.groupdocs.com/signature/net/).
-   A PKCS#11--compatible device (HSM, smart card, or token).
-   [Pkcs11Interop](https://github.com/Pkcs11Interop/Pkcs11Interop) library.
-   .NET 6.0 or later (the sample also supports .NET Framework 4.6.2).


## Installation

Clone or download the [sample repository](https://github.com/groupdocs-signature/esign-documents-with-pkcs11-using-groupdocs-signature-dotnet).

``` bash
git clone https://github.com/groupdocs-signature/esign-documents-with-pkcs11-using-groupdocs-signature-dotnet.git
```

Restore dependencies with NuGet:

``` bash
dotnet restore
```

## Repository Structure

The project includes:

    GroupDocs.Signature-for-.NET-PKCS11-Sample
     ├── GroupDocs.Signature-for-.NET-PKCS11-Sample.csproj
     ├── Helpers.cs              # Utility functions for PKCS#11
     ├── Pkcs11DigitalSigner.cs  # Integration with GroupDocs.Signature
     ├── Program.cs              # Main entry point
     └── Settings.cs             # PKCS#11 configuration
    

## Usage Example

Below is a simplified version of the sample code. For the full implementation, see the [repository](https://github.com/groupdocs-signature/esign-documents-with-pkcs11-using-groupdocs-signature-dotnet).

### Configure PKCS#11 settings

`Settings.cs` defines the PKCS#11 library path, token PIN, and certificate subject:

``` csharp
public static class Settings
{
    public static string Pkcs11LibraryPath = "<PKCS11_LIBRARY_PATH>";
    public static string TokenPin = "<TOKEN_PIN>";
    public static string CertificateSubject = "<CERT_SUBJECT>";
}
```

### Initialize PKCS#11 signer

`Pkcs11DigitalSigner.cs` integrates PKCS#11 with GroupDocs.Signature:

``` csharp
public class Pkcs11DigitalSigner
{
    public X509Certificate2 GetCertificateFromPkcs11()
    {
        // Load certificate directly from token
        // Uses Settings.Pkcs11LibraryPath and Settings.TokenPin
    }
}
```

### Sign a document

`Program.cs` shows how to sign using GroupDocs.Signature.

This example demonstrates two flows:\
1. **Directly from PKCS#11 device**\
2. **From Windows certificate store**

``` csharp
using GroupDocs.Signature;
using GroupDocs.Signature.Options;
using System;

class Program
{
    static void Main()
    {
        string filePath = "sample.pdf";
        string outputPath = "signed.pdf";

        // (1) Sign using PKCS#11 device
        var pkcs11Signer = new Pkcs11DigitalSigner();
        var certificate = pkcs11Signer.GetCertificateFromPkcs11();

        using (var signature = new Signature(filePath))
        {
            var options = new DigitalSignOptions(certificate)
            {
                Comments = "Signed with PKCS#11 device",
                SignTime = DateTime.Now
            };

            signature.Sign(outputPath, options);
        }

        // (2) Sign using certificate from Windows store
        // var windowsCert = Helpers.GetCertificateFromWindowsStore(Settings.CertificateSubject);
        // (sign in the same way with windowsCert)
    }
}
```

## Notes

-   Replace `<PKCS11_LIBRARY_PATH>`, `<TOKEN_PIN>`, and `<CERT_SUBJECT>` with your actual values.
-   Both PKCS#11 and Windows certificate store flows are supported. Choose the one that matches your infrastructure.
-   For detailed helper methods and advanced scenarios, see the [full repository](https://github.com/groupdocs-signature/esign-documents-with-pkcs11-using-groupdocs-signature-dotnet).


{{< alert style="warning" >}}
 **Early Implementation Notice**  
 This solution is currently provided as an early implementation for using PKCS#11 digital signature dongles with GroupDocs.Signature.  
 While it enables document signing with hardware tokens, we strongly recommend performing additional testing in your own environment to ensure it meets your compliance and security requirements.
 We would greatly appreciate your feedback, test results, and suggestions for improvements.  
 Your input will help us refine this functionality and explore new ideas to make it more robust and user-friendly.
{{< /alert >}}

## See Also

-   [Digital Signatures in GroupDocs.Signature](https://docs.groupdocs.com/signature/net/sign-document-with-digital-signature-advanced/)
-   [Iterative Digital Signing](https://blog.groupdocs.com/signature/iterative-digital-signing/)
-   [Custom Hash Signing with Azure Key Vault](https://blog.groupdocs.com/signature/custom-hash-sign-with-azure-key-vault/)

