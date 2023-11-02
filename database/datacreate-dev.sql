/* Grant all access to admin user */
GRANT ALL PRIVILEGES ON *.* TO 'lacroixe' WITH GRANT OPTION;

/* Create user and grant access to application database */
CREATE USER 'rsbookmarkdev01'@'localhost' IDENTIFIED BY 'MySQL@1-rule';
CREATE USER 'rsbookmarkdev01'@'%' IDENTIFIED BY 'MySQL@1-rule';
GRANT ALL PRIVILEGES ON bookmark.* TO 'rsbookmarkdev01'@'localhost';
GRANT ALL PRIVILEGES ON bookmark.* TO 'rsbookmarkdev01'@'%';

/* Flush privileges */
FLUSH PRIVILEGES;

/* Create tables */
CREATE TABLE `Labels` (
  `LabelId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`LabelId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Websites` (
  `WebsiteId` int NOT NULL AUTO_INCREMENT,
  `Date` datetime(6) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Note` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `LabelId` int NOT NULL,
  PRIMARY KEY (`WebsiteId`),
  KEY `Website_LabelId` (`LabelId`),
  CONSTRAINT `FK_Websites_Labels_LabelId` FOREIGN KEY (`LabelId`) REFERENCES `Labels` (`LabelId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;