package gr.northdigital.essentials;

import gr.northdigital.cryptography.RSACryptographyHelper;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.security.PrivateKey;
import java.security.PublicKey;

public class Main {

  private static final String PRIVATE_KEY_FILE = "private.key";
  private static final String PUBLIC_KEY_FILE = "public.key";

  public static void main(String[] args) {

    try {

      if (!RSACryptographyHelper.areKeysPresent(PRIVATE_KEY_FILE, PUBLIC_KEY_FILE)) {
        RSACryptographyHelper.generateKey(PRIVATE_KEY_FILE, PUBLIC_KEY_FILE);
      }

      final String originalText = "Text to be encrypted ";

      final byte[] cipherText = RSACryptographyHelper.encrypt(originalText, PUBLIC_KEY_FILE);
      final String plainText = RSACryptographyHelper.decrypt(cipherText, PRIVATE_KEY_FILE);

      System.out.println("Original: " + originalText);
      System.out.println("Encrypted: " + cipherText.toString());
      System.out.println("Decrypted: " + plainText);

    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
