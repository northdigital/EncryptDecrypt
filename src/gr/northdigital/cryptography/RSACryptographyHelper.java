package gr.northdigital.cryptography;

import javax.crypto.Cipher;
import java.io.*;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;

public class RSACryptographyHelper {

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

  public static String decrypt(byte[] cipherText, String PrivateKeyFile) throws IOException, ClassNotFoundException {
    ObjectInputStream inputStream = null;

    inputStream = new ObjectInputStream(new FileInputStream(PrivateKeyFile));
    final PrivateKey privateKey = (PrivateKey) inputStream.readObject();
    return RSACryptographyHelper.decrypt(cipherText, privateKey);
  }
}
