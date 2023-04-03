---
id: groupdocs-signature-for-java-23-4-release-notes
url: signature/java/groupdocs-signature-for-java-23-4-release-notes
title: GroupDocs.Signature for Java 23.4 Release Notes
weight: 18
description: "Features and fixes that are shipped in GroupDocs.Signature for Java 23.4"
keywords: release notes, groupdocs.signature, java, 23.4
productName: GroupDocs.Signature for Java
hideChildren: False
toc: True
---

## Major Features

The main features of this release are improvements with logging, fixes the issues under Linux platform and new property DataType of the metadata signatures. The updates with logging are related to extended messages for Trace log level that allow to log information events. Also of this release is the implementation of the process metrics that provides statistic on processing time, incoming and outgoing document size, the number of signatures, etc. The IResult interface was enhanced to implement these values. Also, the release includes the changes to fix the Word Processing preview on Linux platforms, fix on Spreadsheet page size calculation and correction on forming the PNG output format when exporting the document pages as images. Below the list of most notable changes in release of GroupDocs.Signature for Java 23.4:

* Fixed the error with previewing Word Processing documents on the Linux platform
* Fixed unexpected QRCode Signature verification result under Linux OS
* Detection of PFX Certificate files were recognized properly
* Log Level enumeration was provided to limit the logging messages events
* Implement new DataType property of the MetadataSignature class.
* Implement detailed Trace messages for logging of the most methods.
* Provide Log Level flags enumeration to specify multiple log levels processing.
* Process metrics were implemented for Sign, Update, Delete, Search and Verify methods
* Fixed the exception by previewing the Word Processing document in Jpg format
* Document export as image method was fixed to provide accurate PNG format files
* The Page size property of the DocumentInfo was fixed for Spreadsheet documents
* Trace logging was extended with informational messages for each method of working with a particular signature
* Referenced libraries and dependencies were updated


**Added new enumeration LogLevel to specify the level of logging witing the SignatureSettings new LogLevel propert**

### The following example demonstrates how to setup standard or custom logging.

```java
public static void run()
{
    LoadOptions loadOptions = new LoadOptions();
    loadOptions.setPassword("12345678901");
    // use standard console logger
    ConsoleLogger logger = new ConsoleLogger();
    SignatureSettings settings = new SignatureSettings(logger);
    settings.setLogLevel(LogLevel.Error | LogLevel.Warning);
    try
    {
        // create the Signature instance with the Signature settings
        Signature signature = new Signature("sample.pdf", loadOptions, settings);
        {
            QrCodeSignOptions options = new QrCodeSignOptions("Sample1");

            // sign document to file
            signature.sign(outputFilePath, options);
        }
    }
    catch(java.lang.RuntimeException e)
    {
        // skip the Exception - check the log
    }
    System.out.print("\nSource document signed successfully.\nFile saved at "+  outputFilePath);
}
```


**SignResult implements product metrics properties of the IResult interface**

### The following example demonstrates how to analyze IResult metrics.

```java
public static void run()
{
    Signature signature = new Signature("sample.pdf");
    {
        // create QRCode option with predefined QRCode text
        QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");

        // sign document to file
        SignResult signResult = signature.sign("output.pdf", options);

        // analyze SignResult (IResult properties)
        System.out.print("Sign-process was executed for "+signResult.getProcessingTime()+" mls");
        System.out.print("Input document size "+signResult.getSourceDocumentSize()+" bytes");
        System.out.print("Output document size "+signResult.getDestinDocumentSize()+" bytes");
        System.out.print("Total processed signatures "+signResult.getTotalSignatures());
        if (signResult.getFailed().size() == 0)
        {
            System.out.print("\nAll signatures were successfully created!");
        }
        else
        {
            System.out.print("Successfully created signatures : "+signResult.getSucceeded().size());
            System.out.print("Failed signatures : "+signResult.getFailed().size());
        }
        System.out.print("\nList of newly created signatures:");
        int number = 1;
        for (BaseSignature temp : signResult.getSucceeded())
        {
            System.out.print("Signature #"+ +number++ +": Type: "+temp.getSignatureType()+" Id:"+temp.getSignatureId()+", Location: "+temp.getLeft()+"x"+temp.getTop()+". Size: "+temp.getWidth()+"x"+temp.getHeight());
        }
    }
}
```


Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-4206 | Error with previewing Word Processing documents on the Linux platform | Bug |
| SIGNATURENET-4157 | QRCode Signature verification result differs from expected (Linux platform) | Bug |
| SIGNATURENET-4147 | Some PFX Certificate documents are not recognized properly | Bug |
| SIGNATURENET-4155 | Implement Log Level settings to limit the logging messages events | Feature |
| SIGNATURENET-4138 | Implement DataType property of the MetadataSignature class | Enhancement |
| SIGNATURENET-4115 | Implement detailed Trace messages for logging of the most methods | Enhancement |
| SIGNATURENET-4110 | Provide Log Level flags enumeration to specify multiple log levels processing | Enhancement |
| SIGNATURENET-4259 | Exported PNG images from the documents have a corrupted format | Bug |
| SIGNATURENET-4222 | The Page size property of the DocumentInfo is wrong for Spreadsheet files | Bug |
| SIGNATURENET-4006 | .Net Core : Preview Word Processing document in Jpg format gives unexpected exception | Bug |
| SIGNATURENET-4150 | Implement process method metrics to all product methods | Feature |
| SIGNATURENET-4260 | Extend trace level logging messages for each particular signature processing for Sign, Update, Delete, Search and Verify methods | Enhancement |




## Public Developer Guide examples changes

The following topics from Developer Guide were added

[Sign document with result analysis]({{< ref "signature/java/developer-guide/advanced-usage/signing/sign-document-with-result-analysis.md" >}})


## Public API and Backward Incompatible Changes

#### Public interface [IResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/iresult/) was updated with following properties

Property [getProcessingTime] of type long return the execution time of the process in milliseconds.
Property [getTotalSignatures] of type int return the total processed signatures.
Property [getSourceDocumentSize] of type long return the input document length in bytes.
Property [getDestinDocumentSize] of type long return the output document length in bytes.

#### Public classes [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/), [UpdateResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/updateresult/), [DeleteResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/deleteresult/) were updated with following properties to implement IResult interface

Property [getProcessingTime] of type long return the execution time of the process in milliseconds.
Property [getTotalSignatures] of type int return the total processed signatures.
Property [getSourceDocumentSize] of type long return the input document size in bytes.
Property [getDestinDocumentSize] of type long return the output (signed/modified/saved) document size in bytes.

#### Public classes [VerificationResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/verificationresult/) and [SearchResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/searchresult/) were updated to implement IResult interface and support following properties

Property [getProcessingTime] of type long return the execution time of the Sign process in milliseconds.
Property [getTotalSignatures] of type int return the total processed signatures.
Property [getSourceDocumentSize] of type long return the input document size in bytes.
Property [getDestinDocumentSize] of type long for Verify and Search method always returns zero.
Property [getSucceeded] as List of [BaseSignature] objects keeps the list of processed successfully signatures for Search method. This property does not yet supported for Verify method.
Property [getFailed] as List of [BaseSignature] objects keeps the list of failed signatures. This property currently does not supported for Verify and Search methods.

