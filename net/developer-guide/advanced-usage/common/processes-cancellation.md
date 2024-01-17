---
id: processes-cancellation
url: signature/net/processes-cancellation
title: Processes cancellation
weight: 3
description: "This article explains how to control signature processing (cancellation) for large documents with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Cancel too long document processing C#    
        description: Document processing cancellation if it is lasted more than specific threshold with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to stop too long document processing with C# 
        description: Get information how to cancel any type of document processing via C#
        steps:
        - name: Load source document
          text: Instantiate Signature object with file path or stream as a constructor parameter will load the document. 
        - name: Define OnProgress method. 
          text: Each type of document processing such as Sign, Search or Verify can invoke OnProgress method during it work.
        - name: Implement OnProgress logic. 
          text: If you have a condition which could be used to cancel processing implement it in OnProgress method.
        - name: Process document with cancellation condition. 
          text: Invoke Sign, Search or Verify method and if condition it true processing is being stopped.
---
[Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class supports cancellation for each of document processing (Sign, Verify, Search). The process cancellation happens over setting property [Cancel](https://reference.groupdocs.com/signature/net/groupdocs.signature/processprogresseventargs/cancel) of [ProcessProgressEventArgs](https://reference.groupdocs.com/signature/net/groupdocs.signature/processprogresseventargs/) property in proper event handler.

* for [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) process this flag should be set to true in handler of [SignProgress](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/signprogress) event. This event occurs each time on signing each signature was completed.
* for [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) process this flag should be set to true in handler of [VerifyProgress](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verifyprogress) event. This event occurs each time on verifying document page.
* for [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) process this flag should be set to true in handler of [SearchProgress](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/searchprogress) event. This event occurs each time on searching document page per each options.  

## Cancel signing process

Here are the steps to provide cancellation for signing process with GroupDocs.Signature:

* Define [SignProgress](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/signprogress) event handler delegates to conditionally cancel the process.
* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Subscribe for [SignProgress](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/signprogress) event with proper handler method.
* Instantiate required [SignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/signoptions) object.
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass signature options in it.

```csharp
private static void OnSignProgress(Signature sender, ProcessProgressEventArgs args)
{
    // check if process takes more than 1 second (1000 milliseconds) processing cancellation
    if(args.Ticks > 1000)
    {
        args.Cancel = true;
        Console.WriteLine("Sign progress was cancelled. Time spent {0} mlsec", args.Ticks);
    }
}
/// <summary>
/// Sign document with text signature applying specific options
/// </summary>
public static void Run()
{
    using (Signature signature = new Signature("sample.docx"))
    {
        signature.SignProgress += OnSignProgress;
        TextSignOptions options = new TextSignOptions("John Smith")
        {
            // ...
        };
        // sign document to file
        signature.Sign("signedSample", options);
    }
}
```

## Cancel verification process

Here are the steps to provide cancellation for verification process with [**GroupDocs.Signature**](https://products.groupdocs.com/signature/net):

* Define [VerifyProgress](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verifyprogress) event handler delegates to conditionally cancel the process.
* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Subscribe for [VerifyProgress](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verifyprogress) event with proper handler method.  
* Instantiate required [VerifyOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/verifyoptions)  object.
* Call [Verify](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/verify) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass verification options in it.

```csharp
private static void OnVerifyProgress(Signature sender, ProcessProgressEventArgs args)
{
    // check if process takes more than 1 second (1000 milliseconds) processing cancellation
    if (args.Ticks > 1000)
    {
        args.Cancel = true;
        Console.WriteLine("Sign progress was cancelled. Time spent {0} mlsec", args.Ticks);
    }
}
public static void Run()
{
    using (Signature signature = new Signature("SignedSample.pdf"))
    {
        signature.VerifyProgress += OnVerifyProgress;
        TextVerifyOptions options = new TextVerifyOptions("John Smith")
        {
            // ...
        };
        // sign document to file
        VerificationResult result = signature.Verify(options);
    }
}
```

## Cancel search process

Here are the steps to provide cancellation of searching process with GroupDocs.Signature:

* Define [SearchProgress](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/searchprogress) event handler delegates to conditionally cancel the process.
* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Subscribe for [SearchProgress](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/searchprogress) event with proper handler method.
* Instantiate required[SearchOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/searchoptions) object.
* Call [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass search options in it.

```csharp
private static void OnSearchProgress(Signature sender, ProcessProgressEventArgs args)
{
    // check if process takes more than 1 second (1000 milliseconds) processing cancellation
    if (args.Ticks > 1000)
    {
        args.Cancel = true;
        Console.WriteLine("Sign progress was cancelled. Time spent {0} mlsec", args.Ticks);
    }
}
public static void Run()
{
    using (Signature signature = new Signature("sampleSigned.pdf"))
    {
        signature.SearchProgress += OnSearchProgress;
        QrCodeSearchOptions options = new QrCodeSearchOptions(QRCodeTypes.QR)
        {
            // ...
        };
        // search for signatures in document
        List<QRCodeSignature> signatures = signature.Search<QRCodeSignature>(options);
        Console.WriteLine("\nSource document contains following signatures.");
        foreach (var QRCodeSignature in signatures)
        {
            Console.WriteLine("QRCode signature found at page {0} with type {1} and text {2}", QRCodeSignature.PageNumber, QRCodeSignature.EncodeType, QRCodeSignature.Text);
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

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
