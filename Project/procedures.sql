-- Procédure : AjouterEvenement
CREATE PROCEDURE AjouterEvenement(
  @nom VARCHAR(255),
  @description VARCHAR(255),
  @date_debut DATE,
  @date_fin DATE,
  @prix_tickets DECIMAL(10, 2),
  @places_totales INT
)
AS
BEGIN
  INSERT INTO Événement (nom, description, date_debut, date_fin, prix_tickets, places_totales, places_restantes)
  VALUES (@nom, @description, @date_debut, @date_fin, @prix_tickets, @places_totales, @places_totales);
END;

-- Procédure : MiseAJourPlacesRestantes
CREATE PROCEDURE MiseAJourPlacesRestantes(
  @id_evenement INT,
  @tickets_vendus INT
)
AS
BEGIN
  UPDATE Événement
  SET places_restantes = places_restantes - @tickets_vendus
  WHERE id_evenement = @id_evenement;
END;

-- Procédure : ObtenirBilanFinancier
CREATE PROCEDURE ObtenirBilanFinancier(
  @id_billetterie INT,
  @bilan DECIMAL(10, 2) OUTPUT
)
AS
BEGIN
  SELECT @bilan = bilan
  FROM Billetterie
  WHERE id_billetterie = @id_billetterie;
END;

-- Procédure : AfficherEvenementsParEquipe
CREATE PROCEDURE AfficherEvenementsParEquipe(
  @nom_equipe VARCHAR(255)
)
AS
BEGIN
  SELECT Événement.*
  FROM Événement
  JOIN Équipe_Événement ON Événement.id_evenement = Équipe_Événement.id_evenement
  JOIN Équipe ON Équipe_Événement.id_equipe = Équipe.id_equipe
  WHERE Équipe.nom = @nom_equipe;
END;

-- Procédure : SupprimerFournisseur
CREATE PROCEDURE SupprimerFournisseur(
  @id_fournisseur INT
)
AS
BEGIN
  DELETE FROM Fournisseur
  WHERE id_fournisseur = @id_fournisseur;

  UPDATE Matériel
  SET id_fournisseur = NULL
  WHERE id_fournisseur = @id_fournisseur;
END;

