-- Création de la table Événement
CREATE TABLE Événement (
  id_evenement INT PRIMARY KEY,
  nom VARCHAR(255),
  description VARCHAR(255),
  date_debut DATE,
  date_fin DATE,
  prix_tickets DECIMAL(10, 2),
  places_totales INT,
  places_restantes INT
);

-- Création de la table Fournisseur
CREATE TABLE Fournisseur (
  id_fournisseur INT PRIMARY KEY,
  nom VARCHAR(255),
  description VARCHAR(255),
  mail VARCHAR(255),
  numero_tel VARCHAR(255)
);

-- Création de la table Employé
CREATE TABLE Employé (
  id_employe INT PRIMARY KEY,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  mail VARCHAR(255),
  poste VARCHAR(255)
);

-- Création de la table Équipe
CREATE TABLE Équipe (
  id_equipe INT PRIMARY KEY,
  nom VARCHAR(255),
  type VARCHAR(255)
);

-- Création de la table Billetterie
CREATE TABLE Billetterie (
  id_billetterie INT PRIMARY KEY,
  id_evenement INT,
  tickets_vendus INT,
  recettes DECIMAL(10, 2),
  depenses DECIMAL(10, 2),
  bilan DECIMAL(10, 2),
  FOREIGN KEY (id_evenement) REFERENCES Événement(id_evenement)
);

-- Création de la table Équipe_Événement
CREATE TABLE Équipe_Événement (
  id_equipe_evenement INT PRIMARY KEY,
  id_evenement INT,
  id_equipe INT,
  FOREIGN KEY (id_evenement) REFERENCES Événement(id_evenement),
  FOREIGN KEY (id_equipe) REFERENCES Équipe(id_equipe)
);

-- Création de la table Matériel
CREATE TABLE Matériel (
  id_materiel INT PRIMARY KEY,
  id_evenement INT,
  id_fournisseur INT,
  nom_materiel VARCHAR(255),
  FOREIGN KEY (id_evenement) REFERENCES Événement(id_evenement),
  FOREIGN KEY (id_fournisseur) REFERENCES Fournisseur(id_fournisseur)
);
