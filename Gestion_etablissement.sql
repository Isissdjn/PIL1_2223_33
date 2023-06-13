CREATE DATABASE gestion_etablissement;
USE gestion_etablissement;
CREATE TABLE utilisateur (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255) DEFAULT NULL,
  prenom VARCHAR(255) DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL,
  `password` VARCHAR(255) DEFAULT NULL);
  
CREATE TABLE `etudiant` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `niveau` VARCHAR(255) DEFAULT NULL,
  `utilisateur_id` INT DEFAULT NULL,
   FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`));
   
CREATE TABLE `enseignant` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `utilisateur_id` INT DEFAULT NULL,
  `matiere` VARCHAR(255) DEFAULT NULL,
  FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`));
  
  CREATE TABLE `administrateur` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `utilisateur_id` INT DEFAULT NULL,
   FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`)
);

CREATE TABLE `cours` (
  `id` 	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(255) DEFAULT NULL,
  `description` TEXT,
  `enseignant_id` INT DEFAULT NULL,
  `salle` VARCHAR(255) DEFAULT NULL,
  `heure_debut` TIME DEFAULT NULL,
  `heure_fin` TIME DEFAULT NULL,
  `jour_semaine` VARCHAR(255) DEFAULT NULL,
  FOREIGN KEY (`enseignant_id`) REFERENCES `enseignant` (`id`)
);

CREATE TABLE `emploidutemps` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `etudiant_id` INT DEFAULT NULL,
  `cours_id` INT DEFAULT NULL,
  FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`));
