---
id: esign-document-with-form-field-signature
url: signature/python-net/esign-document-with-form-field-signature
title:  eSign Document with Form Field Signature
linktitle: ✍️ Form Field Signature
weight: 3
description: "This article explains how to add various types of Form Field signatures on document page with options on component positioning, alignment and other visual options with GroupDocs.Signature for Python via .NET"
keywords: form fields, add various types of Form Field signature, component positioning, python form field signature
productName: GroupDocs.Signature for Python via .NET
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Documents signing with form fields in Python    
        description: Sign documents with form fields and Python language by GroupDocs.Signature for Python via .NET APIs
        productCode: signature
        productPlatform: python-net 
    showVideo: True
    howTo:
        name: How to sign any documents with form fields using Python 
        description: Learn all about signing a document by using form fields and Python
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

![FormField](/signature/python-net/images/esign-document-with-form-field-signature.png)

## How to eSign Document with Form Field Signature

With [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) you can create new form fields or update the existing ones within the documents. The [FormFieldSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsignoptions) class specifies different options for Form Field signature. The [FormFieldSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsignoptions) class contains one [FormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/formfieldsignature/) object that specifies the properties of the desired signature.

Below are listed different Form Field signature classes that could be set to [FormFieldSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsignoptions):

* [TextFormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textformfieldsignature) - represents a text input form field on a document page.
* [CheckboxFormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/checkboxformfieldsignature) - represents a checkbox field on a document page.
* [ComboboxFormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/comboboxformfieldsignature) - represents a combo box field signature input with a list of possible options.
* [RadioButtonFormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/radiobuttonformfieldsignature) - represents a radio button signature on a document page.
* [DigitalFormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/digitalformfieldsignature) - represents a digital signature input form on a document page.  

Here are the steps to add Form Field signatures into a document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter;
* Instantiate the [FormFieldSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsignoptions) object according to your requirements;
* Instantiate one of the objects - [TextFormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textformfieldsignature), [CheckboxFormFieldSignature,](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/checkboxformfieldsignature) [ComboboxFormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/comboboxformfieldsignature), [RadioButtonFormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/radiobuttonformfieldsignature) or [DigitalFormFieldSignature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/digitalformfieldsignature);
* Assign the [FormFieldSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsignoptions) property with the object created in a previous step;
* Call the [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the [FormFieldSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/formfieldsignoptions) object to it.

{{< alert style="note" >}}
Currently GroupDocs.Signature supports the creation of Form Field signatures for PDF documents only.
{{< /alert >}}

This example shows how to sign a PDF document with a Form Field electronic signature using Python:

{{< tabs "sign_with_form_field_signature" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import FormFieldSignOptions
from groupdocs.signature.domain import TextFormFieldSignature


def sign_with_form_field_signature():
    with Signature("sample.pdf") as signature:
        # Create a text form field named "FieldText" with the value "Value1"
        text_field = TextFormFieldSignature("FieldText", "Value1")

        # Create form field options for it
        options = FormFieldSignOptions(text_field)

        # Set form field position and size
        options.left = 100
        options.top = 400
        options.width = 200
        options.height = 20

        # Sign the document and save the result
        result = signature.sign("signed_form_field.pdf", options)
        for field in result.succeeded:
            print(f"Added form field '{field.name}' with value '{field.value}'")


if __name__ == "__main__":
    sign_with_form_field_signature()
```
{{< /tab >}}
{{< tab "sample.pdf" >}}
{{< tab-text >}}
`sample.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-form-field-signature/sample.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "signed_form_field.pdf" >}}  
```text
Binary file (PDF, 37 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-form-field-signature/sign_with_form_field_signature/signed_form_field.pdf)
{{< /tab >}}
{{< /tabs >}}

## How to eSign Document with Existing Form Field Signatures

GroupDocs.Signature for Python via .NET also provides a mechanism to update the existing form field signatures within the documents.

To update an existing form field signature within the document with GroupDocs.Signature:

* Create a new instance of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class and pass the source document path as a constructor parameter.
* Instantiate the [TextSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions) object with all required additional options.
* Set the [TextSignOptions.signature_implementation](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions/signature_implementation) property with the [TextSignatureImplementation.FORM_FIELD](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/textsignatureimplementation) value.
* Set the [form_text_field_title](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions/form_text_field_title) and [form_text_field_type](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions/form_text_field_type) properties with the proper values of form fields to be updated.
* Call the [Sign](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature/sign/) method of the [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class instance and pass the initialized [TextSignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/textsignoptions) instance to it.
* Analyze the [SignResult](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.domain/signresult) object to check the newly created signatures if needed.  

This example shows how to sign a PDF document with the existing Form Field electronic signature and update its value using Python. The `sample_form.pdf` form has two text fields: `ApprovalNote` (plain text) and `UserSignatureFullName` (rich text). The `form_text_field_title` property names the field to fill; when it is not set, the text goes into every text field of the given `form_text_field_type`.

{{< tabs "fill_existing_form_fields" >}}
{{< tab "Python" >}}
```python
from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions
from groupdocs.signature.domain import FormTextFieldType, TextSignatureImplementation


def fill_existing_form_fields():
    with Signature("sample_form.pdf") as signature:
        # Put a note into the plain-text field "ApprovalNote"
        note_options = TextSignOptions("Document is approved")
        note_options.signature_implementation = TextSignatureImplementation.FORM_FIELD
        note_options.form_text_field_type = FormTextFieldType.PLAIN_TEXT
        note_options.form_text_field_title = "ApprovalNote"

        # Put the signer's name into the rich-text field "UserSignatureFullName"
        name_options = TextSignOptions("John Smith")
        name_options.signature_implementation = TextSignatureImplementation.FORM_FIELD
        name_options.form_text_field_type = FormTextFieldType.RICH_TEXT
        name_options.form_text_field_title = "UserSignatureFullName"

        # Sign the document with both options at once
        result = signature.sign("filled_form.pdf", [note_options, name_options])
        print(f"Filled {len(result.succeeded)} form field(s)")


if __name__ == "__main__":
    fill_existing_form_fields()
```
{{< /tab >}}
{{< tab "sample_form.pdf" >}}
{{< tab-text >}}
`sample_form.pdf` is the sample file used in this example. Click [here](/signature/python-net/_sample_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-form-field-signature/sample_form.pdf) to download it.
{{< /tab-text >}}
{{< /tab >}}
{{< tab "filled_form.pdf" >}}  
```text
Binary file (PDF, 40 KB)
```
[Download full output](/signature/python-net/_output_files/developer-guide/basic-usage/electronic-signature-types/esign-document-with-form-field-signature/fill_existing_form_fields/filled_form.pdf)
{{< /tab >}}
{{< /tabs >}}

### Summary
This guide explains how to use [**GroupDocs.Signature for Python via .NET**](https://products.groupdocs.com/signature/python-net) to add form field signatures to documents. It covers loading a document, configuring form field properties such as name, type, and value, and saving the signed document. Advanced options, like placing the field on the page and filling the existing fields of a PDF form, are also included. For more details, refer to related guides on document signing techniques.


## More Resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for Python via .NET examples](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-via-.NET)

### Free Online Apps

Along with the full-featured Python library, we provide simple but powerful free online apps.

To sign PDF documents for free, you can use the [Digital Signature - PDF](https://products.groupdocs.app/signature/pdf) online application.

To sign Word, Excel, PowerPoint, and other documents you can use the other online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**.
