---
id: esign-document-with-stamp-signature
url: signature/net/esign-document-with-stamp-signature
title: eSign document with Stamp signature
linkTitle: Stamp signature
weight: 8
description: "This article explains how to sign a document electronically with generated Stamp signatures by GroupDocs.Signature API."
keywords: sign document electronically, Stamp signatures
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Signing documents with stamps in C#    
        description: Sign documents with generated stamps and C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign any documents with stamps using C# 
        description: Learn all about signing a document by using stamps and C#
        steps:
        - name: Load file which is planned to be signed
          text: Create the Signature object by passing the file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide new FormFieldSignature class instance and fill all demanded data.
        - name: Sign source file with just painted stamp and save result 
          text: Invoke the Sign method with signing options and output file path or stream.
---
## What is a Stamp signature?

A **stamp** signature is a special type of electronic signature that has the visual appearance of a round seal and its visual parameters can be set programmatically.
Every stamp signature can have multiple "stamp lines" with custom text and different line thicknesses, colors, font weights and sizes. Here is an example of how a stamp signature created with [**GroupDocs.Siganture**](https://products.groupdocs.com/signature/net) may look like:

![Stamp](/signature/net/images/esign-document-with-stamp-signature.png)

GroupDocs.Signature provides the [StampSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/stampsignoptions) class to specify different options for Stamp signature:

* Stamp type - Round or Square;
* Height and width in pixels;
* Alignment and position within the document page;
* and many more.

Each Stamp option contains inner and outer lines. Inner lines represent vertical lines inside the stamp, while outer lines represent circles (or rectangles based on stamp type) around the stamp with their own text, border settings, background etc.

Here are the steps to add a Stamp signature to a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [StampSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/stampsignoptions) object according to your requirements and specify appropriate options.
* Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass the [StampSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/stampsignoptions) to it.

## How to eSign document with Stamp signature

This example shows how to add a Stamp signature to a document.

```csharp
using (Signature signature = new Signature("sample.docx"))
{
    StampSignOptions options = new StampSignOptions()
    {
        // set stamp signature position
        Left = 100,
        Top = 100,
    };
    // setup first external line of Stamp
    StampLine outerLine = new StampLine();
    outerLine.Text = " * European Union * European Union  * European Union  *";
    outerLine.Font.FontSize = 12;
    outerLine.Height = 22;
    outerLine.TextBottomIntent = 6;
    outerLine.TextColor = Color.WhiteSmoke;
    outerLine.BackgroundColor = Color.DarkSlateBlue;
    options.OuterLines.Add(outerLine);
    //Inner square lines - horizontal lines inside the rings
    StampLine innerLine = new StampLine();
    innerLine.Text = "John";
    innerLine.TextColor = Color.MediumVioletRed;
    innerLine.Font.FontSize = 20;
    innerLine.Font.Bold = true;
    innerLine.Height = 40;
    options.InnerLines.Add(innerLine);

    signature.Sign("SampleSigned.docx", options);
}
```

### Advanced Usage Topics

To learn more about document eSign features, please refer to the [advanced usage section]({{< ref "signature/net/developer-guide/advanced-usage/_index.md" >}}).

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