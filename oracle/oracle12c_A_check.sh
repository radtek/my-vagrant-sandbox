set -x
#
sudo su - oracle <<EOF
#
sqlplus system/passw0rt@orcl <<SQL
--
set echo on
--
alter user scott account unlock;
alter user scott identified by "passw0rt";
--
SQL
#
sqlplus sys/passw0rt@orcl as SYSDBA <<SQL
--
-- required by EDB migration toolkit
grant select on DBA_ROLES to SCOTT;
grant select on DBA_USERS to SCOTT;
grant select on DBA_TAB_PRIVS to SCOTT;
grant select on DBA_PROFILES to SCOTT;
grant select on DBA_ROLE_PRIVS to SCOTT;
grant select on ROLE_ROLE_PRIVS to SCOTT;
grant select on DBA_SYS_PRIVS to SCOTT;
--
SQL
#
sqlplus scott/passw0rt@orcl <<SQL
--
select user, sysdate from dual;
--
SQL
#
EOF
#
sudo su - oracle <<EOF
#
sqlplus system/passw0rt@orcl <<SQL
--
set echo on
--
alter user HR account unlock;
alter user HR identified by "passw0rt";
--
SQL
#
sqlplus sys/passw0rt@orcl as SYSDBA <<SQL
--
-- required by EDB migration toolkit
grant select on DBA_ROLES to HR;
grant select on DBA_USERS to HR;
grant select on DBA_TAB_PRIVS to HR;
grant select on DBA_PROFILES to HR;
grant select on DBA_ROLE_PRIVS to HR;
grant select on ROLE_ROLE_PRIVS to HR;
grant select on DBA_SYS_PRIVS to HR;
--
SQL
#
sqlplus HR/passw0rt@orcl <<SQL
--
select user, sysdate from dual;
--
SQL
#
EOF
#
sudo su - oracle <<EOF
#
sqlplus system/passw0rt@bibd <<SQL
--
CREATE USER gdwhint IDENTIFIED BY "passw0rt";
GRANT CONNECT, RESOURCE TO gdwhint;
--
GRANT CREATE VIEW TO gdwhint;
GRANT CREATE SYNONYM TO gdwhint;
--
CREATE USER gdwhanlt IDENTIFIED BY "passw0rt";
GRANT CONNECT, RESOURCE TO gdwhanlt;
GRANT UNLIMITED TABLESPACE TO gdwhanlt;
GRANT CREATE VIEW TO gdwhanlt;
GRANT CREATE SYNONYM TO gdwhanlt;
GRANT CREATE MATERIALIZED VIEW TO gdwhanlt;
--
CREATE ROLE gdwh_java_role;
CREATE USER gdwh_sas_owner IDENTIFIED BY "passw0rt";
CREATE ROLE gdwh_dna_role;
CREATE USER gdwhsas IDENTIFIED BY "passw0rt";
CREATE ROLE gdwh_mstr_role;
--
SQL
#
sqlplus sys/passw0rt@orcl as SYSDBA <<SQL
--
GRANT SELECT ON sys.v_$session TO gdwhanlt;
--
grant select on DBA_ROLES to GDWHINT;
grant select on DBA_USERS to GDWHINT;
grant select on DBA_TAB_PRIVS to GDWHINT;
grant select on DBA_PROFILES to GDWHINT;
grant select on DBA_ROLE_PRIVS to GDWHINT;
grant select on ROLE_ROLE_PRIVS to GDWHINT;
grant select on DBA_SYS_PRIVS to GDWHINT;
--
grant select on DBA_ROLES to GDWHANLT;
grant select on DBA_USERS to GDWHANLT;
grant select on DBA_TAB_PRIVS to GDWHANLT;
grant select on DBA_PROFILES to GDWHANLT;
grant select on DBA_ROLE_PRIVS to GDWHANLT;
grant select on ROLE_ROLE_PRIVS to GDWHANLT;
grant select on DBA_SYS_PRIVS to GDWHANLT;
--
SQL
#
EOF
#
exit
#
purge recyclebin;
--
select 'DROP '|| object_type ||' '||user||'.'|| object_name ||';'
from user_objects
where object_type not in ('INDEX','TRIGGER','PACKAGE BODY','LOB','SYNONYM')
and object_type not like '% %PARTITION'
ORDER BY CASE object_type WHEN 'TABLE' THEN 1 ELSE 0 END;

