---
id: advanced-search-for-qr-code-standard-entries
url: signature/net/advanced-search-for-qr-code-standard-entries
title: Search for QR Code standard entries
linkTitle: 🌐 QR Enties
weight: 3
description: "This article explains how to provide advanced search for standard QR Code embedded objects like WiFi, Event, Contact, SMS, EMail, EPC or SEPA payment, VCard or MeCard entries, etc with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
structuredData:
    showOrganization: True
    application:    
        name: Advanced search for QR Code standard entries in documents in C#
        description: Advanced search for QR Code embedded standard entries liek WiFi, URL, Event, VCard, MeCard in various documents fast and easily with C# language and GroupDocs.Signature for .NET APIs
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to find QR Code entry WiFi, Event, SEPA, VCard or MeCard using C# 
        description: Get additional information of searching for QR Code standard entries in documents with C#
        steps:
        - name: Load file which has one of supported file types.
          text: Create object of Signature passing file or stream to the document as a constructor parameter. You can use either file path or file stream. 
        - name: Create search options 
          text: Instantiate QrCodeSearchOptions object providing all demanded data like type, pages setup or return content.
        - name: Get list of items 
          text: Invoke method Search passing search options.
        - name: Process list of found items using GetData method
          text: Loop through the signature list of found items and call GetData<ObjectType> generic method to retrieve the required instance of embedded standard object.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides ability to embed into QR-code signature standard entries like email, contact v-card, address etc, WiFi, contact MeCard. This feature supports standard QR-code representation of entries. At this moment following standard QR-code entries are supported

* [Email](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/email) entry that allows to specify in QR-code standard email information with recipient, subject and body.
* [Address](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/address) entry contains address information.
* [V-Card](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/vcard) entry implements standard of visit card 3.0 specification. More details could be found [here](https://en.wikipedia.org/wiki/VCard).
* [Me-Card](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/mecard) entry implements similar to V-Card contact details standard. More details could be found [here](https://en.wikipedia.org/wiki/MeCard_(QR_code)).
* [EPC](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/epc) implements standard of the European Payments Council guidelines define the content of a QR code that can be used to initiate [SEPA](https://en.wikipedia.org/wiki/SEPA_credit_transfer) credit transfer. More details could be found [here](https://en.wikipedia.org/wiki/EPC_QR_code).
* [Event](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/event) entry implements event standard.
* [WiFi](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/wifi) entry implements WiFI settings standard.
* [SMS](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/sms) entry implements sms properties.
* [CryptoCurrencyTransfer](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/cryptocurrencytransfer/) entry implements event standard.

Here are the steps to extract standard entry frmo the QR-code signature with GroupDocs.Signature:  

* Create new instance of  [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Call the generic [Search](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature/search/#search_2/) method of [Signature](https://reference.groupdocs.com/signature/net/groupdocs.signature/signature) with the [QrCodeSignature](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature/) generic type and pass [SignatureType.QRCode](https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/signaturetype/) to it.
* Enumarate the response with the list of the [QrCodeSignature] (https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature/) signatures and call generic [GetData] (https://reference.groupdocs.com/signature/net/groupdocs.signature.domain/qrcodesignature/getdata/#getdata) method to retrieve the required instance of the object

## Example 1: How to get Address QR Code object in the document 

Following example shows how to search for QR-code Address object in the PDF document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    var signatures = signature.Search<QrCodeSignature>(SignatureType.QrCode);
    foreach (var qrSignature in signatures)
    {
        var address = qrSignature.GetData<Address>();
        if (address != null)
        {
            Console.WriteLine($"Found Address: {Address.Country} {Address.State} {Address.City} {Address.ZIP}");
        }
    }
}
```

## Example 2 : how to get Email QR Code object in the document 

Following example shows how to search for QR-code Email object in the PDF document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    var signatures = signature.Search<QrCodeSignature>(SignatureType.QrCode);
    foreach (var qrSignature in signatures)
    {
        var email = qrSignature.GetData<Email>();
        if (email != null)
        {
            Console.WriteLine($"Found Email signature: {email.Address}: [{email.Subject}] : {email.Body}");
        }
    }
}
```

## Example 3 : how to retrieve VCard QR Code object from image or document 

Following example shows how to retrieve contact VCard object from the QR Code signature.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    var signatures = signature.Search<QrCodeSignature>(SignatureType.QrCode);
    foreach (var qrSignature in signatures)
    {
        var vCard = qrSignature.GetData<VCard>();
        if (vCard != null)
        {
            Console.WriteLine($"Found VCard signature: {vcard.FirstName} {vcard.LastName} from {vcard.Company}. Tel: {vcard.CellPhone}");
        }
    }
}
```

## Example 4 : How to find the EPC data in the QR Code from image or document 

Following example shows to find the EPC (The European Payments Council Quick Response Code) data in the QR Code from image or document.

```csharp
using (Signature signature = new Signature("sample.pdf"))
{
    var signatures = signature.Search<QrCodeSignature>(SignatureType.QrCode);
    foreach (var qrSignature in signatures)
    {
        var payment = qrSignature.GetData<EPC>();
        if (payment != null)
        {
            Console.WriteLine($"EPC: {payment.Name}, IBAN {payment.IBAN}. Amount {payment.Amount}. Ref: {payment.Reference} / {payment.Remittance}");
        }
    }
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
