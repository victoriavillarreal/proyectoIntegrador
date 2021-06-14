-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: trabajoIntegrador
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `COMENTARIOS`
--

DROP TABLE IF EXISTS `COMENTARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMENTARIOS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `fecha_de_creacion` date NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id_idx` (`usuario_id`),
  KEY `producto_id_idx` (`producto_id`),
  CONSTRAINT `producto_id` FOREIGN KEY (`producto_id`) REFERENCES `PRODUCTOS` (`id`),
  CONSTRAINT `usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `USUARIOS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMENTARIOS`
--

LOCK TABLES `COMENTARIOS` WRITE;
/*!40000 ALTER TABLE `COMENTARIOS` DISABLE KEYS */;
INSERT INTO `COMENTARIOS` VALUES (1,1,1,'muy lindo producto','2020-12-13',NULL,NULL),(2,1,2,'muy funcional','2019-10-23',NULL,NULL),(3,1,5,'mala calidad','2020-05-05',NULL,NULL),(4,1,3,'funciona mal','2021-09-08',NULL,NULL),(5,2,2,'buen precio','2018-05-04',NULL,NULL),(6,2,4,'mala calidad respecto precio','2021-04-08',NULL,NULL),(7,2,3,'bueno','2017-04-12',NULL,NULL),(8,2,1,'malo','2017-04-23',NULL,NULL),(9,3,1,'razonable','2020-10-20',NULL,NULL),(10,3,4,'fea apariencia','2020-07-08',NULL,NULL),(11,3,2,'no es lo que esperaba','2021-06-04',NULL,NULL),(12,3,5,'agradable','2019-08-22',NULL,NULL),(13,4,4,'lindo','2018-04-02',NULL,NULL),(14,4,3,'mala calidad','2019-04-25',NULL,NULL),(15,4,2,'buena calidad','2020-12-13',NULL,NULL),(16,4,1,'excelente','2018-11-14',NULL,NULL),(17,5,4,'extraordinario','2019-10-21',NULL,NULL),(18,5,5,'medio','2020-09-05',NULL,NULL),(19,5,5,'mas de lo que esperaba','2021-01-01',NULL,NULL),(20,5,3,'bueno','2021-02-02',NULL,NULL),(21,6,1,'decepcionante','2018-12-16',NULL,NULL),(22,6,2,'genial','2017-11-11',NULL,NULL),(23,6,2,'pesimo','2017-10-18',NULL,NULL),(24,6,1,'muy buena calidad','2019-09-06',NULL,NULL),(25,7,5,'muy malo','2020-04-04',NULL,NULL),(26,7,4,'muy mala calidad','2020-09-09',NULL,NULL),(27,7,3,'pesima calidad','2021-05-05',NULL,NULL),(28,7,2,'excelente apariencia','2020-09-09',NULL,NULL),(29,8,1,'muy lindo','2017-06-06',NULL,NULL),(30,8,4,'feo','2018-04-04',NULL,NULL),(31,8,2,'muy practico','2019-03-03',NULL,NULL),(32,8,1,'facil de usar','2020-07-07',NULL,NULL),(33,9,3,'practico','2021-12-12',NULL,NULL),(34,9,4,'conveniente','2020-11-11',NULL,NULL),(35,9,2,'pesima calidad','2018-08-08',NULL,NULL),(36,9,1,'bueno','2021-11-13',NULL,NULL),(37,10,1,'malo','2020-10-10',NULL,NULL),(38,10,2,'excelente','2019-04-05',NULL,NULL),(39,10,4,'bueno','2020-12-15',NULL,NULL),(40,10,4,'bueno','2020-12-16',NULL,NULL);
/*!40000 ALTER TABLE `COMENTARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTOS`
--

DROP TABLE IF EXISTS `PRODUCTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCTOS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_de_creacion` date NOT NULL,
  `precio` int DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `comentario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `usuario_id_idx` (`user_id`),
  KEY `comentario_id_idx` (`comentario_id`),
  CONSTRAINT `comentario_id` FOREIGN KEY (`comentario_id`) REFERENCES `COMENTARIOS` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `USUARIOS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTOS`
--

LOCK TABLES `PRODUCTOS` WRITE;
/*!40000 ALTER TABLE `PRODUCTOS` DISABLE KEYS */;
INSERT INTO `PRODUCTOS` VALUES (1,2,'https://images-na.ssl-images-amazon.com/images/I/71fusc9SQ%2BL._AC_SX522_.jpg','TV Sony','2021-03-25',NULL,NULL,NULL,NULL),(2,2,'https://www.unidiversidad.com.ar/cache_2/pc_630_1140.jpg','LG Computadora','2021-03-25',NULL,NULL,NULL,NULL),(3,1,'https://i.blogs.es/f3f65d/iphone-12-pro-max-analisis-applesfera-4/1366_2000.jpg','IPhone 12 Pro','2021-04-15',NULL,NULL,NULL,NULL),(4,5,'https://images.oneclickstore.com/images/JBLFLIP5REDAM.jpg','JBL Flip 4','2020-09-09',NULL,NULL,NULL,NULL),(5,4,'https://images.samsung.com/is/image/samsung/latin-fhd-t5300-un43t5300apxpa-frontblack-229166470?$720_576_PNG$','TV Samsung','2020-12-23',NULL,NULL,NULL,NULL),(6,3,'https://www.lg.com/ar/images/televisores/md05781190/gallery/medium07_1.jpg','TV LG','2012-03-13',NULL,NULL,NULL,NULL),(7,2,'https://chemesweb.com.ar/4251-large_default/celular-samsung-galaxy-a10s-sm-a107m.jpg','Celular Samsung','2021-04-24',NULL,NULL,NULL,NULL),(8,3,'https://mallweb.com.ar/media/catalog/product/cache/1/image/800x/9df78eab33525d08d6e5fb8d27136e95/g/i/gimage_23975.jpg','Celular LG','2020-07-26',NULL,NULL,NULL,NULL),(9,1,'https://images.oneclickstore.com/images/739523-2110.jpg','Parlante BOSE','2019-06-15',NULL,NULL,NULL,NULL),(10,2,'https://www.moulinex.com.ar/wp-content/uploads/2018/03/city-perfect-1-1024x1024.jpg','Cafetera Moulinex','2019-11-02',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `PRODUCTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_comentarios`
--

DROP TABLE IF EXISTS `productos_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `comment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id_idx` (`product_id`),
  KEY `comentario_id_idx` (`comment_id`),
  CONSTRAINT `comment_id` FOREIGN KEY (`comment_id`) REFERENCES `COMENTARIOS` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `PRODUCTOS` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_comentarios`
--

LOCK TABLES `productos_comentarios` WRITE;
/*!40000 ALTER TABLE `productos_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIOS`
--

DROP TABLE IF EXISTS `USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIOS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_y_apellido` varchar(50) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `perfil` int NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIOS`
--

LOCK TABLES `USUARIOS` WRITE;
/*!40000 ALTER TABLE `USUARIOS` DISABLE KEYS */;
INSERT INTO `USUARIOS` VALUES (1,'Victoria Villarreal','2002-06-11','victoriavillarreal','11062002',NULL,NULL,0,''),(2,'Felix Paolucci','2000-01-01','felixpaolucci','1012000',NULL,NULL,0,''),(3,'Martin Albores','2000-01-03','martinalbores','3012000',NULL,NULL,0,''),(4,'Santiago Villarreal','2000-03-23','santiagovillarreal','23032000',NULL,NULL,0,''),(5,'Irene Garcia','2000-12-24','irenegarcia','24122000',NULL,NULL,0,'');
/*!40000 ALTER TABLE `USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-14 16:24:07
