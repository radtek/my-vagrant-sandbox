-- User: mtk_gdwhanlt
-- DROP USER mtk_gdwhanlt;

CREATE USER mtk_gdwhanlt WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

COMMENT ON ROLE mtk_gdwhanlt IS 'Enterprise DB Migration Toolkit user for Oracle schema GDWHANLT';

ALTER USER mtk_gdwhanlt WITH PASSWORD 'passw0rt';

-- Database: mtk_gdwhanlt_db

-- DROP DATABASE mtk_gdwhanlt_db;

CREATE DATABASE mtk_gdwhanlt_db
    WITH 
    OWNER = mtk_gdwhanlt
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE mtk_gdwhanlt_db
    IS 'EnterpriseDB Migration Toolkit database for Oracle schema GDWHANLT';
