--create index LOGISMOS.I_FIRST_LAST_CARD_NUMBER on LOGISMOS.PLAYER_MASTER (UPPER(FIRST_NAME), UPPER(LAST_NAME), CARD_NUMBER);
create index LOGISMOS.I_FIRST_LAST_CARD_NUMBER 
on LOGISMOS.PLAYER_MASTER (
UPPER(FIRST_NAME), UPPER(system.decryptfromhexstring(LAST_NAME, '/home/oracle/private.key')), CARD_NUMBER);

--create index LOGISMOS.I_PLAYERMASTER_LASTBIRTHBLK on LOGISMOS.PLAYER_MASTER (LAST_NAME, BIRTH_DATE, BLACK_LIST);
create index LOGISMOS.I_PLAYERMASTER_LASTBIRTHBLK on LOGISMOS.PLAYER_MASTER (system.decryptfromhexstring(LAST_NAME, '/home/oracle/private.key'), BIRTH_DATE, BLACK_LIST);

--create index LOGISMOS.I_PLAYERMASTER_LASTBLKFIRST on LOGISMOS.PLAYER_MASTER (LAST_NAME, BLACK_LIST, FIRST_NAME);
create index LOGISMOS.I_PLAYERMASTER_LASTBLKFIRST on LOGISMOS.PLAYER_MASTER (system.decryptfromhexstring(LAST_NAME, '/home/oracle/private.key'), BLACK_LIST, FIRST_NAME);

--create index LOGISMOS.I_PLMASTER_UPPLSTCARDINACT on LOGISMOS.PLAYER_MASTER (UPPER(LAST_NAME), CARD_NUMBER, INACTIVE);
create index LOGISMOS.I_PLMASTER_UPPLSTCARDINACT on LOGISMOS.PLAYER_MASTER (UPPER(system.decryptfromhexstring(LAST_NAME, '/home/oracle/private.key')), CARD_NUMBER, INACTIVE);

create index LOGISMOS.I_PLMASTER_LAST_NAME on LOGISMOS.PLAYER_MASTER (UPPER(system.decryptfromhexstring(LAST_NAME, '/home/oracle/private.key')));


drop index LOGISMOS.I_FIRST_LAST_CARD_NUMBER;
drop index LOGISMOS.I_PLAYERMASTER_LASTBIRTHBLK;
drop index LOGISMOS.I_PLAYERMASTER_LASTBLKFIRST;
drop index LOGISMOS.I_PLMASTER_UPPLSTCARDINACT;

select * from logismos.player_master t where UPPER(system.decryptfromhexstring(LAST_NAME, '/home/oracle/private.key')) like 'A%';
