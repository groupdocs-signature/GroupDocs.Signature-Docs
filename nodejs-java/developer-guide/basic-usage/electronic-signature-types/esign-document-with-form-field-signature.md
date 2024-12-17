---
id: esign-document-with-form-field-signature
url: signature/nodejs-java/esign-document-with-form-field-signature
title: eSign document with Form Field signature
linkTitle: Form field signature
weight: 3
description: "This article explains how to add various types of Form Field signatures on document page with options on component positioning, alignment and other visual options with GroupDocs.Signature"
keywords: form fields, add various types of Form Field signature, component positioning
productName: GroupDocs.Signature for Node.Js via Java 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Documents signing with form fields in Node.Js    
        description: Sign documents with form fields and Node.Js language by GroupDocs.Signature for Node.Js via Java APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to sign any documents with form fields using Node.Js 
        description: Learn all about signing a document by using form fields and Node.Js
        steps:
        - name: Load file which is planned to be signed
          text: Create the Signature object by passing file path or stream as a constructor parameter.
        - name: Set up signing options 
          text: Provide a new FormFieldSignature class instance and fill in all the demanded data.
        - name: Sign the source file with form fields and save the result 
          text: Invoke the Sign method with signing options and output file path or stream.
---
## What is a Form Field?

A **form field** is an interactive element located on a document page that allows user data input through various control types like free input text boxes, multi-line text boxes, checkboxes, drop-down lists, etc. Different document types support a specific list of form field types. These elements are used to collect information from users on template form. Each Form Field element has a unique name, settings and value field. Form Fields should have unique names within the form. The picture below demonstrates a possible document page with form fields.

![FormField](/signature/nodejs-java/images/esign-document-with-form-field-signature.png)

With [**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) you can create new form fields or update the existing ones within the documents. The [FormFieldSignOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/formfieldsignoptions) class specifies different options for Form Field signature. The [FormFieldSignOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/formfieldsignoptions) class contains one [FormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/formfieldsignature) object that specifies the properties of the desired signature.

Below are listed different Form Field signature classes that could be set to [FormFieldSignOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/formfieldsignoptions):

* [TextFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/textformfieldsignature) - represents a text input form field on a document page.
* [CheckboxFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/checkboxformfieldsignature) - represents a checkbox field on a document page.
* [ComboboxFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/comboboxformfieldsignature) - represents a combo box field signature input with a list of possible options.
* [RadioButtonFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/radiobuttonformfieldsignature) - represents a radio button signature on a document page.
* [DigitalFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/digitalformfieldsignature) - represents a digital signature input form on a document page.

Here are the steps to add Form Field signatures into a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class and pass the source document path as a constructor parameter;
* Instantiate the [FormFieldSignOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/formfieldsignoptions) object according to your requirements;
* Instantiate one of the objects - [TextFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/textformfieldsignature), [CheckboxFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/checkboxformfieldsignature), [ComboboxFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/comboboxformfieldsignature), [RadioButtonFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/radiobuttonformfieldsignature) or [DigitalFormFieldSignature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/digitalformfieldsignature);
* Assign the [FormFieldSignOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/formfieldsignoptions) property with the object created in a previous step;
* Call the [Sign](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/sign) method of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class instance and pass the [FormFieldSignOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/formfieldsignoptions) object to it.

{{< alert style="note" >}}
Currently GroupDocs.Signature supports the creation of Form Field signatures for PDF documents only.
{{< /alert >}}

This example shows how to sign a PDF document with a Form Field electronic signature.

```javascript
// The path to the documents directory.
const filePath = Constants.SAMPLE_PDF; // Assuming Constants.SAMPLE_PDF is defined elsewhere
const fileName = path.basename(filePath);

const outputFilePath = path.join(Constants.OutputPath, 'SignPdfWithFormField', fileName);
const signature = new signatureLib.Signature(filePath);

// Instantiate text form field signature
const textSignature = new signatureLib.TextFormFieldSignature('FieldText', 'Value1');
// Instantiate options based on text form field signature
const options = new signatureLib.FormFieldSignOptions(textSignature);
options.setMargin(new signatureLib.Padding(10, 20, 0, 0));
options.setHeight(10);
options.setWidth(100);

// Sign document to file
signature.sign(outputFilePath, options);
console.log(`\nSource document signed successfully.\nFile saved at ${outputFilePath}`);
```

## How to eSign document with existing Form Field signatures

GroupDocs.Signature for Node.Js via Java also provides a mechanism to update the existing form field signatures within the documents.

To update an existing form field signature within the document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [TextSignOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/textsignoptions) object with all required additional options.
* Set the [TextSignOptions.SignatureImplementation](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/textsignoptions/signatureimplementation) property with the [TextSignatureImplementation.FormField](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/textsignatureimplementation) value.
* Set the [FormTextFieldTitle](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/textsignoptions/formtextfieldtitle) and [FormTextFieldType](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/textsignoptions/formtextfieldtype) properties with the proper values of form fields to be updated.
* Call the [Sign](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature/sign) method of the [Signature](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature/signature) class instance and pass the initialized [TextSignOptions](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.options/textsignoptions) instance to it.
* Analyze the [SignResult](https://reference.groupdocs.com/signature/nodejs-java/com.groupdocs.signature.domain/signresult) object to check the newly created signatures if needed.

This example shows how to sign a PDF document with the existing Form Field electronic signature and update its value.

```javascript
  // The path to the documents directory.
  const filePath = Constants.SAMPLE_PDF; // Assuming Constants.SAMPLE_PDF is defined elsewhere
  const fileName = path.basename(filePath);

  const outputFilePath = path.join(Constants.OutputPath, 'SignPdfWithFormField', fileName);
  const signature = new signatureLib.Signature(filePath);

  // Instantiate text form field signature
  const textSignature = new signatureLib.TextFormFieldSignature('FieldText', 'Value1');
  // Instantiate options based on text form field signature
  const options = new signatureLib.FormFieldSignOptions(textSignature);
  options.setMargin(new signatureLib.Padding(10, 20, 0, 0));
  options.setHeight(10);
  options.setWidth(100);

  // Sign document to file
  signature.sign(outputFilePath, options);
  console.log(`\nSource document signed successfully.\nFile saved at ${outputFilePath}`);
```
### Summary
This guide explains how to use [**GroupDocs.Signature**](https://products.groupdocs.com/signature/nodejs-java) to add form field signatures to documents. It covers loading a document, configuring form field properties such as name, type, and value, and saving the signed document. Advanced options, like customizing field appearance and placement, are also included. For more details, refer to related guides on document signing techniques.



## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature Node.Js for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF documents for free, you can use the [Digital Signature - PDF](https://products.groupdocs.app/signature/pdf) online application.

To sign Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
