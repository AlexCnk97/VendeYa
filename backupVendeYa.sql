-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: vendeya
-- ------------------------------------------------------
-- Server version	5.7.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `Img` varchar(200) NOT NULL,
  `Descripcion` varchar(1000) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Vehiculos','fas fa-car carro text-primary','Automoviles, Motos, Accesorios, Camiones-Vehículos Comerciales, Otros Vehículos.'),(2,'Inmuebles-Propiedades','fas fa-home carro text-primary','Apartamentos, Terrenos, Oficinas, Locales, Alquiler.'),(3,'Teléfonos-Tablets','fas fa-mobile-alt carro text-primary','Teléfonos Celulares, Tablets, Accesorios, Protectores, Audífonos, Otros Accesorios.'),(4,'Electrónicos-Video','fas fa-desktop carro text-primary','Computadoras, Laptops, Consolas, TV - Audio-video.'),(5,'Casa-Muebles-Jardin','fas fa-couch carro text-primary','Muebles, Electrodomésticos, Oficina, Jardín.'),(6,'Moda-Belleza','fas fa-tshirt carro text-primary','Ropa y Calzado, Relojes, Accesorios, Salud, Belleza, Bebés, Niños.'),(7,'Hobbies-Arte-Deportes','fas fa-running carro text-primary','Deportes, Bicicletas, Juegos, Juguetes, Instrumentos, Libros.'),(8,'Animales-Mascotas','fas fa-dog carro text-primary','Perros, Gatos, Otros Animales, Accesorios para Mascotas.'),(9,'Clases-Tutorias','fas fa-chalkboard-teacher carro text-primary','Tutores, Clases Particulares, Otros Cursos, Cursos de Idiomas.'),(10,'Trabajo','fas fa-briefcase carro text-primary','Construcción, Obrero, Abogados, Multimedia, Informática, Otros Trabajos.'),(11,'Servicios','far fa-calendar-alt carro text-primary','Eventos, Turismo, Mantenimiento, Reparación, Transporte, Otros Servicios.'),(12,'Comunidad','fas fa-users carro text-primary','Voluntarios, Músicos, Artistas, Grupos, Perdido y Encontrado, Comunidad                            Varios.');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `idCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `foto` varchar(500) NOT NULL,
  `fec_creacion` datetime NOT NULL,
  PRIMARY KEY (`idCuenta`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,1,'https://firebasestorage.googleapis.com/v0/b/vendeya-a46cc.appspot.com/o/logo.png?alt=media&token=37374693-feff-4b12-9563-c060678867b3','2019-11-23 13:13:19'),(2,2,'https://firebasestorage.googleapis.com/v0/b/vendeya-a46cc.appspot.com/o/logo.png?alt=media&token=37374693-feff-4b12-9563-c060678867b3','2019-11-23 13:18:56'),(3,3,'https://firebasestorage.googleapis.com/v0/b/vendeya-a46cc.appspot.com/o/logo.png?alt=media&token=37374693-feff-4b12-9563-c060678867b3','2019-11-23 13:45:07'),(4,4,'https://firebasestorage.googleapis.com/v0/b/vendeya-a46cc.appspot.com/o/logo.png?alt=media&token=37374693-feff-4b12-9563-c060678867b3','2019-11-23 13:47:16'),(5,5,'https://firebasestorage.googleapis.com/v0/b/vendeya-a46cc.appspot.com/o/logo.png?alt=media&token=37374693-feff-4b12-9563-c060678867b3','2019-11-23 13:48:50');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `idSubCategoria` int(11) NOT NULL,
  `Descripcion` varchar(1000) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idSubCategoria` (`idSubCategoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idSubCategoria`) REFERENCES `subcategorias` (`idsubCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'rrastrillo',4.00,22,'de color anaranjado, de peso lijero'),(2,'pc gaming',1500.00,15,'en buen estado'),(3,'laptop nueva',450.00,15,'nueva en buen estado'),(4,'pc compac ',350.00,15,'nueva en buen estado'),(5,'toyota 2010',1500.00,1,'solo de subirse'),(6,'toyota 2019',2500.00,1,'solo de subir qlos'),(7,'audifonos originales',4.00,13,'suenan duro y en buen estado'),(8,'mochila para niÃ±os',15.00,37,'espacio grande, para objetos'),(9,'perro de raza',15.00,33,'amigable con  una edad de 6 meses'),(10,'perro de raza ',25.00,33,'con una edad de 4 meses'),(11,'gatito lindo',3.00,34,'de raza con una edad de 2 meses'),(12,'gatos',2.00,34,'de 1 mes '),(13,'tiggre de vengala',500.00,35,'de 8 meses'),(14,'vestido de mujer',19.00,23,'super sexy'),(15,'camisa nueva',3.00,23,'color blanco '),(16,'core i9',40.00,16,'nuevo y en cajita'),(17,'zapatos nuevos',45.00,23,'nuevos y en cajita'),(18,'lamborghini',2500.00,1,'nuevo solo de subirse'),(19,'4x4',3000.00,1,'todo terreno'),(20,'casa grande',9000.00,7,'comoda y grande'),(21,'vendo nemo',25.00,35,'nemo de 5 rayas'),(22,'tomates grandes',2.00,60,'tomates de calidad rojitos'),(23,'casa amueblada',259900.00,8,'casa grande'),(24,'toro',1500.00,35,'rejero'),(25,'vaca lechera',15000.00,35,'dando 5 litro por dia'),(26,'a tu abuelo',1.00,62,'tu abuelo'),(27,'pez amarillo',15.00,35,'nada rapido'),(28,'terreno de 5 manzanas',25000.00,8,'regadillo'),(29,'terreno valdio ',12000.00,8,'lejano a tu casa'),(30,'perro cagon',25.00,33,'perro cagon huele rico no necesita papel'),(31,'perro cagon',25.00,33,'perro cagon ');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_imagenes`
--

DROP TABLE IF EXISTS `productos_imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_imagenes` (
  `idProducto_Imagen` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `Imagen` varchar(500) NOT NULL,
  `directorio` varchar(200) NOT NULL,
  PRIMARY KEY (`idProducto_Imagen`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `productos_imagenes_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_imagenes`
--

LOCK TABLES `productos_imagenes` WRITE;
/*!40000 ALTER TABLE `productos_imagenes` DISABLE KEYS */;
INSERT INTO `productos_imagenes` VALUES (1,1,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/nxgthbjk/1.jpg?alt=media','nxgthbjk'),(2,2,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/ksoysvmf/1.jpg?alt=media','ksoysvmf'),(3,2,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/ksoysvmf/2.jpg?alt=media','ksoysvmf'),(4,3,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/vpuumqxp/3.jpg?alt=media','vpuumqxp'),(5,3,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/vpuumqxp/4.jpg?alt=media','vpuumqxp'),(6,4,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/umhebpow/1.jpg?alt=media','umhebpow'),(7,5,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/etrwykhb/1.jpg?alt=media','etrwykhb'),(8,6,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/lcskzkgq/1.jpg?alt=media','lcskzkgq'),(9,7,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/vnishwph/1.jpg?alt=media','vnishwph'),(10,8,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/okfxeupn/1.jpg?alt=media','okfxeupn'),(11,9,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/ovpividb/1.jpg?alt=media','ovpividb'),(12,10,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/cmhnlpri/1.jpg?alt=media','cmhnlpri'),(13,11,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/rxgotsxj/1.jpg?alt=media','rxgotsxj'),(14,12,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/krdjjsvk/1.jpg?alt=media','krdjjsvk'),(15,13,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/sbpvwgnn/1.jpg?alt=media','sbpvwgnn'),(16,14,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/yesqawol/1.jpg?alt=media','yesqawol'),(17,15,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/twzfjlkx/1.jpg?alt=media','twzfjlkx'),(18,16,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/shxlbvnb/1.jpg?alt=media','shxlbvnb'),(19,17,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/apbtzenm/1.jpg?alt=media','apbtzenm'),(20,18,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/xsjystrf/1.jpg?alt=media','xsjystrf'),(21,19,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/pwmqmqty/1.jpg?alt=media','pwmqmqty'),(22,19,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/pwmqmqty/2.jpg?alt=media','pwmqmqty'),(23,19,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/pwmqmqty/3.jpg?alt=media','pwmqmqty'),(24,20,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/ojkvgkup/1.jpg?alt=media','ojkvgkup'),(25,21,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/gjbqdqej/1.jpg?alt=media','gjbqdqej'),(26,21,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/gjbqdqej/2.jpg?alt=media','gjbqdqej'),(27,22,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/zrcbdqvx/1.jpg?alt=media','zrcbdqvx'),(28,23,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/tgvjkgrr/1.jpg?alt=media','tgvjkgrr'),(29,24,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/dhezjbhe/1.jpg?alt=media','dhezjbhe'),(30,25,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/zzlqjcag/1.jpg?alt=media','zzlqjcag'),(31,26,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/lbwhsxby/1.jpg?alt=media','lbwhsxby'),(32,27,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/xzdhadvx/1.jpg?alt=media','xzdhadvx'),(33,28,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/koojthhn/1.jpg?alt=media','koojthhn'),(34,29,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/iczwgytu/1.jpg?alt=media','iczwgytu'),(35,30,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/ezlufmup/1.jpg?alt=media','ezlufmup'),(36,31,'https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/qgeonbrw/1.jpg?alt=media','qgeonbrw');
/*!40000 ALTER TABLE `productos_imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicaciones` (
  `idPublicacion` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `idCuenta` int(11) NOT NULL,
  `fec_Post` datetime NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  PRIMARY KEY (`idPublicacion`),
  KEY `idCuenta` (`idCuenta`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`idCuenta`) REFERENCES `cuentas` (`idCuenta`),
  CONSTRAINT `publicaciones_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones`
--

LOCK TABLES `publicaciones` WRITE;
/*!40000 ALTER TABLE `publicaciones` DISABLE KEYS */;
INSERT INTO `publicaciones` VALUES (1,1,1,'2019-11-23 13:16:27',0,'Sonsonate,Sonsonate'),(2,2,1,'2019-11-23 13:18:51',1,'Sonsonate,Sonsonate'),(3,3,1,'2019-11-23 13:20:13',1,'Sonsonate,Sonsonate'),(4,4,1,'2019-11-23 13:21:11',1,'Sonsonate,Sonsonate'),(5,5,1,'2019-11-23 13:22:19',0,'Sonsonate,Sonsonate'),(6,6,1,'2019-11-23 13:23:59',1,'Sonsonate,Sonsonate'),(7,7,1,'2019-11-23 13:25:09',1,'Sonsonate,Sonsonate'),(8,8,1,'2019-11-23 13:26:58',1,'Sonsonate,Sonsonate'),(9,9,1,'2019-11-23 13:29:13',1,'Sonsonate,Sonsonate'),(10,10,1,'2019-11-23 13:30:27',1,'Sonsonate,Sonsonate'),(11,11,1,'2019-11-23 13:34:14',1,'Sonsonate,Sonsonate'),(12,12,1,'2019-11-23 13:35:16',1,'Sonsonate,Sonsonate'),(13,13,1,'2019-11-23 13:36:07',1,'Sonsonate,Sonsonate'),(14,14,1,'2019-11-23 13:37:37',1,'Sonsonate,Sonsonate'),(15,15,1,'2019-11-23 13:38:51',1,'Sonsonate,Sonsonate'),(16,16,1,'2019-11-23 13:39:41',1,'Sonsonate,Sonsonate'),(17,17,1,'2019-11-23 13:41:34',0,'Sonsonate,Sonsonate'),(18,18,1,'2019-11-23 13:43:26',1,'Sonsonate,Sonsonate'),(19,19,1,'2019-11-23 13:44:30',1,'Sonsonate,Sonsonate'),(20,20,1,'2019-11-23 13:45:44',1,'Sonsonate,Sonsonate'),(21,21,5,'2019-11-23 13:49:39',0,'Sonsonate,Sonsonate'),(22,22,5,'2019-11-23 13:51:18',1,'Sonsonate,Sonsonate'),(23,23,5,'2019-11-23 13:52:13',0,'Sonzacate,Sonsonate'),(24,24,5,'2019-11-23 13:53:25',1,'Sonzacate,Sonsonate'),(25,25,5,'2019-11-23 13:54:39',0,'Sonsonate,Sonsonate'),(26,26,5,'2019-11-23 13:56:38',1,'Sonsonate,Sonsonate'),(27,27,5,'2019-11-23 13:58:04',1,'Sonsonate,Sonsonate'),(28,28,5,'2019-11-23 13:59:01',1,'Sonsonate,Sonsonate'),(29,29,5,'2019-11-23 14:00:32',1,'Sonsonate,Sonsonate'),(30,30,5,'2019-11-23 14:01:52',1,'Sonzacate,Sonsonate'),(31,31,5,'2019-11-23 14:03:47',1,'Sonsonate,Sonsonate');
/*!40000 ALTER TABLE `publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategorias` (
  `idsubCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idsubCategoria`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategorias`
--

LOCK TABLES `subcategorias` WRITE;
/*!40000 ALTER TABLE `subcategorias` DISABLE KEYS */;
INSERT INTO `subcategorias` VALUES (1,'Autos',1),(2,'Accesorios para Autos',1),(3,'Motos',1),(4,'Camiones-Vehículos Comerciales',1),(5,'Otros Vehículos',1),(6,'Apartamentos-Casas en Venta',2),(7,'Apartamentos-Casas en Alquiler',2),(8,'Terrenos',2),(9,'Oficinas y Locales',2),(10,'Alquiler Temporario-Vacaciones',2),(11,'Nuevos Proyectos-VENTA',2),(12,'Telefonos-Celulares',3),(13,'Accesorios',3),(14,'Tablets',3),(15,'Computadoras-Laptops',4),(16,'Consolas-Videojuegos',4),(17,'TV-Audio-Video',4),(18,'Cámaras y Accesorios',4),(19,'Muebles',5),(20,'Electrodomésticos',5),(21,'Almacenes y Oficinas',5),(22,'Decoración-Jardín-Accesorios',5),(23,'Ropa y Calzado',6),(24,'Relojes-Joyas-Accesorios',6),(25,'Salud y Belleza',6),(26,'Bebés y Niños',6),(27,'Deportes-Bicicletas',7),(28,'Juegos y Juguetes',7),(29,'Instrumentos Musicales',7),(30,'Antiguedades y Arte',7),(31,'Libros-CDs-DVDs',7),(32,'Manualidades',7),(33,'Perros',8),(34,'Gatos',8),(35,'Otros Animales',8),(36,'Accesorios para Mascotas',8),(37,'Tutores-Clases Particulares',9),(38,'Otros Cursos',9),(39,'Clases de Idiomas',9),(40,'Musica-Danza-Teatro',9),(41,'Multimedia-Computacional',9),(42,'Otros Trabajos',10),(43,'Construcción-Obrero',10),(44,'Abogados',10),(45,'Vendedor-Asesor de Venta',10),(46,'Hostelería-Meseros-Restauración',10),(47,'Ingenieros-Arquitectos',10),(48,'Atención al Cliente',10),(49,'Medicina-Enfermería',10),(50,'Marketing-Publicidad',10),(51,'Contable-Financiero-Banquero',10),(52,'Educación-Maestros-Profesores',10),(53,'Turismo-Hostelería',10),(54,'Recursos Humanos',10),(55,'Multimedia-Informática',10),(56,'Inmobiliarias',10),(57,'Voluntario-Trabajo Social',10),(58,'Programador-Diseñador-Administrador',10),(59,'Promotores-Azafatas-Edecanes',10),(60,'Otros Servicios',11),(61,'Reparación-Mantenimiento',11),(62,'Tutorías',11),(63,'Planeación de Eventos',11),(64,'Transporte-Viajes',11),(65,'Salud y Belleza',11),(66,'Informática-Mantenimiento',11),(67,'Turismo-Paquetes Turísticos',11),(68,'Traductor',11),(69,'Casting-Modelaje',11),(70,'Comunidad Varios',12),(71,'Eventos',12),(72,'Músicos-Artistas-Grupos',12),(73,'Compartir Coche',12),(74,'Voluntarios',12),(75,'Perdido y Encontrado',12);
/*!40000 ALTER TABLE `subcategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(100) NOT NULL,
  `numeroTelefono` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Bryan ArÃ©valo','76625588','arevalolopezb@gmail.com','1'),(2,'AlexChinke','76142668','alexchinke97@gmail.com','123'),(3,'Cesar ','7877-1710','cguerrerobatres@gmail.com','123'),(4,'Bryan','26374827','arevalolopez@gmail.com','12345'),(5,'edwin','124512','edwin@gmail.com','12345');
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

-- Dump completed on 2019-11-23 14:14:30
