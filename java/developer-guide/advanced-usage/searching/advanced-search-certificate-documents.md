---
id: advanced-search-certificate-documents
url: signature/java/advanced-search-certificate-documents
title: Advanced search certificate documents
linkTitle: Certificate
weight: 18
description: "This article explains how to make advanced search for data within digital certificate documents with GroupDocs.Signature for Java API."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for data within the certificate files in Java    
        description: Advanced search for data within the certificates fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search for data in the certificates using Java 
        description: Get additional information of advanced searching for data within the certificate documents with Java
        steps:
        - name: Upload PFX certificate file.
          text: Instantiate object of Signature passing file as a constructor parameter. You can use either file path or file stream. 
        - name: Create search options 
          text: Instantiate CertificateSearchOptions object providing all demanded data like text or match type.
        - name: Get list of the metadata signatures 
          text: Invoke method search passing search options.
        - name: Process list of found items
          text: Loop through list of found items and process in demanded way.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [CertificateSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/certificatesearchoptions/) class to specify different options to search text data within the certificate documents.
Please be aware that the search result will always be a list of [MetadataSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures.metadata/metadatasignature/) objects. GroupDocs.Signature reads each certificate property, such as SerialNumber, Issuer, Subject or Expiration, as a metadata entry, so every match returns the property name in `getName()` and its value in `getValue()`. The text is matched against the string form of each value; the serial number is read as a decimal number, not as a hexadecimal string.

Here are the steps to search for the values within the certificate document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path and [LoadOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.loadoptions/loadoptions/) with the certificate password as constructor parameters.
* Instantiate the [CertificateSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/certificatesearchoptions/) object according to your requirements and specify search options.
* Call `search` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [CertificateSearchOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.search/certificatesearchoptions/) to it.

This example shows how to make advanced search for text data within the certificate documents.

```java
LoadOptions loadOptions = new LoadOptions();
loadOptions.setPassword("1234567890");

Signature signature = new Signature("certificate.pfx", loadOptions);
try
{
    CertificateSearchOptions options = new CertificateSearchOptions();
    // check the serial number (Java reads it as a decimal number)
    options.setText("12308567976323978183");
    // match by substring
    options.setMatchType(TextMatchType.Contains);

    // search for certificate data
    List<MetadataSignature> result = signature.search(MetadataSignature.class, options);
    if (result.size() > 0)
    {
        System.out.println("\nCertificate contains following search results");
        for (MetadataSignature temp : result)
        {
            System.out.println("\t\t-" + temp.getName() + " - " + temp.getValue());
        }
    }
    else
    {
        System.out.println("\nCertificate failed search process.");
    }
}
finally
{
    signature.dispose();
}
```

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
