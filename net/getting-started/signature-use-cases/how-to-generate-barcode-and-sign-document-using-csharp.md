---
id: how-to-generate-barcode-and-sign-document-using-csharp
url: signature/net/how-to-generate-barcode-and-sign-document-using-csharp
title: How to generate barcode and sign document using C#
weight: 1
description: "This guide describes how to improve your document with generated barcodes using C#. Sign your documents with Codabar, Event or Code39Extended using GroupDocs.Signature .NET API by GroupDocs."
keywords: Barcode Signature in CSharp, Sign document with Codabar in CSharp, Sign document with Event in CSharp, Sign document with Code39Extended in CSharp
productName: GroupDocs.Signature for .NET
hideChildren: False
toc: True
---

Barcodes represent textual information as a quite small image which could be automatically scanned. Such approach brings new opportunities in computer processing of documents like sorting or moving through a business work-flow. In this article, we will discuss useful way to sign electronic documents with data encrypted in Bar or QR codes using C# in .NET applications.

There are following topics could be read in this article:

* [Native .NET API for Electronic Signatures](signature/net/how-to-generate-barcode-and-sign-document-using-csharp/#native-net-api-for-electronic-signatures)
* [How to sign PDF files with barcode](signature/net/how-to-generate-barcode-and-sign-document-using-csharp/#how-to-sign-pdf-files-with-barcode)
* [Signing document with Codabar in C\#](signature/net/how-to-generate-barcode-and-sign-document-using-csharp/#signing-document-with-codabar-in-c)
* [Signing document with Event QR-code in C\#](signature/net/how-to-generate-barcode-and-sign-document-using-csharp/#signing-document-with-event-qr-code-in-c)
* [Barcode and Qr-code image generation](signature/net/how-to-generate-barcode-and-sign-document-using-csharp/#barcode-and-qr-code-image-generation-in-c)

## Native .NET API for Electronic Signatures

[GroupDocs.Signature for .NET](https://products.groupdocs.com/signature/net) provides API for signing wide range of documents formats like PDF, MS Word, MS Presentations, PNG, JPEG, and other. Moreover, API includes special abilities for additional documents content processing. Supported formats are PDF, MS Word, MS Presentations, MS Excel, PNG, JPEG, and [many others](https://docs.groupdocs.com/signature/net/supported-document-formats/).

Use the [downloads section](https://downloads.groupdocs.com/signature/net) to obtain API DLLs or MSI installer or NuGet:

```nuget
PM> Install-Package GroupDocs.Signature
```

## How to sign PDF files with barcode

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
