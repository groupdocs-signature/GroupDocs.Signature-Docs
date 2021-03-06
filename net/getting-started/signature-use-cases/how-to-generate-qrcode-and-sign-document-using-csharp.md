---
id: how-to-generate-qrcode-and-sign-document-using-csharp
url: signature/net/how-to-generate-qrcode-and-sign-document-using-csharp
title: How to generate QR Code and sign document using C#
weight: 3
description: "This guide describes how to improve your document with generated QR code using C#. Sign your documents with QR Code and various standard QR code elements like Event QR Code, contact QR Code as VCard or MeCard, SEPA payment QR Code using GroupDocs.Signature .NET API by GroupDocs."
keywords: QR Code creation, generate QR Code, add QR Code to document in CSharp, Sign document with QR Event in CSharp, VCard or MeCard QR Code.
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Generate QR Code and sign document with it using C#    
        description: Creating QR Code signature and it to document with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to add QR code to various documents with C# 
        description: Get known how to create QR and add it to the document using C#
        steps:
        - name: Load source document
          text: Creating Signature instance with file path or stream as a constructor parameter will load the document. 
        - name: Provide QR Code options. 
          text: Set specific properties of the QRCodeSignOption instance like a QR Code type, QR code text and signature appearance settings.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed file using file path or stream.
---

The generated QR Code can be downloaded and use to add to the business contracts and official documents. Any QR Code contains unique textual information that confirms the identity of the signer or authorizes the business document. QR Code verification can take place automatically by reading the contents of the QR Code embedded data. These signatures could be scanned automatically. The QR Code allows to keep over 2 Kbytes of data.

There are following topics could be read in this article:

* [eSign document with QR-code signature](signature/net/esign-document-with-qr-code-signature/)
* [Sign document with QR-code signature - advanced](signature/net/sign-document-with-qr-code-signature-advanced/)
* [Improve QR Code with custom encrypted data#](signature/net/sign-document-with-embedded-and-encrypted-data-in-qr-code-signatures/)

## Native .NET API for Electronic Signatures

[GroupDocs.Signature for .NET](https://products.groupdocs.com/signature/net) provides API for signing wide range of documents formats like PDF, MS Word, MS Presentations, PNG, JPEG, and other. Moreover, API includes special abilities for additional documents content processing. Supported formats are PDF, MS Word, MS Presentations, MS Excel, PNG, JPEG, and [many others](https://docs.groupdocs.com/signature/net/supported-document-formats/).

Use the [downloads section](https://downloads.groupdocs.com/signature/net) to obtain API DLLs or MSI installer or NuGet:

```nuget
PM> Install-Package GroupDocs.Signature
```

### Signing document with Event QR-code in C\#

Sometimes it is needed to inform workers about business events. In such cases Event QR-code can provide all demanded information in a very effective way. This topic describes how to sign Pdf document with generated Event QR-code.

* Instantiate Signature class providing path to source document or document stream.
* Set event data in Event object instance.
* Create the QrCodeSignOptions object and set up all demanded fields.
* Invoke Sign method to process the document, providing output file path and sign options.

```cs
            // instantiating the signature object
            using (Signature signature = new Signature(@"source.pdf"))
            {
                //provide event data
                Event eventQr = new Event()
                {
                    Title = "Meeting",
                    Description = "Productivity issues",
                    Location = "room 408",
                    StartDate = new DateTime(2022, 06, 19, 15, 30, 0),
                    EndDate = new DateTime(2022, 06, 19, 17, 0, 0)
                };

                // setup qrcode signature options
                QrCodeSignOptions signOptions = new QrCodeSignOptions()
                {
                    HorizontalAlignment = HorizontalAlignment.Right,
                    VerticalAlignment = VerticalAlignment.Bottom,
                    EncodeType = QrCodeTypes.QR,
                    Text = "",
                    Data = eventQr
                };

                // sign document
                signature.Sign(@"signed_event.pdf", signOptions);
            }
```

Result of signing may looks like the picture below. Such QR-code can be very useful for events organization.

![Signed with Event QR-code document](signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/signed_event.png)

[GroupDocs.Signature App](https://products.groupdocs.app/signature/generate/qrcode) gives opportunity to try document signing with QR-codes for free.

## QR Code image generation in C\#

Another way to improve documents is to generate QR Code firstly and add it to documents using third-party tools. For this case it is possible to generate code as an image.

* Create the QRCodeSignOptions instance and set up all demanded fields.
* Instantiate the PreviewSignatureOptions providing methods for creation and releasing.
* Invoke GenerateSignaturePreview method to obtain QR Code image as a stream.
* Use result QR Code stream in any possible way.

```cs
            MemoryStream result = new MemoryStream();
            // setup QR Code signature options
            QRCodeSignOptions signOptions = new QRCodeSignOptions()
            {
                EncodeType = QRCodeTypes.Code93Extended,
                Text = "Case 148.01"
            };

            //Instantiate preview options
            var previewOptions = new PreviewSignatureOptions(
                signOptions,
                delegate (PreviewSignatureOptions options) { return result; },
                delegate (PreviewSignatureOptions options, Stream signatureStream) { }
                );

            //Generate image to stream
            GroupDocs.Signature.Signature.GenerateSignaturePreview(previewOptions);

```
Image containing generated QR Code might looks in this way:

![Generated QRCode](signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/signed_event.png)

## Get a Free API License

In order to use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

To sum up, some useful ways of processing documents, barcodes and QR-codes were discussed in this article. Using C# with .NET applications improves productivity of such actions dramatically.
In addition, you can use [Online Applications to sign your files](https://products.groupdocs.app/signature/family) from GroupDocs.Signature for free.

Moreover, it is possible to learn how to use GroupDocs.Signature in your .NET applications with [documentation](https://docs.groupdocs.com/signature/net/). Also, you may discuss any questions or issues at [Groupdocs forum](https://forum.groupdocs.com/).

## See also

* [How to sign documents with barcodes using C#](signature/net/how-to-generate-barcode-and-sign-document-using-csharp/)
