---
id: preview-certificate-properties
url: signature/java/preview-certificate-properties
title: Preview Digital Certificates properties
weight: 2
description: "This article shows how to receive digital certificates properties over Document Info method with GroupDocs.Signature for Java."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Receive digital certificate properties using Java    
        description: Receiving digital certificate properties using Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to obtain digital certificate properties with Java 
        description: Getting digital certificate properties in Java
        steps:
        - name: Provide digital certificate.
          text: Create the Signature instance with the corresponding file or stream of the Digital Certificate. 
        - name: Call getDocumentInfo method.
          text: Using created instance of the Signature call the getDocumentInfo method. 
        - name: Analyze IDocumentInfo result. 
          text: Check the getMetadataSignatures list of the IDocumentInfo result that will keep the digital certificate properties.
        - name: Enumerate digital certificate properties
          text: Review and enumerate each MetadataSignature object in the response to analyze the result.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides the `getDocumentInfo` method of the [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class to receive document information. The response [IDocumentInfo](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.documentpreview/idocumentinfo/) includes:

* list of [MetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/metadatasignature/) objects (`getMetadataSignatures()`) that for a certificate document keeps all its properties;

## Receive digital certificate properties

```java
LoadOptions loadOptions = new LoadOptions();
loadOptions.setPassword("1234567890");

Signature signature = new Signature(certificatePath, loadOptions);
try
{
    IDocumentInfo documentInfo = signature.getDocumentInfo();
    System.out.println("Certificate properties " + new java.io.File(certificatePath).getName() + ":");
    System.out.println(" - format : " + documentInfo.getFileType().getFileFormat());
    System.out.println(" - extension : " + documentInfo.getFileType().getExtension());
    System.out.println(" - size : " + documentInfo.getSize());
    System.out.println(" - page count : " + documentInfo.getPageCount());

    // display document MetaData signatures information
    System.out.println("Certificate properties:");
    for (MetadataSignature metadataSignature : documentInfo.getMetadataSignatures())
    {
        System.out.println(" - " + metadataSignature.getName() + ":" + metadataSignature.getValue() + " (" + metadataSignature.getType() + ")");
    }
}
finally
{
    signature.dispose();
}
```

The `GetCertificateInfoAdvanced` class of the [Java examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java) runs this code for a `.pfx` certificate.

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
