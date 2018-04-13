-- User: mtk_hr
-- DROP USER mtk_hr;

CREATE USER mtk_hr WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

COMMENT ON ROLE mtk_hr IS 'Enterprise DB Migration Toolkit user for Oracle schema HR';

ALTER USER mtk_hr WITH PASSWORD 'passw0rt';

-- Database: mtk_hr_db

-- DROP DATABASE mtk_hr_db;

CREATE DATABASE mtk_hr_db
    WITH 
    OWNER = mtk_hr
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE mtk_hr_db
    IS 'EnterpriseDB Migration Toolkit database for Oracle schema HR';
