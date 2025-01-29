---
id: load-password-protected-document
url: signature/net/load-document-with-filetype
title: Specify file type when loading a document
weight: 3
description: "This article explains how to specify file type when loading a document with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Signing password protected document using C#    
        description: Specify file type when loading a document with C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
   howTo:
    name: How to sign a document with QR code and specify file type via C#
    description: Learn how to sign a document with a QR code and specify file type while loading the document using C#.
    steps:
    - name: Set up file paths
      text: Define the path to the sample PDF document and output directory. Use `Path.GetFileName(filePath)` to extract the file name and combine it with the output directory path for saving the signed document.
    - name: Open the document as a stream
      text: Open the document file as a stream for reading using `File.OpenRead(filePath)`.
    - name: Specify the file type
      text: Instantiate the [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions) object and specify the file type (e.g., `FileType.PDF`).
    - name: Create Signature instance
      text: Instantiate the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object by passing the file stream and load options as constructor parameters.
    - name: Define QR code signing options
      text: Instantiate the [QrCodeSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options.qrcodesignoptions) object and set properties like signer name, QR code type, and position.
    - name: Sign the document
      text: Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign) method to sign the document and save it to the specified output path.
    - name: Verify the result
      text: Print a success message with the file path of the signed document using `Console.WriteLine`.

---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) supports specifing the file type when loading a documents. When loading a document via a file path or FileStream, GroupDocs.Signature checks the file extension to determine the file type, which can take some time. with the new feature, you can specify the file type directly in LoadOptions, and GroupDocs.Signature will skip the detection process and use the specified type right away.

The following are the steps to work with password protected documents.

*   Instantiate the [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions) object and set the file type;
*   Create a Stream for the document file using File.OpenRead(filePath);
*   Create [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) object by passing the document stream and load options to its constructor;
*   Call the Sign method to sign the document and save the signed version to the output path.

The following code sample shows how to specify file type when loading a document.

```csharp
// The path to the documents directory.
string filePath = Constants.SAMPLE_PDF;
string fileName = Path.GetFileName(filePath);
string outputFilePath = Path.Combine(Constants.OutputPath, "LoadWithFileType", fileName);

using (Stream stream = File.OpenRead(filePath))
{
    // Specify the file type (PDF) while loading the document
    LoadOptions loadOptions = new LoadOptions(FileType.PDF);

    // Initialize the Signature instance with the file stream and load options
    using (Signature signature = new Signature(stream, loadOptions))
    {
        QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith")
        {
            EncodeType = QrCodeTypes.QR,
            Left = 100,
            Top = 100
        };
        // sign document to file
        signature.Sign(outputFilePath, options);
    }
}
Console.WriteLine("\nSource document signed successfully.\nFile saved at " + outputFilePath);
```

## More resources
### GitHub Examples
You may easily run the code above and see the feature in action in our GitHub examples:
*   [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)    
*   [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)    
*   [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)     
*   [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)    
*   [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)    
*   [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)    

### Free Online Apps 
Along with the full-featured .NET library, we provide simple but powerful free online apps.  
To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.