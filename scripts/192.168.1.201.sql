CREATE OR REPLACE FUNCTION echo(message VARCHAR2) RETURN VARCHAR2 AS
  LANGUAGE JAVA NAME 'gr.northdigital.cryptography.RSACryptographyHelper.echo(java.lang.String) return java.lang.String';

  --ENCRYPT--------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION system.encrypt2bytearray(originaltext VARCHAR2, publickeyfile VARCHAR2) RETURN RAW AS
  LANGUAGE JAVA NAME 'gr.northdigital.cryptography.RSACryptographyHelper.encrypt2ByteArray(java.lang.String,java.lang.String) return java.lang.Byte[]';

CREATE OR REPLACE FUNCTION system.encrypt2hexstring(originaltext VARCHAR2, publickeyfile VARCHAR2) RETURN VARCHAR2 AS
  LANGUAGE JAVA NAME 'gr.northdigital.cryptography.RSACryptographyHelper.encryptToHexString(java.lang.String,java.lang.String) return java.lang.String';
-----------------------------------------------------------------------------------------------------------------------------------------------

  --DECRYPT--------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION system.decryptfromraw(cipherraw RAW, privatekeyfile VARCHAR2) RETURN VARCHAR2 DETERMINISTIC AS
  LANGUAGE JAVA NAME 'gr.northdigital.cryptography.RSACryptographyHelper.decryptFromRaw(oracle.sql.RAW,java.lang.String) return java.lang.String';

CREATE OR REPLACE FUNCTION system.decryptfromhexstring(cipherhextext VARCHAR2, privatekeyfile VARCHAR2) RETURN VARCHAR2
  DETERMINISTIC AS
  LANGUAGE JAVA NAME 'gr.northdigital.cryptography.RSACryptographyHelper.decryptFromHexString(java.lang.String,java.lang.String) return java.lang.String';
-----------------------------------------------------------------------------------------------------------------------------------------------

  --GRANT----------------------------------------------------------------------------------------------------------------------------------------

GRANT EXECUTE ON system.encrypt2bytearray TO casinocrm
  WITH GRANT OPTION;

GRANT EXECUTE ON system.encrypttohexstring TO casinocrm
  WITH GRANT OPTION;

GRANT EXECUTE ON system.decryptfromraw TO casinocrm
  WITH GRANT OPTION;

GRANT EXECUTE ON system.decryptfromhexstring TO casinocrm
  WITH GRANT OPTION;

GRANT EXECUTE ON system.encrypt2bytearray TO logismos
  WITH GRANT OPTION;

GRANT EXECUTE ON system.encrypttohexstring TO logismos
  WITH GRANT OPTION;

GRANT EXECUTE ON system.decryptfromraw TO logismos
  WITH GRANT OPTION;

GRANT EXECUTE ON system.decryptfromhexstring TO logismos
  WITH GRANT OPTION;
-----------------------------------------------------------------------------------------------------------------------------------------------

  --TEST-----------------------------------------------------------------------------------------------------------------------------------------

SELECT system.encrypt2bytearray('ΠΑΠΑΔΟΠΟΥΛΟΣ', '/home/oracle/public.key') FROM dual;

SELECT system.encrypttohexstring('ΠΑΠΑΔΟΠΟΥΛΟΣ το καλό το παλικάρι ξέρει κι άλλο μονοπάτι', '/home/oracle/public.key') FROM dual;

SELECT system.decryptfromraw('20BF2571156449D51D3A12187C8B35425CA23603DC4B4DCE68296D3838578FCE9C9E182CD43F16FB07F6CF99F983DED1DCA7F89082CBA02F900AB187EF0853641BD0AA1204886B26CE8BDC80452244AE13CD626398BC202FE5C89661036FAC5C1B66F2A5357812CCC88F5EC2DC109D30C7338E9574F3034E208F8A5BBFFCD762', '/home/oracle/private.key') FROM dual;

SELECT system.decryptfromraw((SELECT system.encrypt2bytearray('ΠΑΠΑΔΟΠΟΥΛΟΣ', '/home/oracle/public.key') FROM dual), '/home/oracle/private.key') FROM dual;

SELECT system.decryptfromhexstring('9340921FD5FB20ECD21A8D0698F676901E1C52ED357E8143F27D6A897904C45EA13E0875CF41ED7710CC94FC19E89EB3B4715FBB08F2E3EFE2409D241D96E1FE9C4754287A48FB44264639E313CE59F223F26005CF2E6EFD48672A1F66BB8A568E8CEC1AE48A344EA8F779AE2664231C20637C0797484A11D18920CD04F86D47', '/home/oracle/private.key') FROM dual;
-----------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO casinocrm.crypto_test(id, name) VALUES(5, 'παπαδόπουλος3');

INSERT INTO casinocrm.crypto_test(id, name) VALUES(6, 'Napoleon3');

SELECT * FROM casinocrm.crypto_test_old;

SELECT * FROM casinocrm.crypto_test;

UPDATE casinocrm.crypto_test SET name = 'james' WHERE id = 1;

DELETE casinocrm.crypto_test WHERE id = 1;
