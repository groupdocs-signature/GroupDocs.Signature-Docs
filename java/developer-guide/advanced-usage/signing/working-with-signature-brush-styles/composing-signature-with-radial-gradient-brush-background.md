---
id: composing-signature-with-radial-gradient-brush-background
url: signature/java/composing-signature-with-radial-gradient-brush-background
title: Composing signature with radial gradient brush background
weight: 2
description: " This article explains how to fill signature background with radial gradient brush"
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides [RadialGradientBrush](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions/RadialGradientBrush) class to specify filling signature background with radial gradients

 Here are the steps to use Radial gradient brush with GroupDocs.Signature:

*   Create new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path or stream as a constructor parameter.    
*   Instantiate the [SignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/SignOptions) object with all required additional options and setup [Background.setBrush](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain/Background#setBrush(com.groupdocs.signature.domain.extensions.Brush)) property with instance of  [RadialGradientBrush](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.extensions/RadialGradientBrush)  
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20com.groupdocs.signature.options.sign.SignOptions)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass [SignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/SignOptions) to it.
*   Analyze [SignResult](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain/SignResult) result to check newly created signatures if needed. 

This example shows how to use Radial gradient brush for signature background. See [SignResult](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain/SignResult) 

```java
Signature signature = new Signature("sample.pdf");
TextSignOptions options = new TextSignOptions("John Smith")
 
// adjust signature appearance brush
 
// setup background                
Background background = new Background();
background.setColor(Color.GREEN);
background.setTransparency(0.5);
background.setBrush(new RadialGradientBrush(Color.GREEN, Color.WHITE));
options.setBackground(background);                
 
// locate signature
options.setWidth(100);
options.setHeight(80);
options.setVerticalAlignment(VerticalAlignment.Center);
options.setHorizontalAlignment(HorizontalAlignment.Center);
Padding padding = new Padding();
padding.setTop(20);
padding.setRight(20);
options.setMargin(padding);
 
// set alternative signature implementation on document page
options.setSignatureImplementation(TextSignatureImplementation.Image);
 
// sign document to file
SignResult signResult = signature.sign("signed.pdf", options);
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

Along with full-featured .NET library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
