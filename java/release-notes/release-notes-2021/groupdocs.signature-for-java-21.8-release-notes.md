---
id: groupdocs-signature-for-java-21-8-release-notes
url: signature/java/groupdocs-signature-for-java-21-8-release-notes
title: GroupDocs.Signature for Java 21.8 Release Notes
weight: 44
description: ""
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for Java 21.8{{< /alert >}}

## Major Features

This release contains improvement on obtaining Document information, adding new Spreadsheet format files to support, important fixes with Digital signatures deletion and few bug fixes.
Below the list of most notable changes in release of GroupDocs.Signature for Java 21.8:

* Implemented ability to exclude Deleted Signatures from Document information.
* Word Processing document issue with saving digital signatures was fixed.
* The issues with deleting Digital signatures in Word Processing and Spreadsheet files were fixed.
* Added support of Spreadsheet formats XLT and XLTM.
* Improvements were made to run sign processing with multiple threads.
* Implemented metadata adjustments when modifying documents.
* Few other minor bugs were fixed.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3493 | Update Image signatures modification to adjust metadata layout  | Feature |
| SIGNATURENET-3492 | Update Text signatures modification to adjust metadata layout  | Feature |
| SIGNATURENET-3458 | Implement ability to exclude Deleted Signatures from Document information  | Feature |
| SIGNATURENET-3494 | Update QR-code/Barcode signatures modification to adjust metadata layout  | Improvement |
| SIGNATURENET-3483 | Extend IDocumentInfo interface with new property to keep list of all existing Signatures  | Improvement |
| SIGNATURENET-3457 | Words Processing document does not have information about Digital Signatures | Bug |
| SIGNATURENET-3456 | Remove digital signature from Word and Excel | Improvement |
| SIGNATURENET-3412 | Excel file is not supported (XLT format) | Improvement |
| SIGNATURENET-3455 | Localized string error for MetaInfo data  | Bug |
| SIGNATURENET-3364 | Multiple calls issue in .NET in parallel multi-threads  | Bug |
| SIGNATURENET-2886 | File preview raises unexpected "Damaged file" exception  | Bug |

## Public API and Backward Incompatible Changes

#### New public static FileType [FileType](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/FileType) were added to support new Spreadsheet file formats

These FileType static objects describe new supported Spreadsheet document types.

**New public static objects**

```java
    public sealed class FileType
    {
		/**
		 * <p>
		 * Excel binary Template (.xlt) represents Excel Template File Format.
		 * Learn more about this file format {@code <a href="https://wiki.fileformat.com/spreadsheet/xlt">here</a>}.
		 * </p>
		 */
		public static final FileType XLT = new FileType("Excel Template file", ".xlt");

		/**
		 * <p>
		 * Excel Office OpenXML file Template (.xltm) represents Excel Template File Format.
		 * Learn more about this file format {@code <a href="https://wiki.fileformat.com/spreadsheet/xltm">here</a>}.
		 * </p>
		 */
		public static final FileType XLTM = new FileType("Excel Template file", ".xltm");
    };
```

#### Public class [SignatureSettings](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/SignatureSettings) was updated with new property that allow to exclude deleted Signatures from Document information result

Public class [SignatureSettings](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/SignatureSettings) was updated with property

* property bool [ShowDeletedSiganturesInfo] that allows to specify if deleted Signature information should be included into the Document Information structure. By default this value is enabled.

**New property of SignatureSettings class**

```java
    public class SignatureSettings
    {
        /**
		 * <p>
		 * Gets or sets flag that includes deleted signatures into Document Info result.
		 * Each Signature {@link BaseSignature} has Deleted flag {@code BaseSignature.Deleted}({@link BaseSignature#getDeleted}/{@link BaseSignature#setDeleted(boolean)}) to detect if it was deleted.
		 * </p>
		 */		
		public final boolean getShowDeletedSiganturesInfo();		
		public final void setShowDeletedSiganturesInfo(boolean value)
		
```

### Public interface [IDocumentInfo](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/IDocumentInfo) was extended with new property Signatures

Public interface **[IDocumentInfo](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/IDocumentInfo)** was extended with new property Signatures.

* Signatures property as IList of BaseSignature objects to keep the list of all document signatures.

**New property Signatures of IDocumentInfo interface**

```java
    /// <summary>
    ///  Defines document description properties.
    /// </summary>
    public interface IDocumentInfo
	{
       /**
		 * <p>
		 * Collection of document all types signatures {@link BaseSignature}.
		 * </p>
		 */		
		public java.util.List<BaseSignature> getSignatures();
	}
```

### Public class [DocumentInfo](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/DocumentInfo) was extended with new property Signatures

Public interface **[DocumentInfo](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/DocumentInfo)** was extended with new property **Signatures** to keep the list of document signatures of all types.

**New property Signatures of DocumentInfo class**

```java
    public class DocumentInfo implements IDocumentInfo
	{
        ...
         /**
		 * <p>
		 * Collection of document all types signatures {@link BaseSignature}.
		 * </p>
		 */		
		public final java.util.List<BaseSignature> getSignatures()
	}
```

Following example demonstrates how to obtain information about actual document signatures.

**Get Document extended information**

```java
public static void run() throws Exception
{
    // define Signature settings to remove Deleted signatures from the list
    SignatureSettings signatureSettings = new SignatureSettings();
    signatureSettings.setShowDeletedSiganturesInfo(false);
	
    final Signature signature = new Signature("signed.pdf");
    {
        IDocumentInfo documentInfo = signature.getDocumentInfo();

		// display all document signatures information without deleted ones
		System.out.print("Document actual Signatures : "+documentInfo.getSignatures().size());
		for (BaseSignature baseSignature : documentInfo.getSignatures())
		{
			System.out.print(
				StringExtensions.concat(" - #"+baseSignature.getSignatureId()+": Type: "+baseSignature.getSignatureType()+" Location: "+baseSignature.getLeft()+"x"+baseSignature.getTop()+". ",
				"Size: "+baseSignature.getWidth()+"x"+baseSignature.getHeight()+". ",
				"CreatedOn/ModifiedOn: "+baseSignature.getCreatedOn()+" / "+baseSignature.getModifiedOn()));
		}                
		// display document process history information
		System.out.print("Document Process logs information: count = "+documentInfo.getProcessLogs().size());
		for (ProcessLog processLog : documentInfo.getProcessLogs())
		{
			System.out.print(" - operation ["+processLog.getType()+"] on {processLog.Date.ToShortDateString()}. Succedded/Failed {processLog.Succeeded}/{processLog.Failed}. Message: {processLog.Message} : ");
			if (processLog.getSignatures() != null)
			{
				for (BaseSignature logSignature : processLog.getSignatures())
				{
					System.out.print("\t\t -"+logSignature.getSignatureType()+" #"+logSignature.getSignatureId()+" at "+logSignature.getTop()+" x "+logSignature.getLeft()+" pos;");
				}
			}
		}
    }
}
```
