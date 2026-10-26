
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `casas_vasallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casas_vasallas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `castillo` varchar(255) DEFAULT NULL,
  `lealtad` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `grandes_casas_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn3wwd9jximhkkthxwx64yg9tx` (`grandes_casas_id`),
  CONSTRAINT `FKn3wwd9jximhkkthxwx64yg9tx` FOREIGN KEY (`grandes_casas_id`) REFERENCES `grandes_casas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `fortalezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fortalezas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `capacidad` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `grandes_casas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grandes_casas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lema` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `region` enum('ESTE','NORTE','OESTE','SUR') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `maestres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maestres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ano_graduacion` int DEFAULT NULL,
  `especialidad` enum('CUERVOS','HISTORIA','MEDICINA','RUMORES') DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo_eslabon` enum('COBRE','HIERRO','ORO','PLATA') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `recuadaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recuadaciones` (
  `fecha` date NOT NULL,
  `estado_pago` enum('EN_DEMORA','EXIMIDO_POR_GUERRA','SATISFECHO') DEFAULT NULL,
  `importe` int DEFAULT NULL,
  `grandes_casas_id` int NOT NULL,
  `maestres_id` int NOT NULL,
  PRIMARY KEY (`fecha`,`grandes_casas_id`,`maestres_id`),
  KEY `FKk240p1q29arfyllvxcbsfodi2` (`grandes_casas_id`),
  KEY `FK381w2nuy2qyig9jby6to1ul57` (`maestres_id`),
  CONSTRAINT `FK381w2nuy2qyig9jby6to1ul57` FOREIGN KEY (`maestres_id`) REFERENCES `maestres` (`id`),
  CONSTRAINT `FKk240p1q29arfyllvxcbsfodi2` FOREIGN KEY (`grandes_casas_id`) REFERENCES `grandes_casas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `regimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regimientos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coste_mantenimiento` double DEFAULT NULL,
  `num_soldados` int DEFAULT NULL,
  `tipo_tropa` enum('ARQUERIA','ASEDIO','CABALLERIA','INFANTERIA','PESADA') DEFAULT NULL,
  `casas_vasallas_id` int DEFAULT NULL,
  `fortalezas_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6vdfj0tl7a3h1y65u3s3oh4y0` (`casas_vasallas_id`),
  KEY `FKm7hqsmj02i9qx1vx5ued1q4rs` (`fortalezas_id`),
  CONSTRAINT `FK6vdfj0tl7a3h1y65u3s3oh4y0` FOREIGN KEY (`casas_vasallas_id`) REFERENCES `casas_vasallas` (`id`),
  CONSTRAINT `FKm7hqsmj02i9qx1vx5ued1q4rs` FOREIGN KEY (`fortalezas_id`) REFERENCES `fortalezas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

