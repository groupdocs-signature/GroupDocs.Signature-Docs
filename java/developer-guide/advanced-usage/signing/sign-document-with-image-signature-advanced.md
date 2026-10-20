---
id: sign-document-with-image-signature-advanced
url: signature/java/sign-document-with-image-signature-advanced
title: Sign document with Image signature - advanced
weight: 9
description: " This article explains how to sign document with Image electronic signatures using extended options with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False toc:True
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [ImageSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/) class to specify different options for Image signature as follow

*   signature alignment ([setHorizontalAlignment](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/#setHorizontalAlignment-int-), [setVerticalAlignment](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/#setVerticalAlignment-int-))
*   margins ([setMargin](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/#setMargin-com.groupdocs.signature.domain.Padding-))
*   additional extensions and appearances ([setExtensions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/#setExtensions-java.util.List-com.groupdocs.signature.domain.extensions.signoptions.SignatureExtension--), [setAppearance](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/signoptions/#setAppearance-com.groupdocs.signature.options.appearances.SignatureAppearance-))

Here are the steps to add Image signature into document with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.    
*   Instantiate the [ImageSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/) object according to your requirements and specify image signature options.    
*   Call [sign](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/#sign-java.io.OutputStream-com.groupdocs.signature.options.sign.SignOptions-) method of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class instance and pass [ImageSignOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.sign/imagesignoptions/) to it.      
*   Analyze [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) result to check newly created signatures if needed.

  

This example shows how to specify different Image signature options. See [SignResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/signresult/) 

```java
Signature signature = new Signature(sample.xlsx);
 
ImageSignOptions options = new ImageSignOptions("sample.jpg");
 
// set signature position
options.setLeft(100);
options.setTop(100);
 
// set signature rectangle
options.setWidth(100);
options.setHeight(30);
 
// set signature alignment
// when VerticalAlignment is set the Top coordinate will be ignored.
// Use Margin properties Top, Bottom to provide vertical offset
options.setVerticalAlignment(VerticalAlignment.Top);
 
// when HorizontalAlignment is set the Left coordinate will be ignored.
// Use Margin properties Left, Right to provide horizontal offset
options.setHorizontalAlignment(HorizontalAlignment.Right);
 
Padding padding = new Padding();
padding.setRight(20);
padding.setTop(20);
options.setMargin(padding);
 
// set rotation
options.setRotationAngle(45);
 
//setup signature border
Border border = new Border();
border.setColor(Color.GREEN);
border.setDashStyle(DashStyle.DashLongDashDot);
border.setWeight(5);
border.setVisible(true);

options.setBorder(border);
 
// sign document to file
SignResult signResult = signature.sign("sgnedSample.xlsx", options);
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

GitHub Examples 

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
