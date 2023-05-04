---
id: searching-for-document-signatures-excluding-external-components
url: signature/java/searching-for-document-signatures-excluding-external-components
title: Searching for document signatures excluding external components
linkTitle: 🌐 External components
weight: 10
description: "This article explains how to search with excluding non-signature components like native documents text, images or barcodes that are the part of document content."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for signatures in documents in Java    
        description: Advanced search for electronic signatures excluding non-signature items in various documents with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to get list of signatures using Java 
        description: Learn more about advanced search for only-signature items in documents with Java
        steps:
        - name: Provide file of supported file types.
          text: Instantiate Signature class passing either file path or file stream as a parameter.
        - name: Create search options 
          text: Instantiate SearchOptions object and set up SkipExternal in true.
        - name: Get list of items 
          text: Call method Search providing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in desirable way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides boolean property [setSkipExternal](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/SearchOptions#setSkipExternal(boolean)) of [SearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/SearchOptions) class to specify if searching process should exclude external signatures (external signatures are the signatures that were added with an 3rd party software and not with GroupDocs.Signature).

Since 20.3 version every time when document is being signed information about document signatures are stored in document's metadata. Which means that all created signatures by GroupDocs.Signature can be distinguished from an actual document content and [setSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/BaseSignature#setSignature(boolean)) flag will be set as true. [setSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/BaseSignature#setSignature(boolean)) property specifies if document component (text/image/barcode/qr-code) is the actual signature or element of document content.

In order to convert signatures added by 3rd party software or by previous version of GroupDocs.Signature, just run [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions))with[setSkipExternal](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/SearchOptions#setSkipExternal(boolean)) property set to false (this is default value) and update [setSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/BaseSignature#setSignature(boolean)) for each signature returned by the search result.

There are few ways to manipulate with document signature search results:

*   If signature is no longer required it can be removed from the document by [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20java.util.List)) method;
*   Signature could be marked as document native content by setting up [setSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/BaseSignature#setSignature(boolean)) = false property,in this case [setSkipExternal](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/SearchOptions#setSkipExternal(boolean)) field will allow [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method to skip this signature;
*   Signatures that were added before 20.3 are treated as non signatures because information about them are not yet stored in the document. Setting [setSkipExternal](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/SearchOptions#setSkipExternal(boolean)) flag to true will exclude these signatures from [Search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/Signature#search(int...))result.

Here are the steps to search for signatures and exclude external components of the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter.
*   Instantiate the [SearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/SearchOptions) object according to your requirements and specify [setSkipExternal ](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/SearchOptions#setSkipExternal(boolean)) to true 
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions))  method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [SearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/SearchOptions) to it.
    

## Excluding external signatures from search

Following example demonstrates usage of [setSkipExternal ](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/SearchOptions#setSkipExternal(boolean))  property for excluding non actual signatures from search result

**Using SearchOptions SkipExternal property to exclude non actual signatures from search**

```java
Signature signature = new Signature("sample_signed.pdf");
 
TextSearchOptions options = new TextSearchOptions();
options.setSkipExternal(true);
options.setAllPages(false);
// search for text signatures in document
List<TextSignature> signatures = signature.search(TextSignature.class,options);
System.out.print("\nSource document contains following text signature(s).");
// enumerate all signature for output
//foreach to while statements conversion
 
try
{
    for (TextSignature sign : signatures)
    {
        if (sign != null)
        {
            System.out.print("Found Text signature at page "+sign.getPageNumber()+" with type ["+sign.getSignatureImplementation()+"] and text '"+sign.getText()+"'.");
            System.out.print("Location at "+sign.getLeft()+"-"+sign.getTop()+". Size is "+sign.getWidth()+"x"+sign.getHeight()+".");
        }
    }
}
catch (Exception ex) {
    System.out.print("System Exception: " + ex.getMessage());
}
```

## Updating signatures from GroupDocs.Signature 20.3 and below

Following examples shows the way to mark signatures in document as actual signatures ([setSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/BaseSignature#setSignature(boolean)) = true)

**How to mark signatures in document as actual signatures**

```java
 // initialize Signature instance 
Signature signature = new Signature("sample_signed.pdf");
// define few search options
BarcodeSearchOptions barcodeOptions = new BarcodeSearchOptions();
QrCodeSearchOptions qrCodeOptions = new QrCodeSearchOptions();
// add options to list
List<SearchOptions> listOptions = new ArrayList<SearchOptions>();
listOptions.add(barcodeOptions);
listOptions.add(qrCodeOptions);
 
// search for signatures in document
SearchResult result = signature.search(listOptions);
if (result.getSignatures().size() > 0)
{
    System.out.print("\nTrying to update all signatures...");
    // mark all signatures as actual Signatures
    for (BaseSignature baseSignature : result.getSignatures())
    {
        baseSignature.setSignature(true);
    }
    // update all found signatures
    UpdateResult updateResult = signature.update(outputFilePath,result.getSignatures());
    if (updateResult.getSucceeded().size() == result.getSignatures().size())
    {
        System.out.print("\nAll signatures were successfully updated!");
    }
    else
    {
        System.out.print("Successfully updated signatures : "+updateResult.getSucceeded().size());
        System.out.print("Not updated signatures : "+updateResult.getFailed().size());
    }
    System.out.print("\nList of updated signatures:");
    int number = 1;
    for (BaseSignature temp : updateResult.getSucceeded())
    {
        System.out.print("Signature #"+ number++ +": Type: "+temp.getSignatureType()+" Id:"+temp.getSignatureId()+", Location: "+temp.getLeft()+"x"+temp.getTop()+". Size: "+temp.getWidth()+"x"+temp.getHeight());
    }
}
else
{
    System.out.print("No one signature was found.");
}
```

## More resources

### GitHub Examples 

You may easily run the code above and see the feature in action in our GitHub examples:

*   [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)    
*   [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)    
*   [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)    
*   [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)    
*   [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)   
*   [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
    

### Free Online App 

Along with full-featured .NET library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
