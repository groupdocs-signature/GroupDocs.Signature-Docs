---
id: load-document-from-ftp
url: signature/java/load-document-from-ftp
title: Load document from FTP
weight: 3
description: "This section explains how to load document from FTP with GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for Java
hideChildren: False
---
Following example demonstrates how to process documents from FTP.

```java
public static void run()
    {
        String server = "ftp.example.com";
        String filePath = "sample.doc";
        String outputFilePath = new File(Constants.OutputPath, "SignFromStream//signedSample.doc").getPath();
 
        try {
 
            InputStream stream = getFileFromFtp(server,filePath);
            Signature signature = new Signature(stream);
            {
                QrCodeSignOptions options = new QrCodeSignOptions("JohnSmith");
                options.setEncodeType(QrCodeTypes.QR);
                options.setLeft(100);
                options.setTop(100);
 
 
                // sign document to file
                signature.sign("signedSample.doc", options);
            }
 
            System.out.print("\nSource document signed successfully.\nFile saved ");
    }catch(Exception e){
        throw new GroupDocsSignatureException(e.getMessage());
    }
}
 
private static InputStream getFileFromFtp(String server, String filePath) throws Exception
{
   FTPClient client = new FTPClient();
   client.connect(server);
   return client.retrieveFileStream(filePath);
}
```


