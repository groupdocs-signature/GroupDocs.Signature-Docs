---
id: groupdocs-signature-for-net-22-7-release-notes
url: signature/net/groupdocs-signature-for-net-22-7-release-notes
title: GroupDocs.Signature for .NET 22.7 Release Notes
weight: 40
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 22.7{{< /alert >}}

## Major Features

This release contains an important updates on security of embedded data objects for the QR code signatures and Metadata signatures. For the .Net Framework version the  AES encryption support was added and few legacy symmetric algorithms were marked as obsolete. Few fixed and improvements were made to signature image preview generation. Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.7:

* The AES symmetric algorithm was added to support encoding data objects for QR Code and Metadata signatures.
* Provided SVG file type support for QR Code and Barcode signatures image preview.
* Few legacy encryption algorithms were marked as obsolete.
* Fixed a signature preview method to respect preview image format.
* Few new image formats were added for signature preview output image type.
* Update the referenced libraries to the latest versions.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3877 | Implement AES encryption algorithm for the Net framework version | Feature |
| SIGNATURENET-3883 | Respect GIF file format for siganture Preview method | Improvement |
| SIGNATURENET-3880 | Implement SVG file format Preview for Barcode and QRCode signatures | Improvement |
| SIGNATURENET-3878 | Fix Signature Preview generation process to respect output format file type | Bug |

## Public Developer Guide examples changes

The following topics from Developer Guide were changed

[Sign document with ordering the signatures]({{< ref "signature/net/developer-guide/advanced-usage/signing/sign-embed-and-encr-data-qr-codes/sign-documents-with-standard-qr-code-entries.md" >}})

## Public API and Backward Incompatible Changes

#### Public enumeration [SymmetricAlgorithmType](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/symmetricalgorithmtype) was modified with few elements marked as obsolete and added new AES type

Represents symmetric encryption algorithm type.

**Enumeration type SymmetricAlgorithmType changes**

```csharp
    /// <summary>
    /// Represents symmetric encryption algorithm type.
    /// </summary>
    public enum SymmetricAlgorithmType
    {
        /// <summary>Represents DES Data Encryption Standard algorithm.</summary>
        [Obsolete("This property is obsolete and will be deprecated in 22.10 version. Use SymmetricAlgorithmType.AES (Advanced Encryption Standard) instead.")]
        DES = 0,

        /// <summary>Represents TripleDES symmetric encryption algorithm..</summary>
        [Obsolete("This property is obsolete and will be deprecated in 22.10 version. Use SymmetricAlgorithmType.AES (Advanced Encryption Standard) instead.")]
        TripleDES = 1,

        /// <summary>Represents RC2 algorithm.</summary>
        [Obsolete("This property is obsolete and will be deprecated in 22.10 version. Use SymmetricAlgorithmType.AES (Advanced Encryption Standard) instead.")]
        RC2 = 2,

        /// <summary>Represents Rijndael symmetric encryption algorithm.</summary>
        Rijndael = 3,

        /// <summary>Represents AES (Advanced Encryption Standard) encryption algorithm.</summary>
        AES = 4
    }
```

#### Public enumeration [PreviewFormats](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/previewsignatureoptions/previewformat) was modified with new supported format types

Enumeration represents signature preview options with new format added - the vector SVG and GIF

**Enumeration type PreviewFormats changes**

```csharp
        /// <summary>
        /// Signature preview supported formats
        /// </summary>
        public enum PreviewFormats
        {
            /// <summary>
            /// PNG
            /// </summary>
            PNG,
            
            /// <summary>
            /// JPEG
            /// </summary>
            JPEG,
            
            /// <summary>
            /// BMP
            /// </summary>
            BMP,

            /// <summary>
            /// GIF
            /// </summary>
            GIF,

            /// <summary>
            /// SVG
            /// </summary>
            SVG
        }
```
