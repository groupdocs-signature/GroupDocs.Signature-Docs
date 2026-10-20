---
id: advanced-search-archive-documents
url: signature/java/advanced-search-archive-documents
title: Advanced search archive documents
linkTitle: Archive
weight: 16
description: "This article explains how to make advanced search within the archive that contains several documents for any electronic signatures with GroupDocs.Signature for Java API."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for various signatures within the archive files in Java    
        description: Advanced search for all supported signatures within the archives fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search data in the archive using Java 
        description: Get additional information of advanced searching for any signature data within the archive documents with Java
        steps:
        - name: Upload supported archive file (ZIP, TAR or 7Z).
          text: Instantiate object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create one or many search options 
          text: Instantiate specific SearchOptions (one or many) object(s) providing all required data.
        - name: Get list of the corresponding signatures 
          text: Invoke method search passing the list of search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) searches all documents of an archive in one call: compose a list of [SearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/searchoptions/) objects, such as [BarcodeSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/barcodesearchoptions/) or [QrCodeSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/qrcodesearchoptions/), and pass it to the `search` method.
The result is a [SearchResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/searchresult/) object. Each item of its `getSucceeded()` list is a [DocumentResultSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/documentresultsignature/) for one archive document with the signatures found in it, and the `getFailed()` list holds the documents that could not be processed.

Here are the steps to search for the values within the archive document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.
* Instantiate the various [SearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/searchoptions/) objects according to your requirements. Here there's ability to compose list of any search options types.
* Call `search` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass list of the [SearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/searchoptions/) to it.

This example shows how to make advanced search for any data within the archive documents.

```java
Signature signature = new Signature("archive.zip");
try
{
    // create list of search options
    BarcodeSearchOptions bcOptions = new BarcodeSearchOptions(BarcodeTypes.Code128);
    QrCodeSearchOptions qrOptions = new QrCodeSearchOptions(QrCodeTypes.QR);

    // setup search options
    List<SearchOptions> listOptions = new ArrayList<SearchOptions>();
    listOptions.add(bcOptions);
    listOptions.add(qrOptions);

    // search archive for documents
    SearchResult searchResult = signature.search(listOptions);

    // check the result
    System.out.println("\nList of successfully processed documents:");
    int number = 1;
    for (BaseSignature item : searchResult.getSucceeded())
    {
        DocumentResultSignature document = (DocumentResultSignature) item;
        System.out.println("Document #" + number++ + ": " + document.getFileName() + ". Processed: " + document.getProcessingTime() + ", mls");
        for (BaseSignature temp : document.getSucceeded())
        {
            System.out.println("\t\t#" + temp.getSignatureId() + ": " + temp.getSignatureType());
        }
    }
    if (searchResult.getFailed().size() > 0)
    {
        System.out.println("\nList of failed documents:");
        number = 1;
        for (BaseSignature item : searchResult.getFailed())
        {
            DocumentResultSignature document = (DocumentResultSignature) item;
            System.out.println("ERROR in Document #" + number++ + "-" + document.getFileName() + ": " + document.getErrorMessage());
        }
    }
}
finally
{
    signature.dispose();
}
```

{{< alert style="info" >}}
To catch errors that the search raises as exceptions, see [Searching for document signatures with exception handling]({{< ref "signature/java/developer-guide/advanced-usage/searching/searching-for-document-signatures-with-exception-handling.md" >}}).
{{< /alert >}}

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
