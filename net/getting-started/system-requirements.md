---
id: system-requirements
url: signature/net/system-requirements
title: System Requirements
weight: 2
description: "GroupDocs.Signature for .NET runs on Windows, Linux and macOS with .NET Framework 4.6.2 or later, .NET 6, .NET 8 or .NET 10"
keywords: GroupDocs.Signature for .NET,Signature,system requirements,.NET 10,.NET 8,.NET 6,.NET Framework 4.6.2,Linux,macOS
productName: GroupDocs.Signature for .NET
hideChildren: False 
toc: True
---
## Overview

GroupDocs.Signature for .NET does not require any external software or third party tool to be installed. Just follow one of the ways described in [Installation]({{< ref "signature/net/getting-started/installation.md" >}}).

## Supported Frameworks

| Framework | NuGet package with this build only |
| --- | --- |
| .NET Framework 4.6.2 or later | `GroupDocs.Signature.Net462` |
| .NET 6 | `GroupDocs.Signature.Net60` |
| .NET 8 | `GroupDocs.Signature.Net80` |
| .NET 10 | `GroupDocs.Signature.Net100` |

The `GroupDocs.Signature` package references all four builds, and your project gets the one that matches its target framework.

{{< alert style="info" >}}
Starting with version 26.9, GroupDocs.Signature for .NET ships a .NET 10 build and no longer ships a .NET Standard 2.1 build. A library that targets `netstandard2.1` and references GroupDocs.Signature must target one of the frameworks above instead.
{{< /alert >}}

## Supported Operating Systems

GroupDocs.Signature for .NET runs on the operating systems that the framework you use supports.

### Windows

* Windows 10 and Windows 11
* Windows Server 2016 and later
* Microsoft Azure

### Linux

* Ubuntu, Debian, Red Hat Enterprise Linux, CentOS, openSUSE and other distributions supported by .NET 6, .NET 8 or .NET 10, including Docker containers

### macOS

* macOS versions supported by .NET 6, .NET 8 or .NET 10

The .NET Framework build runs on Windows only. On Linux and macOS, see the font recommendations in [Known issues]({{< ref "signature/net/developer-guide/known-issues/net-standard-2.0-api-limitations.md" >}}).

## Development Environments

GroupDocs.Signature for .NET can be used to develop applications in any development environment that targets the supported frameworks, for example:

* Microsoft Visual Studio 2022 and later
* Visual Studio Code
* JetBrains Rider
* the .NET CLI (`dotnet`)

To build for .NET 10, use the .NET 10 SDK and a development environment that supports it.
