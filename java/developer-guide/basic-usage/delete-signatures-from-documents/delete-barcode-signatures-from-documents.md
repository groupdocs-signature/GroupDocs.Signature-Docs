---
id: delete-barcode-signatures-from-documents
url: signature/java/delete-barcode-signatures-from-documents
title: Delete Barcode signatures from documents
linkTitle: ✖ Barcode
weight: 1
description: "This article explains how to delete Barcode electronic signatures with GroupDocs.Signature API."
keywords: delete Barcode,delete Barcode electronic signatures, how to delete Barcode electronic signatures
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Remove Barcodes from documents in Java    
        description: Delete Barcodes presented in documents in convenient way with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to clear any documents from barcodes using Java 
        description: Information about removing barcodes from documents by Java
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of barcodes presented in document 
          text: Create an instance of BarcodeSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found barcodes and save result 
          text: Invoke Delete method passing found barcode and file path for signed file. File stream can be used as well.

---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [BarcodeSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/BarcodeSignature) class to manipulate barcode signatures and delete them from the documents over [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method.

Please be aware that [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method modifies the same document that was passed to constructor of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class.

Here are the steps to delete Barcode signature from the document with GroupDocs.Signature:
*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;    
*   Instantiate [BarcodeSearchOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/BarcodeSearchOptions) object with desired properties;    
*   Call [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method to obtain list of [BarcodeSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/BarcodeSignature);  
*   Select from list [BarcodeSignature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.signatures/BarcodeSignature) object(s) that should be removed from the document;      
*   Call [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) object [delete](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method and pass one or several signatures to it. or not.     

This example shows how to delete Barcode signature that was found using [search](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method.

```java
Signature signature = new Signature("signed.docx");
try
{
    BarcodeSearchOptions options = new BarcodeSearchOptions();
 
    // search for Barcode signatures in document
    List<BarcodeSignature> signatures = signature.search(BarcodeSignature.class,options);
    if (signatures.size() > 0)
    {
        BarcodeSignature barcodeSignature = signatures.get(0);
        boolean result = signature.delete("signed.docx", barcodeSignature);
        if (result)
        {
            System.out.print("Signature with Barcode "+barcodeSignature.getText()+" and encode type "+barcodeSignature.getEncodeType().getTypeName()+" was updated in the document [signed.docx].");
        }
        else
        {
            System.out.print("Signature was not updated in the document! Signature with Barcode "+barcodeSignature.getText()+" and encode type "+barcodeSignature.getEncodeType().getTypeName()+" was not found!");
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
