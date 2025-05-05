---
id: how-to-run-examples
url: signature/python-net/how-to-run-examples
title: How to Run Examples
weight: 3
description: "This article describes how to run Python digital signature API code examples. We offer multiple solutions on how you can run GroupDocs.Signature examples, by building your own or using our examples out-of-the-box."
keywords: digital signature API, python signature examples
productName: GroupDocs.Signature for Python via .NET
hideChildren: False 
toc: True
---
This article describes how to run Python digital signature API code examples.
{{< alert style="warning" >}}Before running an example make sure that GroupDocs.Signature has been installed successfully.{{< /alert >}}

We offer multiple solutions on how you can run GroupDocs.Signature examples, by building your own or using our examples out-of-the-box.

Please choose one from the following list:

## Build project from scratch

* Create a new Python project directory and set up a virtual environment:

```bash
# Create project directory
mkdir signature_project
cd signature_project

# Create and activate virtual environment
python -m venv venv
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Install GroupDocs.Signature
pip install groupdocs-signature
```

* Create a new Python file (e.g., `main.py`) and code your first application with **GroupDocs.Signature for Python** like this:

```python
import groupdocs.signature as signature

# The path to the documents directory.
file_path = "sample.docx"  # NOTE: Put here actual path for your document
output_file_path = "output/signed.docx"

# Sign document with text signature
signature_handler = signature.Signature(file_path)
text_sign_options = signature.TextSignOptions("John Smith")
signature_handler.sign(output_file_path, text_sign_options)
```

* Run your project:
```bash
python main.py
```

* Signed document will appear in the "output" directory.

## Run examples from GitHub

The complete examples package of **GroupDocs.Signature for Python** is hosted on [GitHub](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python). You can either download the ZIP file or clone the repository:

```bash
git clone https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python
cd GroupDocs.Signature-for-Python
```

The repository structure will look like this:
```
GroupDocs.Signature-for-Python/
├── Examples/
│   ├── BasicUsage/
│   ├── AdvancedUsage/
│   └── ...
├── Resources/
│   ├── sample.docx
│   ├── sample.pdf
│   └── ...
└── requirements.txt
```

To run the examples:

1. Set up a virtual environment and install dependencies:
```bash
python -m venv venv
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

pip install -r requirements.txt
```

2. Navigate to the example you want to run and execute it:
```bash
cd Examples/BasicUsage
python sign_document_with_text.py
```

## Run Web API examples

You can run [GroupDocs.Signature for Python Web API Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-WebAPI) following these steps:

* Clone the repository:
```bash
git clone https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-WebAPI
cd GroupDocs.Signature-for-Python-WebAPI
```

* Install dependencies and run the application:
```bash
pip install -r requirements.txt
python app.py
```

* Open http://localhost:5000 in your favorite browser

For more details about project configuration please refer to this [guide](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Python-WebAPI#configuration).

## Run from Docker

Use [Docker](https://www.docker.com/) image to try GroupDocs.Signature for Python features in an easy way. Here are the commands to run GroupDocs.Signature for Python from docker image:

```bash
mkdir DocumentSamples
mkdir Licenses
docker run -p 5000:5000 \
  --env APPLICATION_HOST_ADDRESS=localhost \
  -v $(pwd)/DocumentSamples:/home/groupdocs/app/DocumentSamples \
  -v $(pwd)/Licenses:/home/groupdocs/app/Licenses \
  groupdocs/signature-python
# Open http://localhost:5000 in your favorite browser
```

## Contribute

If you like to add or improve an example, we encourage you to contribute to the project. All examples in this repository are open source and can be freely used in your own applications.  
To contribute, you can fork the repository, edit the code and create a pull request. We will review the changes and include it in the repository if found helpful.
