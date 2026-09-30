---
id: features-overview
url: signature/net/features-overview
title: Features Overview
weight: 1
description: "Electronic Signature is an abstract concept that means data in electronic form associated with a certain document and expressing the consent of the signatory with the information contained in the document."
keywords: Electronic Signature, image signatures,Digital signatures,QR-code signatures 
productName: GroupDocs.Signature for .NET
hideChildren: False 
toc: True
---
## Electronic signature

**Electronic Signature** is an abstract concept that means data in electronic form associated with a certain document and expressing the consent of the signatory with the information contained in the document.
GroupDocs.Signature provides various electronic signature implementations as follows:

* Native text signatures as text stamps, text labels, annotation, stickers, watermarks with big amount of settings for visualization effects, opacity, colors, fonts, etc.;
* Text as image signatures with big scope of additional options to specify how text will look, colors, and extra image effects;
* Image signatures with options to specify extra image effects, rotation etc.;
* Digital signatures based on digital certificate files for PDF, Word Processing, Spreadsheet and Presentation documents. PDF signatures use SHA-256 by default and can carry an RFC 3161 time stamp and long-term validation (LTV) data. Word Processing documents can also be signed with post-quantum ML-DSA certificates;
* Barcode/QR-code signatures with variety of options;
* Generated stamp looking image signatures based on predefined lines with custom text, colors, width, etc;
* Metadata signatures to keep hidden signatures inside the document;
* Form-field signatures.

Signing documents in .NET with our electronic signature (eSign) API is easy, reliable and secure. Document signatures could be created and added to the document via collection of different options that specify all possible visualization features – color settings, alignment, font, margins, padding and different styling. Depending on the application requirements, you can sign documents with one or several signature types at the same time.

## Search for signatures

Obtain signatures list applied to document:

* Text signatures information from all supported formats;
* Image signatures information;
* Digital signatures information from PDF, Word Processing, Spreadsheet and Presentation documents;
* Barcode/QR-code signatures information from all supported formats;
* Metadata signatures information from all supported formats;
* Form-field signatures information from all supported formats.

## Verify signatures

Verify that a document's signatures are valid and match the criteria you specify.
For digital signatures this includes verifying the signature cryptographically, so a document altered after signing does not pass.
Supported signature types are:

* Text signatures;
* Digital signatures;
* Barcode/QR-code signatures;
* Certificate files (subject, serial number, thumbprint and certificate chain).

## Document information extraction

GroupDocs.Signature allows to obtain basic information about source document - file type, size, pages count, page height and width etc.  
This may be quite useful for generating document preview and precise signature placing inside document.

## Preview document pages

Document preview feature allows to generate image representations of document pages. This may be helpful for better understanding about document content and its structure,  
set proper signature position inside document, apply appropriate signature styling etc. Preview can be generated for all document pages (by default) or for specific page numbers or page range.

Supported image formats for document preview are:

* PNG;
* JPG;
* BMP.

## Security and privacy

* GroupDocs.Signature runs on your own machine and never sends document content anywhere. See [Network access and data privacy]({{< ref "signature/net/getting-started/network-access-and-data-privacy.md" >}}).
* Starting with version 26.9, the external resources a document links to (linked images, style sheets) are not loaded unless you allow them. See [How to control external resources]({{< ref "signature/net/developer-guide/advanced-usage/loading/skip-external-resources.md" >}}).
* Starting with version 26.9, signing with an expired or not-yet-valid certificate is rejected unless you allow it. See [Pdf Digitally signing]({{< ref "signature/net/developer-guide/advanced-usage/signing/electronic-signatures/sign-document-with-digital-signature-advanced.md" >}}).
