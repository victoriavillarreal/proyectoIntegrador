CREATE DATABASE  IF NOT EXISTS `trabajoIntegrador` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trabajoIntegrador`;
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
-- Dumping data for table `COMENTARIOS`
--

LOCK TABLES `COMENTARIOS` WRITE;
/*!40000 ALTER TABLE `COMENTARIOS` DISABLE KEYS */;
INSERT INTO `COMENTARIOS` VALUES (1,1,1,'muy lindo producto','2020-12-13'),(2,1,2,'muy funcional','2019-10-23'),(3,1,5,'mala calidad','2020-05-05'),(4,1,3,'funciona mal','2021-09-08'),(5,2,2,'buen precio','2018-05-04'),(6,2,4,'mala calidad respecto precio','2021-04-08'),(7,2,3,'bueno','2017-04-12'),(8,2,1,'malo','2017-04-23'),(9,3,1,'razonable','2020-10-20'),(10,3,4,'fea apariencia','2020-07-08'),(11,3,2,'no es lo que esperaba','2021-06-04'),(12,3,5,'agradable','2019-08-22'),(13,4,4,'lindo','2018-04-02'),(14,4,3,'mala calidad','2019-04-25'),(15,4,2,'buena calidad','2020-12-13'),(16,4,1,'excelente','2018-11-14'),(17,5,4,'extraordinario','2019-10-21'),(18,5,5,'medio','2020-09-05'),(19,5,5,'mas de lo que esperaba','2021-01-01'),(20,5,3,'bueno','2021-02-02'),(21,6,1,'decepcionante','2018-12-16'),(22,6,2,'genial','2017-11-11'),(23,6,2,'pesimo','2017-10-18'),(24,6,1,'muy buena calidad','2019-09-06'),(25,7,5,'muy malo','2020-04-04'),(26,7,4,'muy mala calidad','2020-09-09'),(27,7,3,'pesima calidad','2021-05-05'),(28,7,2,'excelente apariencia','2020-09-09'),(29,8,1,'muy lindo','2017-06-06'),(30,8,4,'feo','2018-04-04'),(31,8,2,'muy practico','2019-03-03'),(32,8,1,'facil de usar','2020-07-07'),(33,9,3,'practico','2021-12-12'),(34,9,4,'conveniente','2020-11-11'),(35,9,2,'pesima calidad','2018-08-08'),(36,9,1,'bueno','2021-11-13'),(37,10,1,'malo','2020-10-10'),(38,10,2,'excelente','2019-04-05'),(39,10,4,'bueno','2020-12-15'),(40,10,4,'bueno','2020-12-16');
/*!40000 ALTER TABLE `COMENTARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PRODUCTOS`
--

LOCK TABLES `PRODUCTOS` WRITE;
/*!40000 ALTER TABLE `PRODUCTOS` DISABLE KEYS */;
INSERT INTO `PRODUCTOS` VALUES (1,2,'https://images-na.ssl-images-amazon.com/images/I/71fusc9SQ%2BL._AC_SX522_.jpg','TV Sony','2021-03-25'),(2,2,'https://www.unidiversidad.com.ar/cache_2/pc_630_1140.jpg','LG Computadora','2021-03-25'),(3,1,'https://i.blogs.es/f3f65d/iphone-12-pro-max-analisis-applesfera-4/1366_2000.jpg','IPhone 12 Pro','2021-04-15'),(4,5,'https://images.oneclickstore.com/images/JBLFLIP5REDAM.jpg','JBL Flip 4','2020-09-09'),(5,4,'https://images.samsung.com/is/image/samsung/latin-fhd-t5300-un43t5300apxpa-frontblack-229166470?$720_576_PNG$','TV Samsung','2020-12-23'),(6,3,'https://www.lg.com/ar/images/televisores/md05781190/gallery/medium07_1.jpg','TV LG','2012-03-13'),(7,2,'https://chemesweb.com.ar/4251-large_default/celular-samsung-galaxy-a10s-sm-a107m.jpg','Celular Samsung','2021-04-24'),(8,3,'https://mallweb.com.ar/media/catalog/product/cache/1/image/800x/9df78eab33525d08d6e5fb8d27136e95/g/i/gimage_23975.jpg','Celular LG','2020-07-26'),(9,1,'https://images.oneclickstore.com/images/739523-2110.jpg','Parlante BOSE','2019-06-15'),(10,2,'https://www.moulinex.com.ar/wp-content/uploads/2018/03/city-perfect-1-1024x1024.jpg','Cafetera Moulinex','2019-11-02');
/*!40000 ALTER TABLE `PRODUCTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `USUARIOS`
--

LOCK TABLES `USUARIOS` WRITE;
/*!40000 ALTER TABLE `USUARIOS` DISABLE KEYS */;
INSERT INTO `USUARIOS` VALUES (1,'Victoria Villarreal','2002-06-11','victoriavillarreal',11062002),(2,'Felix Paolucci','2000-01-01','felixpaolucci',1012000),(3,'Martin Albores','2000-01-03','martinalbores',3012000),(4,'Santiago Villarreal','2000-03-23','santiagovillarreal',23032000),(5,'Irene Garcia','2000-12-24','irenegarcia',24122000);
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

-- Dump completed on 2021-04-26 18:28:19
