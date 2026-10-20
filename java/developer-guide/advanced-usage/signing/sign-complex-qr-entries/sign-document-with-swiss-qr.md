---
id: sign-document-with-swiss-qr
url: signature/java/sign-document-with-swiss-qr
title: Sign document with Swiss QR Barcode signature
linkTitle: Swiss QR
weight: 3
description: "This article explains how to sign document with Swiss QR Barcode electronic signatures using Java"
keywords: 
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [SwissQR](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.swissqr/swissqr/) class to create Swiss QR. The Swiss QR Barcode is used mostly in the QR-bill, which is a document designed to replace the payment slips and currently used in payment transactions in Switzerland.

Here are the steps how to add Swiss QR signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.
* Instantiate the [SwissQR](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.swissqr/swissqr/) object with all required additional options. Creditor and debtor addresses are [SwissAddress](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.swissqr/swissaddress/) objects.
* Instantiate the [QrCodeSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/qrcodesignoptions/) object with all required additional options and pass the `SwissQR` object to its `setData` method.
* Call the `sign` method of the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/qrcodesignoptions/) to it.
* Analyze the [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) result to check newly created signatures if needed.

```java
Signature signature = new Signature("sample.pdf");
try {
    // creditor address
    SwissAddress creditor = new SwissAddress();
    creditor.setName("Muster & Söhne");
    creditor.setStreet("Musterstrasse");
    creditor.setHouseNo("12b");
    creditor.setPostalCode("8200");
    creditor.setTown("Zürich");
    creditor.setCountryCode("CH");

    // debtor address
    SwissAddress debtor = new SwissAddress();
    debtor.setName("Muster AG");
    debtor.setStreet("Musterstrasse");
    debtor.setHouseNo("1");
    debtor.setPostalCode("3030");
    debtor.setTown("Bern");
    debtor.setCountryCode("CH");

    // create SwissQR data object
    SwissQR swissQR = new SwissQR();
    swissQR.setAccount("CH4431999123000889012");
    swissQR.setAmount(1000.25);
    swissQR.setCurrency("CHF");
    swissQR.setReference("210000000003139471430009017");
    swissQR.setCreditor(creditor);
    swissQR.setDebtor(debtor);

    // create options
    QrCodeSignOptions options = new QrCodeSignOptions();
    options.setEncodeType(QrCodeTypes.QR);
    options.setLeft(100);
    options.setTop(100);
    // setup Data property to SwissQR instance
    options.setData(swissQR);

    // sign document to file
    SignResult signResult = signature.sign("signed.pdf", options);

    // analyzing result
    System.out.println("List of newly created signatures:");
    int number = 1;
    for (BaseSignature temp : signResult.getSucceeded()) {
        System.out.println("Signature #" + number++ + ": Type: " + temp.getSignatureType()
                + " Id:" + temp.getSignatureId()
                + ", Location: " + temp.getLeft() + "x" + temp.getTop()
                + ". Size: " + temp.getWidth() + "x" + temp.getHeight());
    }
} finally {
    signature.dispose();
}
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)

### Free Online Apps

Along with the full-featured Java library, we provide simple but powerful free online apps.

To generate QR codes and/or sign your files with QR codes for free, you can use the [QR Code Generator](https://products.groupdocs.app/signature/generate/qrcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
