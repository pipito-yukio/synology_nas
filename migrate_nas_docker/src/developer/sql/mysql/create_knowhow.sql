USE mylearn;

DROP TABLE IF EXISTS `knowhow`;
DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
   `id` SMALLINT UNSIGNED NOT NULL,
   `name` VARCHAR(60) NOT NULL UNIQUE,
   PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `knowhow` (
   `id` INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
   `category_id` SMALLINT UNSIGNED NOT NULL,
   `title` VARCHAR(200) NOT NULL,   -- Japanese or English
   `keyword` VARCHAR(128) NOT NULL, -- Keyword space delimited
   `refer_url` VARCHAR(256),
   `doc_place` VARCHAR(256),
   `content` TEXT,                  -- for English
   `content_jp` TEXT,               -- for Japanese
   FULLTEXT (keyword, content),
   FULLTEXT (content_jp) WITH PARSER ngram,
   FOREIGN KEY (category_id) REFERENCES category(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

