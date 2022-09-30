---
id: groupdocs-signature-for-net-21-7-release-notes
url: signature/net/groupdocs-signature-for-net-21-7-release-notes
title: GroupDocs.Signature for .NET 21.7 Release Notes
weight: 42
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 21.7{{< /alert >}}

## Major Features

This release contains improvements on document modification procedures, new feature to adjust loading document external resources, some adjustments with Word processing documents native signatures, new overload methods that allow to remove signature by its identifiers and few bug fixes.
Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.7:

* Load Option allows to adjust the loading of external resources to improve document processing performance.
* The appearance of native signatures in the Word Processing documents was improved.
* After document modification metadata layer was adjusted to keep actual information about Digital signatures for Presentation and Word processing documents.
* New methods Delete were added to support signatures deletion by single and multiple identifiers.
* Fixed long processing time with Presentation documents with many pages and external resources.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3531 | Implement ability to adjust loading of Document External Resources  | Feature |
| SIGNATURENET-3539 | Update Background appearance for Word Document Processing files  | Improvement |
| SIGNATURENET-3498 | Mark Digital Signatures as deleted when modifying Presentation documents  | Improvement |
| SIGNATURENET-3497 | Mark Digital Signatures as deleted when modifying Word Processing documents  | Improvement |
| SIGNATURENET-3495 | Extend Delete method with overloads that accept Id or List of identifiers  | Improvement |
| SIGNATURENET-3487 | Adjust metadata after Update and Delete operations for Presentation documents  | Improvement |
| SIGNATURENET-3484 | Adjust metadata after Update and Delete operations for Word Processing documents  | Improvement |
| SIGNATURENET-3527 | Unexpected long opening and previewing time for Word Processing document with many pages  | Bug |
| SIGNATURENET-3496 | Unexpected long execution while opening Presentation documents with more than 50+ pages  | Bug |

## Public API and Backward Incompatible Changes

#### Public class LoadOptions [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions) was updated new boolean property [LoadExternalResources](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions/loadexternalresources)

This boolean option allow to specify if external resources in the document should be loaded or skipped. By default this property is enabled (value true) that signals to load external resources. If this property is set to false the external resources will be skipped. This mechanism can increase performance of document processing in case of many external resources (like media, images etc)

**New public property LoadExternalResources**

```csharp
    public class LoadOptions
    {
        /// <summary>
        /// Gets or sets options that specifies if external document resources should be loaded.
        /// This option with disabled value (false) allows to save loading time for the documents with many or large external resource links.
        /// By default value is enabled (true).
        /// </summary>
        public bool LoadExternalResources { get; set; } = true;
    };
```

#### Public class [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) was updated with overload methods Delete that accept one or several signature identifiers

Public class [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/Signature) was updated with overload methods Delete

* method [Delete] with one string argument as signature identifier tries to find signature by id and remove it to return true. Otherwise the false value will be deleted.

* second overload method [Delete] that expects list of string identifiers tries to find signatures with same identifiers and then remove them. The result of this procedure returns in the [DeleteResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/deleteresult) object.

**New overload methods Delete of Signature class**

```csharp
    public class Signature
    {
        /// <summary>
        /// Deletes signature by its specific signature Id from the document.
        /// </summary>
        /// <param name="signatureId">The Id of the signature to be removed from the document.</param>
        /// <returns>Returns true if operation was successful.</returns>
        public bool Delete(string signatureId);

        /// <summary>
        /// Deletes the signatures by list of theirs identifiers.
        /// </summary>
        /// <param name="signatureIds">List of the identifiers of the signatures to be removed from the document.</param>
        /// <returns>Returns DeleteResult <see cref="DeleteResult"/> with list of successfully deleted signatures and failed ones.</returns>
        public DeleteResult Delete(List<string> signatureIds);
   }
```

Following example demonstrates how to remove signatures by known list of identifiers and then analyze the result.

**Delete signatures from the document by known list of the signature Identifiers**

```csharp
public static void Run()
{
    using (Signature signature = new Signature("signed.pdf"))
    {
        // read from some data source signature Id value
        List<string> signatureIdList = new List<string>()
        {
            "ff988ab1-7403-4c8d-8db7-f2a56b9f8530",
            "07f83369-318b-41ad-a843-732417b912c2",
            "e3ad0ec7-9abf-426d-b9aa-b3328f3f1470",
            "eff64a14-dad9-47b0-88e5-2ee4e3604e71"
        };
        // delete required signatures
        DeleteResult deleteResult = signature.Delete(signatureIdList);
        if (deleteResult.Succeeded.Count == signatureIdList.Count)
        {
            Console.WriteLine("All signatures were successfully deleted!");
        }
        else
        {
            Console.WriteLine($"Successfully deleted signatures : {deleteResult.Succeeded.Count}");
            Helper.WriteError($"Not deleted signatures : {deleteResult.Failed.Count}");
        }
        Console.WriteLine("List of deleted signatures:");
        foreach (BaseSignature temp in deleteResult.Succeeded)
        {
            Console.WriteLine($"Signature# Id:{temp.SignatureId}, Type: {temp.SignatureType}, located at {temp.Left}x{temp.Top}. Size: {temp.Width}x{temp.Height}");
        }
    }
}
```
