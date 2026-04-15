CREATE DATABASE verwaltung_konferenz;

USE verwaltung_konferenz;

CREATE TABLE referent (
id_referent INT NOT NULL PRIMARY KEY ,
name VARCHAR(100) NOT NULL,
e_mail VARCHAR(255) NOT NULL,
organisation VARCHAR(100) DEFAULT NULL
);

CREATE TABLE teilnehmer (
  id_teilnehmer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  e_mail VARCHAR(255) NOT NULL UNIQUE ,
  organisation VARCHAR(100) DEFAULT NULL
);

CREATE TABLE themen (
  id_themen INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  kurzbeschreibung VARCHAR(300) NOT NULL,
  id_referent INT DEFAULT NULL,

  FOREIGN KEY (id_referent)
    REFERENCES referent(id_referent)
);

CREATE TABLE teilnehmer_themen (
  id_teilnehmer INT NOT NULL,
  id_themen INT NOT NULL,

PRIMARY KEY (id_teilnehmer, id_themen),
  FOREIGN KEY (id_teilnehmer)
    REFERENCES teilnehmer(id_teilnehmer),
  FOREIGN KEY (id_themen)
    REFERENCES themen(id_themen)
);