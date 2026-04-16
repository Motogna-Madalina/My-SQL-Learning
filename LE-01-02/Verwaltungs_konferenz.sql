CREATE DATABASE verwaltung_konferenz
CREATE TABLE `referent` (
  `id_referent` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `e_mail` varchar(255) NOT NULL,
  `organisation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_referent`),
  UNIQUE KEY `e_mail_UNIQUE` (`e_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `teilnehmer` (
  `id_teilnehmer` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `e_mail` varchar(255) NOT NULL,
  `organisation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_teilnehmer`),
  UNIQUE KEY `e_mail_UNIQUE` (`e_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `teilnehmer_themen` (
  `id_teilnehmer` int DEFAULT NULL,
  `id_themen` int DEFAULT NULL,
  KEY `id_teilnehmer_idx` (`id_teilnehmer`),
  KEY `id_themen_idx` (`id_themen`),
  CONSTRAINT `id_teilnehmer` FOREIGN KEY (`id_teilnehmer`) REFERENCES `teilnehmer` (`id_teilnehmer`),
  CONSTRAINT `id_themen` FOREIGN KEY (`id_themen`) REFERENCES `themen` (`id_themen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `themen` (
  `id_themen` int NOT NULL,
  `kurzbeschreibung` varchar(300) NOT NULL,
  `id_referent` int DEFAULT NULL,
  PRIMARY KEY (`id_themen`),
  KEY `id_referent_idx` (`id_referent`),
  CONSTRAINT `id_referent` FOREIGN KEY (`id_referent`) REFERENCES `referent` (`id_referent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



