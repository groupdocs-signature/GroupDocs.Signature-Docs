---
id: migration-notes
url: signature/python-net/migration-notes
title: Migration Notes
weight: 3
description: "How to migrate from earlier versions of GroupDocs.Signature for Python via .NET"
keywords: 
productName: GroupDocs.Signature for Python via .NET

---
### Why To Migrate?
  
Here are the key reasons to use the new updated API provided by GroupDocs.Signature for Python via .NET since version 19.8:

* [Signature](https://reference.groupdocs.com/signature/python-net/groupdocs.signature/signature) class introduced as a **single entry point** to sign the document with various signature types with further verification and search with any supported file format.
* Document **signature options** ([SignOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/signoptions)), **verify options** ([VerifyOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/verifyoptions)) and **search options** ([SearchOptions](https://reference.groupdocs.com/signature/python-net/groupdocs.signature.options/searchoptions)) were unified for all document types. Instead of using document related options now options are related to signature type only.
* The overall document related classes were unified to common.
* Product architecture was redesigned from scratch in order to simplify passing options and classes to manipulate signature.
* Document information and preview generation procedures were simplified.

### How To Migrate?

Here is a brief comparison of how to sign document with text signature using old and new API.  

#### Old coding style

```python
# setup Signature configuration
sign_config = SignatureConfig()
sign_config.storage_path = "c:/Aspose/Test/Storage"
sign_config.output_path = "c:/Aspose/Test/Output"

# instantiating the signature handler
handler = SignatureHandler(sign_config)

# setup text signature options
sign_options = PdfSignTextOptions("John Smith")
sign_options.left = 100
sign_options.top = 100
sign_options.width = 100
sign_options.height = 30
sign_options.fore_color = Color.RED
sign_options.font = SignatureFont(font_size=12, font_family="Comic Sans MS")

save_options = SaveOptions()
save_options.output_type = OutputType.STRING
save_options.output_file_name = "signed.pdf"

# sign document
signed_path = handler.sign("test.pdf", sign_options, save_options)
print("Signed file path is: " + signed_path)
```

#### New coding style

```python
from groupdocs.signature import Signature, TextSignOptions, SignatureFont
from groupdocs.signature.options import Color

# Initialize signature with source document
with Signature("sample.pdf") as signature:
    # Create text signature options
    options = TextSignOptions("John Smith")
    options.left = 100
    options.top = 100
    options.width = 100
    options.height = 30
    options.fore_color = Color.RED
    options.font = SignatureFont(size=12, family_name="Comic Sans MS")
    
    # Sign document to file
    signature.sign("signed.pdf", options)
```

For more code examples and specific use cases please refer to our [Developer Guide]({{< ref "signature/python-net/developer-guide/_index.md" >}}) documentation or [GitHub](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python) samples and showcases.
