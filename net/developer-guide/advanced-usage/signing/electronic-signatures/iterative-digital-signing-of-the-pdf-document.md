---
id: iterative-digital-signing-of-the-pdf-document
url: signature/net/iterative-digital-signing-of-the-pdf-document
title: Iterative Digital signing of the PDF document
linkTitle: ✎ Iterative Digital signing of the PDF document
weight: 1
description: "This article explains how to iteratively sign a PDF document with multiple digital certificates using advanced options with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
hideChildren: False
toc: True
---
 
### How to apply digital signatures iteratively to a PDF document
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) class to specify different amount of settings for Digital signature

* digital certificate (file on local disk [CertificateFilePath](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/certificatefilepath/) or stream [CertificateStream](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/certificatestream/)) (required)
* password of digital certificate [Password](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/password/) (required)
* digital signature details ([Reason](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/reason/), [Contact](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/contact/), [Location](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/location/))

### Here are the steps to add Digital signature into document with GroupDocs.Signature:

* Define the paths for the input PDF file, the digital certificates, and specify the output path where the signed documents will be saved.
* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object with the required certificate and its password, and configure additional properties such as reason, contact, location, and position.
* Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) to it.
* After signing, update the document path for the next iteration.
* Analyze the [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) to check the newly created signatures if needed.
* Iterate through each certificate, repeating the above steps for each one.

This example demonstrates how to iteratively sign a PDF document with multiple digital certificates. See [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult)

```csharp
string filePath = "sample.pdf";
string fileName = Path.GetFileName(filePath);

string[] certificatePaths = new string[] { "certificate1.pfx", "certificate2.pfx" };

string outputFilePath = Path.Combine("output folder path", "SignWithDigitalIterative", fileName);
int iteration = 1;
string documentFile = filePath;

foreach (var certificatePath in certificatePaths)
{
    using (Signature signature = new Signature(documentFile))
    {
        DigitalSignOptions options = new DigitalSignOptions(certificatePath)
        {
            Password = "1234567890", // Certificate password
            Reason = $"Approved-{iteration}", // Digital certificate details
            Contact = $"John{iteration} Smith{iteration}",
            Location = $"Location-{iteration}",
            AllPages = true, // Sign all pages
            Left = 10 + 100 * (iteration - 1),
            Top = 10 + 100 * (iteration - 1),
            Width = 160,
            Height = 80,
            Margin = new Padding() { Bottom = 10, Right = 10 }
        };

        SignResult signResult = signature.Sign(outputFilePath, options);
        documentFile = outputFilePath;
        Console.WriteLine($"\nSource document signed successfully {iteration++}-time with {signResult.Succeeded.Count} signature(s).\nFile saved at {outputFilePath}.");
    }
}
```
### How to apply digital signatures iteratively to a PDF document with custom appearance and image

This example demonstrates how to iteratively sign a PDF document with multiple digital certificates, customizing the appearance and adding an image to each signature. See [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult)

Here are the steps:
* Setting up variables: define the paths for the input PDF file, the digital certificates, and specify the output path where the signed documents will be saved.
```csharp
// File paths for source document, image, and output files
string sourceFile = "sample.pdf";
string imageFilePath = "image.jpg";
string signedFile = "signed.pdf";
string resultOutputFile = "result.pdf";

// Paths to digital certificates for signing
string[] certificatePaths = new string[] { certificateFilePath1, certificateFilePath2 };
int iteration = 0;
```

* Helper method to generate the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object with the required certificate and its password, and configure additional properties such as reason, contact, location, and position. An image and custom appearance labels are also set.

```csharp
private static DigitalSignOptions CreateDigitalSignOptions(string certificatePath, string imageFilePath, int iteration)
{
    return new DigitalSignOptions(certificatePath)
    {
        Password = "1234567890",             // Certificate password
        Reason = "Sign",                     // Signature reason
        Contact = $"JohnSmith{iteration}",   // Contact details
        Location = $"Office{iteration}",     // Signature location
        Visible = true,
        Left = 80 + iteration * 5,           // Positioning for visibility
        Top = 600 + iteration * 5,
        Height = 50 + iteration * 5,
        Width = 200 + iteration * 5,
        ImageFilePath = imageFilePath,       // Image appearance for signature
        Appearance = new PdfDigitalSignatureAppearance
        {
            ReasonLabel = "Reason Label",
            DigitalSignedLabel = "Digital Signed Label"
        }
    };
}
```

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) to it.
* After signing, update the document path for the next iteration.
* Analyze the [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) to check the newly created signatures if needed.
* Iterate through each certificate, repeating the above steps for each one.

```csharp
foreach (var certificatePath in certificatePaths)
{
    using (Signature signature = new Signature("sample.pdf"))
    {
        // Generate signature options with helper method
        DigitalSignOptions options = CreateDigitalSignOptions(certificatePath, imageFilePath, iteration);

        // Update output file name on second iteration
        if (iteration == 1) signedFile = resultOutputFile;

        // Sign document and display result
        SignResult signResult = signature.Sign(signedFile, options);
        Console.WriteLine(
            $"\nDocument signed successfully {iteration + 1}-time with " +
            $"{signResult.Succeeded.Count} signature(s).\nFile saved at {signedFile}.");
        iteration++;
    }
}
```
### Adding Digital Signature with Custom Foreground Color, Image, and Font Settings

This example demonstrates how to apply a digital signature with a customized appearance, including a foreground color, image, and specific font settings.

Here are the steps:
* Setting up variables: define the paths for the input PDF file, the digital certificates, and specify the output path where the signed documents will be saved.
```csharp
// File paths for source document, image, and output files
string sourceFile = "sample.pdf";
string imageFilePath = "image.jpg";
string signedFile = "signed.pdf";
string resultOutputFile = "result.pdf";

// Paths to digital certificates for signing
string[] certificatePaths = new string[] { certificateFilePath1, certificateFilePath2 };
int iteration = 0;
```

* Helper method to generate the [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) object with the required certificate and its password, and configure additional properties such as reason, contact, location, and position. An image and custom appearance labels are also set.

```csharp
private static DigitalSignOptions CreateDigitalSignOptions(string certificatePath, string imageFilePath, int iteration)
{
    return new DigitalSignOptions(certificatePath)
    {
        // Specify the type of signature
        SignatureType = SignatureType.Digital,

        // Provide the certificate password
        Password = "1234567890",

        // Digital certificate details for signature metadata
        Reason = "Sign",                            // Reason for the signature
        Contact = "JohnSmith" + iteration,          // Contact information of the signer
        Location = "Office1" + iteration,           // Location where the document is signed

        // Enable visibility of the signature on the document
        Visible = true,

        // Specify the position and size of the signature on the page
        Left = 400,                                 // Horizontal position (X-axis)
        Top = 20 + iteration * 70,                  // Vertical position (Y-axis)
        Height = 70,                                // Height of the signature area
        Width = 200,                                // Width of the signature area

        // Add an image to represent the digital certificate's appearance
        ImageFilePath = imageFilePath,              // Path to the image file

        // Customize the signature's appearance
        Appearance = new PdfDigitalSignatureAppearance
        {
            // Set a custom font color for the signature text
            Foreground = Color.FromArgb(50, Color.Gray), 

            // Apply specific font settings for the signature
            FontFamilyName = "TimesNewRoman",        // Font family name
            FontSize = 12                            // Font size
        }
    };
}
```

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [DigitalSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/digitalsignoptions/) to it.
* After signing, update the document path for the next iteration.
* Analyze the [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) to check the newly created signatures if needed.
* Iterate through each certificate, repeating the above steps for each one.

```csharp
foreach (var certificatePath in certificatePaths)
{
    using (Signature signature = new Signature("sample.pdf"))
    {
        // Generate signature options with helper method
        DigitalSignOptions options = CreateDigitalSignOptions(certificatePath, imageFilePath, iteration);

        // Update output file name on second iteration
        if (iteration == 1) signedFile = resultOutputFile;

        // Sign document and display result
        SignResult signResult = signature.Sign(signedFile, options);
        Console.WriteLine(
            $"\nDocument signed successfully {iteration + 1}-time with " +
            $"{signResult.Succeeded.Count} signature(s).\nFile saved at {signedFile}.");
        iteration++;
    }
}
```
The following image demonstrates the result:
![Digital](/signature/net/images/iterative-digital-signing-of-the-pdf-document_custom_colors.png)

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
