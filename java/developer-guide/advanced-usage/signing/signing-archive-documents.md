---
id: signing-archive-documents
url: signature/java/signing-archive-documents
title: Signing archive documents in batch
linkTitle: ✎ Archives
weight: 20
description: "This article shows how to sign documents in batch mode within the archive files with one or multiple electronic signatures"
keywords: ZIP archive, TAR archive
productName: GroupDocs.Signature for Java
hideChildren: False
structuredData:
    showOrganization: True
    application:    
        name: Archive signing with form fields in C#    
        description: Sign archives with one or more signatures and C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign archive documents using C# 
        description: Learn all about signing archives with multiple documents in C#
        steps:
        - name: Load archive 
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide new FormFieldSignature class instance and fill all demanded data.
        - name: Sign source file with form fields and save result 
          text: Invoke Sign method with signing options and output file path or stream.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) supports signing archive files with formats like ZIP, TAR the same way as usual documents. The only difference in the [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) of the [Sign](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#sign-java.io.OutputStream-com.groupdocs.signature.options.sign.SignOptions-) method will contain for archive files the lists of [Succeeded](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/#getSucceeded--) and [Failed](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/#getFailed--/) of the [Sign](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#sign-java.io.OutputStream-com.groupdocs.signature.options.sign.SignOptions-) method will contain for archive files the lists of [Succeeded](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/#getSucceeded--) signatures as the  
list of the [DocumentResultSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/documentresultsignature/) instances.

Here are the steps to sign the archive files like ZIP, TAR with GroupDocs.Signature:

* Create a new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass the source archive path or stream of the archive as a constructor parameter.
* Instantiate the single [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/) object or list of this class with the required options.
* Call [Sign](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#sign-java.io.OutputStream-com.groupdocs.signature.options.sign.SignOptions-) method of  [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/) to it.
* The passed signature options will be applied to the all documents within the archive.
* Analyze response [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) over the properties [Succeeded](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/#getSucceeded--) and [Failed](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/#getFailed--) signatures as the instances of the [DocumentResultSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/documentresultsignature/)

## Sign archive document

This example shows how to sign archive document with few SignOptions.

```java
    /**
     * <p>
     * Sign ZIP Documents with varios signature options
     * </p>
     */
Signature signature = new Signature("sample.zip");
{
    // create sign options
    TextSignOptions options = new TextSignOptions("signed!");
    {
        // set signature position
        options.setLeft(100);
        options.setTop(100);
    };
    // sign archive to new zip file
    SignResult result = signature.sign("output.zip", options);
    // analyze signed documents
     for (BaseSignature o : signResult.getSucceeded())
    {
        DocumentResultSignature document = (DocumentResultSignature)o;
        System.out.print("Document #"+ number++ +": "+document.getFileName()+". Processed: "+document.getProcessingTime()+", mls");
    }
    if (signResult.getFailed().size() > 0)
    {
        System.out.print("\nList of failed documents:");
        number = 1;
        for (BaseSignature o : signResult.getFailed())
        {
            DocumentResultSignature document = (DocumentResultSignature)o;
            System.out.print("Document #"+number++ +": "+document.getFileName()+". Processed: "+document.getProcessingTime()+", mls");
        }
    }
}
```

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online App

Along with full-featured .NET library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
