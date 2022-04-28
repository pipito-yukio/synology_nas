CREATE ROLE developer WITH LOGIN PASSWORD 'your-password';
--install pgcrypto that is required superuser. 
ALTER ROLE developer WITH SUPERUSER;
CREATE DATABASE mylearn_pgdb WITH OWNER=developer ENCODING='UTF-8' LC_COLLATE='ja_JP.UTF-8' LC_CTYPE='ja_JP.UTF-8';
GRANT ALL PRIVILEGES ON DATABASE mylearn_pgdb TO developer;
