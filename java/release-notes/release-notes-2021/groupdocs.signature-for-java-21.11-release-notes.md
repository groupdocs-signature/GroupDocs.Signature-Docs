---
id: groupdocs-signature-for-java-21-11-release-notes
url: signature/java/groupdocs-signature-for-java-21-11-release-notes
title: GroupDocs.Signature for Java 21.11 Release Notes
weight: 40
description: ""
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
{{< alert style="info" >}}This page contains release notes for GroupDocs.Signature for Java 21.11{{< /alert >}}

## Major Features

This release contains new features with QR Code embedded objects and few optimization on Document modification process that will allow to skip unnecessary document saving when Update and Delete method had no effect.
Below the list of most notable changes in release of GroupDocs.Signature for Java 21.11:

* Signature Settings has new properties to adjust document saving when modifications method had no effect.
* New QR Code type crypto currency trasnfer for embedded object was added.
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

#### Public class [SignatureSettings](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/SignatureSettings) was updated with new properties that allow to skip document saving when modification methods had no effect

Public class [SignatureSettings](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/SignatureSettings) was updated with properties

* property boolean [getSaveDocumentOnEmptyUpdate()] that allows to specify if document should not be saved when Update method had no affected signatures. By default this value equals to true.
* property boolean [getSaveDocumentOnEmptyDelete()] that allows to specify if document should not be saved when Delete method had no affected signatures. By default this value equals to true.

**New properties of SignatureSettings class**

```java
    public class SignatureSettings
    {
        /**
		 * <p>
		 * Gets or sets flag to resave source document when Update method has no signatures to update.
		 * If this flag is set to true (by default) document will be saving with corresponding history process log (date and operation type) even if Update method has no signatures to update.
		 * When this flat is set to false source document will not be modified at all.
		 * </p>
		 */		
		public final boolean getSaveDocumentOnEmptyUpdate(){}
		public final void setSaveDocumentOnEmptyUpdate(boolean value){}		

		/**
		 * <p>
		 * Gets or sets flag to resave source document when Delete method has no affected signatures to remove.
		 * If this flag is set to true (by default) document will be saving with corresponding history process log (date and operation type) even if Delete method has no signatures to remove.
		 * When this flat is set to false source document will not be modified at all.
		 * </p>
		 */		
		public final boolean getSaveDocumentOnEmptyDelete(){}		
		public final void setSaveDocumentOnEmptyDelete(boolean value){}
		
   }
```

#### New public enumeration [CryptoCurrencyType](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/CryptoCurrencyType) was added to specify various cryptocurrency types

This enumeration keeps supported cryptocurrency types.

**New public enumeration**

```java
    /**
	 * <p>
	 * Represents Crypto currency type.
	 * </p>
	 */	
	public final class CryptoCurrencyType
	{
		private CryptoCurrencyType(){}	
		/**
		 * <p>Represents custom crypto currency type.</p>
		 */
		public static final int Custom = 0;

		/**
		 * <p>Represents Bitcoin crypto currency type.</p>
		 */
		public static final int Bitcoin = 1;

		/**
		 * <p>Represents Bitcoin Cash crypto currency type.</p>
		 */
		public static final int BitcoinCash = 2;

		/**
		 * <p>Represents Litecoin crypto currency type.</p>
		 */
		public static final int Litecoin = 3;

		/**
		 * <p>Represents Ethereum crypto currency type.</p>
		 */
		public static final int Ethereum = 4;

		/**
		 * <p>Represents Dash crypto currency type.</p>
		 */
		public static final int Dash = 5;    
	}
```

#### New public class [CryptoCurrencyTransfer](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/CryptoCurrencyTransfer) was added to keep properties of cryptocurrency data for QR-code embedded object

This class contains following properties

* int Type - the type of cryptocurency trasnfer [CryptoCurrencyType](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.extensions.serialization/CryptoCurrencyType)
* BigDecimal Amount is the value as amount of trasnfer.
* String Address is the address of the trasnfer.
* String Message to keep transfer message.
* String CustomType to specify cryptocurrency name in case of custom cryptocurrency type.

**New public class CryptoCurrencyTransfer**

```java
    /**
	 * <p>
	 * Represents Crypto currency transfer (reciever or transfer) for QR-Code.
	 * </p>
	 */
	public class CryptoCurrencyTransfer
	{
		/**
		 * <p>
		 * Gets or sets one of supported crypto currency type.
		 * </p>
		 */		
		public final int getType(){}		
		public final void setType(int value){}
		
		/**
		 * <p>
		 * Gets or sets transfer amount.
		 * </p>
		 */		
		public final java.math.BigDecimal getAmount() {}	
		public final void setAmount(java.math.BigDecimal value) {}		

		/**
		 * <p>
		 * Gets or sets crypto currency public address.
		 * </p>
		 */		
		public final String getAddress(){}		
		public final void setAddress(String value){}		

		/**
		 * <p>
		 * Gets or sets optional transfer message.
		 * </p>
		 */		
		public final String getMessage(){}		
		public final void setMessage(String value){}		

		/**
		 * <p>
		 * Gets or sets optional transfer message.
		 * </p>
		 */		
		public final String getCustomType(){}		
		public final void setCustomType(String value){}		
		
	}
```

