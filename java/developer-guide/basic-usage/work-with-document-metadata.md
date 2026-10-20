---
id: work-with-document-metadata
url: signature/java/work-with-document-metadata
title: Work with document metadata
weight: 9
description: "Learn what document metadata is, where PDF, Word, Excel, PowerPoint and image files keep it, and how to add, search and read metadata entries in Java with GroupDocs.Signature for Java."
keywords: document metadata, metadata signature, read document metadata, add metadata to document, search metadata, hidden document properties, XMP, EXIF, document properties, Java
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Work with document metadata using Java    
        description: Add, search and read document metadata in various document formats using Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to work with document metadata using Java
        description: Adding metadata entries to documents and reading them back in Java
        steps:
        - name: Load the document
          text: Instantiate the Signature class passing either a file path or a stream as a constructor parameter.
        - name: Add metadata entries
          text: Create a MetadataSignOptions instance, add typed metadata signatures to it and pass it to the sign method.
        - name: Search for metadata
          text: Call the search method with SignatureType.Metadata to read metadata entries back and convert their values to Java types.
        - name: Obtain document details
          text: Call the getDocumentInfo method to get the file type, size, page count and the list of metadata entries found in the document.
---
## What is document metadata

Document metadata is the data a document keeps about itself. It travels inside the file but stays invisible when the document is opened in a viewer or editor: readers see the pages, while the metadata layer quietly records who made the file, when, with which tool, and anything else an application decided to store there.

Metadata entries usually fall into three classic categories:

* **Descriptive** — what the document is about: title, author, subject, keywords, comments. This is what search engines and document management systems index first.
* **Structural** — how the file is built: format and version, page count and dimensions, relationships between embedded parts.
* **Administrative** — how the file is managed: creation and modification dates, producing application, revision history, rights and permissions.

Each document family keeps this layer in its own physical location, and [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) mirrors those locations with dedicated classes derived from [MetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/metadatasignature/):

| Document family | Where metadata physically lives | GroupDocs.Signature class |
| --- | --- | --- |
| PDF | XMP packet — an XML block with prefixed entry names such as `xmp:CreateDate` | [PdfMetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/pdfmetadatasignature/) (adds the `getTagPrefix()` / `setTagPrefix()` methods) |
| Word processing (DOCX, DOC, ODT, ...) | Document properties — built-in fields plus a custom properties collection | [WordProcessingMetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/wordprocessingmetadatasignature/) |
| Spreadsheet (XLSX, XLS, ODS, ...) | Workbook built-in and custom document properties | [SpreadsheetMetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/spreadsheetmetadatasignature/) |
| Presentation (PPTX, PPT, ODP, ...) | Presentation built-in and custom document properties | [PresentationMetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/presentationmetadatasignature/) |
| Images (JPG, TIFF, ...) | EXIF property items keyed by numeric identifiers instead of names | [ImageMetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/imagemetadatasignature/) (adds the `getId()` method) |
| Digital certificates (PFX) | Certificate fields — issuer, serial number, subject, expiration and similar | [CertificateMetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/certificatemetadatasignature/) (returned by search) |

Every entry, whatever the format, is a name-value pair with a detected value type. The [MetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/metadatasignature/) base class exposes the `getName()`, `getValue()` and `getType()` methods. `getValue()` returns the value as a Java object whose class reflects the detected type, for example `String`, `Integer`, `Double`, `Boolean` or `java.util.Date`.

## Why metadata matters

Well-maintained metadata is what makes large document collections manageable. Files with meaningful descriptive entries can be found by a property query instead of a full-text scan, routed automatically to the right storage or workflow branch, and grouped with their related revisions. Because GroupDocs.Signature treats metadata entries as invisible electronic signatures, the same layer becomes an audit-trail channel: you can stamp a document with signer identity, document identifiers, timestamps or whole serialized business objects without changing a single pixel of its visible content.

The same invisibility is also a risk. Documents leave organizations carrying author names, internal file paths, tracked-changes leftovers and other details nobody intended to publish, which can violate privacy rules or leak internal information. Before distributing a document it is worth auditing what its metadata layer actually contains — the search and document-information APIs described below enumerate that layer in a few lines of code, and the encryption features let you protect the values you add deliberately.

## What GroupDocs.Signature can do with metadata

| Document family | Add (sign) metadata | Search metadata | Appears in getDocumentInfo |
| --- | --- | --- | --- |
| PDF | Yes (XMP) | Yes (XMP) | Yes |
| Word processing | Yes | Yes | Yes |
| Spreadsheet | Yes | Yes | Yes |
| Presentation | Yes | Yes | Yes |
| Images | Yes (EXIF, see note) | Yes | Yes |
| Certificates (PFX) | No | Yes (the only supported search type) | Yes (certificate fields) |
| Archives (ZIP, TAR, 7Z) | No | No | No |

Format notes to keep in mind:

* **PDF metadata operations target the XMP packet only.** Entries are read from and written to the document's XMP metadata; each entry name may carry a tag prefix (`xmp`, `dc`, `pdf` and others) controlled via `PdfMetadataSignature.setTagPrefix`. The predefined [PdfMetadataSignatures](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/pdfmetadatasignatures/) class offers ready-made standard entries such as `getAuthor()`, `getCreateDate()` or `getProducer()`.
* **Image metadata is written as EXIF property items.** If the loaded image contains no EXIF entries at all — which is typical for freshly created PNG, BMP or GIF files — the metadata signing step is skipped silently, without an error. Formats such as JPG or TIFF that normally carry EXIF data are the reliable targets. SVG, CDR, CMX, WEBP and WMF images do not support metadata signatures.
* **Built-in document properties are controlled by flags.** `getDocumentInfo` returns them while `SignatureSettings.setIncludeStandardMetadataSignatures` is `true`, which is the default in the Java library. `search` returns them only when `MetadataSearchOptions.setIncludeBuiltinProperties(true)` is set — this applies to Word processing, Spreadsheet and Presentation documents.

The complete per-format feature matrix is available on the [supported document formats]({{< ref "signature/java/getting-started/supported-document-formats.md" >}}) page.

{{< alert style="warning" >}}
Metadata signatures support the add (sign) and search operations only. The update, delete and verify methods do not process metadata signatures — there is no way to modify, remove or verify a metadata entry through those APIs. To change an existing entry, sign the document again with the same metadata name: the new value replaces the previous one.
{{< /alert >}}

## Read document details and metadata

The [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class method `getDocumentInfo` returns an [IDocumentInfo](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/idocumentinfo/) object with general document details together with the list of metadata entries found in the file:

```java
String filePath = "sample.docx";

// Built-in properties (author, creation date, etc.) are controlled by this flag.
// Set it explicitly to see the complete metadata picture.
SignatureSettings signatureSettings = new SignatureSettings();
signatureSettings.setIncludeStandardMetadataSignatures(true);

Signature signature = new Signature(filePath, signatureSettings);
try
{
    IDocumentInfo documentInfo = signature.getDocumentInfo();
    System.out.println("Document properties " + new File(filePath).getName() + ":");
    System.out.println(" - format : " + documentInfo.getFileType().getFileFormat());
    System.out.println(" - extension : " + documentInfo.getFileType().getExtension());
    System.out.println(" - size : " + documentInfo.getSize());
    System.out.println(" - page count : " + documentInfo.getPageCount());
    System.out.println("Metadata signatures : " + documentInfo.getMetadataSignatures().size());
    for (MetadataSignature metadataSignature : documentInfo.getMetadataSignatures())
    {
        System.out.println(" - " + metadataSignature.getName() + " = " + metadataSignature.getValue() + " (" + metadataSignature.getType() + ")");
    }
}
finally
{
    signature.dispose();
}
```

## Add metadata to a document

To add metadata entries, fill a [MetadataSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/metadatasignoptions/) instance with metadata signatures of the class matching your document format and pass it to the `sign` method. The value type you assign — string, integer, date or floating-point number — is preserved and detected back on search:

```java
String filePath = "sample.pdf";
String outputFilePath = "SignedWithMetadata.pdf";

Signature signature = new Signature(filePath);
try
{
    MetadataSignOptions options = new MetadataSignOptions();
    options
        .add(new PdfMetadataSignature("Author", "Mr.Sherlock Holmes")) // String value
        .add(new PdfMetadataSignature("CreatedOn", new Date()))         // Date value
        .add(new PdfMetadataSignature("DocumentId", 123456));           // Integer value

    SignResult result = signature.sign(outputFilePath, options);
    System.out.println("Document signed with " + result.getSucceeded().size() + " metadata signature(s).");
}
finally
{
    signature.dispose();
}
```

For other document families replace `PdfMetadataSignature` with `WordProcessingMetadataSignature`, `SpreadsheetMetadataSignature`, `PresentationMetadataSignature` or `ImageMetadataSignature` — the pattern stays the same.

## Search metadata and convert values

The `search` method with `SignatureType.Metadata` reads the metadata entries back. The class of the object returned by `getValue()` tells you the detected type, and the conversion methods (`toInteger`, `toDateTime`, `toDouble`, `toSingle`, `toBoolean`, `toString` and others) return the value as a proper Java type. The following example searches the document produced by the previous snippet:

```java
String filePath = "SignedWithMetadata.pdf";

Signature signature = new Signature(filePath);
try
{
    List<PdfMetadataSignature> signatures = signature.search(PdfMetadataSignature.class, SignatureType.Metadata);
    System.out.println("Found " + signatures.size() + " metadata signature(s).");
    for (PdfMetadataSignature mdSignature : signatures)
    {
        Object value = mdSignature.getValue();
        if (value instanceof Integer)
        {
            System.out.println(" - " + mdSignature.getName() + " as integer = " + mdSignature.toInteger());
        }
        else if (value instanceof Date)
        {
            System.out.println(" - " + mdSignature.getName() + " as date = " + mdSignature.toDateTime());
        }
        else if (value instanceof Double)
        {
            System.out.println(" - " + mdSignature.getName() + " as double = " + mdSignature.toDouble());
        }
        else
        {
            System.out.println(" - " + mdSignature.getName() + " as string = " + mdSignature.toString());
        }
    }
}
finally
{
    signature.dispose();
}
```

To narrow the results, pass a [MetadataSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/metadatasearchoptions/) instance with the `setName` and `setNameMatchType` filters. When a metadata entry holds a whole serialized object, retrieve it with the `getData` method, for example `getData(DocumentSignatureData.class)` — see the secure metadata topics below.

## Learn more about metadata features

### Get document information

* [Get document information]({{< ref "signature/java/developer-guide/basic-usage/get-document-information.md" >}}) — file type, size, pages and their dimensions.
* [Obtain document form fields and signatures information]({{< ref "signature/java/developer-guide/advanced-usage/common/obtain-document-form-fields-and-signatures-information.md" >}}) — the extended document view including the list of metadata signatures.

### Sign documents with metadata

* [eSign document with Metadata signature]({{< ref "signature/java/developer-guide/basic-usage/electronic-signature-types/esign-document-with-metadata-signature/_index.md" >}}) — the per-format signing guides for PDF, Word processing, Spreadsheet, Presentation and image documents.
* [Sign document with Metadata signature - advanced]({{< ref "signature/java/developer-guide/advanced-usage/signing/sign-document-with-metadata-signature-advanced.md" >}}) — overview of the advanced metadata signing features.

### Search for metadata

* [How to search for Metadata signatures]({{< ref "signature/java/developer-guide/basic-usage/search-for-electronic-signatures-in-document/search-for-metadata-e-signatures.md" >}}) — the basic metadata search.
* [Advanced search for Metadata signatures]({{< ref "signature/java/developer-guide/advanced-usage/searching/advanced-search-for-metadata-signatures.md" >}}) — reading values with the typed conversion methods.
* [Search for built-in Metadata signatures]({{< ref "signature/java/developer-guide/advanced-usage/searching/search-for-built-in-metadata-signatures.md" >}}) — reading standard document properties with `setIncludeBuiltinProperties`.

### Secure metadata values

* [Sign document with secure custom Metadata signatures]({{< ref "signature/java/developer-guide/advanced-usage/signing/sign-document-with-secure-custom-metadata-signatures/_index.md" >}}) — encryption and custom serialization of metadata values.
* [Sign documents with encrypted metadata text]({{< ref "signature/java/developer-guide/advanced-usage/signing/sign-document-with-secure-custom-metadata-signatures/sign-documents-with-encrypted-metadata-text.md" >}}) — protecting string values with symmetric encryption.
* [Sign documents with Metadata embedded object]({{< ref "signature/java/developer-guide/advanced-usage/signing/sign-document-with-secure-custom-metadata-signatures/sign-documents-with-metadata-embedded-object.md" >}}) — storing whole custom objects inside a metadata entry.
* [Search for embedded and encrypted objects in Metadata signatures]({{< ref "signature/java/developer-guide/advanced-usage/searching/search-for-embedded-and-encrypted-objects-in-metadata-signatures/_index.md" >}}) — retrieving protected values with `getData`.
* [Search for encrypted text in Metadata signatures]({{< ref "signature/java/developer-guide/advanced-usage/searching/search-for-embedded-and-encrypted-objects-in-metadata-signatures/search-for-encrypted-text-in-metadata-signatures.md" >}}) — decrypting string values on search.
* [Search for encrypted objects Metadata signatures]({{< ref "signature/java/developer-guide/advanced-usage/searching/search-for-embedded-and-encrypted-objects-in-metadata-signatures/search-for-encrypted-objects-metadata-signatures.md" >}}) — decrypting embedded objects on search.

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/java/developer-guide/advanced-usage/_index.md" >}}).

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)

### Free Online Apps

Along with the full-featured Java library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
