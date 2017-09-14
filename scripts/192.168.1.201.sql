CREATE OR REPLACE FUNCTION echo(message VARCHAR2) RETURN VARCHAR2 AS
  LANGUAGE JAVA NAME 'gr.northdigital.cryptography.RSACryptographyHelper.echo(java.lang.String) return java.lang.String';

  --ENCRYPT--------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION system.encrypt2bytearray(originaltext VARCHAR2, publickeyfile VARCHAR2) RETURN RAW AS
  LANGUAGE JAVA NAME 'gr.northdigital.cryptography.RSACryptographyHelper.encrypt2ByteArray(java.lang.String,java.lang.String) return java.lang.Byte[]';

CREATE OR REPLACE FUNCTION system.encrypt2hexstring(originaltext VARCHAR2, publickeyfile VARCHAR2) RETURN VARCHAR2 AS
  LANGUAGE JAVA NAME 'gr.northdigital.cryptography.RSACryptographyHelper.encrypt2HexString(java.lang.String,java.lang.String) return java.lang.String';
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

SELECT system.encrypt2bytearray('papadopoulos', '/home/oracle/public.key') FROM dual;
SELECT system.decryptfromraw('7724D440E1110331B6AA644695BB3480136D8A0362B03DD0CA2DFB3A1FCBFC2843081028FD5A94DE6E4DDCF25F1C42F5C38750D1341213E9B5A70065C1480B1C04C9E961CE6573BF3937A4135FE1C84C51C4BEF2371C47014F987180569A59DAA400B7DF9E571DE8C170CDB8BA3D8E580357744786EA67737F8585849018F303', '/home/oracle/private.key') FROM dual;

SELECT system.encrypt2hexstring('this is a larger string to encrypt but not to big', '/home/oracle/public.key') FROM dual;
SELECT system.decryptfromhexstring('41F487A26FF9C4BF3F16738F55D745EAC2E01171EA279F5837AD83AC25E48C5E1C0D321049584286F4CBE047067B53681CC9D027B1722DA4735DDF82649B52E297996620EA053DE640F51D3C4C384D9B4186AA867120811D2875E0C1208C849637B93DB10603B0A87A6668D99D1601AAE3BDC534B41B9CFC8994C0E5E6E31EE6', '/home/oracle/private.key') FROM dual;
-----------------------------------------------------------------------------------------------------------------------------------------------
