---
id: how-to-generate-barcode-and-sign-document-using-csharp
url: signature/net/how-to-generate-barcode-and-sign-document-using-csharp
title: How to generate barcode and sign document using C#
weight: 2
description: "This guide describes how to improve your document with generated barcodes using C#. Sign your documents with Codabar, Event or Code39Extended using GroupDocs.Signature .NET API by GroupDocs."
keywords: Barcode Signature in CSharp, Sign document with Codabar in CSharp, Sign document with Event in CSharp, Sign document with Code39Extended in CSharp
productName: GroupDocs.Signature for .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate a Barcode and sign a document with it using C#    
        description: Creating Barcode signature and it to document with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to add Barcode to various documents with C# 
        description: Find out ways of signing documents with the Barcode using C#
        steps:
        - name: Load source document
          text: Creating Signature instance with file path or stream as a constructor parameter will load the document. 
        - name: Provide barcode options. 
          text: Set specific properties of the BarcodeSignOption instance like a Barcode type, barcode text, and signature appearance settings.
        - name: Sign source and obtain result 
          text: Invoke method Sign with passing created options and output file data. You can save signed files using a file path or a stream.
---

Barcodes represent textual information as a quite small image that could be automatically scanned. Such an approach brings new opportunities in the computer processing of documents like sorting or moving through a business workflow. In this article, we will discuss useful ways to sign electronic documents with data encrypted in Bar or QR codes using C# in .NET applications.

## Native .NET API for Electronic Signatures

[GroupDocs.Signature for .NET](https://products.groupdocs.com/signature/net) provides API for signing a wide range of document formats. Moreover, API includes special abilities for additional document content processing. Supported formats are PDF, Microsoft Word, Microsoft PowerPoint, Microsoft Excel, PNG, JPEG, and [many others](/signature/net/supported-document-formats/).

Use the [downloads section](https://downloads.groupdocs.com/signature/net) to obtain API DLLs or MSI installer or use the NuGet package manager:

```nuget
PM> Install-Package GroupDocs.Signature
```

## How to sign PDF files with a barcode

It is a common problem to add additional data to various types of business documents. Such a document may look as in the picture below. One of the most useful ways is to place a barcode directly on the document page.

![Source PDF document preview](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/source_doc_preview.png)

### Signing a document with a Codabar in C\#

To generate a barcode and sign a particular document with it:

* Instantiate the `Signature` class providing a path to the source document or document stream.
* Create the `BarcodeSignOptions` instance and set up all demanded fields.
* Invoke the `Sign` method to process the document, providing the output file path and sign options.

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

A document signed with a Codabar might look like in the picture below. The Codabar format was developed for printed documents and might be useful in office document flow.

![A document signed with a Codabar](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/signed_codabar.png)

The [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) Online App provides an opportunity to try document signing with barcodes for free.

## Barcode and image generation in C\#

Another way to improve documents is to generate the barcode first and then add it to documents using third-party tools. For this case, it is possible to generate code as an image.

* Create the `BarcodeSignOptions` class instance and set up all the demanded fields.
* Instantiate the `PreviewSignatureOptions` object providing the methods for creation and releasing.
* Invoke the `GenerateSignaturePreview` method to obtain the barcode image as a stream.
* Use the resultant barcode stream in any possible way.

```cs
            MemoryStream result = new MemoryStream();
            // setup barcode signature options
            BarcodeSignOptions signOptions = new BarcodeSignOptions()
            {
                EncodeType = BarcodeTypes.Code93,
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
An image containing the generated barcode might look in this way:

![Generated barcode](/signature/net/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-csharp/code93extended.png)

## Get a Free API License

In order to use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

To sum up, some useful ways of processing documents and barcodes were discussed in this article. Using C# with .NET applications improves the productivity of such actions dramatically.
In addition, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) Online App to generate barcodes and/or sign your files with barcodes for free.

Read the [documentation](https://docs.groupdocs.com/signature/net/) to learn how to use GroupDocs.Signature in your .NET applications. Also, you may discuss any questions or issues at the [GroupDocs forum](https://forum.groupdocs.com/).

## See also

* [How to sign documents with QR codes using C#](/signature/net/how-to-generate-qrcode-and-sign-document-using-csharp/)
* [How to sign Excel spreadsheets and their macros using C#](/signature/net/how-to-sign-excel-macros-using-csharp)
