---
id: groupdocs-signature-for-java-22-2-release-notes
url: signature/java/groupdocs-signature-for-java-22-2-release-notes
title: GroupDocs.Signature for Java 22.2 Release Notes
weight: 38
description: ""
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---

{{< alert style="info" >}}## NOTE: Java 7 will not be supported since the next release of GroupDocs.Signature for Java. Supported versions are Java 8 and above.{{< /alert >}}

{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for Java 22.2{{< /alert >}}

## Major Features

This release contains new features with Pdf and Spreadsheet documents processing, new method with Image signatures and enhancements with customizing Digital Signature appearance. Also this update contains few fixed issues with document processing. Below the list of most notable changes in release of GroupDocs.Signature for Java 22.2:

* Involved new settings for Pdf Digital Signature Appearance.
* Implemented a way to compose Image siganture from base64 string content.
* New export types were added for Spreadsheet documents.
* Few issues were fixed.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3730 | Implement Foreground color for Pdf Digital Signature Appearance | Feature |
| SIGNATURENET-3703 | Implement easy way to pass image as base64 string to ImageSignOption | Feature |
| SIGNATURENET-3735 | Implement ImageSignOptions as IDisposable interface class | Improvement |
| SIGNATURENET-3734 | Implement new Spreadsheet document export format types | Improvement |
| SIGNATURENET-3733 | The exception is thrown when rendering Spreadsheet .ods file | Bug |
| SIGNATURENET-3732 | The exception is thrown for Digital Signature verification and searching for Linux OS | Bug |
| SIGNATURENET-3731 | Pdf Document could not be successfully certified for trial versions | Bug |
| SIGNATURENET-3701 | The signed Pdf file is corrupted and can not be opened in Acrobat Reader (.Net Core 3.x) | Bug |

## Public API and Backward Incompatible Changes

#### Public class [PdfDigitalSignatureAppearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.appearances/PdfDigitalSignatureAppearance) was updated with new property that allows to specify foreground color of Digital Signature appearance on Pdf document page

Public class [PdfDigitalSignatureAppearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.appearances/PdfDigitalSignatureAppearance) was updated with propery

* property Color [Foreground] that allows to specify foreground text color of signature labels.

**New properties of PdfDigitalSignatureAppearance class**

```java
    public class PdfDigitalSignatureAppearance
    {
         /**
		 * <p>
		 * Get or set foreground text color of signature appearance.
		 * By default the value is Color.FromArgb(76, 100, 255)
		 * </p>
		 */		
		public final java.awt.Color getForeground()
		public final void setForeground(java.awt.Color value)
   }
```


#### Public enum [SpreadsheetSaveFileFormat](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/SpreadsheetSaveFileFormat) was updated with new supported save format types like Emf, Jpg and Png

Newly added format types SpreadsheetSaveFileFormat.Emf, SpreadsheetSaveFileFormat.Jpg and SpreadsheetSaveFileFormat.Png allow to save signed document to rquired format.

**New enumeration values**

```java
    
    public enum SpreadsheetSaveFileFormat
    {
        ...
         /**
		 * <p>Saves the document in Windows Enhanced Metafile format.</p>
		 */
		public static final int Emf = 31;

		/**
		 * <p>Saves the document in Jpeg format.</p>
		 */
		public static final int Jpg = 33;

		/**
		 * <p>Saves the document in Portable Network Graphics format.</p>
		 */
		public static final int Png = 34;
    }
}
```

#### Public class [ImageSignOption](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/ImageSignOptions) was extended with static method to create ImageSignOptions instance from base64 image string content 

The ImageSignOptions class implements IDisposable interface and contains static method fromBase64(String base64Content) to create ImageSignOptions from base64 string

**Public class ImageSignOption**

```java
    
    public class ImageSignOptions : SignOptions, IRectangle, IAlignment, IRotation, ITransparency
    {
        /**
		 * <p>
		 * Creates a new instance of the ImageSignOptions class with predefined Image from Base64.
		 * </p>
		 * @return
		 * @param base64Content Image content in Base64 string format
		 */		
		public static ImageSignOptions fromBase64(String base64Content)
    }
}
```

Following example demonstrates how to create ImageSignOptions from base64 string.

**Create Image signature from base64 string**

```java
public static void run()
{
    
	Signature signature = new Signature("sample.pdf");
	{
		String base64Content = "iVBORw0KGgoAAAANSUhEUg....AAAPoAAACSCAYAAABsS9cKAAAAGXRF";
		ImageSignOptions options = ImageSignOptions.fromBase64(imageBase64);		
		options.Left = 100;
		options.Top = 100;
		SignResult result = signature.sign("sample_out.pdf", options);
		
	}
    
}

```



