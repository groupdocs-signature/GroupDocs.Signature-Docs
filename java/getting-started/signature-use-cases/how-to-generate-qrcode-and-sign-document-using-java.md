---
id: how-to-generate-qrcode-and-sign-document-using-java
url: signature/java/how-to-generate-qrcode-and-sign-document-using-java
title: How to generate QR Code and sign document using Java
weight: 3
description: "This guide describes how to improve your document with generated QR code using Java. Sign your documents with a QR Code and various standard QR code elements like Event QR Code, contact QR Code as VCard or MeCard, SEPA payment QR Code using GroupDocs.Signature for Java API by GroupDocs."
keywords: QR Code creation, generate QR Code, add QR Code to document in Java, Sign document with QR Event in Java, VCard, or MeCard QR Code.
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Generate a QR Code and sign a document with it using Java    
        description: Creating QR Code signature and adding it to document with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to add QR code to various documents with Java 
        description: Get known how to create QR and add it to the document using Java
        steps:
        - name: Load source document
          text: Creating the Signature instance with file path or stream as a constructor parameter will load the document. 
        - name: Provide QR Code options. 
          text: Set specific properties of the QrCodeSignOptions instance like a QR Code type, QR code text, and signature appearance settings.
        - name: Sign source and obtain result 
          text: Invoke method sign with passing created options and output file data. You can save signed files using a file path or a stream.
---

The generated QR Code can be downloaded and used to add to the business contracts and official documents. Any QR Code contains unique textual information that confirms the identity of the signer or authorizes the business document. QR Code verification could be performed automatically by reading the contents of the QR Code embedded data. These signatures could be scanned automatically. The QR Code allows keeping over 2 Kilobytes of data.

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

## Signing a document with an Event QR-code in Java

Sometimes it is needed to inform coworkers about business events. In such cases, an Event QR code can provide all the required information in a very effective way. This topic describes how to sign a PDF document with the generated Event QR code.

* Instantiate the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class providing the path to the source document or document stream.
* Set event data in the [Event](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/event/) object instance.
* Create the [QrCodeSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/qrcodesignoptions/) object and set up all demanded fields.
* Invoke the `sign` method to process the document, providing output file path and sign options.

```java
// instantiating the signature object
Signature signature = new Signature("source.pdf");
try {
    // provide event data
    Event eventQr = new Event();
    eventQr.setTitle("Meeting");
    eventQr.setDescription("Productivity issues");
    eventQr.setLocation("room 408");
    eventQr.setStartDate(new GregorianCalendar(2022, 5, 19, 15, 30, 0).getTime());
    eventQr.setEndDate(new GregorianCalendar(2022, 5, 19, 17, 0, 0).getTime());

    // setup QR code signature options
    QrCodeSignOptions signOptions = new QrCodeSignOptions();
    signOptions.setHorizontalAlignment(HorizontalAlignment.Right);
    signOptions.setVerticalAlignment(VerticalAlignment.Bottom);
    signOptions.setEncodeType(QrCodeTypes.QR);
    signOptions.setData(eventQr);

    // sign document
    signature.sign("signed_event.pdf", signOptions);
} finally {
    signature.dispose();
}
```

`GregorianCalendar` counts months from zero, so `5` is June.

The result of signing a document may look like the picture below. Such QR codes can be very useful for organizing events.

![Document signed with an Event QR code](/signature/java/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-java/signed_event.png)

To try signing documents with QR codes for free, you may use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) Online App.

## QR Code image generation in Java

Another way to improve documents is to generate the QR code first and then add it to documents using third-party tools. For this case, it is possible to generate code as an image.

* Create the [QrCodeSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/qrcodesignoptions/) instance and set up all demanded fields.
* Instantiate the [PreviewSignatureOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options/previewsignatureoptions/) object, passing a `PageSignatureStreamFactory` implementation that creates and releases the output stream.
* Invoke the static `Signature.generateSignaturePreview` method to write the QR code image to the stream.
* Use the resultant QR Code image in any possible way.

```java
final ByteArrayOutputStream result = new ByteArrayOutputStream();

// setup QR code signature options
QrCodeSignOptions signOptions = new QrCodeSignOptions();
signOptions.setEncodeType(QrCodeTypes.QR);
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
Files.write(Paths.get("qrcode.png"), result.toByteArray());
```

An image with the generated QR Code may look as below:

![Generated QR Code](/signature/java/images/signature-use-cases/how-to-generate-barcode-and-sign-document-using-java/textqrcode.png)

## Get a Free API License

To use the API without evaluation limitations, you can get a free [temporary license](https://purchase.groupdocs.com/temporary-license).

## Conclusion

To sum up, some useful ways of processing documents with QR codes were discussed in this article. Using GroupDocs.Signature in Java applications greatly improves the productivity of such actions.
In addition, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) Online App to generate QR codes and/or sign your files with QR codes for free.

Read the [documentation](https://docs.groupdocs.com/signature/java/) to learn how to use GroupDocs.Signature in your Java applications. Also, you may discuss any questions or issues at the [GroupDocs forum](https://forum.groupdocs.com/).

## See also

* [How to sign documents with barcodes using Java]({{< ref "signature/java/getting-started/signature-use-cases/how-to-generate-barcode-and-sign-document-using-java.md" >}})
* [How to sign Excel spreadsheets and their macros using Java]({{< ref "signature/java/getting-started/signature-use-cases/how-to-sign-excel-macros-using-java.md" >}})
