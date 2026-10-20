---
id: delete-qr-code-signatures-from-documents
url: signature/java/delete-qr-code-signatures-from-documents
title: Delete QR-code signatures from documents
linkTitle: QR Code
weight: 3
description: "This article explains how to delete QR code electronic signatures with GroupDocs.Signature API."
keywords: delete QR code, how to delete QR code
productName: GroupDocs.Signature for Java
structuredData:
    showOrganization: True
    application:    
        name: Remove QR codes from documents in Java    
        description: Delete QR codes presented in documents in convenient way with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to clear any documents from QR codes using Java 
        description: Information about removing QR codes from documents by Java
        steps:
        - name: Load file which is belongs to various supported file types
          text: Instantiate Signature object by passing file as a constructor parameter. You may provide either file path or file stream. 
        - name: Get list of QR codes presented in document 
          text: Create an instance of QrCodeSearchOptions class, fill data and call Search method of signature.
        - name: Delete one of found QR codes and save result 
          text: Invoke Delete method passing found QR codes and file path for signed file. File stream can be used as well.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [QrCodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/qrcodesignature/) class to manipulate QR-code signatures and delete them from the documents over [delete](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#delete-java.io.OutputStream-com.groupdocs.signature.domain.signatures.BaseSignature-) method.

The [delete](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#delete-java.io.OutputStream-com.groupdocs.signature.domain.signatures.BaseSignature-) method writes the changed document to the file path or stream that you pass to it. To change the source document itself, pass the same path that you passed to the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) constructor.

Here are the steps to delete QR-code signature from the document with GroupDocs.Signature:
*   Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter;    
*   Instantiate [QrCodeSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/qrcodesearchoptions/) object with desired properties;    
*   Call [search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#-T-search-java.lang.Class-T--com.groupdocs.signature.options.search.SearchOptions-) method to obtain list of [QrCodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/qrcodesignature/);
*   Select from list [QrCodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/qrcodesignature/) object(s) that should be removed from the document;
*   Call [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) object [delete](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#delete-java.io.OutputStream-com.groupdocs.signature.domain.signatures.BaseSignature-) method and pass one or several signatures to it.
    
This example shows how to delete QR-code signature that was found using [search](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#-T-search-java.lang.Class-T--com.groupdocs.signature.options.search.SearchOptions-) method.

```java
Signature signature = new Signature("signed.docx");
try
{
    QrCodeSearchOptions options = new QrCodeSearchOptions();
    // search for QRCode signatures in document
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, options);
    if (signatures.size() > 0)
    {
        QrCodeSignature qrCodeSignature = signatures.get(0);
        boolean result = signature.delete("signed-output.docx",qrCodeSignature);
        if (result)
        {
            System.out.print("Signature with QR-Code "+qrCodeSignature.getText()+" and encode type "+qrCodeSignature.getEncodeType().getTypeName()+" was deleted from document [signed-output.docx].");
        }
        else
        {
            System.out.print("Signature was not deleted from the document! Signature with Barcode "+qrCodeSignature.getText()+" and encode type "+qrCodeSignature.getEncodeType().getTypeName()+" was not found!");
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

Along with full-featured Java library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
