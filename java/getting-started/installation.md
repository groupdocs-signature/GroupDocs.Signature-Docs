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

## Operating Systems

**[GroupDocs.Signature for Java](https://products.groupdocs.com/signature/java)** can be executed on any Operating System with Java JDK installed.

- Windows Desktops and Servers
- Linux
- Mac OS

## Supported Runtime

**[GroupDocs.Signature for Java](https://products.groupdocs.com/signature/java)** supports Java run-time version 8 and above (Kotlin is supported as well).

## Development Environments

- NetBeans
- IntelliJ IDEA
- Eclipse

## Installation from GroupDocs Repository

All Java packages are hosted at [GroupDocs Artifact Repository](https://releases.groupdocs.com/java/repo/). You can easily reference [GroupDocs.Signature for Java API](https://releases.groupdocs.com/java/repo/com/groupdocs/groupdocs-signature/) directly in your project using following steps.

### Add GroupDocs Artifact Repository

First, you need to specify repository configuration/location in your project as follows:

{{< tabs "example1">}}
{{< tab "Maven" >}}
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
{{< tab "Gradle" >}}
```xml
repositories {
    maven {
        url "https://repository.groupdocs.com/repo/"
    }
}
```
{{< /tab >}}
{{< tab "Kotlin" >}}
```xml
repositories {
    maven(url = "https://repository.groupdocs.com/repo/")
}
```
{{< /tab >}}
{{< tab "Ivy" >}}
```xml
<ivysettings>
    <settings defaultResolver="chain"/>
    <resolvers>
        <chain name="chain">
            <ibiblio name="GroupDocs Repository" m2compatible="true" root="https://releases.groupdocs.com/java/repo/"/>
        </chain>
    </resolvers>
</ivysettings>
```
{{< /tab >}}
{{< tab "Sbt" >}}
```xml
resolvers += Resolver.url("GroupDocs Repository", url("https://releases.groupdocs.com/java/repo/"))
```
{{< /tab >}}
{{< /tabs >}}

### Add GroupDocs.Signature as a dependency

Then define GroupDocs.Signature for Java API dependency in your project as follows:

{{< tabs "example2">}}
{{< tab "Maven" >}}
```xml
<dependencies>
    <dependency>
        <groupId>com.groupdocs</groupId>
        <artifactId>groupdocs-signature</artifactId>
        <version>24.3</version>
    </dependency>
</dependencies>
```
{{< /tab >}}
{{< tab "Gradle" >}}
```xml
dependencies {
    implementation 'com.groupdocs:groupdocs-signature:24.3'
}
```
{{< /tab >}}
{{< tab "Kotlin" >}}
```xml
dependencies {
    implementation("com.groupdocs:groupdocs-signature:24.3")
}
```
{{< /tab >}}
{{< tab "Ivy" >}}
```xml
<dependency org="com.groupdocs" name="groupdocs-signature" rev="24.3">
   <artifact name="groupdocs-signature" ext="jar"/>
</dependency>
```
{{< /tab >}}
{{< tab "Sbt" >}}
```xml
libraryDependencies += "com.groupdocs" % "groupdocs-signature" % "24.3"
```
{{< /tab >}}
{{< /tabs >}}

_The latest version of Signature API can be [found here](https://releases.groupdocs.com/java/repo/com/groupdocs/groupdocs-signature/)_

