SHOW VARIABLES LIKE "secure_file_priv";

SELECT @@global.secure_file_priv;
show global variables like 'local_infile';
SET GLOBAL local_infile=1;
SHOW GRANTS;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE "local_infile";
LOAD DATA LOCAl INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/covid_deaths_modified.csv" INTO TABLE covid_deaths_modified FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
select * from covid_deaths_modified;

LOAD DATA LOCAl INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/covid_vaccinations.csv" INTO TABLE covid_vaccinations FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
select * from covid_vaccinations;
