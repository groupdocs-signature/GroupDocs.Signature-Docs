---
id: sign-document-with-hibc-pas-barcode
url: signature/java/sign-document-with-hibc-pas-barcode
title: Sign document with HIBC PAS barcode Symbology
linkTitle: HIBC PAS
weight: 4
description: "This article explains how to sign document with HIBC PAS barcode Symbology signatures using Java"
keywords: 
productName: GroupDocs.Signature for Java
toc: True
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides the `HIBCPASData` class (package `com.groupdocs.signature.domain.extensions.hibcpas`) to create HIBC PAS barcode, designed specifically to meet the stringent requirements of the healthcare industry.

Here are the steps how to add HIBC PAS barcode signature into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.
* Instantiate the `HIBCPASData` class. Set the data location with the `setDataLocation` method (a `HIBCPASDataLocation` constant) and add records with the `addRecord` method (a `HIBCPASDataType` constant and the value).
* Instantiate the [QrCodeSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/qrcodesignoptions/) object with all required additional options and pass the `HIBCPASData` object to its `setData` method.
* Call the `sign` method of the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [QrCodeSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/qrcodesignoptions/) to it.
* Analyze the [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) result to check newly created signatures if needed.

This example shows how to add HIBCPASData signature to document using Java:

```java
Signature signature = new Signature("sample.pdf");
try {
    HIBCPASData data = new HIBCPASData();
    data.setDataLocation(HIBCPASDataLocation.Patient);
    data.addRecord(HIBCPASDataType.LabelerIdentificationCode, "A123");
    data.addRecord(HIBCPASDataType.ManufacturerSerialNumber, "SERIAL123");

    // create options
    QrCodeSignOptions options = new QrCodeSignOptions();
    options.setEncodeType(QrCodeTypes.QR);
    options.setLeft(100);
    options.setTop(100);
    // setup Data property to HIBCPASData instance
    options.setData(data);

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

This example shows how to decode HIBCPASData signature from the document using Java. The `getData` method of [QrCodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/qrcodesignature/) takes the class of the expected object:

```java
Signature signature = new Signature("signed.pdf");
try {
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    if (!signatures.isEmpty()) {
        HIBCPASData data = signatures.get(0).getData(HIBCPASData.class);
        if (data != null) {
            System.out.println("HIBC PAS data location: " + data.getDataLocation());
            for (HIBCPASRecord record : data.getRecords()) {
                System.out.println("\t" + record.getDataType() + " : " + record.getData());
            }
        }
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

To generate barcodes and/or sign your files with barcodes for free, you can use the [Barcode Generator](https://products.groupdocs.app/signature/generate/barcode) online app.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
