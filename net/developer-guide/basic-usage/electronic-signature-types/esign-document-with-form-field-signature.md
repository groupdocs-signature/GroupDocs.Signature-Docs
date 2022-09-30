---
id: esign-document-with-form-field-signature
url: signature/net/esign-document-with-form-field-signature
title: eSign document with Form Field signature
weight: 3
description: "This article explains how to add various types of Form Field signatures on document page with options on component positioning, alignment and other visual options with GroupDocs.Signature"
keywords: form fields,add various types of Form Field signature, component positioning
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Documents signing with form fields in C#    
        description: Sign documents with form fields and C# language by GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign any documents with form fields using C# 
        description: Learn all about signing a document by using form fields and C#
        steps:
        - name: Load file which is planned to be signed
          text: Create Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide new FormFieldSignature class instance and fill all demanded data.
        - name: Sign source file with form fields and save result 
          text: Invoke Sign method with signing options and output file path or stream.
---
## What is a Form Field?

A **form field** is the interactive element located on document page that allows user data input through various control types like free input text box, multi-line text box, check boxes, drop down lists etc. Different document types support specific list of form field types. These elements are used to collect information from user on template form. Each Form Field element has an unique name, settings and value field. Form Fields should have unique names within the form. Picture below demonstrates possible document page with form fields.

![FormField](/signature/net/images/esign-document-with-form-field-signature.png)

## How to eSign document with Form Field signature

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) supports creation of new form fields or update existing ones within the documents. Class [FormFieldSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsignoptions) specifies different options for Form Field signature. The [FormFieldSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsignoptions)  class contains one [FormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/formfieldsignature/) object to put to the document.  
Here are the list of different Form Field signature classes that could be set to [FormFieldSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsignoptions)

* [TextFormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textformfieldsignature) - represents text input form field on document page.
* [CheckboxFormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/checkboxformfieldsignature) - represents check box field on the document page.
* [ComboboxFormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/comboboxformfieldsignature) - represents combo box field signature input with list of possible options on document page.
* [RadioButtonFormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/radiobuttonformfieldsignature) - represents radio button signature on document page.
* [DigitalFormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/digitalformfieldsignature) - represents digital signature input form on document page.  

Here are the steps to add Form Field signatures into document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter;
* Instantiate the [FormFieldSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsignoptions) object according to your requirements;
* Instantiate one of the objects  - [TextFormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textformfieldsignature), [CheckboxFormFieldSignature,](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/checkboxformfieldsignature) [ComboboxFormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/comboboxformfieldsignature), [RadioButtonFormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/radiobuttonformfieldsignature) or [DigitalFormFieldSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/digitalformfieldsignature);
* Set [FormFieldSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsignoptions) Signature property with created object;
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass [FormFieldSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/formfieldsignoptions) to it.

*NOTE: At the moment GroupDocs.Signature supports creation of Form Field signatures for PDF documents only.*

This example shows how to sign PDF document with Form Field electronic signature on document page.

```csharp
            // The path to the documents directory.
            string filePath = "sample.pdf";
            string fileName = Path.GetFileName(filePath);

            string outputFilePath = Path.Combine("C:\output", fileName);

            using (Signature signature = new Signature(filePath))
            {
                // Instantiate text form field signature
                FormFieldSignature textSignature = new TextFormFieldSignature("FieldText", "Value1");

                // Instantiate options based on text form field signature
                FormFieldSignOptions options = new FormFieldSignOptions(textSignature)
                {
                    HorizontalAlignment = HorizontalAlignment.Left,
                    VerticalAlignment = VerticalAlignment.Top,
                    Margin = new Padding(10, 20, 0, 0),
                    Height = 10,
                    Width = 100
                };
                // Sign document and save to the file
                signature.Sign(outputFilePath, options);
            }
```

## How to eSign document with existing Form Field signatures

GroupDocs.Signature for .NET also provides mechanism to update existing form fields signatures within the documents.

Class [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions) allows to setup different options for Form Field signature

* property [SignatureImplementation](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/signatureimplementation) of enumeration type [TextSignatureImplementation](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignatureimplementation) should be set to [TextSignatureImplementation.FormField](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignatureimplementation) to update existing Form Fields in the document
* property [FormTextFieldTitle](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/formtextfieldtitle) must keep unique Form Field name
* property [FormTextFieldType](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/formtextfieldtype) allows to specify type of Form Field.

Here are the steps to update existing form field signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions) object with all required additional options.
* Set property [SignatureImplementation](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/signatureimplementation) of [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions) object with [TextSignatureImplementation.FormField](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignatureimplementation) value from enumeration type [TextSignatureImplementation](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/textsignatureimplementation).
* Set properties [FormTextFieldTitle](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/formtextfieldtitle) and [FormTextFieldType](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions/formtextfieldtype) with proper values of form fields to update
* Call [Sign](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/sign/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class instance and pass initialized [TextSignOptions](https://reference.groupdocs.com/signature/net/groupdocs.signature.options/textsignoptions) instance to it.
* Analyze [SignResult](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signresult) result to check newly created signatures if needed.  

This example shows how to e sign PDF document with existing Form Field electronic signature on document page and update its value.

```csharp
// The path to the documents directory.
string filePath = "sample.pdf";
string fileName = Path.GetFileName(filePath);

string outputFilePath = Path.Combine("C:\output", fileName);

using (Signature signature = new Signature(filePath))
{
    TextSignOptions ffOptions1 = new TextSignOptions("Document is approved")
    {
        // set alternative signature implementation on document page
        SignatureImplementation = TextSignatureImplementation.FormField,
        FormTextFieldType = FormTextFieldType.PlainText
    };
    TextSignOptions ffOptions2 = new TextSignOptions("John Smith")
    {
        // set alternative signature implementation on document page
        SignatureImplementation = TextSignatureImplementation.FormField,
        FormTextFieldType = FormTextFieldType.RichText,
        FormTextFieldTitle = "UserSignatureFullName"
    };
    List<SignOptions> listOptions = new List<SignOptions>();
    listOptions.Add(ffOptions1);
    listOptions.Add(ffOptions2);
    // sign document to file
    SignResult signResult = signature.Sign(outputFilePath, listOptions);
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

### Free Online App

Along with full-featured .NET library we provide simple, but powerful free Apps.

You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
