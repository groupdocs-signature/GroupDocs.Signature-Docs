---
id: handling-password-required-exception
url: signature/net/handling-password-required-exception
title: Handling password required exception
weight: 2
description: "This article shows how to handle missing document password exception with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Handling document password absence exception with C#    
        description: Handle password required exception during document processing with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to coupe with absent password using C# 
        description: Learn all about ways of handling required password exceptions using C#
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Surround code with specific try-catch statement. 
          text: Use PasswordRequiredException type in try-catch statement to handle with required password exception.
        - name: Provide code with Signature try-catch statement. 
          text: For other Signature exceptions use GroupDocsSignatureException.
        - name: Implement code with common try-catch statement. 
          text: For all other possible exceptions use Exception.
---
[Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class supports handling required password exception when opening protected documents over class [PasswordRequiredException](https://reference.groupdocs.com/signature/net/groupdocs.signature/passwordrequiredexception).

Here are the steps to handle incorrect password exception when working with protected documents with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Cover the code that works with [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object methods ([Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/#sign_4), [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify), [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search), [Update](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/update), [Delete](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/delete)) with try - catch block including catching [PasswordRequiredException](https://reference.groupdocs.com/signature/net/groupdocs.signature/passwordrequiredexception) exception.

Following example demonstrates how to handle required password exception.

```csharp
// skip initialization of LoadOptions with Password
// LoadOptions loadOptions = new LoadOptions(){ Password  = "1234567890" }
using (Signature signature = new Signature("protectedPwd.pdf"))
{
    try
    {
        QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith")
        {
            EncodeType = QrCodeTypes.QR,
            Left = 100,
            Top = 100
        };
        // try to sign document to file, we expect for PasswordRequiredException
        signature.Sign(outputFilePath, options);
        Console.WriteLine("\nSource document signed successfully.\nFile saved at " + outputFilePath);
    }
    catch(PasswordRequiredException ex)
    {
        Console.WriteLine($"PasswordRequiredException: {ex.Message}");
    }
    catch(GroupDocsSignatureException ex)
    {
        Console.WriteLine($"Common GroupDocsSignatureException: {ex.Message}");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Common Exception happens only at user code level: {ex.Message}");
    }
    finally
    {
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

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
