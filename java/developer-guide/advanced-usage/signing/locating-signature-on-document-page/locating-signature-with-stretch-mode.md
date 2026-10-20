---
id: locating-signature-with-stretch-mode
url: signature/java/locating-signature-with-stretch-mode
title: Locating signature with stretch mode
linkTitle: Stretch Mode
weight: 3
description: " This article explains how to use stretch mode values to adjust signature area positions on document page with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides ability to stretch signature area along page width or height. Use enumeration [StretchMode](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/stretchmode/) contains following values

*   [None](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/stretchmode/#None) - no stretch will be applied 
*   [PageWidth](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/stretchmode/#PageWidth) -  to stretch signature area along page width
*   [PageHeight](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/stretchmode/#PageHeight) - to stretch signature area along page height
*   [PageArea](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/stretchmode/#PageArea) - to stretch signature area along page width and height

Here are the steps to use stretch mode with adding text or images signatures into document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.    
*   Instantiate the [TextSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/textsignoptions/) or [ImageSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/)  object with all required additional options and setup [setStretch](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/#setStretch-int-) property      
*   Call [sign](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#sign-java.io.OutputStream-java.util.List-com.groupdocs.signature.options.sign.SignOptions--) method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and the instance of signature options ([ImageSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/) for example) to it.
    

## Locate Signature Area with Stretch Mode

This example shows how to locate signature with stretch mode.

```java
// instantiating the signature object
final Signature signature = new Signature("sample.pdf");
 
// define several signature options of different types and settings
TextSignOptions textOptions = new TextSignOptions("This is test message");
textOptions.setAllPages(true);
textOptions.setVerticalAlignment(VerticalAlignment.Top);
textOptions.setMargin(new Padding(50));
textOptions.setStretch(StretchMode.PageWidth);
 
BarcodeSignOptions barcodeOptions = new BarcodeSignOptions("123456");
barcodeOptions.setAllPages(true);
barcodeOptions.setEncodeType(BarcodeTypes.Code128);
barcodeOptions.setVerticalAlignment(VerticalAlignment.Bottom);
barcodeOptions.setMargin(new Padding(50));
barcodeOptions.setStretch(StretchMode.PageWidth);
 
ImageSignOptions imageOptions = new ImageSignOptions();
imageOptions.setAllPages(true);
imageOptions.setStretch(StretchMode.PageHeight);
imageOptions.setHorizontalAlignment(HorizontalAlignment.Right);
imageOptions.setImageFilePath("image.png");
 
// define list of signature options
List<SignOptions> listOptions = new ArrayList<SignOptions>();
listOptions.add(textOptions);
listOptions.add(barcodeOptions);
listOptions.add(imageOptions);
// sign document to file
SignResult signResult = signature.sign("signed.pdf", listOptions);
// analyzing result
System.out.print("List of newly created signatures:");
int number = 1;
for(BaseSignature temp : signResult.getSucceeded())
{
    System.out.print("Signature #"+ number++ +": Type: "+temp.getSignatureType()+" Id:"+temp.getSignatureId()+
            ",Location: "+temp.getLeft()+"x"+temp.getTop()+". Size: "+temp.getWidth()+"x"+temp.getHeight());
}
```

## More resources

### GitHub Examples 

You may easily run the code above and see the feature in action in our GitHub examples:

*   [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)    
*   [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)    
*   [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)    
*   [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)    
*   [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)   
*   [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)
    

### Free Online App 

Along with full-featured Java library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
