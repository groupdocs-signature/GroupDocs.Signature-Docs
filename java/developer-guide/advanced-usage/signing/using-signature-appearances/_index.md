---
id: using-signature-appearances
url: signature/java/using-signature-appearances
title: Using Signature Appearances
weight: 15
description: " This sections contains explanation about various electronic signature visual appearances on document page."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
GroupDocs.Signature contains several signature appearance classes that implements document oriented special signature representation.

Base signature options [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/SignOptions) contains property [SignOptions.Appearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/SignOptions#getAppearance()) that expects instance of the following classes

*   [PdfTextAnnotationAppearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.appearances/PdfTextAnnotationAppearance) class implements for Pdf documents signature as annotation area. Note that [TextSignOptions.getSignatureImplementation](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/TextSignOptions#getSignatureImplementation()) property must be set to [TextSignatureImplementation.Annotation](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/TextSignatureImplementation)
*   [PdfTextStickerAppearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.appearances/PdfTextStickerAppearance) class implements for Pdf documents signature as small sticker. Note that [TextSignOptions.getSignatureImplementation](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/TextSignOptions#getSignatureImplementation()) property must be set to [TextSignatureImplementation.Sticker](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/TextSignatureImplementation)
*   [ImageAppearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.appearances/ImageAppearance) class extends any image based with different image adjustments (like gray scale, contrast, brightness,  corrections, border etc)
*   [DigitalSignatureAppearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.appearances/DigitalSignatureAppearance) class extends for Word Processing and Spreadsheet documents digital signature appearances as page header information line
    

Following examples demonstrates using these classes
