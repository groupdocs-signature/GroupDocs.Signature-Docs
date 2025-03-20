---
id: digital-signing-with-custom-hash
url: signature/net/digital-signing-with-custom-hash
title: Digital signing with custom hash
linkTitle: ✎ Digital signing with custom hash
weight: 2
description: "This article explains how to apply digital signatures with custom hash algorithms using GroupDocs.Signature API."
keywords: 
productName: GroupDocs.Signature for .NET 
hideChildren: False
toc: True
---

### How to apply digital signature with custom hash algorithm

[**GroupDocs.Signature**](https://products.groupdocs.com/signature/net) provides the ability to customize the hash algorithm used for digital signatures. This is particularly useful when you need to use specific cryptographic standards or have compliance requirements.

Here's how to implement digital signing with a custom hash algorithm:

```csharp
public void SignDocument()
{
    string certFilePath = "cert.pfx";
    string sampleFilePath = "sample.pdf";
    string sampleOutputFilePath = "signed.pdf";
    using (Signature.Signature signature = new Signature.Signature(sampleFilePath))
    {
        // initialize digital option with certificate file path
        DigitalSignOptions options = new DigitalSignOptions(certFilePath)
        {
            // certificate password
            Password = "1234567890",
            // digital certificate details
            Reason = "Sign",
            Contact = "JohnSmith",
            Location = "Office1",
            AllPages = true,
            Width = 80,
            Height = 60,
            VerticalAlignment = VerticalAlignment.Bottom,
            HorizontalAlignment = HorizontalAlignment.Right,
            Margin = new Padding() {  Bottom = 10, Right = 10},
            HashAlgorithm = HashAlgorithm.Sha256
        };
        options.CustomSignHash = new CustomDigitalSigner();
        
        signature.Sign(sampleOutputFilePath, options);
    }
}

public class CustomDigitalSigner : ICustomSignHash
{
    public byte[] CustomSignHash(byte[] signableHash, HashAlgorithm hashAlgorithm, SignatureContext signatureContext)
    {
        string inputP12 = "";
        var inputPfxPassword = "1234567890";
        X509Certificate2 signerCert = new X509Certificate2(inputP12, inputPfxPassword, X509KeyStorageFlags.Exportable);
        RSACryptoServiceProvider rsaCSP = new RSACryptoServiceProvider();
        var xmlString = signerCert.PrivateKey.ToXmlString(true);
        rsaCSP.FromXmlString(xmlString);
        byte[] signedData = rsaCSP.SignData(signableHash, hashAlgorithm);
        return signedData;
    }
}
```

### Step-by-Step Implementation Guide

Let's break down the implementation into clear steps:

1. **Setup the Signature Environment**
   ```csharp
   string certFilePath = "cert.pfx";
   string sampleFilePath = "sample.pdf";
   string sampleOutputFilePath = "signed.pdf";
   using (Signature.Signature signature = new Signature.Signature(sampleFilePath))
   ```
   - Define paths for your certificate, input document, and output file
   - Create a new `Signature` instance with your input document

2. **Configure Digital Signature Options**
   ```csharp
   DigitalSignOptions options = new DigitalSignOptions(certFilePath)
   {
       Password = "1234567890",
       Reason = "Sign",
       Contact = "JohnSmith",
       Location = "Office1",
       AllPages = true,
       Width = 80,
       Height = 60,
       VerticalAlignment = VerticalAlignment.Bottom,
       HorizontalAlignment = HorizontalAlignment.Right,
       Margin = new Padding() { Bottom = 10, Right = 10},
       HashAlgorithm = HashAlgorithm.Sha256
   };
   ```
   - Create `DigitalSignOptions` with your certificate file
   - Set basic signature properties (password, reason, contact, location)
   - Configure visual appearance (size, position, alignment)
   - Specify the hash algorithm (SHA-256 in this example)

3. **Implement Custom Hash Signing**
   ```csharp
   options.CustomSignHash = new CustomDigitalSigner();
   ```
   - Assign your custom hash implementation to the options

4. **Create Custom Hash Implementation**
   ```csharp
   public class CustomDigitalSigner : ICustomSignHash
   {
       public byte[] CustomSignHash(byte[] signableHash, HashAlgorithm hashAlgorithm, SignatureContext signatureContext)
       {
           // Load certificate
           string inputP12 = "";
           var inputPfxPassword = "1234567890";
           X509Certificate2 signerCert = new X509Certificate2(inputP12, inputPfxPassword, X509KeyStorageFlags.Exportable);
           
           // Setup RSA provider
           RSACryptoServiceProvider rsaCSP = new RSACryptoServiceProvider();
           var xmlString = signerCert.PrivateKey.ToXmlString(true);
           rsaCSP.FromXmlString(xmlString);
           
           // Sign the hash
           byte[] signedData = rsaCSP.SignData(signableHash, hashAlgorithm);
           return signedData;
       }
   }
   ```
   - Implement `ICustomSignHash` interface
   - Load your certificate with proper password and flags
   - Configure RSA provider with the certificate's private key
   - Sign the hash using the specified algorithm

5. **Apply the Signature**
   ```csharp
   signature.Sign(sampleOutputFilePath, options);
   ```
   - Call the `Sign` method with your output path and options
   - The document will be signed using your custom hash implementation

### Important Notes

* Make sure your certificate file is valid and accessible
* Keep your certificate password secure and never hardcode it in production code
* The custom hash implementation should handle the signing process securely
* Consider implementing proper error handling in production code
* The hash algorithm specified in options should match your security requirements

### Understanding Hash Algorithms

Hash algorithms are cryptographic functions that convert data of any size into a fixed-size output (hash value). In digital signatures, hash algorithms play a crucial role in ensuring document integrity and authenticity. Here's how they work:

1. The document content is processed through the hash algorithm to generate a unique hash value
2. This hash value is then encrypted with the signer's private key
3. The encrypted hash becomes part of the digital signature
4. When verifying the signature, the same hash algorithm is used to ensure the document hasn't been tampered with

### Available Hash Algorithms

GroupDocs.Signature provides several hash algorithms for digital signing, each offering different levels of security and performance. Here are the available options:

* **Auto Selection**: The system automatically chooses the most appropriate hash algorithm based on your document type and security requirements.

* **SHA-1**: 
  - Produces a 160-bit (20-byte) hash value
  - Widely supported but considered less secure for modern applications
  - Best for legacy system compatibility

* **SHA-256**: 
  - Produces a 256-bit (32-byte) hash value
  - Currently recommended for most applications
  - Provides a good balance of security and performance
  - Widely supported across modern systems

* **SHA-384**: 
  - Produces a 384-bit (48-byte) hash value
  - Offers enhanced security compared to SHA-256
  - Suitable for high-security applications
  - May require more computational resources

* **SHA-512**: 
  - Produces a 512-bit (64-byte) hash value
  - Provides the highest level of security among available options
  - Best for applications requiring maximum security
  - Requires the most computational resources

### Signing PDF Files Using Azure Key Vault

GroupDocs.Signature supports integration with Azure Key Vault for secure digital signing. This approach is particularly useful for cloud-based applications where you want to keep your signing keys secure in Azure Key Vault.

Here's how to implement PDF signing using Azure Key Vault:

```csharp
public static void SignUsingAzureKeyVault()
{
    string sampleFilePath = "sample.pdf";
    string sampleOutputFilePath = "signed.pdf";
    
    using (Signature signature = new Signature(sampleFilePath))
    {
        // initialize digital option with certificate file path
        DigitalSignOptions options = new DigitalSignOptions()
        {
            Signature = new DigitalSignature(),
            // certificate password
            Password = "1234567890",
            // digital certificate details
            Reason = "Sign",
            Contact = "JohnSmith",
            Location = "Office1",
            AllPages = true,
            Width = 80,
            Height = 60,
            VerticalAlignment = VerticalAlignment.Bottom,
            HorizontalAlignment = HorizontalAlignment.Right,
            Margin = new Padding() {  Bottom = 10, Right = 10},
            HashAlgorithm = HashAlgorithm.Sha256
        };
        var azureSigner = new AzureSigner();
        options.CustomSignHash = azureSigner;
        options.Signature.Certificate = azureSigner.GetPublicCertificateFromAzureStorage();
            
        signature.Sign(sampleOutputFilePath, options);
    }
}

public class AzureSigner : ICustomSignHash
{
    public byte[] CustomSignHash(byte[] hash, HashAlgorithm hashAlgorithm, SignatureContext signatureContext)
    {
        return SignWithAzure(hash);
    }

    private static byte[] SignWithAzure(byte[] signableHash)
    {
        var credential = GetAzureSecretCredential();
        var certificateKeyId = "https://...";
        CryptographyClient client = new CryptographyClient(new Uri(certificateKeyId), credential);
        var result = client.Sign(SignatureAlgorithm.RS256, signableHash);
        return result.Signature;
    }

    static ClientSecretCredential GetAzureSecretCredential()
    {
        string tenantId = "your tenantId";
        string clientId = "your clientId";
        string secret = "your secret";
        ClientSecretCredential credential = new ClientSecretCredential(tenantId, clientId, secret);
        return credential;
    }

    public X509Certificate2 GetPublicCertificateFromAzureStorage()
    {
        string vaultUri = "https://test.vault.azure.net/";
        var credential = GetAzureSecretCredential();
        X509Certificate2 pubCertificate = GetPublicCertificateFromAzureStorage(credential, vaultUri);
        return pubCertificate;
    }

    static X509Certificate2 GetPublicCertificateFromAzureStorage(ClientSecretCredential credential, string uri)
    {
        //Create certificate client.
        CertificateClient certificateClient = new CertificateClient(new Uri(uri), credential);
        //Get the certificate with public key.
        KeyVaultCertificateWithPolicy certificate = certificateClient.GetCertificateAsync("Certificate").Result;
        //Create and return the X509Certificate2.
        return new X509Certificate2(certificate.Cer);
    }
}
```

### Azure Key Vault Implementation Steps

1. **Setup Azure Key Vault**
   - Create an Azure Key Vault instance
   - Upload your signing certificate to the Key Vault
   - Configure access policies for your application

2. **Configure Azure Credentials**
   ```csharp
   static ClientSecretCredential GetAzureSecretCredential()
   {
       string tenantId = "your tenantId";
       string clientId = "your clientId";
       string secret = "your secret";
       return new ClientSecretCredential(tenantId, clientId, secret);
   }
   ```
   - Register your application in Azure AD
   - Get the tenant ID, client ID, and client secret
   - Create a credential object for Azure Key Vault access

3. **Retrieve Certificate**
   ```csharp
   public X509Certificate2 GetPublicCertificateFromAzureStorage()
   {
       string vaultUri = "https://test.vault.azure.net/";
       var credential = GetAzureSecretCredential();
       return GetPublicCertificateFromAzureStorage(credential, vaultUri);
   }
   ```
   - Connect to your Azure Key Vault
   - Retrieve the public certificate for signature verification

4. **Implement Custom Signing**
   ```csharp
   private static byte[] SignWithAzure(byte[] signableHash)
   {
       var credential = GetAzureSecretCredential();
       var certificateKeyId = "https://...";
       CryptographyClient client = new CryptographyClient(new Uri(certificateKeyId), credential);
       var result = client.Sign(SignatureAlgorithm.RS256, signableHash);
       return result.Signature;
   }
   ```
   - Create a cryptography client
   - Sign the hash using the Azure Key Vault key
   - Return the signed data

### Azure Key Vault Security Considerations

1. **Access Control**
   - Use managed identities when possible
   - Implement least privilege access
   - Regularly rotate credentials

2. **Certificate Management**
   - Keep certificates up to date
   - Monitor certificate expiration
   - Implement certificate rotation procedures

3. **Network Security**
   - Use private endpoints when possible
   - Implement proper network security groups
   - Monitor access logs

4. **Error Handling**
   - Implement proper exception handling
   - Log security events
   - Monitor for suspicious activities

### Security Considerations

When choosing a hash algorithm for digital signatures, consider the following:

1. **Security Level**: SHA256 and above are recommended for modern applications as they provide better security than SHA1 or MD5.
2. **Compatibility**: Ensure the chosen algorithm is compatible with your target systems and compliance requirements.
3. **Performance**: While stronger algorithms provide better security, they may require more computational resources.

## More resources

### GitHub Examples

You may easily run the code above and see the feature in action in our GitHub examples:

* [GroupDocs.Signature for .NET examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET)
* [GroupDocs.Signature for Java examples, plugins, and showcase](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java)
* [Document Signature for .NET MVC UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-MVC)
* [Document Signature for .NET App WebForms UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-.NET-WebForms)
* [Document Signature for Java App Dropwizard UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Dropwizard)
* [Document Signature for Java Spring UI Example](https://github.com/groupdocs-signature/GroupDocs.Signature-for-Java-Spring)

### Free Online Apps

Along with the full-featured .NET library, we provide simple but powerful free online apps.

To sign PDF, Word, Excel, PowerPoint, and other documents you can use the online apps from the **[GroupDocs.Signature App Product Family](https://products.groupdocs.app/signature/family)**. 