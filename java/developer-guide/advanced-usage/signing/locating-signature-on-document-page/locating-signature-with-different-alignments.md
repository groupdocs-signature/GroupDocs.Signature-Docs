---
id: locating-signature-with-different-alignments
url: signature/java/locating-signature-with-different-alignments
title: Locating signature with different alignments
linkTitle: 🌐 Alignments
weight: 2
description: " This article explains how to use different alignment values to locate signature on document page with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides ability to align signature on page with horizontal and vertical alignment settings. Signature options that implement interface [IAlignment](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.interfaces/IAlignment) contain following properties:

*   [getHorizontalAlignment](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.interfaces/IAlignment#getHorizontalAlignment()) - property of enumeration type [HorizontalAlignment](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/HorizontalAlignment) to specify horizontal alignment of signature. Values are [None, Left, Center, Right](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/HorizontalAlignment)
*   [getVerticalAlignment](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.interfaces/IAlignment#getVerticalAlignment()) - property of enumeration type [VerticalAlignment](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/VerticalAlignment) to specify vertical alignment of signature. Values are [None, Top, Center, Bottom](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/VerticalAlignment)
*   [getMargin](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.interfaces/IAlignment#getMargin())\- property of class [Padding](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain/Padding) to specify offset for signature alignment. Fields of class are [Left, Top, Right, Bottom](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain/Padding) to specify offset in measure units from alignment area.
*   [getMarginMeasureType](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.interfaces/IAlignment#getMarginMeasureType()) - property of enumeration type [MeasureType](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/MeasureType) with values ([Pixels, Millimeters, Percents](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.enums/MeasureType)). See more details in this example [Locating signature on page with different measure units]({{< ref "signature/java/developer-guide/advanced-usage/signing/locating-signature-on-document-page/_index.md" >}})

Here are the steps to align signature on page with GroupDocs.Signature:

*   Create a new instance of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class and pass source document path or stream as a constructor parameter.    
*   Instantiate signature options ([ImageSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/ImageSignOptions) for example) with all required properties.    
*   Set  [setHorizontalAlignment](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.interfaces/IAlignment#setHorizontalAlignment(int)) with one of enumeration value to align signature along page width
*   Set  [setVerticalAlignment](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.interfaces/IAlignment#setVerticalAlignment(int)) with one of enumeration value to align signature along page height
*   Set  [setMargin](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.interfaces/IAlignment#setMargin(com.groupdocs.signature.domain.Padding)) property with required offsetfrom page border
*   Set  [setMarginMeasureType](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.domain.interfaces/IAlignment#setMarginMeasureType(int)) property with non default value if there is need to specify offset from page border in another measure units like millimeters and page percents (from 100% width and 100% height)      
*   Call [sign](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature#sign(java.io.OutputStream,%20java.util.List)) method of [Signature](https://reference.groupdocs.com/java/signature/com.groupdocs.signature/Signature) class instance and pass the instance of signature options ([ImageSignOptions](https://reference.groupdocs.com/java/signature/com.groupdocs.signature.options.sign/ImageSignOptions) for example) to it.

This example shows how to locate signature with different alignments.

```java
// instantiating the signature object
final Signature signature = new Signature("sample.pdf");
 
// define qr-code size
int qrWidth = 100;
int qrHeight = 100;
// define list of options        
List<SignOptions> listOptions = new ArrayList<SignOptions>();
// walk through all alignment values to locate signature at all page alignment areas
for(int horizontalAlignment : HorizontalAlignment.getValues())
{
    for (int verticalAlignment : VerticalAlignment.getValues())
    {
        if (verticalAlignment != VerticalAlignment.None && horizontalAlignment != HorizontalAlignment.None)
        {
 
            QrCodeSignOptions options =  new QrCodeSignOptions("Left-Top");
            options.setWidth(qrWidth);
            options.setHeight(qrHeight);
            // set signature alignment
            options.setHorizontalAlignment(horizontalAlignment);
            options.setVerticalAlignment(verticalAlignment);
            options.setMargin(new Padding(5));
            listOptions.add(options);
        }
    }
}
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

Along with full-featured .NET library we provide simple, but powerful free Apps.  
You are welcome to eSign PDF, Word, Excel, PowerPoint documents with free to use online **[GroupDocs Signature App](https://products.groupdocs.app/signature)**.
