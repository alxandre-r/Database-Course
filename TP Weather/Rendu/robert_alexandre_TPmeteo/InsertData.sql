
LOAD DATA LOCAL INFILE '/var/lib/mysql-files/code_wmo.csv'
INTO TABLE code_temps_present
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(code, description);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/donnees_meteo.csv'
INTO TABLE station
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
-- si data = mq alors NULL
(@numer_sta, @region)
SET numer_sta = NULLIF(@numer_sta,'mq'),
region_id = NULLIF(@region,'mq');


LOAD DATA LOCAL INFILE '/var/lib/mysql-files/donnees_meteo.csv'
INTO TABLE meteo
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
-- si data = mq alors NULL
(@numer_sta, @date, @dd, @ff, @t, @u, @ww, @pres)
SET numer_sta = NULLIF(@numer_sta,'mq'),
date = NULLIF(@date,'mq'),
dd = NULLIF(@dd,'mq'),
ff = NULLIF(@ff,'mq'),
t = NULLIF(@t,'mq'),
u = NULLIF(@u,'mq'),
ww = NULLIF(@ww,'mq'),
pres = NULLIF(@pres,'mq');


-- Création des données pour la table "region"
INSERT INTO region (id, nom, region_limitrophes)
VALUES (1, 'Ile-de-France', '2,3,4'), 
       (2, 'Nord', '1,3,5'), 
       (3, 'Est', '1,2,4,5'), 
       (4, 'Ouest', '1,3'), 
       (5, 'Sud', '2,3');

