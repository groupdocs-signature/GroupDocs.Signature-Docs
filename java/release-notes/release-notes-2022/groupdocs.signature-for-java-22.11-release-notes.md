---
id: groupdocs-signature-for-java-22-11-release-notes
url: signature/java/groupdocs-signature-for-java-22-11-release-notes
title: GroupDocs.Signature for Java 22.11 Release Notes
weight: 34
description: ""
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for Java 22.11{{< /alert >}}

## Major Features

This release contains an important updates on security of embedded data objects for the QR code signatures and Metadata signatures. The  AES encryption support was added and few legacy symmetric algorithms were marked as obsolete. Few fixed and improvements were made to signature image preview generation.An updates with the webp file format support were made to support its processing over the creating the signatures, verifying and searching them in this image document format. Below the list of most notable changes in release of GroupDocs.Signature for Java 21.11:

* The AES symmetric algorithm was added to support encoding data objects for QR Code and Metadata signatures.
* Provided SVG file type support for QR Code and Barcode signatures image preview.
* Few legacy encryption algorithms were marked as obsolete.
* Fixed a signature preview method to respect preview image format.
* Few new image formats were added for signature preview output image type.
* Update the referenced libraries to the latest versions.
* QR Code standard object scanner was improved to support different version of QR Code data serialization.
* The new AES improved implementation was provided to respect highly secure standards.
* Improved standard QR Code Event object processing to support time and various format versions.
* Fixed an issue with symetric algorithms encoding.
* New QR Code SMS object was implemented
* Fixed QR Code Event serialization issue.
* Implemented fixes with unexpected options settings.
* Fixed issues with damaged metadata information in the Microsoft Office documents
* The referenced libraries were updated to the latest versions.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3877 | Implement AES encryption algorithm for the Net framework version | Feature |
| SIGNATURENET-3883 | Respect GIF file format for siganture Preview method | Improvement |
| SIGNATURENET-3880 | Implement SVG file format Preview for Barcode and QRCode signatures | Improvement |
| SIGNATURENET-3878 | Fix Signature Preview generation process to respect output format file type | Bug |
| SIGNATURENET-3913 | Improve QR Code Event object scanner to support empty and missing fields | Feature |
| SIGNATURENET-3892 | Implement advanced AES encryption algorithm for the Net framework version | Feature |
| SIGNATURENET-3855 | Implement webp image file format support for full signature life circle processing | Feature |
| SIGNATURENET-3837 | Adjust standard QR Code entities to support empty values | Improvement |
| SIGNATURENET-3832 | QR Code Event entity does not support time for Start and End dates | Bug |
| SIGNATURENET-3914 | Exception with AES data encryption : Specified key is not a valid size for this algorithm | Bug |
| SIGNATURENET-3993 | Fixed QR Code Event object with multiple location serialization | Bug |
| SIGNATURENET-3987 | Error when signing the document with negative Width or Heigh parameters | Bug |
| SIGNATURENET-3959 | Exception : Image export failed | Bug |
| SIGNATURENET-3953 | Error processing Image documents: Unable to cast object of type 'System.Int32' to type 'System.UInt16' | Bug |
| SIGNATURENET-3952 | Error obtaining Words processing Document Info | Bug |
| SIGNATURENET-3951 | Processing Word Documents : Parameter not valid | Bug |
| SIGNATURENET-3658 | Error processing Image Document with many metadata items | Bug |
| SIGNATURENET-3915 | Implement SMS QR Code entity object | Feature |
| SIGNATURENET-3847 | Involve .Net 6.0 Support | Feature |
| SIGNATURENET-3991 | Skip possible damaged internal metadata information for most supported Office documents | Enhancement |

## Public Developer Guide examples changes

The following topics from Developer Guide were changed

## Public API and Backward Incompatible Changes

#### Public enumeration [SymmetricAlgorithmType](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.encryption/symmetricalgorithmtype/) was modified with few elements marked as obsolete and added new AES type

Represents symmetric encryption algorithm type.

**Enumeration type SymmetricAlgorithmType changes**

```java
    /**
	 * <p>
	 * Represents symmetric encryption algorithm type.
	 * </p>
	 */
    public final class SymmetricAlgorithmType extends Object
	{
		private SymmetricAlgorithmType(){}	
		/**
		 * <p>Represents DES Data Encryption Standard algorithm.</p>
		 * @deprecated This property is obsolete and will be deprecated in 22.12 version. Use SymmetricAlgorithmType.AES (Advanced Encryption Standard) instead.
		 */
		@Deprecated
		public static final int DES = 0;

		/**
		 * <p>Represents TripleDES symmetric encryption algorithm..</p>
		 * @deprecated This property is obsolete and will be deprecated in 22.12 version. Use SymmetricAlgorithmType.AES (Advanced Encryption Standard) instead.
		 */
		@Deprecated
		public static final int TripleDES = 1;

		/**
		 * <p>Represents RC2 algorithm.</p>
		 * @deprecated This property is obsolete and will be deprecated in 22.12 version. Use SymmetricAlgorithmType.AES (Advanced Encryption Standard) instead.
		 */
		@Deprecated
		public static final int RC2 = 2;

		/**
		 * <p>Represents Rijndael symmetric encryption algorithm.</p>
		 */
		public static final int Rijndael = 3;

		/**
		 * <p>Represents AES (Advanced Encryption Standard) encryption algorithm.</p>
		 */
		public static final int AES = 4;

		/**
		 * <p>Represents improved AES (Advanced Encryption Standard) encryption algorithm.</p>
		 */
		public static final int AESNew = 5;

	}
```

#### Public enumeration [PreviewFormats](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options/previewsignatureformats/) was modified with new supported format types

Enumeration represents signature preview options with new format added - the vector SVG and GIF

**Enumeration type PreviewFormats changes**

```java
	/**
	 * Signature preview supported formats
	 */
	public class PreviewSignatureFormats
	{
		/**
		 * <p>
		 * PNG
		 * </p>
		 */
		public static final int PNG = 0;

		/**
		 * <p>
		 * JPEG
		 * </p>
		 */
		public static final int JPEG = 1;

		/**
		 * <p>
		 * BMP
		 * </p>
		 */
		public static final int BMP = 2;

		/**
		 * <p>
		 * GIF
		 * </p>
		 */
		public static final int GIF = 3;

		/**
		 * <p>
		 * SVG
		 * </p>
		 */
		public static final int SVG = 4;
	}
```

[eSign PDF with Metadata signature]({{< ref "signature/java/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-pdf-with-metadata-signature.md" >}})

[eSign Image with Metadata signature]({{< ref "signature/java/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/esign-image-with-metadata-signature.md" >}})


#### Public class  [MetadataSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/metadatasignoptions/) was updated with the new method to add the existing MetadataSignature object

Prototype is
public MetadataSignOptions add(MetadataSignature metadataSignature);

**How to add quickly existing MetadataSignature**

```java
    public class MetadataSignOptions : SignOptions
    {
         /**
		 * <p>
		 * Add existing  MetadataSignature instance to collection.
		 * </p>
		 * @return Instance itself
		 * @param metadataSignature The existing MetadataSignature instance to be added
		 */		
		public final MetadataSignOptions add(MetadataSignature metadataSignature);
    }
    // using sample     
    Signature signature = new Signature("sample.pdf");
    
	// create Metadata option with predefined Metadata text
	MetadataSignOptions options = new MetadataSignOptions();
	
	options.add(new PdfMetadataSignature("Author", "Mr.Scherlock Holmes")) // String value
	options.add(new PdfMetadataSignature("CreatedOn", DateTime.Now))       // DateTime values
	options.add(new PdfMetadataSignature("DocumentId", 123456))            // Integer value
	options.add(new PdfMetadataSignature("SignatureId", 123.456D))         // Double value
	options.add(new PdfMetadataSignature("Amount", 123.456M))              // Decimal value
	options.add(new PdfMetadataSignature("Total", 123.456F));              // Float value
	
	// sign document to file
	SignResult result = signature.sign(outputFilePath, options);
	System.out.print("\nSource document signed successfully with"+ result.getSucceeded().size());
    

```

[eSign PDF with QR Code entries]({{< ref "signature/java/developer-guide/advanced-usage/signing/sign-embed-and-encr-data-qr-codes/sign-documents-with-standard-qr-code-entries.md" >}})


#### Public class [SMS](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/sms/) was added to provide SMS QR Code object properties

Class [SMS] contains following properties to get or set.

```java
/**
 * <p>
 * Represents SMS short message service details.
 * </p>
 */
public class SMS
{
    /**
     * <p>
     * Gets or sets SMS receipient phone number.
     *  </p>
     */    
    public final String getNumber();    
    public final void setNumber(String value);
   

    /**
     * <p>
     * Gets or sets SMS message content.
     *  </p>
     */    
    public final String getMessage();    
    public final void setMessage(String value);    

    /**
     * <p>
     * Creates VCard instance with default values.
     * </p>
     */    
    public SMS();  
}
```

The following example demonstrates how to create SMS QR Code standard entry.

**Create QR Code signature with SMS**

```java
public static void run()
{
	Signature signature = new Signature(file.pdf);
	{
		// create Event object
		SMS sms = new SMS();
		{
			sms.setNumber("0800 048 0408");
			sms.setMessage("Document approval automatic SMS message");
		};
		// create options
		QrCodeSignOptions options = new QrCodeSignOptions();
		{
			options.setEncodeType(QrCodeTypes.QR);
				// setup Data property to SMS instance
			options.setData(sms);
				// set right bottom corner
			options.setHorizontalAlignment(HorizontalAlignment.Left);
			options.setVerticalAlignment(VerticalAlignment.Center);
			options.setWidth(100);
			options.setHeight(100);
			options.setMargin(new Padding(10));
		};

		// sign document to file
		signature.sign(outputFile.pdf, options);
	}

	System.out.print("\nSource document signed successfully.\nFile saved at " + outputFilePath);
    
} 
```
