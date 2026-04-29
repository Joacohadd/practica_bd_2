-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: gestionbiblioteca
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nombre_autor` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacionalidad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_autor`),
  KEY `idx_nacionalidad` (`nacionalidad`),
  KEY `idx_nombre_autor` (`nombre_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Gabriel García Márquez','Colombiana','1927-03-06'),(2,'Isabel Allende','Chilena','1942-08-02'),(3,'Mario Vargas Llosa','Peruana','1936-03-28'),(4,'Julio Cortázar','Argentina','1914-08-26'),(5,'Jorge Luis Borges','Argentina','1899-08-24');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_autor` int NOT NULL,
  `genero` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anio_publicacion` year DEFAULT NULL,
  `isbn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT '1',
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_libro`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `idx_titulo` (`titulo`),
  KEY `idx_genero` (`genero`),
  KEY `idx_anio` (`anio_publicacion`),
  KEY `idx_autor` (`id_autor`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'Cien años de soledad',1,'Realismo mágico',1967,'978-84-376-0494-7',1,'2025-08-19 20:12:41'),(2,'La casa de los espíritus',2,'Realismo mágico',1982,'978-84-204-2962-7',1,'2025-08-19 20:12:41'),(3,'La ciudad y los perros',3,'Novela',1963,'978-84-322-0441-9',1,'2025-08-19 20:12:41'),(4,'Rayuela',4,'Literatura experimental',1963,'978-84-376-0543-2',1,'2025-08-19 20:12:41'),(5,'El Aleph',5,'Cuentos',1949,'978-84-206-3914-8',1,'2025-08-19 20:12:41'),(6,'Conversación en La Catedral',3,'Novela',1969,'978-84-322-0442-6',1,'2025-08-19 20:12:41'),(7,'Paula',2,'Autobiografía',1994,'978-84-204-2963-4',1,'2025-08-19 20:12:41');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_libro` int NOT NULL,
  `fecha_prestamo` date NOT NULL DEFAULT (curdate()),
  `fecha_devolucion` date DEFAULT NULL,
  `fecha_limite` date NOT NULL,
  `devuelto` tinyint(1) DEFAULT '0',
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_prestamo`),
  KEY `idx_usuario` (`id_usuario`),
  KEY `idx_libro` (`id_libro`),
  KEY `idx_fecha_prestamo` (`fecha_prestamo`),
  KEY `idx_devuelto` (`devuelto`),
  CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (1,1,1,'2024-08-01','2024-08-14','2024-08-15',1,NULL),(2,2,3,'2024-08-05',NULL,'2024-08-19',0,NULL),(3,3,2,'2024-08-10','2024-08-22','2024-08-24',1,NULL),(4,1,5,'2024-08-15',NULL,'2024-08-29',0,NULL),(5,4,4,'2024-08-18',NULL,'2024-09-01',0,NULL);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_email` (`email`),
  KEY `idx_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan Pérez','juan.perez@email.com','+54-11-1234-5678','2025-08-19 20:12:41'),(2,'María González','maria.gonzalez@email.com','+54-11-8765-4321','2025-08-19 20:12:41'),(3,'Carlos Rodríguez','carlos.rodriguez@email.com','+54-11-5555-6666','2025-08-19 20:12:41'),(4,'Ana Martínez','ana.martinez@email.com','+54-11-7777-8888','2025-08-19 20:12:41'),(5,'Luis Fernández','luis.fernandez@email.com','+54-11-9999-0000','2025-08-19 20:12:41');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24 19:45:39
