---
id: search-for-standard-entries-in-the-qr-code-signatures
url: signature/java/search-for-standard-entries-in-the-qr-code-signatures
title: Search for standard entries in the QR-Code signatures
weight: 5
description: "This article explains how to search for VCard, MeCard, Email, Address, EPC, SEPA, Event data in QR-code electronic signatures from previously signed documents with GroupDocs.Signature for Java API."
keywords: 
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Search for standard QR Code signatures in documents in Java    
        description: Advanced search for standard QR Code electronic signatures in various documents with Java language and GroupDocs.Signature for Java APIs
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: Getting list of standard QR Code signatures using Java 
        description: Learn how to get information about standard QR Code electronic signatures in documents with Java
        steps:
        - name: Provide document for processing.
          text: Create Signature with file path or file stream as parameter. 
        - name: Get list of items 
          text: Call method search with QrCodeSignature.class and SignatureType.QrCode.
        - name: Process list of found items
          text: Process in desired way list of found items.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides additional features when searching for [QrCode Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/qrcodesignature/) that were previously added to document with embedded standard entry objects. Following standard entries are supported to search for and receive object back from Qr-Code

* [Email](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/email/) that keeps in the QR-code standard email information with recipient, subject and body.
* [Address](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/address/) with address information.
* [V-Card](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/vcard/) entry of visit card 3.0 specification with visited card details. More info could be found [here](https://en.wikipedia.org/wiki/VCard).
* [Me-Card](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/mecard/) entry implements similar to V-Card contact details standard. More details could be found [here](https://en.wikipedia.org/wiki/MeCard_(QR_code)).
* [EPC](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/epc/) implements standard of the European Payments Council guidelines define the content of a QR code that can be used to initiate [SEPA](https://en.wikipedia.org/wiki/SEPA_credit_transfer) credit transfer. More details could be found [here](https://en.wikipedia.org/wiki/EPC_QR_code).
* [Event](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/event/) entry implements event standard.
* [WiFi](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/wifi/) entry implements WiFi settings standard.
* [SMS](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/sms/) entry implements sms properties.
* [CryptoCurrencyTransfer](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/cryptocurrencytransfer/) entry implements cryptocurrency transfer details.

To obtain an entry, call the `getData` method of the found [QrCodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/qrcodesignature/) with the entry class, for example `getData(Email.class)`, and check the result for `null` before using it.

{{< alert style="info" >}}
The evaluation version recognizes QR-codes with restrictions and does not return their full text, so `getData` cannot restore the entry objects. Apply a license to run these examples, see [Evaluation Limitations and Licensing]({{< ref "signature/java/getting-started/evaluation-limitations-and-licensing-of-groupdocs.signature.md" >}}).
{{< /alert >}}

## Search for QR-code signatures and extract Email object

This example shows how to search for QR-code signature and obtain [Email](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/email/) object.

```java
// instantiating the signature object
Signature signature = new Signature("signed.pdf");
try
{
    // search document
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        System.out.println("Found QRCode signature: " + qrSignature.getEncodeType().getTypeName() + " with text " + qrSignature.getText());
        Email email = qrSignature.getData(Email.class);
        if (email != null)
        {
            System.out.println("Found Email signature: " + email.getAddress() + " " + email.getSubject() + " " + email.getBody());
        }
    }
}
finally
{
    signature.dispose();
}
```

## Search for QR-code signatures and extract Address object

This example shows how to search for QR-code signature and obtain [Address](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/address/) object.

```java
// instantiating the signature object
Signature signature = new Signature("signed.pdf");
try
{
    // search document
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        System.out.println("Found QRCode signature: " + qrSignature.getEncodeType().getTypeName() + " with text " + qrSignature.getText());
        Address address = qrSignature.getData(Address.class);
        if (address != null)
        {
            System.out.println("Found Address signature: " + address.getCountry() + " " + address.getState() + " " + address.getCity() + " " + address.getZIP());
        }
    }
}
finally
{
    signature.dispose();
}
```

## Search for QR-code signatures and extract VCard object

This example shows how to obtain [V-Card](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/vcard/) entry from QR-Code electronic signatures.

```java
// instantiating the signature object
Signature signature = new Signature("signed.pdf");
try
{
    // search document
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        System.out.println("Found QRCode signature: " + qrSignature.getEncodeType().getTypeName() + " with text " + qrSignature.getText());
        VCard vcard = qrSignature.getData(VCard.class);
        if (vcard != null)
        {
            System.out.println("Found VCard signature: " + vcard.getFirstName() + " " + vcard.getLastName() + " from " + vcard.getCompany() + ". Email: " + vcard.getEmail());
        }
    }
}
finally
{
    signature.dispose();
}
```

## Search for QR-code with MeCard object

This example shows how to obtain [Me-Card](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/mecard/) entry from QR-Code electronic signature.

```java
// instantiating the signature object
Signature signature = new Signature("sample.pdf");
try
{
    // search document
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        MeCard meCard = qrSignature.getData(MeCard.class);
        if (meCard != null)
        {
            System.out.println("Found MeCard signature: " + meCard.getName() + " " + meCard.getReading() + " from " + meCard.getNote() + ". Email: " + meCard.getEmail());
        }
        else
        {
            System.out.println("MeCard object was not found. QRCode " + qrSignature.getEncodeType().getTypeName() + " with text " + qrSignature.getText());
        }
    }
}
finally
{
    signature.dispose();
}
```

## Search for QR-code with EPC/SEPA object

This example shows how to obtain [EPC/SEPA](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/epc/) entry from QR-Code electronic signatures.

```java
// instantiating the signature object
Signature signature = new Signature("sample.pdf");
try
{
    // search document
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        EPC payment = qrSignature.getData(EPC.class);
        if (payment != null)
        {
            System.out.println("Found EPC payment signature. Name " + payment.getName() + ", IBAN " + payment.getIBAN() + ". Amount " + payment.getAmount() + ". Ref: " + payment.getReference() + " / " + payment.getRemittance());
        }
        else
        {
            System.out.println("EPC object was not found. QRCode " + qrSignature.getEncodeType().getTypeName() + " with text " + qrSignature.getText());
        }
    }
}
finally
{
    signature.dispose();
}
```

## Search for QR-code with Event object

This example shows how to obtain [Event](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/event/) entry from QR-Code electronic signatures.

```java
// instantiating the signature object
Signature signature = new Signature("sample.pdf");
try
{
    // search document
    List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, SignatureType.QrCode);
    for (QrCodeSignature qrSignature : signatures)
    {
        Event evnt = qrSignature.getData(Event.class);
        if (evnt != null)
        {
            System.out.println("Found Event signature: " + evnt.getTitle() + "/" + evnt.getDescription() + " at " + evnt.getLocation() + ". Started @ " + evnt.getStartDate());
        }
        else
        {
            System.out.println("Event object was not found. QRCode " + qrSignature.getEncodeType().getTypeName() + " with text " + qrSignature.getText());
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
