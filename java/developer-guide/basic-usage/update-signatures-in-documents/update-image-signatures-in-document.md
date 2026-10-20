---
id: update-image-signatures-in-document
url: signature/java/update-image-signatures-in-document
title: Update Image signatures in document
linkTitle: Image
weight: 2
description: "This article explains how to update Image electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Update images in documents in Java    
        description: Update image signatures in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to update any images in documents using Java 
        description: Get additional information of updating image signatures in documents with Java
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of images
          text: Instantiate ImageSearchOptions object and invoke method Search with it.
        - name: Update found signature
          text: Select one of found signature and update it properties in desirable way.
        - name: Update document
          text: Call method Update passing updated signature.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [ImageSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/imagesignature/) class to manipulate barcode signatures location, size and textual content. 

The [update](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#update-java.io.OutputStream-com.groupdocs.signature.domain.signatures.BaseSignature-) method writes the changed document to the file path or stream that you pass to it. To change the source document itself, pass the same path that you passed to the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) constructor.

Here are the steps to update Barcode signature in the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter;    
*   Instantiate [ImageSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/imagesearchoptions/) object with desired properties;    
*   Call [search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#-T-search-java.lang.Class-T--com.groupdocs.signature.options.search.SearchOptions-) method to obtain list of [ImageSignatures](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/imagesignature/);      
*   Select from list [ImageSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/imagesignature/) object(s) that should be updated;     
*   Call [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) object [update](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#update-java.io.OutputStream-com.groupdocs.signature.domain.signatures.BaseSignature-) method and pass one or several signatures to it.
    

This example shows how to update Image signature that was found using  [search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#-T-search-java.lang.Class-T--com.groupdocs.signature.options.search.SearchOptions-) method.

```java
Signature signature = new Signature("sampleSigned.pdf");
try {
    ImageSearchOptions options = new ImageSearchOptions();
    // search for image signatures in document
    List<ImageSignature> signatures = signature.search(ImageSignature.class, options);
    if (signatures.size() > 0) {
        ImageSignature imageSignature = signatures.get(0);
        // change Image properties
        imageSignature.setTop(200);
        imageSignature.setLeft(200);
        imageSignature.setWidth(300);
        imageSignature.setHeight(150);

        // save the document with the updated signature to a new file
        boolean result = signature.update("sampleUpdated.pdf", imageSignature);
        if (result) {
            System.out.println("Signature with Top " + imageSignature.getTop() + " was updated in the document.");
        } else {
            System.out.println("Signature was not updated in the document! Signature with Top " + imageSignature.getTop() + " was not found!");
        }
    }
} finally {
    signature.dispose();
}
```

## More resources

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/java/developer-guide/advanced-usage/_index.md" >}}).

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
