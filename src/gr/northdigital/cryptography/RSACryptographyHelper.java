package gr.northdigital.cryptography;

import javax.crypto.Cipher;
import java.io.*;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;

public class RSACryptographyHelper {

  private final static char[] hexArray = "0123456789ABCDEF".toCharArray();

  private static String bytesToHex(byte[] bytes) {
    char[] hexChars = new char[bytes.length * 2];
    for (int j = 0; j < bytes.length; j++) {
      int v = bytes[j] & 0xFF;
      hexChars[j * 2] = hexArray[v >>> 4];
      hexChars[j * 2 + 1] = hexArray[v & 0x0F];
    }
    return new String(hexChars);
  }

  public static byte[] hexStringToByteArray(String hexString) {
    int len = hexString.length();
    byte[] data = new byte[len / 2];
    for (int i = 0; i < len; i += 2) {
      data[i / 2] = (byte) ((Character.digit(hexString.charAt(i), 16) << 4)
        + Character.digit(hexString.charAt(i + 1), 16));
    }

    return data;
  }

  public static void generateKey(String privateKeyFileName, String publicKeyFileName) {
    try {
      final KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
      keyGen.initialize(1024);
      final KeyPair key = keyGen.generateKeyPair();

      File privateKeyFile = new File(privateKeyFileName);
      File publicKeyFile = new File(publicKeyFileName);

      if (privateKeyFile.getParentFile() != null) {
        privateKeyFile.getParentFile().mkdirs();
      }
      privateKeyFile.createNewFile();

      if (publicKeyFile.getParentFile() != null) {
        publicKeyFile.getParentFile().mkdirs();
      }
      publicKeyFile.createNewFile();

      ObjectOutputStream publicKeyOS = new ObjectOutputStream(
        new FileOutputStream(publicKeyFile));
      publicKeyOS.writeObject(key.getPublic());
      publicKeyOS.close();

      ObjectOutputStream privateKeyOS = new ObjectOutputStream(
        new FileOutputStream(privateKeyFile));
      privateKeyOS.writeObject(key.getPrivate());
      privateKeyOS.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static boolean areKeysPresent(String privateKeyFileName, String publicKeyFileName) {

    File privateKey = new File(privateKeyFileName);
    File publicKey = new File(publicKeyFileName);

    if (privateKey.exists() && publicKey.exists()) {
      return true;
    }
    return false;
  }

  public static byte[] encrypt(String text, PublicKey publicKey) {
    byte[] cipherText = null;
    try {
      final Cipher cipher = Cipher.getInstance("RSA");
      cipher.init(Cipher.ENCRYPT_MODE, publicKey);
      cipherText = cipher.doFinal(text.getBytes());
    } catch (Exception e) {
      e.printStackTrace();
    }
    return cipherText;
  }

  public static byte[] encrypt(String originalText, String publicKeyFile) throws IOException, ClassNotFoundException {
    ObjectInputStream inputStream = null;

    inputStream = new ObjectInputStream(new FileInputStream(publicKeyFile));
    final PublicKey publicKey = (PublicKey) inputStream.readObject();
    return encrypt(originalText, publicKey);
  }

  public static String encryptEx(String originalText, String publicKeyFile) throws IOException, ClassNotFoundException {
    return bytesToHex(encrypt(originalText, publicKeyFile));
  }

  public static String decrypt(byte[] cipherText, PrivateKey key) {
    byte[] dectyptedText = null;
    try {
      final Cipher cipher = Cipher.getInstance("RSA");
      cipher.init(Cipher.DECRYPT_MODE, key);
      dectyptedText = cipher.doFinal(cipherText);
    } catch (Exception ex) {
      ex.printStackTrace();
    }

    return new String(dectyptedText);
  }

  public static String decrypt(byte[] cipherText, String privateKeyFile) throws IOException, ClassNotFoundException {
    ObjectInputStream inputStream = null;

    inputStream = new ObjectInputStream(new FileInputStream(privateKeyFile));
    final PrivateKey privateKey = (PrivateKey) inputStream.readObject();
    return RSACryptographyHelper.decrypt(cipherText, privateKey);
  }

  public static String decryptEx(String cipherText, String privateKeyFile) throws IOException, ClassNotFoundException {
    return decrypt(hexStringToByteArray(cipherText), privateKeyFile);
  }

  public static String echo(String message) {
    return message + ',' + message;
  }
}
