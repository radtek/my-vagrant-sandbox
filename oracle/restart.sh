#after VM restart:
#
# $ sudo su - oracle
#
# $ echo $ORACLE_HOME
# /u01/app/oracle/product/12.1.0/dbhome_1
#
# $ cd $ORACLE_HOME
# 
# $ bin/dbstart $ORACLE_HOME
#
# $ pwd
# /u01/app/oracle/product/12.1.0/dbhome_1
# 
# $ sqlplus /nolog
#SQL*Plus: Release 12.1.0.2.0 Production on Wed Mar 21 13:41:35 2018
#Copyright (c) 1982, 2014, Oracle.  All rights reserved.
#SQL> conn sys as sysdba
#Enter password: ****
#Connected to an idle instance.
#SQL> startup
#ORACLE instance started.
#Total System Global Area 2466250752 bytes
#Fixed Size                  2927384 bytes
#Variable Size             671089896 bytes
#Database Buffers         1778384896 bytes
#Redo Buffers               13848576 bytes
#Database mounted.
#Database opened.
#SQL> exit:
#
# $ sqlplus scott/passw0rt@orcl
# SQL> select user, sysdate from dual;
#