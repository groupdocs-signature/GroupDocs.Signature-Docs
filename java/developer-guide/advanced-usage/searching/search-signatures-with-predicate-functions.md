---
id: search-signatures-with-predicate-functions
url: signature/java/search-signatures-with-predicate-functions
title: How to search signatures with predicate functions
weight: 4
description: "This article explains how to search signatures using predicate functions (java.util.function.Predicate) with GroupDocs.Signature for Java API to filter search results based on custom criteria."
keywords: search signatures, predicate functions, filter signatures, lambda expressions, custom search criteria, java.util.function.Predicate
productName: GroupDocs.Signature for Java
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Search Signatures in Documents with Predicate Functions
        description: This article explains how to search signatures using predicate functions to filter results based on custom criteria with GroupDocs.Signature for Java APIs.
        productCode: signature
        productPlatform: java 
    showVideo: True
    howTo:
        name: How to search signatures with predicate functions
        description: This topic explains how to search signatures in documents using predicate functions (lambda expressions) to filter results in Java. 
        steps:
        - name: Load the document for searching.
          text: Create an instance of the `Signature` class by passing the local file path as a parameter.
        - name: Define search options (optional).
          text: Create a list of `SearchOptions` to specify which signature types to search for, or omit this parameter to search all signature types.
        - name: Define predicate function.
          text: Create a `java.util.function.Predicate<BaseSignature>` (lambda expression) that defines the filtering criteria, such as filtering by page number, signature type, text content, position, or any other signature property.
        - name: Execute the search with predicate.
          text: Call the `search` method with the search options (if any) and predicate function to retrieve signatures that match both the search options and the predicate criteria.
        - name: Process the filtered results.
          text: Inspect the returned `SearchResult` or `List<BaseSignature>` containing only the signatures that match your predicate criteria, and process them as needed.
---

# Search with Predicate Functions

## Overview

The [Signature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature/signature/) class of [**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) provides `search` methods that accept predicate functions (`java.util.function.Predicate`) to filter signatures based on custom criteria. This allows you to perform more flexible and targeted signature searches by applying custom filtering logic to the search results.

## Benefits

- **Flexible Filtering**: Filter signatures based on any custom criteria using lambda expressions
- **Type-Safe**: Strongly typed predicates ensure compile-time safety
- **Easy to Use**: Simple lambda expressions make filtering intuitive
- **Comprehensive Results**: Search across all signature types or specific types, then filter as needed

## Available Methods

1. `search(List<SearchOptions> searchOptionsList, Predicate<BaseSignature> predicate)`
2. `search(Predicate<BaseSignature> predicate)`
3. `search(Class<T> typeOfT, SearchOptions searchOptions, Predicate<T> predicate)`

## Method Signatures

```java
public final SearchResult search(List<SearchOptions> searchOptionsList, Predicate<BaseSignature> predicate) throws Exception
public final List<BaseSignature> search(Predicate<BaseSignature> predicate) throws Exception
public final <T extends BaseSignature> List<T> search(Class<T> typeOfT, SearchOptions searchOptions, Predicate<T> predicate) throws Exception
```

## How It Works

The `search` methods with predicates:

1. **Search First**: All signatures matching the search options are found. `search(Predicate)` takes no options and searches for text, image, digital, barcode, QR-code and metadata signatures.
2. **Filter Results**: The predicate is applied to filter the search results
3. **Return Filtered Results**: Only signatures matching the predicate are returned

The predicate receives a [BaseSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/basesignature/). Use `instanceof` and a cast to read the properties of a specific signature class, such as [TextSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/textsignature/) or [QrCodeSignature](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain.signatures/qrcodesignature/).

## Examples

### Example 1: Search and Filter by Text Content

```java
Signature signature = new Signature("document.pdf");
try
{
    // Search for text signatures
    List<SearchOptions> searchOptions = new ArrayList<SearchOptions>();
    searchOptions.add(new TextSearchOptions());

    // Filter to only signatures containing "Approved"
    SearchResult result = signature.search(searchOptions,
        sig -> sig instanceof TextSignature && ((TextSignature) sig).getText().contains("Approved"));

    for (BaseSignature sig : result.getSignatures())
    {
        System.out.println("Found: " + ((TextSignature) sig).getText());
    }
}
finally
{
    signature.dispose();
}
```

### Example 2: Search All Signature Types with Filtering

```java
Signature signature = new Signature("document.pdf");
try
{
    // Search all signature types and filter by type
    List<BaseSignature> result = signature.search(
        sig -> sig.getSignatureType() == SignatureType.Digital);

    System.out.println("Found " + result.size() + " digital signatures");
}
finally
{
    signature.dispose();
}
```

### Example 3: Search and Filter by Multiple Criteria

```java
Signature signature = new Signature("document.pdf");
try
{
    List<SearchOptions> searchOptions = new ArrayList<SearchOptions>();
    searchOptions.add(new TextSearchOptions());
    searchOptions.add(new BarcodeSearchOptions());

    // Filter signatures by page and type
    SearchResult result = signature.search(searchOptions, sig ->
        sig.getPageNumber() == 1 &&
        (sig.getSignatureType() == SignatureType.Text || sig.getSignatureType() == SignatureType.Barcode));

    System.out.println("Found " + result.getSignatures().size() + " signatures on page 1");
}
finally
{
    signature.dispose();
}
```

### Example 4: Search Digital Signatures by Sign Time

```java
Signature signature = new Signature("document.pdf");
try
{
    Date startDate = new GregorianCalendar(2024, Calendar.JANUARY, 1).getTime();
    Date endDate = new GregorianCalendar(2024, Calendar.DECEMBER, 31, 23, 59, 59).getTime();

    // Search all signatures and keep digital signatures signed in 2024
    List<BaseSignature> result = signature.search(sig ->
    {
        if (!(sig instanceof DigitalSignature))
        {
            return false;
        }
        Date signTime = ((DigitalSignature) sig).getSignTime();
        return signTime != null && !signTime.before(startDate) && !signTime.after(endDate);
    });

    System.out.println("Found " + result.size() + " signatures in 2024");
}
finally
{
    signature.dispose();
}
```

### Example 5: Search and Filter by Signature Size

```java
Signature signature = new Signature("document.pdf");
try
{
    List<SearchOptions> searchOptions = new ArrayList<SearchOptions>();
    searchOptions.add(new ImageSearchOptions());

    // Filter image signatures by size
    SearchResult result = signature.search(searchOptions, sig ->
    {
        if (sig instanceof ImageSignature)
        {
            ImageSignature imgSig = (ImageSignature) sig;
            return imgSig.getWidth() > 200 && imgSig.getHeight() > 200;
        }
        return false;
    });

    System.out.println("Found " + result.getSignatures().size() + " large image signatures");
}
finally
{
    signature.dispose();
}
```

### Example 6: Find Signatures in Specific Region

```java
Signature signature = new Signature("document.pdf");
try
{
    // Define a region (rectangle)
    int regionLeft = 100;
    int regionTop = 100;
    int regionWidth = 200;
    int regionHeight = 200;

    List<BaseSignature> result = signature.search(sig ->
        sig.getLeft() >= regionLeft &&
        sig.getTop() >= regionTop &&
        sig.getLeft() + sig.getWidth() <= regionLeft + regionWidth &&
        sig.getTop() + sig.getHeight() <= regionTop + regionHeight);

    System.out.println("Found " + result.size() + " signatures in the specified region");
}
finally
{
    signature.dispose();
}
```

### Example 7: Search Signatures with Specific Properties

```java
Signature signature = new Signature("document.pdf");
try
{
    List<SearchOptions> searchOptions = new ArrayList<SearchOptions>();
    searchOptions.add(new QrCodeSearchOptions());

    // Search for QR codes with specific data
    SearchResult result = signature.search(searchOptions, sig ->
    {
        if (sig instanceof QrCodeSignature)
        {
            String text = ((QrCodeSignature) sig).getText();
            return text != null && (text.startsWith("https://") || text.contains("contract-id:"));
        }
        return false;
    });

    for (QrCodeSignature qrSig : result.toList(QrCodeSignature.class))
    {
        System.out.println("QR Code: " + qrSig.getText());
    }
}
finally
{
    signature.dispose();
}
```

### Example 8: Search by Signature Type and Page

```java
Signature signature = new Signature("document.pdf");
try
{
    // Search all signatures and filter by type and page
    List<BaseSignature> result = signature.search(sig ->
        sig.getSignatureType() == SignatureType.Text &&
        sig.getPageNumber() == 1);

    System.out.println("Found " + result.size() + " text signatures on page 1");
}
finally
{
    signature.dispose();
}
```

### Example 9: Search a Single Signature Type with a Typed Predicate

The typed overload passes the signature class, so the predicate gets that class directly and no cast is needed:

```java
// Search QR-code signatures and keep only those on the first page
QrCodeSearchOptions options = new QrCodeSearchOptions();
List<QrCodeSignature> signatures = signature.search(QrCodeSignature.class, options,
    qrSig -> qrSig.getPageNumber() == 1 && qrSig.getText() != null);

for (QrCodeSignature qrSig : signatures)
{
    System.out.println("QR Code on page 1: " + qrSig.getText());
}
```

## Common Use Cases

### 1. Find Signatures by Author

```java
Signature signature = new Signature("document.pdf");
try
{
    List<SearchOptions> searchOptions = new ArrayList<SearchOptions>();
    searchOptions.add(new DigitalSearchOptions());

    // Keep digital signatures whose certificate subject contains "John Doe"
    SearchResult result = signature.search(searchOptions, sig ->
    {
        if (!(sig instanceof DigitalSignature))
        {
            return false;
        }
        X509Certificate certificate = ((DigitalSignature) sig).getX509Certificate();
        return certificate != null &&
               certificate.getSubjectX500Principal().getName().contains("John Doe");
    });

    System.out.println("Found " + result.getSignatures().size() + " signatures by John Doe");
}
finally
{
    signature.dispose();
}
```

### 2. Search Signatures by Barcode Value

```java
Signature signature = new Signature("document.pdf");
try
{
    List<SearchOptions> searchOptions = new ArrayList<SearchOptions>();
    searchOptions.add(new BarcodeSearchOptions());

    SearchResult result = signature.search(searchOptions,
        sig -> sig instanceof BarcodeSignature &&
               ((BarcodeSignature) sig).getText().startsWith("PROD-"));

    for (BarcodeSignature barcodeSig : result.toList(BarcodeSignature.class))
    {
        System.out.println("Product Barcode: " + barcodeSig.getText());
    }
}
finally
{
    signature.dispose();
}
```

### 3. Find Signatures by Position and Size

```java
Signature signature = new Signature("document.pdf");
try
{
    // Find signatures in bottom-right corner that are large
    List<BaseSignature> result = signature.search(sig ->
        sig.getLeft() > 400 &&
        sig.getTop() > 600 &&
        sig.getWidth() > 150 &&
        sig.getHeight() > 50);

    System.out.println("Found " + result.size() + " large signatures in bottom-right");
}
finally
{
    signature.dispose();
}
```

### 4. Search Multiple Signature Types with Complex Filtering

```java
Signature signature = new Signature("document.pdf");
try
{
    List<SearchOptions> searchOptions = new ArrayList<SearchOptions>();
    searchOptions.add(new TextSearchOptions());
    searchOptions.add(new ImageSearchOptions());
    searchOptions.add(new QrCodeSearchOptions());

    // Find signatures that are either text with specific content,
    // or QR codes with URLs, or large images
    SearchResult result = signature.search(searchOptions, sig ->
    {
        if (sig instanceof TextSignature)
        {
            return ((TextSignature) sig).getText().contains("APPROVED");
        }
        if (sig instanceof QrCodeSignature)
        {
            return ((QrCodeSignature) sig).getText().startsWith("http");
        }
        if (sig instanceof ImageSignature)
        {
            return sig.getWidth() > 300 && sig.getHeight() > 300;
        }
        return false;
    });

    System.out.println("Found " + result.getSignatures().size() + " matching signatures");
}
finally
{
    signature.dispose();
}
```

## Best Practices

### 1. Use Specific Predicates

**Good:**
```java
// Specific and clear predicate
SearchResult specific = signature.search(searchOptions,
    sig -> sig instanceof TextSignature && "Approved".equals(((TextSignature) sig).getText()));
```

**Avoid:**
```java
// Too generic, returns every signature of every type
List<BaseSignature> everything = signature.search(sig -> true);
```

### 2. Handle Null Checks

```java
// Safe predicate with null checks
SearchResult safe = signature.search(searchOptions, sig ->
{
    if (sig == null) return false;
    if (sig instanceof TextSignature)
    {
        String text = ((TextSignature) sig).getText();
        return text != null && !text.isEmpty() && text.contains("Contract");
    }
    return false;
});
```

### 3. Combine Multiple Conditions

```java
// Clear, readable predicate with multiple conditions
SearchResult combined = signature.search(searchOptions, sig ->
    sig.getPageNumber() == 1 &&
    sig.getSignatureType() == SignatureType.Text &&
    sig instanceof TextSignature &&
    ((TextSignature) sig).getText().length() > 10);
```

### 4. Reusable Predicates

`java.util.function.Predicate` provides the `and`, `or` and `negate` methods to combine predicates:

```java
// Define reusable predicates
Predicate<BaseSignature> isOnFirstPage = sig -> sig.getPageNumber() == 1;
Predicate<BaseSignature> isTextSignature = sig -> sig.getSignatureType() == SignatureType.Text;
Predicate<BaseSignature> isLargeSignature = sig -> sig.getWidth() > 200 && sig.getHeight() > 200;

// Combine predicates
SearchResult result = signature.search(searchOptions,
    isOnFirstPage.and(isTextSignature).and(isLargeSignature));
```

### 5. Use Appropriate Search Options

```java
// Use specific search options to narrow down the initial search
TextSearchOptions textOptions = new TextSearchOptions("Contract");
List<SearchOptions> searchOptions = new ArrayList<SearchOptions>();
searchOptions.add(textOptions);

// Then apply additional filtering with the predicate
SearchResult result = signature.search(searchOptions,
    sig -> sig.getPageNumber() == 1);
```

## Error Handling

### Null Parameter Validation

`search(Predicate)` requires a predicate: passing `null` throws an unchecked exception with the message "Value cannot be null. Parameter name: predicate". The overloads that take search options treat a `null` predicate as "no filter" and return all found signatures.

```java
Signature signature = new Signature("document.pdf");
try
{
    // A null predicate is rejected by search(Predicate)
    List<BaseSignature> result = signature.search((Predicate<BaseSignature>) null);
}
catch (RuntimeException ex)
{
    System.out.println("Error: " + ex.getMessage());
}
finally
{
    signature.dispose();
}
```

## Return Values

- **`search(List<SearchOptions>, Predicate<BaseSignature>)`**: Returns [SearchResult](https://reference.groupdocs.com/signature/java/com.groupdocs.signature.domain/searchresult/). Its `getSignatures()` list holds the filtered signatures. The statistics of the search, such as `getProcessingTime()`, are not filled in for this filtered result.
- **`search(Predicate<BaseSignature>)`**: Returns `List<BaseSignature>` - A list of filtered signatures
- **`search(Class<T>, SearchOptions, Predicate<T>)`**: Returns `List<T>` - A typed list of filtered signatures
- **Empty Results**: Returns empty collection if no signatures match the predicate

### Working with SearchResult

```java
SearchResult result = signature.search(searchOptions, predicate);

// Access filtered signatures
List<BaseSignature> signatures = result.getSignatures();

// Convert to a typed list
List<TextSignature> textSignatures = result.toList(TextSignature.class);
```

`toList` converts every item of the result to the requested class and puts `null` in place of an item of another class, so use it when the search options cover a single signature type.

## Comparison: With vs Without Predicate

### Without Predicate

```java
// Get all search results
SearchResult result = signature.search(searchOptions);
List<BaseSignature> allSignatures = result.getSignatures();

// Manual filtering
List<BaseSignature> filtered = allSignatures.stream()
    .filter(sig -> sig.getPageNumber() == 1)
    .collect(Collectors.toList());
```

### With Predicate

```java
// Filtered during search (more concise)
SearchResult result = signature.search(searchOptions,
    sig -> sig.getPageNumber() == 1);
List<BaseSignature> filtered = result.getSignatures();
```

**Advantages:**
- More concise code
- Cleaner API
- Single method call instead of search + filter

## Summary

The predicate-based `search` methods provide a powerful and flexible way to search for signatures in GroupDocs.Signature. They allow you to:

- Filter signatures based on any custom criteria
- Search across all signature types or specific types
- Write more readable and maintainable code
- Handle complex filtering scenarios with ease

Use these methods when you need to find a subset of signatures based on specific criteria, rather than searching all signatures and filtering manually.

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
