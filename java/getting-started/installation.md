---
id: installation
url: signature/java/installation
title: Development Environment Installation and Configuration
weight: 4
description: "This guide explains how to install GroupDocs.Signature for Java to your environment"
keywords:
productName: GroupDocs.Signature for Java
hideChildren: False
---
## Installation from GroupDocs Repository using Maven

GroupDocs hosts all Java APIs on [GroupDocs Repository](https://releases.groupdocs.com/java/repo/). You can easily use [GroupDocs.Signature for Java](https://releases.groupdocs.com/java/repo/com/groupdocs/groupdocs-signature/) API directly in your Maven projects with simple configurations.

### Specify GroupDocs Repository Configuration

First, you need to specify GroupDocs repository configuration/location in your Maven `pom.xml` as follows: 

```java
<repositories>
	<repository>
		<id>GroupDocs Artifact Repository</id>
        	<name>GroupDocs Artifact Repository</name>
        	<url>https://releases.groupdocs.com/java/repo/</url>
	</repository>
</repositories>
```

### Define GroupDocs.Signature for Java API Dependency

Then define GroupDocs.Signature for Java API dependency in your `pom.xml` as follows:

```java
<dependencies>
    <dependency>
        <groupId>com.groupdocs</groupId>
        <artifactId>groupdocs-signature</artifactId>
        <version>22.11</version>
    </dependency>
</dependencies>
```

After performing above-mentioned steps, GroupDocs.Signature for Java dependency will finally be added to your Maven project.

## Install from official GroupDocs website

You can follow the steps below to reference GroupDocs.Signature for Java downloaded from official website [Downloads section](https://releases.groupdocs.com/signature/java/):

1.  Unpack zip archive .
2.  Switch to **lib** folder.
3.  Run **install.bat** (for Windows) or **install.sh** (for Linux) file to install the library in your local maven repository.
4.  After this you should add the signature **dependency** block to your pom.xml project file.
