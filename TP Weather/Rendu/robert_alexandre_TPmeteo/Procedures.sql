-- fichier contenant les procédures stockées

-- Procédure pour récupérer les températures d'une station dans un intervalle donné
CREATE PROCEDURE get_temperatures(
  IN station_id INT,
  IN start_date DATETIME,
  IN end_date DATETIME
)
BEGIN
  SELECT t FROM meteo
  WHERE numer_sta = station_id AND date BETWEEN start_date AND end_date;
END //

-- Procédure pour récupérer les pressions d'une station dans un intervalle donné
CREATE PROCEDURE get_pressures(
  IN station_id INT,
  IN start_date DATETIME,
  IN end_date DATETIME
)
BEGIN
  SELECT pres FROM meteo
  WHERE numer_sta = station_id AND date BETWEEN start_date AND end_date;
END //

-- Procédure pour récupérer la température maximale et minimale d'une station dans un intervalle donné
CREATE PROCEDURE get_tmax_tmin(
  IN station_id INT,
  IN start_date DATETIME,
  IN end_date DATETIME
)
BEGIN
  SELECT MAX(t) AS tmax, MIN(t) AS tmin FROM meteo
  WHERE numer_sta = station_id AND date BETWEEN start_date AND end_date;
END //

-- Procédure pour récupérer la pression maximale et minimale d'une station dans un intervalle donné
CREATE PROCEDURE get_pmax_pmin(
  IN station_id INT,
  IN start_date DATETIME,
  IN end_date DATETIME
)
BEGIN
  SELECT MAX(pres) AS pmax, MIN(pres) AS pmin FROM meteo
  WHERE numer_sta = station_id AND date BETWEEN start_date AND end_date;
END //

