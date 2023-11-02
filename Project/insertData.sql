-- Insertion des données dans la table Événement avec Billetterie
LOAD DATA INFILE '/var/lib/mysql-files/events.csv'
INTO TABLE Événement
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Insertion des données dans la table Matériel
LOAD DATA INFILE '/var/lib/mysql-files/equipment.csv'
INTO TABLE Matériel
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Insertion des données dans la table Fournisseur
LOAD DATA INFILE '/var/lib/mysql-files/suppliers.csv'
INTO TABLE Fournisseur
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Insertion des données dans la table Employé
LOAD DATA INFILE '/var/lib/mysql-files/employees.csv'
INTO TABLE Employé
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Insertion des données dans la table Équipe
LOAD DATA INFILE '/var/lib/mysql-files/teams.csv'
INTO TABLE Équipe
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Insertion des données dans la table Équipe_Événement
LOAD DATA INFILE '/var/lib/mysql-files/event_teams.csv'
INTO TABLE Équipe_Événement
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Insertion des données dans la table Billetterie
LOAD DATA INFILE '/var/lib/mysql-files/ticketing.csv'
INTO TABLE Billetterie
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

