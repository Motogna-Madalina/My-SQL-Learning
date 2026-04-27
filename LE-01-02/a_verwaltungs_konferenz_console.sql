DROP DATABASE IF EXISTS verwaltung_konferenz;
CREATE DATABASE IF NOT EXISTS verwaltung_konferenz;

USE verwaltung_konferenz;

CREATE TABLE IF NOT EXISTS referent (
id_referent INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
name VARCHAR(100) NOT NULL,
e_mail VARCHAR(255) NOT NULL UNIQUE ,
organisation VARCHAR(100) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS teilnehmer (
  id_teilnehmer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  e_mail VARCHAR(255) NOT NULL UNIQUE ,
  organisation VARCHAR(100) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS themen (
  id_themen INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  kurzbeschreibung VARCHAR(300) NOT NULL,
  id_referent INT DEFAULT NULL,
  FOREIGN KEY (id_referent) REFERENCES referent(id_referent)
);

CREATE TABLE IF NOT EXISTS teilnehmer_themen (
  id_teilnehmer INT NOT NULL,
  id_themen INT NOT NULL,

PRIMARY KEY (id_teilnehmer, id_themen),
  FOREIGN KEY (id_teilnehmer)
    REFERENCES teilnehmer(id_teilnehmer),
  FOREIGN KEY (id_themen)
    REFERENCES themen(id_themen)
);
