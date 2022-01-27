DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'admin'@'%';
DROP USER IF EXISTS 'citizen'@'localhost';
DROP USER IF EXISTS 'citizen'@'%';

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';

CREATE USER 'citizen'@'localhost' IDENTIFIED BY 'citizen';
CREATE USER 'citizen'@'%' IDENTIFIED BY 'citizen';

USE `test`;
CREATE 
     OR REPLACE SQL SECURITY DEFINER
VIEW `query1` AS
SELECT id AS crimeId, city, description
FROM crimes
WHERE city='Thessaloniki' AND date>2020;

CREATE 
     OR REPLACE SQL SECURITY DEFINER
VIEW `query2` AS
SELECT id AS crimeId, name, surname, age, description
FROM crimes JOIN crimes_offenders ON crimes.id=crimes_offenders.crimeId
JOIN offenders ON offenders.idCardNumber=crimes_offenders.offenderId
WHERE offenders.age<18;

GRANT SELECT ON test.victims_per_city TO 'citizen'@'localhost';
GRANT SELECT ON test.victims_per_city TO 'citizen'@'%';  
GRANT SELECT ON query1 TO 'citizen'@'localhost';
GRANT SELECT ON query1 TO 'citizen'@'%';  
GRANT SELECT ON query2 TO 'citizen'@'localhost';
GRANT SELECT ON query2 TO 'citizen'@'%';  

drop user if exists 'investigator'@'localhost';
drop user if exists 'investigator'@'%';

CREATE USER 'investigator'@'localhost' IDENTIFIED BY 'investigator';
CREATE USER 'investigator'@'%' IDENTIFIED BY 'investigator';

USE `test`;
CREATE 
     OR REPLACE SQL SECURITY DEFINER
VIEW `evidenceWithoutDNA` AS
    SELECT 
        `evidence`.`classification` AS `classification`,
		`evidence`.`type` AS `type`,
		`evidence`.`description` AS `description`,
        `evidence`.`crimeId` AS `crimId`
    FROM
        `evidence`
    WHERE
        (`evidence`.`type` != 'DNA');
GRANT SELECT ON evidenceWithoutDNA TO 'investigator'@'localhost'; 

GRANT SELECT, UPDATE, INSERT ON test.crimes TO 'investigator'@'localhost';
GRANT SELECT, UPDATE, INSERT ON test.crimes_investigators TO 'investigator'@'localhost';
GRANT SELECT, UPDATE, INSERT ON test.crimes_offenders TO 'investigator'@'localhost';
GRANT SELECT, UPDATE, INSERT ON test.crimes_weapons TO 'investigator'@'localhost';
GRANT SELECT, UPDATE, INSERT ON test.offenders TO 'investigator'@'localhost';
GRANT SELECT, UPDATE, INSERT ON test.sentences TO 'investigator'@'localhost';
GRANT SELECT, UPDATE, INSERT ON test.victims TO 'investigator'@'localhost';
GRANT SELECT, UPDATE, INSERT ON test.weapons TO 'investigator'@'localhost';
GRANT SELECT ON test.investigators TO 'investigator'@'localhost';

#SELECT  CONCAT("GRANT UPDATE, INSERT ON new_schema.", table_name, " TO invastigatorr@localhost;")
#FROM information_schema.TABLES
#WHERE table_schema = "new_schema" AND table_name <> "evidence";

DROP USER IF EXISTS 'lawyer'@'localhost';
DROP USER IF EXISTS 'lawyer'@'%';
CREATE USER 'lawyer'@'localhost' IDENTIFIED BY 'lawyer';
CREATE USER 'lawyer'@'%' IDENTIFIED BY 'lawyer';
GRANT SELECT ON new_schema.* TO 'lawyer'@'localhost';
GRANT SELECT ON new_schema.* TO 'lawyer'@'%';

DROP USER IF EXISTS 'medical_examer'@'localhost';
DROP USER IF EXISTS 'medical_examer'@'%';
CREATE USER 'medical_examer'@'localhost' IDENTIFIED BY 'medical_examer';
CREATE USER 'medical_examer'@'%' IDENTIFIED BY 'medical_examer';
GRANT SELECT, INSERT, UPDATE ON test.evidence TO 'medical_examer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON test.evidence TO 'medical_examer'@'%';

DROP USER IF EXISTS 'police'@'localhost';
DROP USER IF EXISTS 'police'@'%';
CREATE USER 'police'@'localhost' IDENTIFIED BY 'police';
CREATE USER 'police'@'%' IDENTIFIED BY 'police';

USE `test`;
CREATE 
     OR REPLACE SQL SECURITY DEFINER
VIEW `solvedcrimes` AS
    SELECT 
        `crimes`.`id` AS `id`,
		`crimes`.`type` AS `type`,
		`crimes`.`date` AS `date`,
        `crimes`.`time` AS `time`,
        `crimes`.`country` AS `country`,
        `crimes`.`city` AS `city`,
        `crimes`.`address` AS `address`,
        `crimes`.`isSolved` AS `isSolved`,
        `crimes`.`description` AS `description`
    FROM
        `crimes`
    WHERE
        (`crimes`.`isSolved` = '1');

GRANT SELECT ON solvedcrimes.* TO 'police'@'localhost';
GRANT SELECT ON solvedcrimes.* TO 'police'@'%';  
