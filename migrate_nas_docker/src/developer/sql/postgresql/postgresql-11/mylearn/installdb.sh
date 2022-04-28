#!/bin/bash
psql mylearn_pgdb -Udeveloper -f /home/yukio/sql/postgresql-11/pgcrypto--1.3.sql
sleep 5
psql mylearn_pgdb -Udeveloper -f ./createtable.sql
