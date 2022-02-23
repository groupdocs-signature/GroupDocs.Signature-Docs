---
id: obtain-document-history-information
url: signature/java/obtain-document-history-information
title: Obtain document history information
weight: 2
description: "This article shows how to obtain the history of document changes with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
toc: True
---
[**GroupDocs.Signature**](https://products.groupdocs.com/signature/java) allows to get document history information about processed changes that include list of [ProcessLog](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain/ProcessLog ). Each history log record contains following information :

* date/time of processed change.
* type of document process change. See [ProcessType](https://apireference.groupdocs.com/signature/java/com.groupdocs.signature.domain.enums/ProcessType )
* description of change
* quantity of succeeded and failed signatures

## Analyze document process history information

The following code snippet demonstrates how to obtain information about document historical changes and analyze them.

```java
final Signature signature = new Signature("sampleSigned.pdf");
	try /*JAVA: was using*/
	{
		IDocumentInfo documentInfo = signature.getDocumentInfo();
		// display document process history information
		System.out.print("Document Process logs information: count = "+documentInfo.getProcessLogs().size());
		for (ProcessLog processLog : documentInfo.getProcessLogs())
		{
			System.out.print(" - operation ["+processLog.getType()+"}] on "+processLog.getDate().toString()+"}. Succedded/Failed "+processLog.getSucceeded()+"/"+processLog.getFailed()+". Message: "+processLog.getMessage()+" : ");
			if (processLog.getSignatures() != null)
			{
				for (BaseSignature logSignature : processLog.getSignatures())
				{
					System.out.print("\t\t -"+logSignature.getSignatureType()+" #"+logSignature.getSignatureId()+" at "+logSignature.getTop()+" x "+logSignature.getLeft()+" pos;");
				}
			}
		}
	} catch (Exception e){
		throw new GroupDocsSignatureException(e.getMessage());
	}
```
