---
id: groupdocs-signature-for-java-22-8-release-notes
url: signature/java/groupdocs-signature-for-java-22-8-release-notes
title: GroupDocs.Signature for Java 22.8 Release Notes
weight: 44
description: ""
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for Java 22.8{{< /alert >}}

{{< alert style="info" >}}NOTE: Starting from this release Java 7 is not longer supported in the GroupDocs.Signature for Java. The minimal supported versions is Java 8 and higher{{< /alert >}}
## Major Features

This release contains an important updates for QR Code entities and features for ordering the electronic signatures on document pages. Few changes were made to improve the Digital Signatures appearance with the Chinese charset for the PDF documents. Some adjustments were made on the ordering of the signatures on the Image Documents. The new options Order was implemented for page-oriented signature types like Text, Image, Barcode, QRCode and Stamps and supported for most document types such as Spreadsheets, Word Processing and Images. Having this feature will allow the front-end applications to adjust signature ordering on the page and move them from back to front. Also this release contains significant optimization for document type detections and implementation of sull svg-image file format support. Below the list of most notable changes in release of GroupDocs.Signature for Java 21.8:

* Implemented ability to specify the order of signature for Spreadsheet, Word process and Image documents.
* Provided full SVG file type support for image documents and most signature types.
* Involved a significant optimization of file detection algorithm.
* Implement adjustment on image preview signature for front-end applications.
* Implemented ability to specify the order of signature for Spreadsheet, Word process and Image documents.
* Provided full SVG file type support for image documents and most signature types.
* Involved a significant optimization of file detection algorithm.
* Implement adjustment on image preview signature for front-end applications.
* Fixed a few internal issues.
* Update the referenced libraries to the latest versions.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3810 | Implement Order position for page-oriented signatures for Image Documents | Feature |
| SIGNATURENET-3809 | Implement Order position for page-oriented signatures for Word Processing Documents | Feature |
| SIGNATURENET-3808 | Implement full SVG file type for image documents for all signature types | Feature |
| SIGNATURENET-3807 | Improve file type detection algorithm | Improvement |
| SIGNATURENET-3758 | Implement Order position for page-oriented signatures for Spreadsheet Documents | Feature |
| SIGNATURENET-3706 | Implement various Image Signature Preview for Signature App Generation Templates | Improvement |
| SIGNATURENET-3845 | Implement standard QR Code WiFi entry  | Feature |
| SIGNATURENET-3837 | Adjust standard QR-Code entities to support empty values | Improvement |
| SIGNATURENET-3838 | Update the Developers Guide and Use Cases section of GroupDocs.Signature documentation | Improvement |
| SIGNATURENET-3843 | Chinese strings are not displayed correctly on the PDF Digital Signatures | Improvement |

## Public Developer Guide examples changes

The following topics from Developer Guide were changed

[Sign document with ordering the signatures]({{< ref "signature/java/developer-guide/advanced-usage/signing/sign-embed-and-encr-data-qr-codes/sign-documents-with-standard-qr-code-entries.md" >}})

## Public API and Backward Incompatible Changes

#### Public class [SignOptions](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.options/package-frame) was updated with ZOrder property

Property [ZOrder] expects integer values to put the signatures on document page in proper order.

The following example demonstrates how to setup special ordering of the signatures on the document page.

**Generate signature preview**

```java
public static void run()
{
    Signature signature = new Signature(filePath);
        {
            // create several signatures that intersect

            // # 1 create barcode option with predefined barcode text
            // this options will be on top
            BarcodeSignOptions options1 = new BarcodeSignOptions("12345678");
            {
                // setup Barcode encoding type
                options1.setEncodeType(BarcodeTypes.Code128);
                // set signature position
                options1.setLeft(100);
                options1.setTop(100);
                options1.setWidth(100);
                options1.setHeight(100);
                options1.setZOrder(2);
            };

            // # 2 create barcode option with predefined barcode text
            // this options will be bottom
            QrCodeSignOptions options2 = new QrCodeSignOptions("12345678");
            {
                // setup Barcode encoding type
                options2.setEncodeType(QrCodeTypes.QR);
                // set signature position
                options2.setLeft(150);
                options2.setTop(150);
                options2.setZOrder(1);
            };
            // sign document to file
            List<SignOptions> options = new ArrayList<SignOptions>();
            options.add(options1);
            options.add(options2);
            SignResult signResult = signature.sign(outputPath, options);
            System.out.print("\nSource document signed successfully with {signResult.Succeeded.Count} signature(s).\nFile saved at {outputFilePath}.");
        }
} 
```

#### New public enumeration [WiFiEncryptionType](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/WiFiEncryptionType) was added to specify various encryption types for the WiFi QR Code entities

This enumeration keeps supported WiFi encryption types.

**New public enumeration**

```java
    /**
	* <p>
	* Represents WiFi Encryption type.
	* </p>
	*/
    public final class WiFiEncryptionType
	{
	
		/**
		 * <p>Represents no encryption WiFi type.</p>
		 */
		public static final int None = 0;

		/**
		 * <p>Represents WiFi with the WPA encryption type.</p>
		 */
		public static final int WPA = 1;

		/**
		 * <p>Represents WiFi with the WPA-EAP encryption type.</p>
		 */
		public static final int WPAEAP = 2;

		/**
		 * <p>Represents WiFi with the WPA/WPA2 encryption type.</p>
		 */
		public static final int WPAWPA2 = 3;

		/**
		 * <p>Represents WiFi with the WEP encryption type.</p>
		 */
		public static final int WEP = 4;
    }
```

#### Public class [WiFi](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/WiFi) was added to provide WiFi QR Code object properties

Class [WiFi] contains following properties to get or set.

The following example demonstrates how to create WiFi QR Code standard entry.

**Generate signature preview**

```java
public static void run()
{
    Signature signature = new Signature(filePath);
        {
            // create WiFi object
            WiFi wifi  = new WiFi();
            {
                wifi.setSSID("GuestNetwork!");
                wifi.setEncryption(WiFiEncryptionType.WPAWPA2);
                wifi.setPassword("guest");
                wifi.setHidden(false);
            };
            // create options
            QrCodeSignOptions options = new QrCodeSignOptions();
            {
                options.setEncodeType(QrCodeTypes.QR);
                // setup Data property to MeCard instance
                options.setData(wifi);
                // set right bottom corner
                options.setHorizontalAlignment(HorizontalAlignment.Left);
                options.setVerticalAlignment(VerticalAlignment.Center);
                options.setWidth(100);
                options.setHeight(100);
                options.setMargin (new Padding(10));
            };

            // sign document to file
            signature.sign(outputFilePath, options);

            System.out.print("\nSource document signed successfully.\nFile saved at " + outputFilePath);
        }
} 
```
