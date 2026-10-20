---
id: protect-pdf-documents
url: signature/java/protect-pdf-documents
title: How to protect a signed PDF document
weight: 3
description: "This article explains how to protect a signed PDF document with GroupDocs.Signature for Java."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Protect PDF document with permissions using Java    
        description: This article explains how to protect a signed PDF document using Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to protect a PDF document with permissions using Java
        description: This article explains how to protect a signed PDF document with specific permissions in Java.
        steps:
          - name: Load document for signing
            text: Create a Signature class instance by passing the local file path or stream as a constructor parameter.
          - name: Configure signature and save options
            text: Set up signature options (e.g., TextSignOptions), and instantiate the PdfSaveOptions class. Call setPermissions to restrict user actions (such as denying printing or modification) and optionally setPermissionsPassword for securing these permissions.
          - name: Run signing process and retrieve output
            text: Call the sign method with the signature options and the PdfSaveOptions instance to generate a protected signed PDF document.
          - name: Obtain protected document
            text: Retrieve the signed and protected PDF document with restricted permissions and access settings.

---

### How to secure PDF document with permissions

[Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class supports saving signed documents with permission settings and password protection for access and modification. This capability is achieved using the `setPermissionsPassword` and `setPermissions` methods of the [PdfSaveOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.saveoptions/pdfsaveoptions/) class, which should be passed to the `sign` method.

The permissions are `int` flags of the `com.groupdocs.signature.options.Permissions` class that can be combined with `|`:

| Constant | Meaning |
| --- | --- |
| `Permissions.None` | Allow all actions, including printing, modification, and data extraction |
| `Permissions.DenyPrinting` | Deny printing of the document |
| `Permissions.DenyModification` | Deny content modification, including filling forms and adding or modifying annotations |
| `Permissions.DenyDataExtraction` | Deny extraction of text and graphics from the document |
| `Permissions.DenyAll` | Deny all actions, including printing, modification, and data extraction |

You can secure a PDF document by setting the following parameters:
* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path or stream as a constructor parameter.
* Instantiate required signature options.
* Instantiate the [PdfSaveOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.saveoptions/pdfsaveoptions/) object and call its `setPermissionsPassword` method (optional). Call the `setPermissions` method to control user actions (e.g., deny printing or modification).
* Call the `sign` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass signature options and [PdfSaveOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.saveoptions/pdfsaveoptions/) object to it.

Following example demonstrates how to save signed document with permissions.

```java
// Using the Signature class to create a signature for the specified PDF document
Signature signature = new Signature("sample.pdf");
try
{
    TextSignOptions textSignOptions = new TextSignOptions("JohnSmith");
    textSignOptions.setLeft(0);
    textSignOptions.setTop(100);
    textSignOptions.setWidth(100);
    textSignOptions.setHeight(100);
    textSignOptions.setAllPages(true);
    textSignOptions.setForeColor(Color.BLACK);

    // Create a new PdfSaveOptions object to configure the PDF save settings
    PdfSaveOptions saveOptions = new PdfSaveOptions();
    saveOptions.setOverwriteExistingFiles(false);
    // Set permissions to deny printing and modification
    saveOptions.setPermissions(Permissions.DenyPrinting | Permissions.DenyModification);
    // Set a password for modifying permissions (optional)
    saveOptions.setPermissionsPassword("0987654321");
    // Sign the document and save the result to a new file
    signature.sign("result.pdf", textSignOptions, saveOptions);
}
finally
{
    signature.dispose();
}
```

`Color` is `java.awt.Color`.

### Permissions of a loaded PDF document

In GroupDocs.Signature for Java, the permissions of the source document cannot be set through [LoadOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.loadoptions/loadoptions/). `LoadOptions.getPermissions()` is read-only: it is filled with the permissions read from the PDF document when the document is loaded, and a value set before loading is replaced. To change the permissions of the signed document, call `PdfSaveOptions.setPermissions` as shown above.

When you do not set permissions, what happens to the permissions of the source document depends on the password of the signed document:

* If the signed document is saved with an open password, the permissions of the source document are kept. That is the case when you load a password-protected document and save it without a new password, because `setUseOriginalPassword(true)` is the default of the save options.
* If the signed document is saved without an open password, it is saved without permissions. Call `PdfSaveOptions.setPermissions` to keep the restrictions of such a source document.

Following example demonstrates how to sign a password-protected PDF document and keep its permissions.

```java
// The source document is protected with the open password "1234567890"
LoadOptions loadOptions = new LoadOptions();
loadOptions.setPassword("1234567890");

Signature signature = new Signature("sample.pdf", loadOptions);
try
{
    TextSignOptions textSignOptions = new TextSignOptions("JohnSmith");
    textSignOptions.setLeft(0);
    textSignOptions.setTop(100);
    textSignOptions.setWidth(100);
    textSignOptions.setHeight(100);

    // No save options: the signed copy is saved with the same open password
    // and keeps the permissions of the source document.
    signature.sign("result.pdf", textSignOptions);
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
