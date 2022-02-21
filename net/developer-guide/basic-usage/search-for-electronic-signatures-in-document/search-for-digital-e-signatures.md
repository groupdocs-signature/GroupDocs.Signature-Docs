---
id: search-for-digital-e-signatures
url: signature/net/search-for-digital-e-signatures
title: Search for Digital e-signatures
weight: 2
description: "This topic explains how to search for digital electronic signatures across the documents with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET
hideChildren: False
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) offers an ability to find Digital signatures that are applied to document and returns its digital signature certificate.  
Please follow these steps to search for Digital signatures within the document:

* Create new instance of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class and pass source document path as a constructor parameter.
* Instantiate the [DigitalSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/digitalsearchoptions) object according to your requirements and specify search options
* Call [Search](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature/methods/search/_1) method of [Signature](https://apireference.groupdocs.com/net/signature/groupdocs.signature/signature) class instance and pass [DigitalSearchOptions](https://apireference.groupdocs.com/net/signature/groupdocs.signature.options/digitalsearchoptions) to it.

This example shows how to search for Digital signature in the document and analyze digital signature certificate.

```csharp
            using (Signature signature = new Signature("spreadsheet.xlsx"))
            {
                // search for signatures in document
                List<DigitalSignature> signatures = signature.Search<DigitalSignature>(SignatureType.Digital);

                Console.WriteLine("\nSource document contains following signatures.");
                foreach (var digitalSignature in signatures)
                {
                    Console.WriteLine("Digital signature found from {0} with validation flag {1}. Certificate SN {2}",
                    digitalSignature.SignTime, digitalSignature.IsValid, digitalSignature.Certificate?.SerialNumber);
                }
            }
```


