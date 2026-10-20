---
id: updating-multiple-signatures-of-different-types
url: signature/java/updating-multiple-signatures-of-different-types
title: Updating multiple signatures of different types
weight: 3
description: " This article explains how to provide advanced options when updating different multiple electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides different classes of signatures to manipulate them by changing its properties over [update](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#update-java.io.OutputStream-com.groupdocs.signature.domain.signatures.BaseSignature-) method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class. This method returns [UpdateResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/updateresult/) object to analyze if signatures were successfully processed.

The [update](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#update-java.io.OutputStream-com.groupdocs.signature.domain.signatures.BaseSignature-) method writes the changed document to the file path or stream that you pass to it. To change the source document itself, pass the same path that you passed to the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) constructor. The [UpdateResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/updateresult/)contains list of successfully updated signatures and ones that failed. The signature could be failed to update due to several reasons:

*   if signature object was initialized with constructor by incorrect signature identifier;
*   if signature object was not found;
*   there was an error occurred while updating signature in the document;
*   the signature type is not supported for modification (Digital, Form Field or Metadata signature).

Here are the steps to update multiple signature in the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter;    
*   Instantiate one or several Search options with desired properties;    
*   Call [search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#-T-search-java.lang.Class-T--com.groupdocs.signature.options.search.SearchOptions-) method and pass created list of Search Options to obtain list of [BaseSignatures](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/basesignature/);      
*   Select from list [BaseSignatures](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/basesignature/) object(s) that should be updated;      
*   Call [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) object [update](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#update-java.io.OutputStream-com.groupdocs.signature.domain.signatures.BaseSignature-) method and pass one or several signatures to it.    
*   Analyze [UpdateResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/updateresult/) result to check whether signatures were updated or not.

## Update multiple signatures of different types in the document

This example shows how to update signature that was found using  [search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#-T-search-java.lang.Class-T--com.groupdocs.signature.options.search.SearchOptions-) method.

```java
try {
    // initialize Signature instance
    Signature signature = new Signature("signed.pptx");
 
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
        UpdateResult updateResult = signature.update("signed.pptx",result.getSignatures());
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
} catch (Exception e) {
    throw new GroupDocsSignatureException(e.getMessage());
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

Along with full-featured Java library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
