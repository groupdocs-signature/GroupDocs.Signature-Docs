---
id: installation
url: signature/java/installation
title: Installation
weight: 4
description: "GroupDocs.Signature for Java installation"
keywords: "groupdocs signature java, installation, maven"
productName: GroupDocs.Signature for Java
hideChildren: False
toc: True
---

## Install using Maven

All Java packages are hosted at [GroupDocs Artifact Repository](https://repository.groupdocs.com/). You can easily reference GroupDocs.Signature for Java API directly in your Maven project using following steps.

### Add GroupDocs Artifact Repository

First, you need to specify repository configuration/location in your Maven `pom.xml` as follows:

{{< tabs "example1">}}
{{< tab "pom.xml" >}}
```xml
<repositories>
	<repository>
		<id>GroupDocs Artifact Repository</id>
        	<name>GroupDocs Artifact Repository</name>
        	<url>https://releases.groupdocs.com/java/repo/</url>
	</repository>
</repositories>
```
{{< /tab >}}
{{< /tabs >}}

### Add GroupDocs.Signature as a dependency

Then define GroupDocs.Signature for Java API dependency in your `pom.xml` as follows:

{{< tabs "example2">}}
{{< tab "pom.xml" >}}
```xml
<dependencies>
    <dependency>
        <groupId>com.groupdocs</groupId>
        <artifactId>groupdocs-signature</artifactId>
        <version>22.11</version>
    </dependency>
</dependencies>
```
{{< /tab >}}
{{< /tabs >}}
