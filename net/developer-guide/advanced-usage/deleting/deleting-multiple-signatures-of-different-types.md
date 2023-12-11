---
id: deleting-multiple-signatures-of-different-types
url: signature/net/deleting-multiple-signatures-of-different-types
title: Deleting multiple signatures of different types
linkTitle: ✖ Multiple
weight: 3
description: "This article shows how to delete multiple electronic signatures different ways with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Delete selected signatures from document via C#    
        description: Remove specific multiple signatures in documents using C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to remove electronic signatures in supported documents with C# 
        description: Learn about ways of deletion selected signatures in document using C#
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Get specific signatures from document. 
          text: Get all presented in a document electronic signatures by invoking method Search. Pass to this method only SearchOptions of desirable type.
        - name: Select signatures to delete. 
          text: Select only suitable electronic signatures and put them to new List instance.
        - name: Remove specific signatures. 
          text: Invoke Delete method of Signature instance and analyze DeleteResult object.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides different classes of signatures to manipulate and delete them from the documents over [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method.

Please be aware that [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class. This method returns [DeleteResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/deleteresult) object that contains list of successfully updated signatures and ones that failed. The signature could be failed to delete due to several reasons:

* if signature object was initialized with constructor by incorrect signature identifier;
* if signature object was not found;
* there was an error occurred while deleting signature in the document;
* the signature type is not supported for deletion for current version (for version 19.12 these signatures are Digital, Form Field or Metadata signature).

Here are the steps to delete multiple signature in the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate one or several Search options with desired properties;
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method and pass created list of Search Options to obtain list of [BaseSignatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/basesignature);
* Select from list [BaseSignatures](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/basesignature) object(s) that should be deleted;  
* Call [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete) method and pass one or several signatures to it.
* Analyze [DeleteResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/deleteresult) result to check whether signatures were updated or not.

## Delete multiple signatures in the document

This example shows how to delete multiple signatures that was found using [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method.

```csharp
// initialize Signature instance
using (Signature signature = new Signature("signed.docx"))
{
    // define few search options
    BarcodeSearchOptions barcodeOptions = new BarcodeSearchOptions();
    QrCodeSearchOptions qrCodeOptions = new QrCodeSearchOptions();
    // add options to list
    List<SearchOptions> listOptions = new List<SearchOptions>();
    listOptions.Add(barcodeOptions);
    listOptions.Add(qrCodeOptions);
    // search for signatures in document
    SearchResult result = signature.Search(listOptions);
    if (result.Signatures.Count > 0)
    {
        Console.WriteLine("Trying to delete signatures...");
        List<BaseSignature> signaturesToDelete = new List<BaseSignature>();
        // collect image signatures to delete
        foreach (BaseSignature temp in result.Signatures)
        {
            if (temp.SignatureType == SignatureType.Image)
            {
                signaturesToDelete.Add(temp);
            }
        }
        // delete signatures
        DeleteResult deleteResult = signature.Delete(signaturesToDelete);
        if (deleteResult.Succeeded.Count == signaturesToDelete.Count)
        {
            Console.WriteLine("All signatures were successfully deleted!");
        }
        else
        {
            Console.WriteLine($"Successfully deleted signatures : {deleteResult.Succeeded.Count}");
            Console.WriteLine($"Not deleted signatures : {deleteResult.Failed.Count}");
        }
        Console.WriteLine("List of deleted signatures:");
        foreach (BaseSignature temp in deleteResult.Succeeded)
        {
            Console.WriteLine($"Signature# Id:{temp.SignatureId}, Location: {temp.Left}x{temp.Top}. Size: {temp.Width}x{temp.Height}");
        }
    }
    else
    {
        Console.WriteLine("No one signature was found.");
    }
}
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
