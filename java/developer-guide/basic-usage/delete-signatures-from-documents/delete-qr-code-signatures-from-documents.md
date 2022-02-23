---
id: delete-qr-code-signatures-from-documents
url: signature/java/delete-qr-code-signatures-from-documents
title: Delete QR-code signatures from documents
weight: 3
description: "This article explains how to delete QR-code electronic signatures with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [QrCodeSignature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/QrCodeSignature) class to manipulate QR-code signatures and delete them from the documents over [delete](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method.

Please be aware that [delete](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method modifies the same document that was passed to constructor of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class.

Here are the steps to delete QR-code signature from the document with GroupDocs.Signature:
*   Create new instance of [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path as a constructor parameter;    
*   Instantiate [QrCodeSearchOptions](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature.options.search/QrCodeSearchOptions) object with desired properties;    
*   Call [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method to obtain list of [QrCodeSignature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/QrCodeSignature);
*   Select from list [QrCodeSignature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/QrCodeSignature) object(s) that should be removed from the document;
*   Call [Signature](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) object [delete](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#delete(java.io.OutputStream,%20com.groupdocs.signature.domain.signatures.BaseSignature)) method and pass one or several signatures to it.
    
This example shows how to delete QR-code signature that was found using [search](https://apireference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#search(java.lang.Class,%20com.groupdocs.signature.options.search.SearchOptions)) method.

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


