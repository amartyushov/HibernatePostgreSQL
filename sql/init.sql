REVOKE CREATE ON SCHEMA public FROM PUBLIC;
CREATE SCHEMA mart_schema;

CREATE ROLE migration_role;
GRANT CONNECT ON DATABASE mart_db TO migration_role;
GRANT USAGE, CREATE ON SCHEMA mart_schema TO migration_role;
-- I think that during migration we should not touch data (well, until there is a real need for it)
--GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA mart_schema TO migration_role;
--ALTER DEFAULT PRIVILEGES IN SCHEMA mart_schema GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO migration_role;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA mart_schema TO migration_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA mart_schema GRANT USAGE ON SEQUENCES TO migration_role;

CREATE ROLE app_role;
GRANT CONNECT ON DATABASE mart_db TO app_role;
GRANT USAGE ON SCHEMA mart_schema TO app_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA mart_schema TO app_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA mart_schema GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_role;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA mart_schema TO app_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA mart_schema GRANT USAGE ON SEQUENCES TO app_role;

CREATE USER migration_user WITH PASSWORD 'migration_password';
CREATE USER app_user WITH PASSWORD 'app_password';

GRANT migration_role TO migration_user;
GRANT app_role TO app_user;


