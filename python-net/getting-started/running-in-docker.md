---
id: running-in-docker
url: signature/python-net/getting-started/running-in-docker
title: Running in Docker
weight: 8
description: "Run GroupDocs.Signature for Python via .NET in a Docker container: the Linux packages it needs, a minimal Dockerfile, how to pass a license at run time, and fixes for common errors."
keywords: docker, dockerfile, linux, container, signature docker, libgdiplus, ICU, fonts, ttf-mscorefonts-installer
productName: GroupDocs.Signature for Python via .NET
hideChildren: False
toc: True
---

In this guide, you'll learn how to run GroupDocs.Signature for Python via .NET inside a Docker container, using a small application that signs a PDF file.

## Dependencies

The wheel bundles the .NET runtime it needs, so the image needs no .NET or Mono installation. It does need the following Linux packages, the same ones listed in [System Requirements]({{< ref "signature/python-net/getting-started/system-requirements.md" >}}):

* `libicu-dev` (ICU). Without it the runtime cannot start: the first call ends the Python process with "Couldn't find a valid ICU package".
* `libfontconfig1` and `fontconfig`, which the bundled SkiaSharp library uses to find fonts.
* `libgdiplus`, for stamp signatures, text rendered as an image, barcode, QR code and image signatures with a border or transparency, every signature on PowerPoint and image files, and signature previews.
* `ttf-mscorefonts-installer` (the Microsoft core fonts). PDF text and digital signatures use Times New Roman and Arial by default. Metric-compatible substitutes such as Liberation are not picked up.

Use a base image with glibc 2.27 or newer; the official `python:*-slim` images qualify. Versions up to 26.1 also needed `libssl1.1` and ICU 70 or older from a Debian snapshot. 26.10 needs neither and runs on the ICU and OpenSSL that the distribution ships.

## Basic Example

This example signs a PDF file with a text signature inside a container and writes the result to a folder mounted from the host.

{{< alert style="info" >}}
You can download this sample application from [here](/signature/python-net/_sample_files/getting-started/running-in-docker/basic-example.zip).
{{< /alert >}}

### Project Structure

The sample application has the following folder structure:

```
📂 basic-example/
├── 📄 .dockerignore             # Keeps license files and the output folder out of the image
├── 📄 Dockerfile                # Container definition
├── 📄 README.md                 # Build and run instructions
├── 📄 requirements.txt          # Python dependencies
├── 📄 sample.pdf                # Input document
└── 📄 sign_pdf_with_text.py     # Application code
```

The image is based on `python:3.13-slim` (Debian 13). The Microsoft core fonts are in Debian's `contrib` component and ask for a license agreement, so the Dockerfile enables `contrib` and accepts the agreement before installing them. Here are the essential parts:

{{< tabs "example_run_in_docker" >}}

{{< tab "Dockerfile" >}}
{{< highlight dockerfile "" >}}
# Python 3.13 on Debian 13 (trixie)
FROM python:3.13-slim

# System packages GroupDocs.Signature needs on Linux:
#   libicu-dev                  ICU: the .NET runtime cannot start without it
#   libfontconfig1, fontconfig  font discovery for the bundled SkiaSharp library
#   libgdiplus                  stamps, text rendered as an image, PowerPoint and
#                               image files, signature previews
#   ttf-mscorefonts-installer   Times New Roman and Arial for PDF text signatures
# The fonts package lives in Debian's contrib component, asks for a EULA, and
# downloads the fonts over HTTPS (hence ca-certificates).
RUN sed -i '/^Components:/s/main/main contrib/' /etc/apt/sources.list.d/debian.sources \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true \
        | debconf-set-selections \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        libicu-dev libfontconfig1 fontconfig libgdiplus \
        ttf-mscorefonts-installer ca-certificates \
    && fc-cache -f \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app and its input document
COPY sign_pdf_with_text.py sample.pdf ./

# Run the app
CMD ["python", "sign_pdf_with_text.py"]
{{< /highlight >}}
{{< /tab >}}

{{< tab "sign_pdf_with_text.py" >}}
{{< highlight python "" >}}
import os

from groupdocs.signature import Signature
from groupdocs.signature.options import TextSignOptions


def sign_pdf_with_text():
    # The output folder is mounted from the host, so the signed file outlives the container
    os.makedirs("output", exist_ok=True)
    output_path = os.path.join("output", "signed_sample.pdf")

    with Signature("sample.pdf") as signature:
        options = TextSignOptions("Hello from Docker!")
        options.left = 100
        options.top = 100
        result = signature.sign(output_path, options)

    print(f"Signatures added: {len(result.succeeded)}. File saved at {output_path}")


if __name__ == "__main__":
    sign_pdf_with_text()
{{< /highlight >}}
{{< /tab >}}

{{< tab "requirements.txt" >}}
{{< highlight text "" >}}
groupdocs-signature-net==26.10.0
{{< /highlight >}}
{{< /tab >}}

{{< tab "Input files" >}}
{{< tab-text >}}
Sample input file [sample.pdf](/signature/python-net/_sample_files/getting-started/running-in-docker/sample.pdf).
{{< /tab-text >}}
{{< /tab >}}

{{< /tabs >}}

### Building and Running the Application

To create the Docker image, run the following command in the directory that contains the Dockerfile:

```bash
docker build -t groupdocs-signature-net:basic-example .
```

Run the application in evaluation mode, mounting the output folder:

```bash
docker run --rm -v "${PWD}/output:/app/output" groupdocs-signature-net:basic-example
```

To run it with a license, mount the folder that holds the license file and point `GROUPDOCS_LIC_PATH` at it. The license is applied automatically when `groupdocs.signature` is imported:

```bash
docker run --rm \
    -v "${PWD}/output:/app/output" \
    -v /path/to/license-folder:/license:ro \
    -e GROUPDOCS_LIC_PATH=/license/GroupDocs.Signature.lic \
    groupdocs-signature-net:basic-example
```

{{< alert style="warning" >}}
Mount the license at run time instead of copying it into the image: anyone who can pull an image can read the files inside it. The sample's `.dockerignore` keeps `*.lic` files out of the build context.
{{< /alert >}}

### Command Explanation

- `--rm`: removes the container when it exits.
- `-v`: mounts a host folder into the container: `output` receives the signed file, and `/license` holds the license read-only.
- `-e GROUPDOCS_LIC_PATH=...`: tells the library where the license file is.

On Windows with Git Bash, run `export MSYS_NO_PATHCONV=1` before `docker run` so that the container paths are not rewritten.

### App Output

The app prints `Signatures added: 1. File saved at output/signed_sample.pdf`, and the signed PDF file [signed_sample.pdf](/signature/python-net/_sample_files/getting-started/running-in-docker/signed_sample.pdf) appears in the `output` folder. In evaluation mode the signed page also carries an evaluation line.

## Troubleshooting

- **"Couldn't find a valid ICU package"**, with the process ending abruptly: install `libicu-dev`. Do not set `DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1` to work around it.
- **"The type initializer for 'Gdip' threw an exception"**: install `libgdiplus`.
- **"Font Times New Roman was not found"** or **"Font Arial was not found"**: install `ttf-mscorefonts-installer` and run `fc-cache -f`, or set the signature's font to a font that is installed in the image. [How to Sign PDFs in a Linux Container]({{< ref "signature/python-net/use-cases/signing-documents-linux-container-fonts.md" >}}) covers fonts in depth.
- **"Package 'ttf-mscorefonts-installer' has no installation candidate"**: enable the `contrib` component on Debian, or `multiverse` on Ubuntu (`add-apt-repository -y multiverse`).
- **"The number of pages cannot exceed 2 in a trial version"**: the license was not applied. Check the mount and the `GROUPDOCS_LIC_PATH` value. A missing license file does not raise an error; the library just stays in evaluation mode.

### Exceptions

If you run into any other exception, see [Troubleshooting]({{< ref "signature/python-net/getting-started/troubleshooting/_index.md" >}}), or contact us on the [GroupDocs Free Support Forum](https://forum.groupdocs.com/c/signature) and we'll be happy to help.
