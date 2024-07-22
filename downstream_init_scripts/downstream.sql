SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;
ALTER SYSTEM SET STREAMS_POOL_SIZE=512M SCOPE=BOTH SID='XE';
ALTER DATABASE FORCE LOGGING;
ALTER DATABASE ADD SUPPLEMENTAL LOG DATA FOR PROCEDURAL REPLICATION;
ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;
ALTER DATABASE ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;
ALTER SYSTEM SET ENABLE_GOLDENGATE_REPLICATION=TRUE SCOPE=BOTH;
-- ALTER SYSTEM SET log_archive_dest_2='SERVICE=SOURCE_XEPDB1 PRIMARY_ROLE=ENABLE LGWR ASYNC VALID_FOR=(ONLINE_LOGFILES,PRIMARY_ROLE)' SCOPE=BOTH;

ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=/u01/oradata/downstream-db/arch_local VALID_FOR=(ONLINE_LOGFILE,PRIMARY_ROLE)';
ALTER DATABASE ADD STANDBY LOGFILE GROUP 4 '/u01/oradata/downstream-db/standby_redo04.log' SIZE 50M;
ALTER DATABASE ADD STANDBY LOGFILE GROUP 5 '/u01/oradata/downstream-db/standby_redo05.log' SIZE 50M;
ALTER DATABASE ADD STANDBY LOGFILE GROUP 6 '/u01/oradata/downstream-db/standby_redo06.log' SIZE 50M;
ALTER DATABASE ADD STANDBY LOGFILE GROUP 7 '/u01/oradata/downstream-db/standby_redo07.log' SIZE 50M;
ALTER SYSTEM SET LOG_ARCHIVE_DEST_2=’LOCATION=/u01/oradata/downstream-db/arch_remote VALID_FOR=(STANDBY_LOGFILE,PRIMARY_ROLE)’;
ALTER SYSTEM SET LOG_ARCHIVE_DEST_STATE_2=ENABLE;

ALTER SYSTEM SET LOG_ARCHIVE_CONFIG='DG_CONFIG=(source-db,downstream-db)';
ALTER SESSION SET CONTAINER = XEPDB1;
CREATE TABLESPACE GG_ADMIN_DATA DATAFILE '/opt/oracle/oradata/XE/XEPDB1/ggadmin_data.dbf' SIZE 100m AUTOEXTEND ON NEXT 100m;
CREATE USER OGGADMIN IDENTIFIED BY "Admin11" CONTAINER=CURRENT DEFAULT TABLESPACE GG_ADMIN_DATA QUOTA UNLIMITED ON GG_ADMIN_DATA;
GRANT DBA TO OGGADMIN;
GRANT CONNECT TO OGGADMIN CONTAINER=CURRENT;
GRANT RESOURCE TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE SESSION TO OGGADMIN CONTAINER=CURRENT;
GRANT SELECT_CATALOG_ROLE TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER SYSTEM TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER USER TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER DATABASE TO OGGADMIN CONTAINER=CURRENT;
GRANT DATAPUMP_EXP_FULL_DATABASE TO OGGADMIN CONTAINER=CURRENT;
GRANT DATAPUMP_IMP_FULL_DATABASE TO OGGADMIN CONTAINER=CURRENT;
GRANT SELECT ANY DICTIONARY TO OGGADMIN CONTAINER=CURRENT;
GRANT SELECT ANY TRANSACTION TO OGGADMIN CONTAINER=CURRENT;
GRANT INSERT ANY TABLE TO OGGADMIN CONTAINER=CURRENT;
GRANT UPDATE ANY TABLE TO OGGADMIN CONTAINER=CURRENT;
GRANT DELETE ANY TABLE TO OGGADMIN CONTAINER=CURRENT;
GRANT LOCK ANY TABLE TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY TABLE TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY INDEX TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY CLUSTER TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY INDEXTYPE TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY OPERATOR TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY PROCEDURE TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY SEQUENCE TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY TRIGGER TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY TYPE TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY SEQUENCE TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE ANY VIEW TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY TABLE TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY INDEX TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY CLUSTER TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY INDEXTYPE TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY OPERATOR TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY PROCEDURE TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY SEQUENCE TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY TRIGGER TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY TYPE TO OGGADMIN CONTAINER=CURRENT;
GRANT ALTER ANY SEQUENCE TO OGGADMIN CONTAINER=CURRENT;
GRANT CREATE DATABASE LINK TO OGGADMIN CONTAINER=CURRENT;
EXEC DBMS_GOLDENGATE_AUTH.GRANT_ADMIN_PRIVILEGE('OGGADMIN',CONTAINER=>'CURRENT');
GRANT SELECT ON V_$DATABASE TO OGGADMIN;