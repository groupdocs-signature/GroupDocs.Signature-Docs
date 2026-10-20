---
id: advanced-search-for-qr-code-standard-entries
url: signature/java/advanced-search-for-qr-code-standard-entries
title: Search for QR Code standard entries
linkTitle: QR Entries
weight: 3
description: "This article explains how to provide advanced search for standard QR Code embedded objects like WiFi, Event, Contact, SMS, EMail, EPC or SEPA payment, VCard or MeCard entries, etc with GroupDocs.Signature for Java API."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for QR Code standard entries in documents in Java
        description: Advanced search for QR Code embedded standard entries like WiFi, URL, Event, VCard, MeCard in various documents fast and easily with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to find QR Code entry WiFi, Event, SEPA, VCard or MeCard using Java 
        description: Get additional information of searching for QR Code standard entries in documents with Java
        steps:
        - name: Load file which has one of supported file types.
          text: Create object of Signature passing file or stream to the document as a constructor parameter. You can use either file path or file stream. 
        - name: Get list of items 
          text: Invoke method search passing QrCodeSignature.class and SignatureType.QrCode.
        - name: Process list of found items using getData method
          text: Loop through the signature list of found items and call the getData method with the entry class to retrieve the required instance of embedded standard object.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides ability to embed into QR-code signature standard entries like email, contact v-card, address etc, WiFi, contact MeCard. This feature supports standard QR-code representation of entries. At this moment following standard QR-code entries are supported

* [Email](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/email/) entry that allows to specify in QR-code standard email information with recipient, subject and body.
* [Address](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/address/) entry contains address information.
* [V-Card](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/vcard/) entry implements standard of visit card 3.0 specification. More details could be found [here](https://en.wikipedia.org/wiki/VCard).
* [Me-Card](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/mecard/) entry implements similar to V-Card contact details standard. More details could be found [here](https://en.wikipedia.org/wiki/MeCard_(QR_code)).
* [EPC](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/epc/) implements standard of the European Payments Council guidelines define the content of a QR code that can be used to initiate [SEPA](https://en.wikipedia.org/wiki/SEPA_credit_transfer) credit transfer. More details could be found [here](https://en.wikipedia.org/wiki/EPC_QR_code).
* [Event](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/event/) entry implements event standard.
* [WiFi](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/wifi/) entry implements WiFi settings standard.
* [SMS](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/sms/) entry implements sms properties.
* [CryptoCurrencyTransfer](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/cryptocurrencytransfer/) entry implements cryptocurrency transfer details.

Here are the steps to extract standard entry from the QR-code signature with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.
* Call the `search` method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) with the [QrCodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/qrcodesignature/) class and pass [SignatureType.QrCode](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/signaturetype/) to it.
* Enumerate the response with the list of the [QrCodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/qrcodesignature/) signatures and call the `getData` method with the entry class, for example `getData(Address.class)`, to retrieve the required instance of the object. Check the result for `null` before using it.

{{< alert style="info" >}}
The evaluation version recognizes QR-codes with restrictions and does not return their full text, so `getData` cannot restore the entry objects. Apply a license to run these examples, see [Evaluation Limitations and Licensing]({{< ref "signature/java/getting-started/evaluation-limitations-and-licensing-of-groupdocs.signature.md" >}}).
{{< /alert >}}

## Example 1: How to get Address QR Code object in the document

Following example shows how to search for QR-code Address object in the PDF document.

```java
Signature signature = new Signature("sample.pdf");
try
{
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        Address address = qrSignature.getData(Address.class);
        if (address != null)
        {
            System.out.println("Found Address: " + address.getCountry() + " " + address.getState() + " " + address.getCity() + " " + address.getZIP());
        }
    }
}
finally
{
    signature.dispose();
}
```

## Example 2: How to get Email QR Code object in the document

Following example shows how to search for QR-code Email object in the PDF document.

```java
Signature signature = new Signature("sample.pdf");
try
{
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        Email email = qrSignature.getData(Email.class);
        if (email != null)
        {
            System.out.println("Found Email signature: " + email.getAddress() + ": [" + email.getSubject() + "] : " + email.getBody());
        }
    }
}
finally
{
    signature.dispose();
}
```

## Example 3: How to retrieve VCard QR Code object from image or document

Following example shows how to retrieve contact VCard object from the QR Code signature.

```java
Signature signature = new Signature("sample.pdf");
try
{
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        VCard vcard = qrSignature.getData(VCard.class);
        if (vcard != null)
        {
            System.out.println("Found VCard signature: " + vcard.getFirstName() + " " + vcard.getLastName() + " from " + vcard.getCompany() + ". Tel: " + vcard.getCellPhone());
        }
    }
}
finally
{
    signature.dispose();
}
```

## Example 4: How to find the EPC data in the QR Code from image or document

Following example shows to find the EPC (The European Payments Council Quick Response Code) data in the QR Code from image or document.

```java
Signature signature = new Signature("sample.pdf");
try
{
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        EPC payment = qrSignature.getData(EPC.class);
        if (payment != null)
        {
            System.out.println("EPC: " + payment.getName() + ", IBAN " + payment.getIBAN() + ". Amount " + payment.getAmount() + ". Ref: " + payment.getReference() + " / " + payment.getRemittance());
        }
    }
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
