---
id: running-in-docker
url: signature/python-net/getting-started/running-in-docker
title: Running in Docker
weight: 5
description: "Learn how to run GroupDocs.Signature for Python via .NET inside Docker containers with examples, troubleshooting tips, and best practices."
keywords: docker, dockerfile, linux, container, signature docker
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

In this guide, you'll learn how to run GroupDocs.Signature for Python via .NET inside a Docker container using simple code examples.

## Limitations

Currently, not all GroupDocs Python APIs support Linux. This limitation will be addressed in upcoming releases.

APIs that support Linux are the following:

* [groupdocs‑comparison‑net](https://pypi.org/project/groupdocs-comparison-net/)
* [groupdocs‑watermark‑net](https://pypi.org/project/groupdocs-watermark-net/)
* [groupdocs‑metadata‑net](https://pypi.org/project/groupdocs-metadata-net/)
* [groupdocs‑merger‑net](https://pypi.org/project/groupdocs-merger-net/)

{{< alert style="warning" >}}
GroupDocs.Signature for Python via .NET Linux support is currently limited. Please check the [System Requirements]({{< ref "signature/python-net/system-requirements" >}}) page for the latest supported platforms. Full Linux support will be available in upcoming releases.
{{< /alert >}}

This guide demonstrates how to use GroupDocs.Signature for Python via .NET in a Docker container, assuming Linux support is available in your version.

## Dependencies

When using the GroupDocs Python SDK in a Linux environment, make sure the following packages are installed, as they are required for proper library operation:

* `libicu` — ICU library (must not exceed version 70)
* `libssl1.1` — OpenSSL library required by .NET Core 3.1

## Basic Example

This is the most basic example that shows how to run GroupDocs.Signature for Python via .NET in Docker. The example demonstrates how to sign a PDF file with a text signature using GroupDocs.Signature in a Docker container.

{{< alert style="info" >}}
You can download this sample application from [here](/signature/python-net/_sample_files/getting-started/running-in-docker/basic-example.zip).
{{< /alert >}}

### Project Structure

The sample application has the following folder structure:

```
📂 basic-example/
├── 📂 output/                   # Output directory for signed files
├── 📄 .dockerignore             # Files to exclude from Docker build context
├── 📄 sample.pdf                # Sample input document to sign
├── 📄 Dockerfile                # Docker container definition
├── 📄 GroupDocs.Signature.PythonViaNET.lic  # License file (optional)
├── 📄 sign_pdf_with_text.py     # Main application code
├── 📄 README.md                 # Build and run instructions
└── 📄 requirements.txt          # Application dependencies
```

We're using a Python 3.11 slim image and installing required .NET dependencies `libicu` and `libssl1.1` manually.
Here are the most essential parts:

{{< tabs "example_run_in_docker" >}}

{{< tab "Dockerfile" >}}  
{{< highlight dockerfile "" >}}
# Use Python 3.11 slim base image which is smaller than the default base image
FROM python:3.11-slim

# Install prerequisites from a reliable source
ENV SNAPSHOT_DATE=20220328T000000Z
RUN echo "deb [trusted=yes] http://snapshot.debian.org/archive/debian/${SNAPSHOT_DATE} bullseye main" \
        > /etc/apt/sources.list.d/debian-archive.list && \
    apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y --no-install-recommends \
        libicu67 \
        libssl1.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set workdir 
WORKDIR /app

# Install Python dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy the rest of the app
COPY . .

# Run the app
CMD ["python", "sign_pdf_with_text.py"]
{{< /highlight >}}
{{< /tab >}}

{{< tab "sign_pdf_with_text.py" >}}  
{{< highlight python "" >}}
import os
import groupdocs.signature as gs
import groupdocs.signature.options as gso

def sign_pdf_with_text_signature():
    # Get license file absolute path
    license_path = os.path.abspath("./GroupDocs.Signature.PythonViaNET.lic")

    if os.path.exists(license_path):
        # Create License and set the path
        license = gs.License()
        license.set_license(license_path)

    # Ensure output directory exists
    os.makedirs("./output", exist_ok=True)

    # The path to the input PDF file
    sample_pdf = "./sample.pdf"
    
    # The path to the output directory
    output_file_path = "./output/signed_sample.pdf"

    # Sign document with text signature
    with gs.Signature(sample_pdf) as signature:
        text_sign_options = gso.TextSignOptions("Hello from Docker!")
        signature.sign(output_file_path, text_sign_options)

    print(f"\nSource document signed successfully.\nFile saved at {output_file_path}")

if __name__ == "__main__":
    sign_pdf_with_text_signature()
{{< /highlight >}}
{{< /tab >}}

{{< tab "requirements.txt" >}}  
{{< highlight text "" >}}
groupdocs-signature-net>=25.4
{{< /highlight >}}
{{< /tab >}}

{{< tab "Input files" >}}  
{{< tab-text >}}
Sample input file [sample.pdf](/signature/python-net/_sample_files/getting-started/running-in-docker/sample.pdf).
{{< /tab-text >}}
{{< /tab >}}

{{< /tabs >}}

### Building and Running the Application

To create the Docker image, run the following command in the directory containing the Dockerfile:

```bash
docker build -t groupdocs-signature-net:basic-example .
```

To run the application and mount the output directory:

```bash
docker run -it --rm -v ${PWD}/output:/app/output groupdocs-signature-net:basic-example
```

### Command Explanation

- `-it`: Runs the container in interactive mode
- `--rm`: Automatically removes the container when it exits
- `-v`: Mounts the host directory to the container directory for file output

### App Output

The app creates the signed PDF file [signed_sample.pdf](/signature/python-net/_sample_files/getting-started/running-in-docker/signed_sample.pdf) in the `output` folder.


## Troubleshooting

### Font Issues

If you encounter font-related errors:

```bash
# Install additional fonts
RUN apt-get update && apt-get install -y fonts-liberation fonts-dejavu-core
```

### Exceptions

In case you experience any other exceptions when running the application please contact us using the [GroupDocs Free Support Forum](https://forum.groupdocs.com/) and we'll be happy to help.

