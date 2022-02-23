---
id: delete-signatures-of-the-certain-types
url: signature/java/delete-signatures-of-the-certain-types
title: Delete Signatures of the certain types
weight: 6
description: "This article explains how to delete electronic signatures of the certain types with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides overloaded [deleteByTypes](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature#deleteByTypes(java.io.OutputStream,%20java.util.List)) method that accepts list of the [SignatureType](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/SignatureType) enumeration values.
Please be aware that this method modifies the same document that was passed to constructor of the [Signature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) class.

Here are the steps to delete signature by certain types from the document with GroupDocs.Signature:

* Create new instance of [Signature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) class and pass source document path or its stream as a constructor parameter;
* Call [Signature](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature) object [deleteByTypes](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature/Signature#deleteByTypes(java.io.OutputStream,%20java.util.List))  method and pass list of the required [SignatureType](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/SignatureType) enumerations to it.

This example shows how to delete various signatures types from the document at once.

```java
Signature signature = new Signature(outputFilePath);
{
	// compose the list of signature types to delete
	List<Integer> signedTypes = new ArrayList<Integer>();
	signedTypes.add(SignatureType.Text);
	signedTypes.add(SignatureType.Image);
	signedTypes.add(SignatureType.Barcode);
	signedTypes.add(SignatureType.QrCode);
	signedTypes.add(SignatureType.Digital);

	// deleting signatures from the document by signature types
	DeleteResult result = signature.deleteByTypes(outputFilePath,signedTypes);
	if (result.getSucceeded().size() > 0)
	{
		System.out.print("Following signatures were removed:");
		int number = 1;
		for(BaseSignature temp : result.getSucceeded())
		{
			System.out.print("Signature #"+number++ +": Type: "+temp.getSignatureType()+" Id:"+temp.getSignatureId()+". Created: "+temp.getCreatedOn());
		}
	}
	else
	{
		System.out.print("No one signature was deleted.");
	}
}
```


