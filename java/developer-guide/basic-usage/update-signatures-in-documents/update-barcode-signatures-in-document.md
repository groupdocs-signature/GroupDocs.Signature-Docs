---
id: update-barcode-signatures-in-document
url: signature/java/update-barcode-signatures-in-document
title: Update Barcode signatures in document
linkTitle: Barcode
weight: 1
description: "This article explains how to update Barcode electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Update barcode signatures in documents in Java    
        description: Update barcode signatures in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to update any barcode signatures in documents using Java 
        description: Get additional information of updating barcode signatures in documents with Java
        steps:
        - name: Load file which is belongs to various supported file types.
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of barcode signatures
          text: Instantiate BarcodeSearchOptions object and invoke method Search with it.
        - name: Update found signature
          text: Select one of found signature and update it properties in desirable way.
        - name: Update document
          text: Call method Update passing updated signature.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [BarcodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/barcodesignature/) class to manipulate barcode signatures location, size and textual content. 

The [update](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#update-java.lang.String-com.groupdocs.signature.domain.signatures.BaseSignature-) method writes the changed document to the file path or stream that you pass to it. To change the source document itself, pass the same path that you passed to the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) constructor.

Here are the steps to update Barcode signature in the document with GroupDocs.Signature:
*   Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter;
*   Instantiate [BarcodeSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/barcodesearchoptions/) object with desired properties;    
*   Call [search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#-T-search-java.lang.Class-T--com.groupdocs.signature.options.search.SearchOptions-) method to obtain list of [BarcodeSignatures](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/barcodesignature/);      
*   Select from list [BarcodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/barcodesignature/) object(s) that should be updated;      
*   Call [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) object [update](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#update-java.lang.String-com.groupdocs.signature.domain.signatures.BaseSignature-) method and pass one or several signatures to it.
    
This example shows how to update Barcode signature that was found using  [search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#-T-search-java.lang.Class-T--com.groupdocs.signature.options.search.SearchOptions-) method.

```java
Signature signature = new Signature("sampleSigned.pdf");
try 
{
    BarcodeSearchOptions options = new BarcodeSearchOptions();

    List<BarcodeSignature> signatures = signature.search(BarcodeSignature.class,options);
    if (signatures.size() > 0)
    {

        BarcodeSignature barcodeSignature = signatures.get(0);
        barcodeSignature.setLeft(100);
        barcodeSignature.setTop(100);
        boolean result = signature.update("sampleSigned.pdf",barcodeSignature);
        if (result)
        {
            System.out.print("Signature with Barcode '"+barcodeSignature.getText()+"' and encode type '"+barcodeSignature.getEncodeType().getTypeName()+"' was updated in the document ['"+fileName+"'].");
        }
        else
        {
            System.out.print("Signature was not updated in the document! Signature with Barcode"+barcodeSignature.getText()+"' and encode type '"+barcodeSignature.getEncodeType().getTypeName()+"' was not found!");
        }
    }
} catch (Exception e) {
    throw new GroupDocsSignatureException(e.getMessage());
}
```

More resources

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
