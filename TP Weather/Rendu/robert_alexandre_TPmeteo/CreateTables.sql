-- CREATE TABLE station (
--     numer_sta INT PRIMARY KEY,
--     region VARCHAR(50)
-- );

-- CREATE TABLE region (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     nom VARCHAR(50),
--     regions_limitrophes VARCHAR(50)
-- );

-- CREATE TABLE code_temps_present (
--   code VARCHAR(2) PRIMARY KEY,
--   description VARCHAR(100)
-- );

-- -- Créer la table 'meteo' avec la contrainte de clé étrangère
-- CREATE TABLE meteo (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     numer_sta INT,
--     date DATE,
--     dd INT,
--     ff INT,
--     t FLOAT,
--     u INT,
--     ww INT,
--     pres INT,
--     FOREIGN KEY (numer_sta) REFERENCES station(numer_sta)
-- );

-- Création de la table "region" avec sa clé primaire "id"
CREATE TABLE region (
id INT PRIMARY KEY,
nom VARCHAR(50),
region_limitrophes VARCHAR(200)
);

-- Création de la table "station" avec sa clé primaire "numer_sta" et la clé étrangère "region_id" référençant la table "region"
CREATE TABLE station (
numer_sta INT PRIMARY KEY,
region_id INT,
FOREIGN KEY (region_id) REFERENCES region(id)
);

-- Création de la table "code_temps_present" avec sa clé primaire "code"
CREATE TABLE code_temps_present (
code INT PRIMARY KEY,
description VARCHAR(255)
);

-- Création de la table "meteo" avec sa clé primaire composite composée de la clé étrangère "numer_sta" référençant la table "station" et du champ "date"
CREATE TABLE meteo (
numer_sta INT,
    date DATE,
    dd INT,
    ff INT,
    t FLOAT,
    u INT,
    ww INT,
    pres INT,
PRIMARY KEY (numer_sta, date),
FOREIGN KEY (numer_sta) REFERENCES station(numer_sta)
);

-- Ajout de contraintes d'intégrité référentielle
ALTER TABLE station ADD CONSTRAINT fk_region_id FOREIGN KEY (region_id) REFERENCES region(id);
ALTER TABLE meteo ADD CONSTRAINT fk_numer_sta FOREIGN KEY (numer_sta) REFERENCES station(numer_sta);
ALTER TABLE meteo ADD CONSTRAINT fk_code FOREIGN KEY (ww) REFERENCES code_temps_present(code);