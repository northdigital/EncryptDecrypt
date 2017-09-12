package gr.northdigital.essentials;

import gr.northdigital.cryptography.RSACryptographyHelper;

public class Main {

  private static final String PRIVATE_KEY_FILE = "private.key";
  private static final String PUBLIC_KEY_FILE = "public.key";

  public static void main(String[] args) {

    try {

      if (!RSACryptographyHelper.areKeysPresent(PRIVATE_KEY_FILE, PUBLIC_KEY_FILE)) {
        RSACryptographyHelper.generateKey(PRIVATE_KEY_FILE, PUBLIC_KEY_FILE);
        System.out.println("created new private/public keys");
      } else {
        System.out.println("found existing private/public keys");
      }

      final String originalText = "ΠΑΠΑΔΟΠΟΥΛΟΣ";

      final byte[] cipherText = RSACryptographyHelper.encrypt2ByteArray(originalText, PUBLIC_KEY_FILE);
      final String plainText = RSACryptographyHelper.decryptFromByteArray(cipherText, PRIVATE_KEY_FILE);

      System.out.println("Original: " + originalText);
      System.out.println("Encrypted: " + cipherText.toString());
      System.out.println("Decrypted: " + plainText);

      String hexCipherText = RSACryptographyHelper.encryptToHexString(originalText, PUBLIC_KEY_FILE);
      String hexOriginalText = RSACryptographyHelper.decryptFromHexString(hexCipherText, PRIVATE_KEY_FILE);

      System.out.println("hexText: " + hexCipherText);
      System.out.println("hexText: " + hexOriginalText);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
