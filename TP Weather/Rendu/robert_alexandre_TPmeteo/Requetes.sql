-- a) Donnez la liste de températures de la station n° 7005 :
SELECT t FROM meteo WHERE numer_sta = '7005';

-- b) Donnez Tmin, Tmax pour la station n° 7577 pour la date d'hier :
SELECT MIN(t) as Tmin, MAX(t) as Tmax FROM meteo WHERE numer_sta = '7577' AND date = DATEADD(day, -1, GETDATE());

-- c) Donnez la description du temps pour la station n°7643, pour le 20/10/2018 à 18H :
SELECT description FROM code_temps_present WHERE code = (SELECT ww FROM meteo WHERE numer_sta = '7643' AND date = '2018-10-20 18:00:00');

-- d) Comptez le nombre de stations dans la base :
SELECT COUNT(*) FROM station;

-- e) Donnez les températures et les pressions de la semaine pour la station de Strasbourg-Entzheim :
SELECT t, pres FROM meteo 
WHERE numer_sta = (SELECT numer_sta FROM station WHERE nom = 'Strasbourg-Entzheim') 
AND date >= DATEADD(day, -7, GETDATE());

-- f) Donnez la température moyenne de la semaine par n° de station :
SELECT numer_sta, AVG(t) as temperature_moyenne FROM meteo 
WHERE date >= DATEADD(day, -7, GETDATE()) 
GROUP BY numer_sta;

-- g) Donnez la température moyenne et la pression moyenne de la semaine par nom de station :
SELECT s.nom as nom_station, AVG(m.t) as temperature_moyenne, AVG(m.pres) as pression_moyenne 
FROM meteo m 
JOIN station s ON m.numer_sta = s.numer_sta 
WHERE m.date >= DATEADD(day, -7, GETDATE()) 
GROUP BY s.nom;

-- h) Donnez la date/heure, le nom de la station et la direction du vent en lettre pour l’ensemble des relevés :
SELECT meteo.date, station.nom, 
CASE
    WHEN dd BETWEEN 0 AND 22.5 THEN 'N'
    WHEN dd BETWEEN 22.5 AND 67.5 THEN 'NE'
    WHEN dd BETWEEN 67.5 AND 112.5 THEN 'E'
    WHEN dd BETWEEN 112.5 AND 157.5 THEN 'SE'
    WHEN dd BETWEEN 157.5 AND 202.5 THEN 'S'
    WHEN dd BETWEEN 202.5 AND 247.5 THEN 'SO'
    WHEN dd BETWEEN 247.5 AND 292.5 THEN 'O'
    WHEN dd BETWEEN 292.5 AND 337.5 THEN 'NO'
    WHEN dd BETWEEN 337.5 AND 360 THEN 'N'
END AS direction_vent
FROM meteo
INNER JOIN station ON meteo.numer_sta = station.numer_sta;

-- i) Donnez la date et le nom de la station qui a des valeurs manquantes dans une des mesures :
SELECT numer_sta, date FROM meteo
WHERE dd IS NULL OR ff IS NULL OR t IS NULL OR u IS NULL OR ww IS NULL OR pres IS NULL;

-- j) Donnez la moyenne de température par région :
SELECT region.nom, AVG(meteo.t) AS temperature_moyenne FROM meteo
INNER JOIN station ON meteo.numer_sta = station.numer_sta
INNER JOIN region ON station.region_id = region.id
GROUP BY region.nom;

-- k) Quelle est la région la plus chaude ? la plus froide ?
-- La plus chaude :
SELECT region.nom, AVG(meteo.t) AS temperature_moyenne FROM meteo
INNER JOIN station ON meteo.numer_sta = station.numer_sta
INNER JOIN region ON station.region_id = region.id
GROUP BY region.nom
ORDER BY temperature_moyenne DESC;

-- La plus froide :
SELECT region.nom, AVG(meteo.t) AS temperature_moyenne FROM meteo
INNER JOIN station ON meteo.numer_sta = station.numer_sta
INNER JOIN region ON station.region_id = region.id
GROUP BY region.nom
ORDER BY temperature_moyenne ASC;

-- l) Donnez les régions dont la température moyenne est inférieur à la température moyenne nationale :

SELECT region.nom FROM region
JOIN station ON region.id = station.region_id
JOIN meteo ON station.numer_sta = meteo.numer_sta
GROUP BY region.nom
HAVING AVG(meteo.t) < (SELECT AVG(t) FROM meteo)

-- m) Donnez les régions limitrophes à la région Grand Est :

SELECT region.nom FROM region
JOIN region_limitrophes ON region.id = region_limitrophes.region_id
WHERE region_limitrophes.region_id_limitrophe = (SELECT id FROM region WHERE nom = 'Grand Est')

-- n) Quelle régions ont le plus de voisins ?

SELECT region.nom, COUNT(region_limitrophes.region_id) AS nb_voisins FROM region
JOIN region_limitrophes ON region.id = region_limitrophes.region_id
GROUP BY region.nom
ORDER BY nb_voisins DESC;

-- o) Y a-t-il des stations dont la température max est inférieure à la température moyenne nationale ?

SELECT * FROM station
JOIN meteo ON station.numer_sta = meteo.numer_sta
WHERE meteo.tmax < (SELECT AVG(t) FROM meteo)

-- p) Y a-t-il des stations où il a plu toute une journée ?

SELECT DISTINCT station.numer_sta FROM station
JOIN meteo ON station.numer_sta = meteo.numer_sta
WHERE meteo.ww = 99 AND meteo.tmin = meteo.tmax
