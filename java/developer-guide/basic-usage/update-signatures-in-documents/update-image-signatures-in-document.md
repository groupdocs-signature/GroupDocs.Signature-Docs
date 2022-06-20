---
id: update-image-signatures-in-document
url: signature/java/update-image-signatures-in-document
title: Update Image signatures in document
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
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [ImageSignature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/ImageSignature) class to manipulate barcode signatures location, size and textual content. 

Please be aware that [update](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature#update(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method modifies the same document that was passed to constructor of [Signature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) class.

Here are the steps to update Barcode signature in the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;    
*   Instantiate [ImageSearchOptions](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/ImageSearchOptions) object with desired properties;    
*   Call [search](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method to obtain list of [ImageSignatures](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/ImageSignature);      
*   Select from list [ImageSignature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/ImageSignature) object(s) that should be updated;     
*   Call [Signature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) object [update](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature#update(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method and pass one or several signatures to it.
    

This example shows how to update Image signature that was found using  [search](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method.

```java
using (Signature signature = new Signature("sampleSigned.pdf"))
{
    ImageSearchOptions options = new ImageSearchOptions();
    // search for image signatures in document
    List<ImageSignature> signatures = signature.Search<ImageSignature>(options);
    if(signatures.Count > 0)
    {
        ImageSignature imageSignature = signatures[0];
        // change Image properties
        signatureToUpdate.Top = 200;
        signatureToUpdate.Left = 200;
        signatureToUpdate.Width = 300;
        signatureToUpdate.Height = 150;

        bool result = signature.Update(imageSignature);
        if(result)
        {
            Console.WriteLine($"Signature with Top '{imageSignature.Top}' was updated in the document ['{fileName}'].");
        }
        else
        {
            Console.WriteLine($"Signature was not updated in  the document! Signature with Top '{imageSignature.Top}' was not found!");
        }
    }
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

Along with full-featured .NET library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
