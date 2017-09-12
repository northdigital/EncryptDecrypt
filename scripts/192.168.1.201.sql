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
SELECT system.decryptfromraw('9468D1978CA8EA9B5A7639D91364518EE33ABC7A344E4DC2C3AEE97144B79B03427CFAAB2AD48F91D5991F898ABB3A8E1262D9444176947D6876E78FF8F5B46A9FE0E7B98FE91CACB2DADFE7465A6B2F6730ECA65F85F2ED4B4D9A21ABD7B6DA40545CEE7D38CA89789C1A762822671C184FA00F06FE9757F949ECAB77F9CBC0', '/home/oracle/private.key') FROM dual;

SELECT system.encrypt2hexstring('this is a larger string to encrypt but not to big', '/home/oracle/public.key') FROM dual;
SELECT system.decryptfromhexstring('41F487A26FF9C4BF3F16738F55D745EAC2E01171EA279F5837AD83AC25E48C5E1C0D321049584286F4CBE047067B53681CC9D027B1722DA4735DDF82649B52E297996620EA053DE640F51D3C4C384D9B4186AA867120811D2875E0C1208C849637B93DB10603B0A87A6668D99D1601AAE3BDC534B41B9CFC8994C0E5E6E31EE6', '/home/oracle/private.key') FROM dual;
-----------------------------------------------------------------------------------------------------------------------------------------------
