---
id: skip-external-resources
url: signature/java/skip-external-resources
title: How to control external resources
weight: 4
description: "This article explains how GroupDocs.Signature for Java treats images and style sheets that a document links to, and how to allow the ones you trust."
keywords: external resources, linked images, setSkipExternalResources, setWhitelistedResources, setLoadExternalResources, SSRF
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:
        name: Controlling external resources of documents using Java
        description: Skip or allow the linked images and style sheets of documents with Java language by GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java
    showVideo: True
    howTo:
        name: How to control the external resources of a document via Java
        description: Keep external resources skipped, or allow the ones you trust, with Java
        steps:
        - name: Set up load options
          text: Instantiate LoadOptions. External resources are skipped by default; list trusted addresses with setWhitelistedResources, or call setSkipExternalResources(false).
        - name: Pass file to Signature
          text: Instantiate Signature object by passing file and LoadOptions as constructor parameters.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) does not load the external resources a document links to, unless you allow them. This article explains what external resources are, why they are skipped, and how to allow the ones you trust with the [LoadOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.loadoptions/loadoptions/) class.

{{< alert style="info" >}}
External resources are skipped by default starting with GroupDocs.Signature for Java 26.10. Earlier versions loaded them.
{{< /alert >}}

## What are external resources?

A document can refer to resources that are stored outside it instead of inside it:

| Format | External resources |
| --- | --- |
| Word Processing documents | linked images, pictures inserted by an INCLUDEPICTURE field |
| Presentations | linked pictures |
| Spreadsheets | pictures linked to a file or an address |
| SVG images | images, and style sheets imported with `@import` |
| Archives | whatever the documents inside them refer to |

Hyperlinks are not external resources: GroupDocs.Signature never follows them.

## Security considerations

Loading an external resource means requesting the address written in the document. When the documents come from other people, that is a risk:

* **Server-side request forgery.** A document can make your server request internal addresses, such as a cloud metadata endpoint or a service on `localhost`.
* **Credential leaks.** On Windows, a UNC path (`\\host\share\image.png`) can make the operating system send the account's NTLM credentials to another host.
* **Offline installations.** On a machine without network access the requests fail or wait for a time-out.

That is why GroupDocs.Signature **skips external resources by default**. A skipped resource is not drawn in page previews or in documents saved as images, and image, barcode and QR-code search does not see it. Embedded images are not affected, and a signed Word document keeps its links.

## Skip external resources (default)

Nothing to set:

```java
Signature signature = new Signature("sample.docx");
try
{
    // External resources of sample.docx are not loaded.
}
finally
{
    signature.dispose();
}
```

This is the same as calling the `setSkipExternalResources` method explicitly:

```java
LoadOptions loadOptions = new LoadOptions();
loadOptions.setSkipExternalResources(true);

Signature signature = new Signature("sample.docx", loadOptions);
try
{
}
finally
{
    signature.dispose();
}
```

## Allow specific external resources

List the parts of the addresses you trust with the `setWhitelistedResources` method. A resource is loaded when its address contains one of them, ignoring case. Empty entries are ignored, and passing `null` clears the list. Prefer long fragments: `cdn.example.com` would also match `https://attacker.test/?cdn.example.com`.

```java
List<String> whitelistedResources = new ArrayList<String>();
whitelistedResources.add("https://cdn.example.com/images/");

LoadOptions loadOptions = new LoadOptions();
loadOptions.setWhitelistedResources(whitelistedResources);

Signature signature = new Signature("sample.docx", loadOptions);
try
{
    // Only images from https://cdn.example.com/images/ are loaded.
}
finally
{
    signature.dispose();
}
```

## Load all external resources

Only for documents you trust:

```java
LoadOptions loadOptions = new LoadOptions();
loadOptions.setSkipExternalResources(false);

Signature signature = new Signature("trusted.docx", loadOptions);
try
{
    // Every external resource is loaded.
}
finally
{
    signature.dispose();
}
```

The `SkipExternalResourcesWhenLoading` and `LoadWhitelistedExternalResources` classes of the [Java examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java) render a page preview of a Word document with a linked picture, once without the picture and once with the picture loaded from a whitelisted address.

## Documents inside archives and SVG images

* **Archives:** documents inside an archive follow the settings you pass for the archive.
* **SVG images:** before it reads an SVG image, GroupDocs.Signature removes the references it will not load. An SVG image that is not well-formed XML cannot be checked, so it is rejected with [GroupDocsSignatureException](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.exception/groupdocssignatureexception/) while external resources are skipped.

## Upgrading from setLoadExternalResources

Earlier versions had `LoadOptions.setLoadExternalResources`, which loaded external resources by default and has **the opposite meaning**:

| Earlier code | Same effect now |
| --- | --- |
| `setLoadExternalResources(false)` | `setSkipExternalResources(true)`, the default |
| `setLoadExternalResources(true)` | `setSkipExternalResources(false)` |

`setLoadExternalResources` and `getLoadExternalResources` still work, but they are deprecated: use `setSkipExternalResources` in new code.

See [Network access and data privacy]({{< ref "signature/java/getting-started/network-access-and-data-privacy.md" >}}) for every situation in which GroupDocs.Signature uses the network.

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
