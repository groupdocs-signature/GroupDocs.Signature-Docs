---
id: delete-image-signatures-from-documents
url: signature/java/delete-image-signatures-from-documents
title: Delete Image signatures from documents
linkTitle: ✖ Image
weight: 2
description: "This article explains how to delete Image electronic signatures with GroupDocs.Signature API."
keywords: delete Image electronic signatures, how to delete Image electronic signatures
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Remove Images from documents in Java    
        description: Delete Images presented in documents in convenient way with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to clear any documents from images using Java 
        description: Information about removing images from documents by Java
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of images presented in document 
          text: Create an instance of ImageSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found images and save result 
          text: Invoke Delete method passing found images and file path for signed file. File stream can be used as well.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [ImageSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/ImageSignature) class to manipulate image signatures and delete them from the documents over [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method.  
Please be aware that [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class.

Here are the steps to delete Image signature from the document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;    
*   Instantiate [ImageSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/ImageSearchOptions) object with desired properties;    
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method to obtain list of [ImageSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/ImageSignature);      
*   Select from list [ImageSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/ImageSignature) object(s) that should be removed from the document;      
*   Call [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) object [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method and pass one or several signatures to it.
    
This example shows how to delete Image signature that was found using [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method.

```java
Signature signature = new Signature("signed.pptx");
try
{
    ImageSearchOptions options = new ImageSearchOptions();
 
    // search for image signatures in document
    List<ImageSignature> signatures = signature.search(ImageSignature.class, options);
    if (signatures.size() > 0)
    {
        ImageSignature imageSignature = signatures.get(0);
        boolean result = signature.delete("signed-output.pptx",imageSignature);
        if (result)
        {
            System.out.print("Image signature at location "+imageSignature.getLeft() + "x"+imageSignature.getTop()+" and Size "+imageSignature.getSize()+" was deleted from document [signed-output.pptx].");
        }
        else
        {
            System.out.print("Signature was not deleted from the document! Signature at location "+imageSignature.getLeft()+"x"+imageSignature.getTop()+" and Size "+imageSignature.getSize()+" was not found!");
        }
    }
} catch (Exception e) {
    throw new GroupDocsSignatureException(e.getMessage());
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
