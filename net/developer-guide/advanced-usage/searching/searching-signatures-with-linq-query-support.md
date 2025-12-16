---
id: search-signatures-with-predicate-functions
url: signature/net/search-signatures-with-predicate-functions
title: How to search signatures with predicate functions
weight: 4
description: "This article explains how to search signatures using predicate functions (Func<BaseSignature, bool>) with GroupDocs.Signature API to filter search results based on custom criteria."
keywords: search signatures, predicate functions, filter signatures, lambda expressions, custom search criteria, LINQ queries
productName: GroupDocs.Signature for .NET 
toc: True
structuredData:
    showOrganization: True
    application:    
        name: Search Signatures in Documents with Predicate Functions
        description: This article explains how to search signatures using predicate functions to filter results based on custom criteria with GroupDocs.Signature for .NET APIs.
        productCode: signature
        productPlatform: net 
    showVideo: True
    howTo:
        name: How to search signatures with predicate functions
        description: This topic explains how to search signatures in documents using predicate functions (lambda expressions) to filter results in C#. 
        steps:
        - name: Load the document for searching.
          text: Create an instance of the `Signature` class by passing the local file path as a parameter.
        - name: Define search options (optional).
          text: Create a list of `SearchOptions` to specify which signature types to search for, or omit this parameter to search all signature types.
        - name: Define predicate function.
          text: Create a predicate function (lambda expression) that defines the filtering criteria, such as filtering by page number, signature type, text content, position, or any other signature property.
        - name: Execute the search with predicate.
          text: Call the `Search` method with the search options (if any) and predicate function to retrieve signatures that match both the search options and the predicate criteria.
        - name: Process the filtered results.
          text: Inspect the returned `SearchResult` or `List<BaseSignature>` containing only the signatures that match your predicate criteria, and process them as needed.
---

# Search with Predicate Functions

## Overview

The GroupDocs.Signature library provides enhanced `Search` methods that accept predicate functions (`Func<BaseSignature, bool>`) to filter signatures based on custom criteria. This allows you to perform more flexible and targeted signature searches by applying custom filtering logic to the search results.

## Benefits

- **Flexible Filtering**: Filter signatures based on any custom criteria using lambda expressions
- **Type-Safe**: Strongly typed predicates ensure compile-time safety
- **Easy to Use**: Simple lambda expressions make filtering intuitive
- **Comprehensive Results**: Search across all signature types or specific types, then filter as needed

## Available Methods

1. `Search(List<SearchOptions> searchOptionsList, Func<BaseSignature, bool> predicate)`
2. `Search(Func<BaseSignature, bool> predicate)`

## Method Signatures

```csharp
public SearchResult Search(List<SearchOptions> searchOptionsList, Func<BaseSignature, bool> predicate)
public List<BaseSignature> Search(Func<BaseSignature, bool> predicate)
```

## How It Works

The `Search` methods with predicates:

1. **Search First**: All signatures matching the search options are found (or all signatures if no options provided)
2. **Filter Results**: The predicate is applied to filter the search results
3. **Return Filtered Results**: Only signatures matching the predicate are returned

## Examples

### Example 1: Search and Filter by Text Content

```csharp
using GroupDocs.Signature;
using GroupDocs.Signature.Options;
using GroupDocs.Signature.Domain;

using (Signature signature = new Signature("document.pdf"))
{
    // Search for text signatures
    List<SearchOptions> searchOptions = new List<SearchOptions>
    {
        new TextSearchOptions()
    };
    
    // Filter to only signatures containing "Approved"
    SearchResult result = signature.Search(searchOptions, 
        sig => sig is TextSignature textSig && textSig.Text.Contains("Approved"));
    
    foreach (BaseSignature sig in result.Signatures)
    {
        Console.WriteLine($"Found: {((TextSignature)sig).Text}");
    }
}
```

### Example 2: Search All Signature Types with Filtering

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    // Search all signature types and filter by type
    List<BaseSignature> result = signature.Search(
        sig => sig.SignatureType == SignatureType.Digital);
    
    Console.WriteLine($"Found {result.Count} digital signatures");
}
```

### Example 3: Search and Filter by Multiple Criteria

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    List<SearchOptions> searchOptions = new List<SearchOptions>
    {
        new TextSearchOptions(),
        new BarcodeSearchOptions()
    };
    
    // Filter signatures by page and type
    SearchResult result = signature.Search(searchOptions, sig =>
        sig.PageNumber == 1 && 
        (sig.SignatureType == SignatureType.Text || sig.SignatureType == SignatureType.Barcode));
    
    Console.WriteLine($"Found {result.Signatures.Count} signatures on page 1");
}
```

### Example 4: Search Signatures by Date Range

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    DateTime startDate = new DateTime(2024, 1, 1);
    DateTime endDate = new DateTime(2024, 12, 31);
    
    // Search and filter by signature date
    List<BaseSignature> result = signature.Search(sig =>
        sig.SignDate.HasValue &&
        sig.SignDate.Value >= startDate &&
        sig.SignDate.Value <= endDate);
    
    Console.WriteLine($"Found {result.Count} signatures in 2024");
}
```

### Example 5: Search and Filter by Signature Size

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    List<SearchOptions> searchOptions = new List<SearchOptions>
    {
        new ImageSearchOptions()
    };
    
    // Filter image signatures by size
    SearchResult result = signature.Search(searchOptions, sig =>
    {
        if (sig is ImageSignature imgSig)
        {
            return imgSig.Width > 200 && imgSig.Height > 200;
        }
        return false;
    });
    
    Console.WriteLine($"Found {result.Signatures.Count} large image signatures");
}
```

### Example 6: Find Signatures in Specific Region

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    // Define a region (rectangle)
    int regionLeft = 100;
    int regionTop = 100;
    int regionWidth = 200;
    int regionHeight = 200;
    
    List<BaseSignature> result = signature.Search(sig =>
        sig.Left >= regionLeft &&
        sig.Top >= regionTop &&
        sig.Left + sig.Width <= regionLeft + regionWidth &&
        sig.Top + sig.Height <= regionTop + regionHeight);
    
    Console.WriteLine($"Found {result.Count} signatures in the specified region");
}
```

### Example 7: Search Signatures with Specific Properties

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    List<SearchOptions> searchOptions = new List<SearchOptions>
    {
        new QRCodeSearchOptions()
    };
    
    // Search for QR codes with specific data
    SearchResult result = signature.Search(searchOptions, sig =>
    {
        if (sig is QrCodeSignature qrSig)
        {
            return qrSig.Text.StartsWith("https://") ||
                   qrSig.Text.Contains("contract-id:");
        }
        return false;
    });
    
    foreach (QrCodeSignature qrSig in result.ToList<QrCodeSignature>())
    {
        Console.WriteLine($"QR Code: {qrSig.Text}");
    }
}
```

### Example 8: Search by Signature Type and Page

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    // Search all signatures and filter by type and page
    List<BaseSignature> result = signature.Search(sig =>
        sig.SignatureType == SignatureType.Text &&
        sig.PageNumber == 1);
    
    Console.WriteLine($"Found {result.Count} text signatures on page 1");
}
```

## Common Use Cases

### 1. Find Signatures by Author

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    DigitalSearchOptions searchOptions = new DigitalSearchOptions();
    
    List<BaseSignature> result = signature.Search(
        new List<SearchOptions> { searchOptions }, 
        sig => sig is DigitalSignature digitalSig && 
               digitalSig.SignerName == "John Doe");
    
    Console.WriteLine($"Found {result.Count} signatures by John Doe");
}
```

### 2. Search Signatures by Barcode Value

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    BarcodeSearchOptions searchOptions = new BarcodeSearchOptions();
    
    SearchResult result = signature.Search(
        new List<SearchOptions> { searchOptions },
        sig => sig is BarcodeSignature barcodeSig &&
               barcodeSig.Text.StartsWith("PROD-"));
    
    foreach (BarcodeSignature barcodeSig in result.ToList<BarcodeSignature>())
    {
        Console.WriteLine($"Product Barcode: {barcodeSig.Text}");
    }
}
```

### 3. Find Signatures by Position and Size

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    // Find signatures in bottom-right corner that are large
    List<BaseSignature> result = signature.Search(sig =>
        sig.Left > 400 &&
        sig.Top > 600 &&
        sig.Width > 150 &&
        sig.Height > 50);
    
    Console.WriteLine($"Found {result.Count} large signatures in bottom-right");
}
```

### 4. Search Multiple Signature Types with Complex Filtering

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    List<SearchOptions> searchOptions = new List<SearchOptions>
    {
        new TextSearchOptions(),
        new ImageSearchOptions(),
        new QRCodeSearchOptions()
    };
    
    // Find signatures that are either text with specific content, 
    // or QR codes with URLs, or large images
    SearchResult result = signature.Search(searchOptions, sig =>
    {
        if (sig is TextSignature textSig)
        {
            return textSig.Text.Contains("APPROVED");
        }
        if (sig is QrCodeSignature qrSig)
        {
            return qrSig.Text.StartsWith("http");
        }
        if (sig is ImageSignature imgSig)
        {
            return imgSig.Width > 300 && imgSig.Height > 300;
        }
        return false;
    });
    
    Console.WriteLine($"Found {result.Signatures.Count} matching signatures");
}
```

## Best Practices

### 1. Use Specific Predicates

**Good:**
```csharp
// Specific and clear predicate
SearchResult result = signature.Search(searchOptions, 
    sig => sig is TextSignature textSig && textSig.Text == "Approved");
```

**Avoid:**
```csharp
// Too generic, might match unintended signatures
List<BaseSignature> result = signature.Search(sig => true);
```

### 2. Handle Null Checks

```csharp
// Safe predicate with null checks
SearchResult result = signature.Search(searchOptions, sig =>
{
    if (sig == null) return false;
    if (sig is TextSignature textSig)
    {
        return !string.IsNullOrEmpty(textSig.Text) && 
               textSig.Text.Contains("Contract");
    }
    return false;
});
```

### 3. Combine Multiple Conditions

```csharp
// Clear, readable predicate with multiple conditions
SearchResult result = signature.Search(searchOptions, sig =>
    sig.PageNumber == 1 &&
    sig.SignatureType == SignatureType.Text &&
    sig is TextSignature textSig &&
    textSig.Text.Length > 10);
```

### 4. Reusable Predicates

```csharp
// Define reusable predicates
Func<BaseSignature, bool> isOnFirstPage = sig => sig.PageNumber == 1;
Func<BaseSignature, bool> isTextSignature = sig => sig.SignatureType == SignatureType.Text;
Func<BaseSignature, bool> isLargeSignature = sig => sig.Width > 200 && sig.Height > 200;

// Combine predicates
SearchResult result = signature.Search(searchOptions, sig =>
    isOnFirstPage(sig) && isTextSignature(sig) && isLargeSignature(sig));
```

### 5. Use Appropriate Search Options

```csharp
// Good: Use specific search options to narrow down initial search
List<SearchOptions> searchOptions = new List<SearchOptions>
{
    new TextSearchOptions { Text = "Contract" }
};

// Then apply additional filtering with predicate
SearchResult result = signature.Search(searchOptions, 
    sig => sig.PageNumber == 1);
```

## Error Handling

### Null Parameter Validation

The methods throw `ArgumentNullException` if required parameters are null:

```csharp
try
{
    using (Signature signature = new Signature("document.pdf"))
    {
        // This will throw ArgumentNullException
        SearchResult result = signature.Search(null, sig => true);
    }
}
catch (ArgumentNullException ex)
{
    Console.WriteLine($"Error: {ex.Message}");
}
```

### Safe Usage Pattern

```csharp
using (Signature signature = new Signature("document.pdf"))
{
    if (searchOptions != null && predicate != null)
    {
        SearchResult result = signature.Search(searchOptions, predicate);
        // Process results
    }
}
```

## Return Values

- **`Search(List<SearchOptions>, Func<...>)`**: Returns `SearchResult` - Contains filtered signatures and metadata (processing time, document size, etc.)
- **`Search(Func<...>)`**: Returns `List<BaseSignature>` - A list of filtered signatures
- **Empty Results**: Returns empty collection if no signatures match the predicate

### Working with SearchResult

```csharp
SearchResult result = signature.Search(searchOptions, predicate);

// Access filtered signatures
List<BaseSignature> signatures = result.Signatures;

// Access metadata
Console.WriteLine($"Processing time: {result.ProcessingTime}ms");
Console.WriteLine($"Source document size: {result.SourceDocumentSize} bytes");
Console.WriteLine($"Destination document size: {result.DestinDocumentSize} bytes");
```

## Comparison: With vs Without Predicate

### Without Predicate

```csharp
// Get all search results
SearchResult result = signature.Search(searchOptions);
List<BaseSignature> allSignatures = result.Signatures;

// Manual filtering
List<BaseSignature> filtered = allSignatures
    .Where(sig => sig.PageNumber == 1)
    .ToList();
```

### With Predicate

```csharp
// Filtered during search (more concise)
SearchResult result = signature.Search(searchOptions, 
    sig => sig.PageNumber == 1);
List<BaseSignature> filtered = result.Signatures;
```

**Advantages:**
- More concise code
- Cleaner API
- Single method call instead of search + filter

## Summary

The predicate-based `Search` methods provide a powerful and flexible way to search for signatures in GroupDocs.Signature. They allow you to:

- Filter signatures based on any custom criteria
- Search across all signature types or specific types
- Write more readable and maintainable code
- Handle complex filtering scenarios with ease

Use these methods when you need to find a subset of signatures based on specific criteria, rather than searching all signatures and filtering manually.

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
