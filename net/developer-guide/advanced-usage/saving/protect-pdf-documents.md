---
id: protect-pdf-documents
url: signature/net/protect-pdf-documents
title: How to Protect a Signed PDF Document
weight: 3
description: "This article explains how to protect a signed PDF document."
keywords: 
productName: GroupDocs.Signature for .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Protect PDF document with permissions using C#    
        description: This article explains how to protect a signed PDF document using C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to protect a PDF document with permissions using C#
        description: This article explains how to protect a signed PDF document with specific permissions in C#.
        steps:
          - name: Load document for signing
            text: Create a Signature class instance by passing the local file path or stream as a constructor parameter.
          - name: Configure signature and save options
            text: Set up signature options (e.g., TextSignOptions), and instantiate the PdfSaveOptions class. Set the Permissions property to restrict user actions (such as denying printing or modification) and optionally set PermissionsPassword for securing these permissions.
          - name: Run signing process and retrieve output
            text: Call the Sign method with the signature options and the PdfSaveOptions instance to generate a protected signed PDF document.
          - name: Obtain protected document
            text: Retrieve the signed and protected PDF document with restricted permissions and access settings.

---
[Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class supports saving signed documents with permission settings and password protection for access and modification. This capability is achieved using the [PermissionsPassword](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions/permissionspassword/) and [Permissions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions/permissions/) properties of the [PdfSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions/) class, which should be passed to [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method.

You can secure a PDF document by setting the following parameters:
* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path or stream as a constructor parameter.
* Instantiate required signature options.
* Instantiate the [PdfSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions) object and specify [PermissionsPassword](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions/permissionspassword) property(optional). Configure the [Permissions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions/permissions/property) to control user actions (e.g., deny printing or modification).  
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass signature options and [PdfSaveOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions) object to it.

Following example demonstrates how to save signed document with permissions.

```csharp
// Using the Signature class to create a signature for the specified PDF document
using (Signature signature = new Signature("sample.pdf"))
{
    TextSignOptions textSignOptions = new TextSignOptions("JohnSmith")
    {
        Left = 0,
        Top = 100,
        Width = 100,
        Height = 100,
        AllPages = true,
        ForeColor = Color.Black
    };

    // Create a new PdfSaveOptions object to configure the PDF save settings
    PdfSaveOptions saveOptions = new PdfSaveOptions();
    saveOptions.OverwriteExistingFiles = false;
    // Set permissions to deny printing and modification
    saveOptions.Permissions = Permissions.DenyPrinting | Permissions.DenyModification;
    // Set a password for modifying permissions(optional)
    saveOptions.PermissionsPassword = "0987654321";
    // Sign the document and save the result to a new file
    signature.Sign("result.pdf", textSignOptions, saveOptions);
}
```

### How to load PDF document with permissions

The [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class supports loading documents with specific permissions that are preserved after signing. This capability is managed through the [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions/) class, where the [Permissions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions/permissions/) property is set when loading the document. These permissions remain enforced in the signed document, ensuring consistent restrictions from loading to final save output when passed to the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method.

To load a PDF document with permissions and ensure those permissions are preserved throughout the signing process, follow these steps:
* Create a new instance of [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions/) , configuring the [Permissions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/pdfsaveoptions/permissions/) property to set restrictions (e.g., deny printing, modification, or data extraction).
* Use this [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions/) instance to initialize the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class with the document path or stream.
* Instantiate the required signature options (e.g.,  [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/) ) to set signature position and appearance.
* Call the [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class, passing the signature options. The document will retain the permissions specified in the [LoadOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/loadoptions/) , ensuring any restrictions applied during loading are preserved in the signed document.

Following example demonstrates how to load PDF document with permissions. 

```csharp
// Set up load options with specific permissions, denying all actions (printing, modification, extraction)
LoadOptions loadOptions = new LoadOptions()
{
    Permissions = Permissions.DenyAll
};

// Using the Signature class to create a signature for the specified PDF document
using (Signature signature = new Signature("sample.pdf", loadOptions))
{
    TextSignOptions textSignOptions = new TextSignOptions("JohnSmith")
    {
        Left = 0,
        Top = 100,
        Width = 100,
        Height = 100
    };
    
    signature.Sign("result.pdf", textSignOptions);
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
