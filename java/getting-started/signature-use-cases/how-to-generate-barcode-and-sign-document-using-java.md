---
id: how-to-generate-barcode-and-sign-document-using-java
url: signature/java/how-to-generate-barcode-and-sign-document-using-java
title: How to generate barcode and sign document using Java
weight: 2
description: "This guide describes how to improve your document with generated barcodes using Java. Sign your documents with Codabar, Event or Code93 using GroupDocs.Signature for Java API by GroupDocs."
keywords: Barcode Signature in Java, Sign document with Codabar in Java, Sign document with Event in Java, Sign document with Code93 in Java
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate a Barcode and sign a document with it using Java    
        description: Creating Barcode signature and adding it to document with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to add Barcode to various documents with Java 
        description: Find out ways of signing documents with the Barcode using Java
        steps:
        - name: Load source document
          text: Creating Signature instance with file path or stream as a constructor parameter will load the document. 
        - name: Provide barcode options. 
          text: Set specific properties of the BarcodeSignOptions instance like a Barcode type, barcode text, and signature appearance settings.
        - name: Sign source and obtain result 
          text: Invoke method sign with passing created options and output file data. You can save signed files using a file path or a stream.
---

Barcodes represent textual information as a quite small image that could be automatically scanned. Such an approach brings new opportunities in the computer processing of documents like sorting or moving through a business workflow. In this article, we will discuss useful ways to sign electronic documents with data encrypted in Bar or QR codes using Java.

## Native Java API for Electronic Signatures

[GroupDocs.Signature for Java](https://products.groupdocs.com/signature/java) provides API for signing a wide range of document formats. Moreover, API includes special abilities for additional document content processing. Supported formats are PDF, Microsoft Word, Microsoft PowerPoint, Microsoft Excel, PNG, JPEG, and [many others]({{< ref "signature/java/getting-started/supported-document-formats.md" >}}).

Use the [downloads section](https://releases.groupdocs.com/signature/java/) to obtain the API JAR, or add the `com.groupdocs:groupdocs-signature` dependency from the [GroupDocs Artifact Repository](https://releases.groupdocs.com/java/repo/) to your Maven project as described in [Installation]({{< ref "signature/java/getting-started/installation.md" >}}):

```xml
<dependency>
    <groupId>com.groupdocs</groupId>
    <artifactId>groupdocs-signature</artifactId>
    <version>26.10</version>
</dependency>
```

## How to sign PDF files with a barcode

It is a common problem to add additional data to various types of business documents. Such a document may look as in the picture below. One of the most useful ways is to place a barcode directly on the document page.

![Source PDF document preview](/signature/java/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-java/source_doc_preview.png)

### Signing a document with a Codabar in Java

To generate a barcode and sign a particular document with it:

* Instantiate the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class providing a path to the source document or document stream.
* Create the [BarcodeSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/barcodesignoptions/) instance and set up all demanded fields.
* Invoke the `sign` method to process the document, providing the output file path and sign options.

```java
// instantiating the signature object
Signature signature = new Signature("source.pdf");
try {
    // setup barcode signature options
    BarcodeSignOptions signOptions = new BarcodeSignOptions();
    signOptions.setHorizontalAlignment(HorizontalAlignment.Right);
    signOptions.setTop(150);
    signOptions.setEncodeType(BarcodeTypes.Codabar);
    signOptions.setText("Approved_19/06/2022");

    // sign document
    signature.sign("signed_codabar.pdf", signOptions);
} finally {
    signature.dispose();
}
```

A document signed with a Codabar might look like in the picture below. The Codabar format was developed for printed documents and might be useful in office document flow.

![A document signed with a Codabar](/signature/java/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-java/signed_codabar.png)

The [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) Online App provides an opportunity to try document signing with barcodes for free.

## Barcode and image generation in Java

Another way to improve documents is to generate the barcode first and then add it to documents using third-party tools. For this case, it is possible to generate code as an image.

* Create the [BarcodeSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/barcodesignoptions/) class instance and set up all the demanded fields.
* Instantiate the [PreviewSignatureOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options/previewsignatureoptions/) object, passing a `PageSignatureStreamFactory` implementation that creates and releases the output stream.
* Invoke the static `Signature.generateSignaturePreview` method to write the barcode image to the stream.
* Use the resultant barcode image in any possible way.

```java
final ByteArrayOutputStream result = new ByteArrayOutputStream();

// setup barcode signature options
BarcodeSignOptions signOptions = new BarcodeSignOptions();
signOptions.setEncodeType(BarcodeTypes.Code93);
signOptions.setText("Case 148.01");

// instantiate preview options
PreviewSignatureOptions previewOptions = new PreviewSignatureOptions(signOptions,
        new PageSignatureStreamFactory() {
            @Override
            public OutputStream createSignatureStream(PreviewSignatureOptions options) {
                return result;
            }

            @Override
            public void closeSignatureStream(PreviewSignatureOptions options, OutputStream signatureStream) {
                // the stream stays open: the image is read from it below
            }
        });
previewOptions.setPreviewFormat(PreviewFormats.PNG);

// generate image to stream
Signature.generateSignaturePreview(previewOptions);

// use the image, for example save it to a file
Files.write(Paths.get("barcode.png"), result.toByteArray());
```

An image containing the generated barcode might look in this way:

![Generated barcode](/signature/java/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-java/code93extended.png)

## Get a Free API License

In order to use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

To sum up, some useful ways of processing documents and barcodes were discussed in this article. Using GroupDocs.Signature in Java applications improves the productivity of such actions dramatically.
In addition, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) Online App to generate barcodes and/or sign your files with barcodes for free.

Read the [documentation](https://docs.groupdocs.com/signature/java/) to learn how to use GroupDocs.Signature in your Java applications. Also, you may discuss any questions or issues at the [GroupDocs forum](https://forum.groupdocs.com/).

## See also

* [How to sign documents with QR codes using Java]({{< ref "signature/java/getting-started/signature-use-cases/how-to-generate-qrcode-and-sign-document-using-java.md" >}})
* [How to sign Excel spreadsheets and their macros using Java]({{< ref "signature/java/getting-started/signature-use-cases/how-to-sign-excel-macros-using-java.md" >}})
