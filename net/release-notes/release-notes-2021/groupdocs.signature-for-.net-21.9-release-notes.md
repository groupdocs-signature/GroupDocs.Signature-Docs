---
id: groupdocs-signature-for-net-21-9-release-notes
url: signature/net/groupdocs-signature-for-net-21-9-release-notes
title: GroupDocs.Signature for .NET 21.9 Release Notes
weight: 40
description: ""
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for .NET 21.9{{< /alert >}}

## Major Features

This release contains new features with QR Code embedded objects and few optimization on Document modification process that will allow to skip unnecessary document saving when Update and Delete method had no effect.
Below the list of most notable changes in release of GroupDocs.Signature for .NET 21.9:

* Signature Settings has new properties to adjust document saving when modifications method had no effect.
* New QR Code type crypto currency transfer for embedded object was added.
* Fixed issue with image document processing.
* Implemented ability to skip document saving based on new settings.

Full List of Issues Covering all Changes in this Release

| Key | Summary | Issue Type |
| --- | --- | --- |
| SIGNATURENET-3634 | Implement new Signature setting to skip document saving when Delete method has no effect  | Feature |
| SIGNATURENET-3633 | Implement new Signature setting to skip document saving when Update method has no effect  | Feature |
| SIGNATURENET-3628 | Implement new QR Code type of Crypto Currency wallets  | Feature |
| SIGNATURENET-3577 | Parameter is not valid for Image Document | Improvement |
| SIGNATURENET-3576 | Skip Document saving when Delete method had no effect  | Improvement |
| SIGNATURENET-3627 | Skip Document saving when Update method had no effect  | Bug |

## Public API and Backward Incompatible Changes

#### Public class [SignatureSettings](https://apireference.groupdocs.com/signature/net/groupdocs.signature/signaturesettings) was updated with new properties that allow to skip document saving when modification methods had no effect

Public class [SignatureSettings](https://apireference.groupdocs.com/signature/net/groupdocs.signature/SignatureSettings) was updated with properties

* property bool [SaveDocumentOnEmptyUpdate] that allows to specify if document should not be saved when Update method had no affected signatures. By default this value equals to true.
* property bool [SaveDocumentOnEmptyDelete] that allows to specify if document should not be saved when Delete method had no affected signatures. By default this value equals to true.

**New properties of SignatureSettings class**

```csharp
    public class SignatureSettings
    {
        /// <summary>
        /// Gets or sets flag to resave source document when Update method has no signatures to update.
        /// If this flag is set to true (by default) document will be saving with corresponding history process log (date and operation type) 
        //  even if Update method has no signatures to update.
        /// When this flat is set to false source document will not be modified at all.
        /// </summary>
        public bool SaveDocumentOnEmptyUpdate { get; set; } = true;

        /// <summary>
        /// Gets or sets flag to resave source document when Delete method has no affected signatures to remove.
        /// If this flag is set to true (by default) document will be saving with corresponding history process log (date and operation type) even if Delete method has no signatures to remove.
        /// When this flat is set to false source document will not be modified at all.
        /// </summary>
        public bool SaveDocumentOnEmptyDelete { get; set; } = true;
   }
```

#### New public enumeration [CryptoCurrencyType](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/cryptocurrencytype) was added to specify various cryptocurrency types

This enumeration keeps supported cryptocurrency types.

**New public enumeration**

```csharp
    /// <summary>
    /// Represents Cryptocurrency type.
    /// </summary>
    public enum CryptoCurrencyType
    {
        /// <summary>Represents custom crypto currency type.</summary>
        Custom = 0,

        /// <summary>Represents Bitcoin crypto currency type.</summary>
        Bitcoin = 1,

        /// <summary>Represents Bitcoin Cash crypto currency type.</summary>
        BitcoinCash = 2,

        /// <summary>Represents Litecoin crypto currency type.</summary>
        Litecoin = 3,

        /// <summary>Represents Ethereum crypto currency type.</summary>
        Ethereum = 4,

        /// <summary>Represents Dash crypto currency type.</summary>
        Dash = 5,
    }
}
```

#### New public class [CryptoCurrencyTransfer](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/cryptocurrencytransfer) was added to keep properties of cryptocurrency data for QR-code embedded object

This class contains following properties

* CryptoCurrencyType Type - the type of cryptocurency transfer [CryptoCurrencyType](https://apireference.groupdocs.com/signature/net/groupdocs.signature.domain.extensions/cryptocurrencytype)
* decimal Amount is the value as amount of transfer.
* string Address is the address of the transfer.
* string Message to keep transfer message.
* string CustomType to specify cryptocurrency name in case of custom cryptocurrency type.

**New public class CryptoCurrencyTransfer**

```csharp
    /// <summary>
    /// Represents Crypto currency transfer (receive or send) for QR-Code.
    /// </summary>
    public class CryptoCurrencyTransfer
    {
        /// <summary>
        /// Gets or sets one of supported crypto currency type.
        /// </summary>
        public CryptoCurrencyType Type { get; set; } = CryptoCurrencyType.Bitcoin;

        /// <summary>
        /// Gets or sets transfer amount.
        /// </summary>
        public decimal Amount { get; set; }

        /// <summary>
        /// Gets or sets crypto currency public address.
        /// </summary>
        public string Address { get; set; }

        /// <summary>
        /// Gets or sets optional transfer message.
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// Gets or sets optional transfer message.
        /// </summary>
        public string CustomType { get; set; }
    }
}
```

