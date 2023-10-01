# Bash Text Encryption and Decryption Scripts

This repository contains a collection of Bash scripts that allow you to encrypt and decrypt text strings using various methods. Currently, it includes a Caesar cipher encryption script. These scripts are designed for educational purpose.

## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [Future Enhancements](#future-enhancements)

## Getting Started

To get started, clone this repository to your local machine:

```bash
git clone https://github.com/your-username/text-encryption-scripts.git
```
### Prerequisites:
You will need a Unix-like operating system with Bash installed to use these scripts.

## Usage
### Caesar Cipher:

1. Navigate to the folder where the scripts are located.
```bash
cd ./caesar-cipher
```
2. Write the string to be encrypted in the secret.txt document
3. Run the caesar_cipher.sh:
```bash
bash caesar_cipher.sh --input secret.txt --output encrypted_secret.txt --key 4
```
Replace 4 with your desired encryption key.

4. Check the encrypted message:
```bash
cat encrypted_secret.txt
```
5. Run the caesar_decrypter.sh:
```bash
bash caesar_decryptor.sh --input encrypted_secret.txt --output decrypted_secret.txt --key 4
```
Replace 4 with your desired encryption key.
6. Check the decrypted message:
```bash
cat decrypted_secret.txt
```

## Future Enhancements
In the future, we plan to include more encryption and decryption methods, such as:

- Vigenère cipher.
- Custom encryption with OpenSSL, allowing for different algorithms, modes, IVs, passwords, keys, derivations, extensions, and other parameters.