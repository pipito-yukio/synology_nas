\c mylearn_pgdb;
CREATE EXTENSION pgcrypto;

DROP SCHEMA IF EXISTS exam1 CASCADE;

CREATE SCHEMA exam1;

SET search_path TO exam1,"$user",public;

DROP TABLE IF EXISTS t_username; 
DROP TABLE IF EXISTS t_email; 
DROP TABLE IF EXISTS t_credential; 
DROP TABLE IF EXISTS t_user CASCADE; 
DROP INDEX IF EXISTS UQ_t_user_account; 
DROP INDEX IF EXISTS UQ_t_email_addresss; 

CREATE TABLE t_user(
    pid varchar(512) NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
    main_name_no smallint NOT NULL,
    main_mail_no smallint,
    account varchar(32) NOT NULL,
    language varchar(16) NOT NULL,
    is_deleted boolean DEFAULT FALSE,
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted timestamp
);
CREATE TABLE t_username(
    pid varchar(512) NOT NULL REFERENCES t_user(pid),
    name_no smallint NOT NULL,
    name_order smallint NOT NULL,
    family_name varchar(64) NOT NULL,
    given_name varchar(64) NOT NULL,
    middle_names varchar(64),
    is_deleted boolean DEFAULT FALSE,
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted timestamp,
    CONSTRAINT CK_t_username_name_order CHECK (name_order IN (0, 1))
);
CREATE TABLE t_email(
    pid varchar(512) NOT NULL REFERENCES t_user(pid),
    mail_no smallint NOT NULL,
    mail_address varchar(256) NOT NULL,
    is_deleted boolean DEFAULT FALSE,
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted timestamp
);
CREATE TABLE t_credential(
    pid varchar(512) NOT NULL REFERENCES t_user(pid),
    token varchar(255) NOT NULL, -- gen key is full_name + timestamp
    duration_start date NOT NULL,
    duration_end date,
    is_deleted boolean DEFAULT FALSE,
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted timestamp
);

ALTER TABLE t_username ADD
   CONSTRAINT PK_t_userName PRIMARY KEY (pid, name_no);

ALTER TABLE t_email ADD
   CONSTRAINT PK_t_email PRIMARY KEY (pid, mail_no);

ALTER TABLE t_credential ADD
   CONSTRAINT PK_t_credential PRIMARY KEY (pid, token);

CREATE UNIQUE INDEX UQ_t_user ON t_user(pid, account);
CREATE UNIQUE INDEX UQ_t_email_addresss ON t_email(mail_address);
