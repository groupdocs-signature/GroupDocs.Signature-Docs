---
id: how-to-generate-qrcode-and-sign-document-using-csharp
url: signature/net/how-to-generate-qrcode-and-sign-document-using-csharp
title: How to generate QR Code and sign document using C#
weight: 3
description: "This guide describes how to improve your document with generated QR code using C#. Sign your documents with a QR Code and various standard QR code elements like Event QR Code, contact QR Code as VCard or MeCard, SEPA payment QR Code using GroupDocs.Signature .NET API by GroupDocs."
keywords: QR Code creation, generate QR Code, add QR Code to document in CSharp, Sign document with QR Event in CSharp, VCard, or MeCard QR Code.
productName: GroupDocs.Signature for .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate a QR Code and sign a document with it using C#    
        description: Creating QR Code signature and it to document with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to add QR code to various documents with C# 
        description: Get known how to create QR and add it to the document using C#
        steps:
        - name: Load source document
          text: Creating the Signature instance with file path or stream as a constructor parameter will load the document. 
        - name: Provide QR Code options. 
          text: Set specific properties of the QRCodeSignOption instance like a QR Code type, QR code text, and signature appearance settings.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed files using a file path or a stream.
---

The generated QR Code can be downloaded and used to add to the business contracts and official documents. Any QR Code contains unique textual information that confirms the identity of the signer or authorizes the business document. QR Code verification could be performed automatically by reading the contents of the QR Code embedded data. These signatures could be scanned automatically. The QR Code allows keeping over 2 Kilobytes of data.

## Native .NET API for Electronic Signatures

[GroupDocs.Signature for .NET](https://products.groupdocs.com/signature/net) provides API for signing a wide range of document formats. Moreover, API includes special abilities for additional document content processing. Supported formats are PDF, Microsoft Word, Microsoft PowerPoint, Microsoft Excel, PNG, JPEG, and [many others](/signature/net/supported-document-formats/).

Use the [downloads section](https://downloads.groupdocs.com/signature/net) to obtain API DLLs or MSI installer or use the NuGet package manager:

```nuget
PM> Install-Package GroupDocs.Signature
```

## Signing a document with an Event QR-code in C\#

Sometimes it is needed to inform coworkers about business events. In such cases, an Event QR code can provide all the required information in a very effective way. This topic describes how to sign a PDF document with the generated Event QR code.

* Instantiate the `Signature` class providing the path to the source document or document stream.
* Set event data in the `Event` object instance.
* Create the `QrCodeSignOptions` object and set up all demanded fields.
* Invoke the `Sign` method to process the document, providing output file path and sign options.

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

The result of signing a document may look like the picture below. Such QR codes can be very useful for organizing events.

![Document signed with an Event QR code](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/signed_event.png)

To try signing documents with QR codes for free, you may use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) Online App.

## QR Code image generation in C\#

Another way to improve documents is to generate the QR code first and then add it to documents using third-party tools. For this case, it is possible to generate code as an image.

* Create the `QRCodeSignOptions` instance and set up all demanded fields.
* Instantiate the `PreviewSignatureOptions` object providing the methods for creation and releasing.
* Invoke the `GenerateSignaturePreview` method to obtain the QR code image as a stream.
* Use the resultant QR Code stream in any possible way.

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
An image with the generated QR Code may look as below:

![Generated QR Code](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/textqrcode.png)

## Get a Free API License
To use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

To sum up, some useful ways of processing documents with QR codes were discussed in this article. Using C# with .NET applications greatly improves the productivity of such actions.
In addition, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) Online App to generate QR codes and/or sign your files with QR codes for free.

Read the [documentation](https://docs.groupdocs.com/signature/net/) to learn how to use GroupDocs.Signature in your .NET applications. Also, you may discuss any questions or issues at the [GroupDocs forum](https://forum.groupdocs.com/).

## See also

* [How to sign documents with barcodes using C#](/signature/net/how-to-generate-barcode-and-sign-document-using-csharp)
* [How to sign Excel spreadsheets and their macros using C#](/signature/net/how-to-sign-excel-macros-using-csharp)
