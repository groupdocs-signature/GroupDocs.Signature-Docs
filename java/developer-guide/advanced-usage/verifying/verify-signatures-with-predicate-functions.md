---
id: verify-signatures-with-predicate-functions
url: signature/java/verify-signatures-with-predicate-functions
title: How to verify signatures with predicate functions
weight: 19
description: "This article explains how to verify signatures and filter the verified signatures with predicate functions (java.util.function.Predicate) using GroupDocs.Signature for Java API."
keywords: verify signatures, predicate functions, filter signatures, lambda expressions, custom verification criteria, java.util.function.Predicate, signature validation
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Verify Signatures in Documents with Predicate Functions
        description: This article explains how to verify signatures and filter the verified signatures with predicate functions using GroupDocs.Signature for Java APIs.
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to verify signatures with predicate functions
        description: This topic explains how to verify signatures in documents and filter the verified signatures with predicate functions (lambda expressions) in Java. 
        steps:
        - name: Load the document for verification.
          text: Create an instance of the `Signature` class by passing the local file path as a parameter.
        - name: Define verification options.
          text: Create `VerifyOptions` (e.g., `TextVerifyOptions`, `DigitalVerifyOptions`, `BarcodeVerifyOptions`) to specify which signatures to verify.
        - name: Define predicate function.
          text: Create a `java.util.function.Predicate<BaseSignature>` (lambda expression) that defines the filtering criteria, such as filtering by page number, signature type, position, text content, or any other signature property.
        - name: Execute the verification with predicate.
          text: Call the `verify` method with the verification options and predicate function. The method verifies the document with the options and then keeps the verified signatures that satisfy the predicate.
        - name: Process the verified results.
          text: Inspect the returned `List<BaseSignature>` containing only the verified signatures that match your predicate criteria, and process them as needed.
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) supports predicate functions (`java.util.function.Predicate<BaseSignature>`) in the verification process. The [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class provides two `verify` overloads that take a predicate:

```java
public final List<BaseSignature> verify(VerifyOptions verifyOptions, Predicate<BaseSignature> predicate) throws Exception
public final List<BaseSignature> verify(List<VerifyOptions> verifyOptionsList, Predicate<BaseSignature> predicate) throws Exception
```

Both methods verify the document with the given [VerifyOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.verify/verifyoptions/) first, then apply the predicate to the signatures that passed verification (the `getSucceeded()` list of the [VerificationResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/verificationresult/)) and return the ones that satisfy it. A `null` predicate returns all verified signatures.

Here are the steps to verify Barcode signature within the document with GroupDocs.Signature:

* Create new instance of [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class and pass source document path as a constructor parameter.
* Instantiate the [BarcodeVerifyOptions](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.options.verify/barcodeverifyoptions/) object according to your requirements.
* Define a predicate with the criteria for the verified signatures, such as checking that the signature type is Barcode and that the SignatureId equals "123".
* Call the `verify` method and pass the options and the predicate to it.
* Process the returned list of verified signatures if needed.

This example shows how to verify Barcode signature and filter the result with a predicate.

```java
Signature signature = new Signature("sample.pdf");
try
{
    // verify Barcode signatures with the text "12345678"
    BarcodeVerifyOptions options = new BarcodeVerifyOptions("12345678");

    // keep only verified Barcode signatures with a specific SignatureId
    List<BaseSignature> signatures = signature.verify(options, signatureItem ->
        signatureItem.getSignatureType() == SignatureType.Barcode &&
        "123".equals(signatureItem.getSignatureId()));

    // Optionally, process the verified signatures here.
    System.out.println("Verified " + signatures.size() + " Barcode signature(s) with SignatureId 123");
}
finally
{
    signature.dispose();
}
```

## Verify several signature types with one predicate

Pass a list of verification options to verify several signature types at once. This example keeps the verified signatures on the first three pages and, for digital signatures, only the valid ones.

```java
Signature signature = new Signature("sample_signed_digital.pdf");
try
{
    TextVerifyOptions textVerifyOptions = new TextVerifyOptions();
    textVerifyOptions.setText("Approved");

    List<VerifyOptions> verifyOptionsList = new ArrayList<VerifyOptions>();
    verifyOptionsList.add(new DigitalVerifyOptions());
    verifyOptionsList.add(textVerifyOptions);

    // keep verified signatures on the first 3 pages; digital signatures must also be valid
    List<BaseSignature> filteredSignatures = signature.verify(verifyOptionsList, sig ->
        sig.getPageNumber() >= 1 &&
        sig.getPageNumber() <= 3 &&
        (!(sig instanceof DigitalSignature) || ((DigitalSignature) sig).isValid()));

    System.out.println("Verified " + filteredSignatures.size() + " signatures on pages 1-3");
    for (BaseSignature sig : filteredSignatures)
    {
        System.out.println("  " + sig.getSignatureType() + " signature on page " + sig.getPageNumber());
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
