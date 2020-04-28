CREATE DATABASE  IF NOT EXISTS `ebanisteria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ebanisteria`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ebanisteria
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacion` (
  `idCotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoUsua` int(11) NOT NULL,
  `idUsuario` varchar(20) NOT NULL,
  `fechaCoti` date NOT NULL,
  `subtotal` decimal(20,2) NOT NULL,
  `iva` decimal(20,2) NOT NULL,
  `total` decimal(20,2) NOT NULL,
  `notacoti` mediumtext COMMENT 'Nota o comentario al vendedor',
  PRIMARY KEY (`idCotizacion`,`idTipoUsua`,`idUsuario`),
  KEY `usuario1_idx` (`idUsuario`,`idTipoUsua`),
  CONSTRAINT `usuario1` FOREIGN KEY (`idUsuario`, `idTipoUsua`) REFERENCES `usuario` (`idUsuario`, `idTipoUsua`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para el registro de Cotizaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

LOCK TABLES `cotizacion` WRITE;
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datousua`
--

DROP TABLE IF EXISTS `datousua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datousua` (
  `idDatoUsua` int(11) NOT NULL COMMENT 'Llave primaria del id',
  `idEmpresa` varchar(45) NOT NULL,
  `idTipoDocu` varchar(4) NOT NULL,
  `idTipoUsua` int(11) NOT NULL,
  `idUsuario` varchar(20) NOT NULL,
  `Genero` varchar(45) DEFAULT NULL COMMENT 'Genero del usuario, masculino, femenino o indefinido',
  `FechNace` date DEFAULT NULL COMMENT 'Fecha de nacimiento del usuario',
  `DireUsua` varchar(200) NOT NULL COMMENT 'Direccion del usuario',
  `TeleUsua` varchar(45) NOT NULL COMMENT 'Numero de Telefono del usuario',
  `CelUsua` varchar(45) NOT NULL COMMENT 'Numero celular del usuario',
  `EstaDato` varchar(45) NOT NULL COMMENT 'Estado del dato, activo o inactivo',
  PRIMARY KEY (`idDatoUsua`,`idEmpresa`,`idTipoDocu`,`idTipoUsua`,`idUsuario`),
  KEY `fk_DatoUsua_Empresa1_idx` (`idEmpresa`),
  KEY `fk_DatoUsua_TipoDocu1_idx` (`idTipoDocu`),
  KEY `fk_DatoUsua_Usuario1_idx` (`idUsuario`,`idTipoUsua`),
  CONSTRAINT `fk_DatoUsua_Empresa1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DatoUsua_TipoDocu1` FOREIGN KEY (`idTipoDocu`) REFERENCES `tipodocu` (`idTipoDocu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DatoUsua_Usuario1` FOREIGN KEY (`idUsuario`, `idTipoUsua`) REFERENCES `usuario` (`idUsuario`, `idTipoUsua`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para los datos del perfil de usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datousua`
--

LOCK TABLES `datousua` WRITE;
/*!40000 ALTER TABLE `datousua` DISABLE KEYS */;
INSERT INTO `datousua` VALUES (1,'6875757-2','CC',3,'143999999','M','1982-09-30','Edificio Vivo bueno al lado del D1','0','3115780589','Activo'),(2,'6875757-2','CC',1,'159999991','M','1982-09-30','Edificio Vivo bueno al lado del D1','0','3115780589','Activo');
/*!40000 ALTER TABLE `datousua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detacoti`
--

DROP TABLE IF EXISTS `detacoti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detacoti` (
  `idDetaCoti` int(11) NOT NULL AUTO_INCREMENT,
  `idCotizacion` int(11) NOT NULL,
  `idTipoUsua` int(11) NOT NULL,
  `idUsuario` varchar(20) NOT NULL,
  `idProductos` int(11) NOT NULL,
  `idTipoProd` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ValUni` decimal(20,2) NOT NULL COMMENT 'valor unitario del producto de  la cotizacion',
  `ValTotal` decimal(20,2) NOT NULL COMMENT 'Valor total del producto en la cotizacion',
  PRIMARY KEY (`idDetaCoti`,`idCotizacion`,`idTipoUsua`,`idUsuario`,`idProductos`,`idTipoProd`),
  KEY `Cotizacion1_idx` (`idCotizacion`,`idTipoUsua`,`idUsuario`),
  KEY `Productos1_idx` (`idProductos`,`idTipoProd`),
  CONSTRAINT `Cotizacion1` FOREIGN KEY (`idCotizacion`, `idTipoUsua`, `idUsuario`) REFERENCES `cotizacion` (`idCotizacion`, `idTipoUsua`, `idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Productos1` FOREIGN KEY (`idProductos`, `idTipoProd`) REFERENCES `productos` (`idProductos`, `idTipoProd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para el detalle de la cotizacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detacoti`
--

LOCK TABLES `detacoti` WRITE;
/*!40000 ALTER TABLE `detacoti` DISABLE KEYS */;
/*!40000 ALTER TABLE `detacoti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idEmpresa` varchar(45) NOT NULL COMMENT 'Numero de identificacion tributario de la empresa',
  `NomEmpresa` varchar(100) NOT NULL COMMENT 'Nombre de la empresa',
  `UbicEmpresa` varchar(200) NOT NULL COMMENT 'Ubicacion de la empresa',
  `TelEmpresa` varchar(45) NOT NULL COMMENT 'Numero de telefono de la empresa',
  `FaxEmpresa` varchar(45) NOT NULL COMMENT 'Numero de fax de la empresa',
  `EmailEmpresa` varchar(200) NOT NULL COMMENT 'Correo electronico de la empresa',
  `EstaEmpresa` varchar(45) NOT NULL COMMENT 'activo o inactivo',
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entidad para los datos de la empresa Ebanisteria Ego';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('6875757-2','EGO','calle 18 NO 92B-16','3128929390','','ebaniteriaego@gmail.com','Activo');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Producto',
  `idTipoProd` int(11) NOT NULL,
  `NombProd` varchar(45) NOT NULL COMMENT 'Nombre del Producto',
  `Descripcion` varchar(255) NOT NULL,
  `ValMetro` varchar(45) NOT NULL,
  `Imagen` varchar(255) NOT NULL,
  `EstaProd` varchar(45) NOT NULL COMMENT 'Estado del producto',
  PRIMARY KEY (`idProductos`,`idTipoProd`),
  KEY `TipoProd1_idx` (`idTipoProd`),
  CONSTRAINT `TipoProd1` FOREIGN KEY (`idTipoProd`) REFERENCES `tipoprod` (`idTipoProd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7012 DEFAULT CHARSET=utf8 COMMENT='Tabla para productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1000,1,'Cocina creativa','Productos de carpinteria en Nogal y Cedro Rosado','30000','Cocina1.jpg','Activo'),(1001,1,'Cocina L','Productos de carpinteria en Nogal y Cedro Rosado','32000','Cocina2.jpg','Activo'),(1002,1,'Cocina L','Productos de carpinteria en Nogal y Cedro Rosado','30000','Cocina3.jpg','Activo'),(1003,1,'Cocina vanguardia o moderna','Productos de carpinteria en Nogal y Cedro Rosado','35000','Cocina4.jpg','Activo'),(1004,1,'Cocina clásica','Productos de carpinteria en Nogal y Cedro Rosado','25000','Cocina5.jpg','Activo'),(1005,1,'Cocina clásica','Productos de carpinteria en Nogal y Cedro Rosado','25000','Cocina6.jpg','Activo'),(1006,1,'Cocina clásica','Productos de carpinteria en Nogal y Cedro Rosado','25000','Cocina7.jpg','Activo'),(1007,1,'Cocina moderna','Productos de carpinteria en Nogal y Cedro Rosado','40000','Cocina8.jpg','Activo'),(1008,1,'Alta cocina ','Productos de carpinteria en Nogal y Cedro Rosado','45000','Cocina9.jpg','Activo'),(1009,1,'Cocina clásica','Productos de carpinteria en Nogal y Cedro Rosado','30000','Cocina10.jpg','Activo'),(1010,1,'Cocina moderna ','Productos de carpinteria en Nogal y Cedro Rosado','40000','Cocina11.jpg','Activo'),(1011,1,'Cocina americana ','Productos de carpinteria en Nogal y Cedro Rosado','35000','Cocina12.jpg','Activo'),(2000,2,'Comedor 2 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','25000','Comedor1.jpg','Activo'),(2001,2,'Comedor 2 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','30000','Comedor2.jpg','Activo'),(2002,2,'Comedor 2 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','33000','Comedor3.jpg','Activo'),(2003,2,'Comedor 4 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','50000','Comedor4.jpg','Activo'),(2004,2,'Comedor 4 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','55000','Comedor5.jpg','Activo'),(2005,2,'Comedor 4 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','50000','Comedor6.jpg','Activo'),(2006,2,'Comedor 6 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','70000','Comedor7.jpg','Activo'),(2007,2,'Comedor 6 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','75000','Comedor8.jpg','Activo'),(2008,2,'Comedor 6 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','75000','Comedor9.jpg','Activo'),(2009,2,'comedor 8 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','90000','Comedor10.jpg','Activo'),(2010,2,'comedor 8 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','95000','Comedor11.jpg','Activo'),(2011,2,'comedor 8 puestos ','Productos de carpinteria en Nogal y Cedro Rosado','100000','Comedor12.jpg','Activo'),(3000,3,'Sala moderna ','Productos de carpinteria en Nogal y Cedro Rosado','100000','Sala1.jpg','Activo'),(3001,3,'Sala moderna ','Productos de carpinteria en Nogal y Cedro Rosado','105000','Sala2.jpg','Activo'),(3002,3,'Sala clasica','Productos de carpinteria en Nogal y Cedro Rosado','110000','Sala3.jpg','Activo'),(3003,3,'Sala clasica','Productos de carpinteria en Nogal y Cedro Rosado','110000','Sala4.jpg','Activo'),(3004,3,'Diseño L','Productos de carpinteria en Nogal y Cedro Rosado','130000','Sala5.jpg','Activo'),(3005,3,'Diseño L','Productos de carpinteria en Nogal y Cedro Rosado','130000','Sala6.jpg','Activo'),(3006,3,'Sofas en cuero','Productos de carpinteria en Nogal y Cedro Rosado','170000','Sala7.jpg','Activo'),(3007,3,'Sofas en cuero','Productos de carpinteria en Nogal y Cedro Rosado','170000','Sala8.jpg','Activo'),(3008,3,'Sala pequeña ','Productos de carpinteria en Nogal y Cedro Rosado','70000','Sala9.jpg','Activo'),(3009,3,'Sala pequeña ','Productos de carpinteria en Nogal y Cedro Rosado','70000','Sala10.jpg','Activo'),(3010,3,'Sala estilo frances','Productos de carpinteria en Nogal y Cedro Rosado','100000','Sala11.jpg','Activo'),(3011,3,'Sala estilo frances','Productos de carpinteria en Nogal y Cedro Rosado','100000','Sala12.jpg','Activo'),(4000,4,'Juego de alcoba ','Productos de carpinteria en Nogal y Cedro Rosado','100000','Baño1.jpg','Activo'),(4001,4,'Juego de alcoba ','Productos de carpinteria en Nogal y Cedro Rosado','100000','Baño2.jpg','Activo'),(4002,4,'Juego de alcoba ','Productos de carpinteria en Nogal y Cedro Rosado','130000','Baño3.jpg','Activo'),(4003,4,'Juego de alcoba ','Productos de carpinteria en Nogal y Cedro Rosado','110000','Baño4.jpg','Activo'),(4004,4,'Juego de alcoba ','Productos de carpinteria en Nogal y Cedro Rosado','120000','Baño5.jpg','Activo'),(4005,4,'Alcoba moderna','Productos de carpinteria en Nogal y Cedro Rosado','100000','Baño6.jpg','Activo'),(4006,4,'Alcoba moderna','Productos de carpinteria en Nogal y Cedro Rosado','120000','Baño7.jpg','Activo'),(4007,4,'Alcoba moderna','Productos de carpinteria en Nogal y Cedro Rosado','160000','Baño8.jpg','Activo'),(4008,4,'Alcoba clasica','Productos de carpinteria en Nogal y Cedro Rosado','140000','Baño9.jpg','Activo'),(4009,4,'Alcoba clasica','Productos de carpinteria en Nogal y Cedro Rosado','100000','Baño10.jpg','Activo'),(4010,4,'Alcoba clasica','Productos de carpinteria en Nogal y Cedro Rosado','120000','Baño11.jpg','Activo'),(4011,4,'Alcoba clasica','Productos de carpinteria en Nogal y Cedro Rosado','130000','Baño12.jpg','Activo'),(5000,5,'Mesa berloni ','Productos de carpinteria en Nogal y Cedro Rosado','100000','Alcoba1.jpg','Activo'),(5001,5,'Mesa berloni ','Productos de carpinteria en Nogal y Cedro Rosado','100000','Alcoba2.jpg','Activo'),(5002,5,'Mesa de centro ','Productos de carpinteria en Nogal y Cedro Rosado','130000','Alcoba3.jpg','Activo'),(5003,5,'Mesa de centro ','Productos de carpinteria en Nogal y Cedro Rosado','110000','Alcoba4.jpg','Activo'),(5004,5,'Mesa de centro italia','Productos de carpinteria en Nogal y Cedro Rosado','120000','Alcoba5.jpg','Activo'),(5005,5,'Mesa de centro italia','Productos de carpinteria en Nogal y Cedro Rosado','100000','Alcoba6.jpg','Activo'),(5006,5,'Mesa de centro nicole','Productos de carpinteria en Nogal y Cedro Rosado','120000','Alcoba7.jpg','Activo'),(5007,5,'Mesa de centro nicole','Productos de carpinteria en Nogal y Cedro Rosado','160000','Alcoba8.jpg','Activo'),(5008,5,'Mesa cofee table ','Productos de carpinteria en Nogal y Cedro Rosado','140000','Alcoba9.jpg','Activo'),(5009,5,'Mesa cofee table ','Productos de carpinteria en Nogal y Cedro Rosado','100000','Alcoba10.jpg','Activo'),(5010,5,'Mesa ovalada ','Productos de carpinteria en Nogal y Cedro Rosado','120000','Alcoba11.jpg','Activo'),(5011,5,'Mesa ovalada ','Productos de carpinteria en Nogal y Cedro Rosado','130000','Alcoba12.jpg','Activo'),(6000,6,'Puerta maciza','Productos de carpinteria en Nogal y Cedro Rosado','40000','Mesa1.jpg','Activo'),(6001,6,'Puerta maciza','Productos de carpinteria en Nogal y Cedro Rosado','38000','Mesa2.jpg','Activo'),(6002,6,'Puerta maciza','Productos de carpinteria en Nogal y Cedro Rosado','70000','Mesa3.jpg','Activo'),(6003,6,'Puerta chapada','Productos de carpinteria en Nogal y Cedro Rosado','50000','Mesa4.jpg','Activo'),(6004,6,'Puerta chapada','Productos de carpinteria en Nogal y Cedro Rosado','45000','Mesa5.jpg','Activo'),(6005,6,'Puerta chapada','Productos de carpinteria en Nogal y Cedro Rosado','60000','Mesa6.jpg','Activo'),(6006,6,'Puerta hueca','Productos de carpinteria en Nogal y Cedro Rosado','65000','Mesa7.jpg','Activo'),(6007,6,'Puerta hueca','Productos de carpinteria en Nogal y Cedro Rosado','65000','Mesa8.jpg','Activo'),(6008,6,'Puerta hueca','Productos de carpinteria en Nogal y Cedro Rosado','30000','Mesa8.jpg','Activo'),(6009,6,'Puerta moderna','Productos de carpinteria en Nogal y Cedro Rosado','35000','Mesa10.jpg','Activo'),(6010,6,'Puerta moderna','Productos de carpinteria en Nogal y Cedro Rosado','70000','Mesa11.jpg','Activo'),(6011,6,'Puerta moderna','Productos de carpinteria en Nogal y Cedro Rosado','70000','Mesa12.jpg','Activo'),(7000,7,'Closet elegante','Productos de carpinteria en Nogal y Cedro Rosado','50000','Puerta1.jpg','Activo'),(7001,7,'Closet elegante','Productos de carpinteria en Nogal y Cedro Rosado','50000','Puerta2.jpg','Activo'),(7002,7,'Closet elegante','Productos de carpinteria en Nogal y Cedro Rosado','50000','Puerta3.jpg','Activo'),(7003,7,'Closet clasico','Productos de carpinteria en Nogal y Cedro Rosado','60000','Puerta4.jpg','Activo'),(7004,7,'Closet clasico','Productos de carpinteria en Nogal y Cedro Rosado','65000','Puerta5.jpg','Activo'),(7005,7,'Closet clasico','Productos de carpinteria en Nogal y Cedro Rosado','68000','Puerta6.jpg','Activo'),(7006,7,'Closet esquinero','Productos de carpinteria en Nogal y Cedro Rosado','40000','Puerta7.jpg','Activo'),(7007,7,'Closet esquinero','Productos de carpinteria en Nogal y Cedro Rosado','40000','Puerta8.jpg','Activo'),(7008,7,'Closet esquinero','Productos de carpinteria en Nogal y Cedro Rosado','45000','Puerta9.jpg','Activo'),(7009,7,'Closet compacto','Productos de carpinteria en Nogal y Cedro Rosado','40000','Puerta10.jpg','Activo'),(7010,7,'Closet compacto','Productos de carpinteria en Nogal y Cedro Rosado','45000','Puerta11.jpg','Activo'),(7011,7,'Closet compacto','Productos de carpinteria en Nogal y Cedro Rosado','35000','Puerta12.jpg','Activo');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocu`
--

DROP TABLE IF EXISTS `tipodocu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocu` (
  `idTipoDocu` varchar(4) NOT NULL COMMENT 'Abreviacion de tipo de documento de identidad C.C, TI, RC, PS',
  `NoTiDocu` varchar(100) NOT NULL COMMENT 'Nombre de tipo de documento Tarjeta de Identidad, Cedula de Ciudadania, Pasaporte, Registro Civil',
  PRIMARY KEY (`idTipoDocu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocu`
--

LOCK TABLES `tipodocu` WRITE;
/*!40000 ALTER TABLE `tipodocu` DISABLE KEYS */;
INSERT INTO `tipodocu` VALUES ('CC','Cédula de Ciudadanía'),('CE','Cédula Extrangería'),('NIT','Número de ID Tributario'),('RC','Registro Civil'),('TI','Tarjeta de Identidad');
/*!40000 ALTER TABLE `tipodocu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoprod`
--

DROP TABLE IF EXISTS `tipoprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoprod` (
  `idTipoProd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identiicador de tipo de producto',
  `NoTiProd` varchar(45) NOT NULL COMMENT 'nombre de tipo de producto. Ejemplo:\nCocinas\nBaños\nClosets\nSalas\nComedores\nAlcoba\n',
  PRIMARY KEY (`idTipoProd`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Tabla para los tipos de productos\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoprod`
--

LOCK TABLES `tipoprod` WRITE;
/*!40000 ALTER TABLE `tipoprod` DISABLE KEYS */;
INSERT INTO `tipoprod` VALUES (1,'Cocinas'),(2,'Mesas'),(3,'Salas'),(4,'Baños'),(5,'Alcobas'),(6,'Comedores'),(7,'Puertas'),(8,'Carpinteria'),(9,'Closet');
/*!40000 ALTER TABLE `tipoprod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousua`
--

DROP TABLE IF EXISTS `tipousua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousua` (
  `idTipoUsua` int(11) NOT NULL AUTO_INCREMENT,
  `NoTipoUsua` varchar(45) NOT NULL COMMENT 'Identificador de tipo de usuario:\n1=Administrador\n2=Operador\n3=Cliente',
  PRIMARY KEY (`idTipoUsua`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabla o entidad para clasificar los tipos de usuarios del sistema\nAdministrador:\nOperario:\nCliente:\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousua`
--

LOCK TABLES `tipousua` WRITE;
/*!40000 ALTER TABLE `tipousua` DISABLE KEYS */;
INSERT INTO `tipousua` VALUES (1,'Administtrador'),(2,'Operador'),(3,'Cliente');
/*!40000 ALTER TABLE `tipousua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` varchar(20) NOT NULL COMMENT 'Numero de identificacion del usuario',
  `idTipoUsua` int(11) NOT NULL,
  `Nombres` varchar(100) NOT NULL COMMENT 'Nombres del usuario sin apellidos',
  `Apellidos` varchar(100) NOT NULL COMMENT 'Apellidos del usuario sin nombre',
  `Email` varchar(100) NOT NULL COMMENT 'Correo electronico del usuario utilizado para el inicio de sesion',
  `Password` varchar(100) NOT NULL COMMENT 'contraseña del usuario para el inicio de sesion',
  `EstaUsua` varchar(45) NOT NULL COMMENT 'Estado de usuario= igual o inactivo',
  PRIMARY KEY (`idUsuario`,`idTipoUsua`),
  KEY `fk_Usuario_TipoUsua_idx` (`idTipoUsua`),
  CONSTRAINT `fk_Usuario_TipoUsua` FOREIGN KEY (`idTipoUsua`) REFERENCES `tipousua` (`idTipoUsua`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla o entidad para almacenar los datos prncipales del usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('143999999',3,'Eder','Lara','eder@mail.com','eder3009','Activo'),('159999991',1,'Juan Admin','Ego','juan@mail.com','123456','Activo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ebanisteria'
--

--
-- Dumping routines for database 'ebanisteria'
--
/*!50003 DROP PROCEDURE IF EXISTS `crudUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crudUsuario`(
in Identificacion varchar (20),
in Tipo int,
in Nombres varchar(100),
in Apellidos varchar (100),
in Email varchar(100),
in Contrasena varchar(100),
in opcion varchar (20)
)
BEGIN
/*declarar las constantes de procedimiento*/
set @estado =  'Activo';

/*Metodos de la clase: */
case
/*Cuando la opcion sea guardar:*/
when opcion = 'guardar' then
insert into usuario values (Identificacion, Tipo, Nombres, Apellidos, Email, Contrasena, @estado);
select concat('Se ha agregado el usuario ', Nombres,' ', Apellidos) as Mensaje;
/*cuando la opcion sea modificar:*/ 
end case; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DatoUsua` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DatoUsua`(
in idTipoDocu varchar(4),
in idTipoUsua varchar(45),
in idUsuario varchar(45),
in Genero varchar(45),
in FechNace date,
in Direccion varchar(200),
in Telefono varchar (45),
in Celular varchar(45),
in opcion varchar(45)
)
BEGIN
/*declarar las constantes de procedimiento*/
set @iddato = (select ifnull(max(iddatousua)+1, 1) from datousua);
set @estado =  'Activo';
set @empresa = (select idempresa from Empresa);

/* Metodos de la clase: */
case
/*Cuando la opcion sea guardar:*/
when opcion = 'guardar' then
insert into datousua values (@iddato,@empresa,idTipoDocu,idTipoUsua,idUsuario,Genero, FechNace, Direccion, Telefono, Celular, @estado);
select concat('Se ha agregado datos del usuario') as Mensaje;
/*cuando la opcion sea modificar:*/ 
end case; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Empresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Empresa`(
in Nombre varchar (100),
in Ubicacion varchar(200),
in Telefono varchar(45),
in Fax varchar (45),
in Email varchar(200),
in Estado varchar (100)
)
BEGIN
/*declarar las constantes de procedimiento*/
set @estado =  'Activo';

/* Metodos de la clase: */
case
/*Cuando la opcion sea guardar:*/
when opcion = 'guardar' then
insert into usuario values (Nombre, Ubicacion, Telefono, Fax, Email, @estado);
select concat('Se han agregado los datos') as Mensaje;
/*cuando la opcion sea modificar:*/ 
end case; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TipoDocu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TipoDocu`(
in Numero varchar (20)
)
BEGIN
/*declarar las constantes de procedimiento*/
set @estado =  'Activo';

/* Metodos de la clase: */
case
/*Cuando la opcion sea guardar:*/
when opcion = 'guardar' then
insert into usuario values (Numero, @estado);
select concat('Se ha agregado el usuario', Nombres, Apellidos) as Mensaje;
/*cuando la opcion sea modificar:*/ 
end case; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TipoUsua` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TipoUsua`(
in Nombre varchar(45),
in opcion varchar(45)
)
BEGIN
/*iniciamos el contador de el idtipo de usuario*/
set @idtipo = (select ifnull(max(idtipousua)+1,1) from tipousua);
/*buscamos que el nombre de usuario no esté en la base de datos o exista*/
set @NoTipoUsua = (select NoTipoUsua from tipousua where NoTipoUsua = Nombre);
/* Metodos de la clase: */
case
/*Cuando la opcion sea guardar:*/
when opcion = 'guardar' then
/* Validamos que el usuario ya existe */
if @NoTipoUsua = Nombre then
select concat('El tipo de usuario ', Nombre, ' ya existe.') as mensaje;
else /*Si no existe lo guardamos*/
insert into tipousua values (@idtipo, Nombre);
select concat('Se ha agregado el tipo de usuario ', Nombre) as Mensaje;
end if; 

/*cuando la opcion sea modificar:*/ 
end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-10  0:32:07
