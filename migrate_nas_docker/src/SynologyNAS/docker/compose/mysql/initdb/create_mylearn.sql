CREATE USER 'mysql'@'localhost' IDENTIFIED BY 'yourpassword';
CREATE USER 'mysql'@'%' IDENTIFIED BY 'yourpassword';
CREATE USER 'developer'@'%' IDENTIFIED BY 'yourpassword';
CREATE DATABASE mylearn CHARACTER SET utf8; 
GRANT ALL ON *.* TO 'mysql'@'%' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'developer'@'%' WITH GRANT OPTION;
GRANT ALL ON mylearn.* TO 'developer'@'%' WITH GRANT OPTION;
