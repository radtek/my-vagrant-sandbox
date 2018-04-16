-- User: mtk_gdwhint
-- DROP USER mtk_gdwhint;

CREATE USER mtk_gdwhint WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

COMMENT ON ROLE mtk_gdwhint IS 'Enterprise DB Migration Toolkit user for Oracle schema GDWHINT';

ALTER USER mtk_gdwhint WITH PASSWORD 'passw0rt';

-- Database: mtk_gdwhint_db

-- DROP DATABASE mtk_gdwhint_db;

CREATE DATABASE mtk_gdwhint_db
    WITH 
    OWNER = mtk_gdwhint
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE mtk_gdwhint_db
    IS 'EnterpriseDB Migration Toolkit database for Oracle schema GDWHINT';
