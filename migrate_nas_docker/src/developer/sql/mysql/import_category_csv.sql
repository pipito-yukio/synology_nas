USE mylearn;

LOAD DATA INFILE '/home/yukio/sql/mysql/category.csv' INTO TABLE category
   CHARACTER SET 'utf8mb4'
   FIELDS TERMINATED BY ',' ENCLOSED BY '"'
   LINES TERMINATED BY '\n';
