-- User: mtk_scott
-- DROP USER mtk_scott;

CREATE USER mtk_scott WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

COMMENT ON ROLE mtk_scott IS 'Enterprise DB Migration Toolkit user for Oracle schema SCOTT';

ALTER USER mtk_scott WITH PASSWORD 'passw0rt';

-- Database: mtk_scott_db

-- DROP DATABASE mtk_scott_db;

CREATE DATABASE mtk_scott_db
    WITH 
    OWNER = mtk_scott
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE mtk_scott_db
    IS 'EnterpriseDB Migration Toolkit database for Oracle schema SCOTT';
