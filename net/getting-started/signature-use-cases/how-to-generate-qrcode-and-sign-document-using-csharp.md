---
id: how-to-generate-qrcode-and-sign-document-using-csharp
url: signature/net/how-to-generate-qrcode-and-sign-document-using-csharp
title: How to generate QR code and sign document using C#
weight: 1
description: "This topic describes how to generate QR Code and add it to document on any page using C#. Sign your documents with QR Code using GroupDocs.Signature .NET API by GroupDocs."
keywords: Creating QR Code in CSharp, QR Code signature in CSharp, Sign document with QR Code in CSharp
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---

QR Code is a machine-readable image that can contain any limited information. Specific QR codes often contain data for a locator, identifier, or tracker that points to a website or application. A QR Code uses specific data to represent a object with its properties. For the QR Code enter your data. Each property will describe the QR Code type details. Press Generate Button and download generated QR Code image. Test the QR code with any scanner or mobile camera! Share and distribute your QR code. Share and post for everyone! The generated QR code can be shared over the social media as generated image, QR Code can be scanned over any mobile camera! Share and distribute your QR code to spread the information in it!

There are following topics could be read in this article:

* [eSign document with QR-code signature](signature/net/esign-document-with-qr-code-signature/)
* [Advanced document signing with QR-code](signature/net/sign-document-with-qr-code-signature-advanced/)
* [Sign document with embedded and encrypted data in QR-code signatures](signature/net/sign-document-with-embedded-and-encrypted-data-in-qr-code-signatures/)
* [Signing document with Event QR-code in C\#](signature/net/how-to-generate-barcode-and-sign-document-using-csharp/#signing-document-with-event-qr-code-in-c)
* [Barcode and Qr-code image generation](signature/net/how-to-generate-barcode-and-sign-document-using-csharp/#barcode-and-qr-code-image-generation-in-c)

## Native .NET API for Electronic Signatures

[GroupDocs.Signature for .NET](https://products.groupdocs.com/signature/net) provides API for signing wide range of documents formats like PDF, MS Word, MS Presentations, PNG, JPEG, and other. Moreover, API includes special abilities for additional documents content processing. Supported formats are PDF, MS Word, MS Presentations, MS Excel, PNG, JPEG, and [many others](https://docs.groupdocs.com/signature/net/supported-document-formats/).

Use the [downloads section](https://downloads.groupdocs.com/signature/net) to obtain API DLLs or MSI installer or NuGet:

```nuget
PM> Install-Package GroupDocs.Signature
```

## How to sign PDF files with QR Code

It is common problem to add additional data in various types of business documents. Such document may looks as in the picture below. The one of the most useful ways is to place a barcode directly on the document page.

![Source PDF document preview](signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/source_doc_preview.png)

### Signing document with Codabar in C\#

To sign a particular document with just generated barcode:

* Instantiate Signature class providing path to source document or document stream.
* Create the BarcodeSignOptions instance and set up all demanded fields.
* Invoke Sign method to process the document, providing output file path and sign options.

```cs
            // instantiating the signature object
            using (Signature signature = new Signature(@"source.pdf"))
            {
                // setup barcode signature options
                BarcodeSignOptions signOptions = new BarcodeSignOptions()
                {
                    HorizontalAlignment = HorizontalAlignment.Right,
                    Top = 150,
                    EncodeType = BarcodeTypes.Codabar,
                    Text = "Approved_19/06/2022"
                };
                // sign document
                signature.Sign(@"signed_codabar.pdf", signOptions);
            }
```

Signed with Codabar document might looks like in the picture below. Codabar format was developed for printed documents and might be useful in office document flow.

![Signed with Codabar document](signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/signed_codabar.png)

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

## Barcode and Qr-code image generation in C\#

Another way to improve documents is to generate barcode firstly and add it to documents using third-party tools. For this case it is possible to generate code as an image.

* Create the BarcodeSignOptions instance and set up all demanded fields.
* Instantiate the PreviewSignatureOptions providing methods for creation and releasing.
* Invoke GenerateSignaturePreview method to obtain barcode image as a stream.
* Use result barcode stream in any possible way.

```cs
            MemoryStream result = new MemoryStream();
            // setup barcode signature options
            BarcodeSignOptions signOptions = new BarcodeSignOptions()
            {
                EncodeType = BarcodeTypes.Code93Extended,
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
Image containing generated barcode might looks in this way:

![Generated barcode](signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/code93extended.png)

## Get a Free API License

In order to use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

To sum up, some useful ways of processing documents, barcodes and QR-codes were discussed in this article. Using C# with .NET applications improves productivity of such actions dramatically.
In addition, you can use [Online Applications to sign your files](https://products.groupdocs.app/signature/family) from GroupDocs.Signature for free.

Moreover, it is possible to learn how to use GroupDocs.Signature in your .NET applications with [documentation](https://docs.groupdocs.com/signature/net/). Also, you may discuss any questions or issues at [Groupdocs forum](https://forum.groupdocs.com/).

## See also

* [How to sign documents with barcodes using C#](signature/net/how-to-generate-barcode-and-sign-document-using-csharp/)
