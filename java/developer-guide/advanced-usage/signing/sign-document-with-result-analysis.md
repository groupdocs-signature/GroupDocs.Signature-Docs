---
id: sign-document-with-result-analysis
url: signature/java/sign-document-with-result-analysis
title: Sign document with analysis of the Sign process result
weight: 16
description: "This article shows how to analyse the sign processing of the document"
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**com.groupdocs.signature**](https://products.groupdocs.com/signature/java) provides the each method result as the implementation of the [IResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/iresult/) interface which contains the process metrics.

Here are the steps to analyze the process result with com.groupdocs.signature:

* Create a new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass the source document path as a constructor parameter.
* Instantiate the [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/) object with the required options and set the ZOrder property.
* Call [sign](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#sign-java.lang.String-com.groupdocs.signature.options.sign.SignOptions-) method of  [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [SignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/) to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) response of the [sign](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#sign-java.lang.String-com.groupdocs.signature.options.sign.SignOptions-) method.


## Sign document with result analysis

This example shows how to analize sign process result.

```java
public static void Run()
{
    Signature signature = new Signature("sample.pdf");
    {
        // create QRCode option with predefined QRCode text
        QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");

        // sign document to file
        SignResult signResult = signature.sign("output.pdf", options);

        // analyze SignResult (IResult properties)
        System.out.print("Sign-process was executed for "+signResult.getProcessingTime()+" mls");
        System.out.print("Input document size "+signResult.getSourceDocumentSize()+" bytes");
        System.out.print("Output document size "+signResult.getDestinDocumentSize()+" bytes");
        System.out.print("Total processed signatures "+signResult.getTotalSignatures());
        if (signResult.getFailed().size() == 0)
        {
            System.out.print("\nAll signatures were successfully created!");
        }
        else
        {
            System.out.print("Successfully created signatures : "+signResult.getSucceeded().size());
            System.out.print("Failed signatures : "+signResult.getFailed().size());
        }
        System.out.print("\nList of newly created signatures:");
        int number = 1;
        for (BaseSignature temp : signResult.getSucceeded())
        {
            System.out.print("Signature #"+ +number++ +": Type: "+temp.getSignatureType()+" Id:"+temp.getSignatureId()+", Location: "+temp.getLeft()+"x"+temp.getTop()+". Size: "+temp.getWidth()+"x"+temp.getHeight());
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
