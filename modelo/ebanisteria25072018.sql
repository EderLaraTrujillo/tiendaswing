CREATE DATABASE  IF NOT EXISTS `ebanisteria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ebanisteria`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ebanisteria
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.22-MariaDB

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
  `ValMetro` varchar(45) NOT NULL,
  `Imagen` varchar(255) NOT NULL,
  `EstaProd` varchar(45) NOT NULL COMMENT 'Estado del producto',
  PRIMARY KEY (`idProductos`,`idTipoProd`),
  KEY `TipoProd1_idx` (`idTipoProd`),
  CONSTRAINT `TipoProd1` FOREIGN KEY (`idTipoProd`) REFERENCES `tipoprod` (`idTipoProd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
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
INSERT INTO `usuario` VALUES ('1000645598',1,'Mariana','Gil Montoya','marianagil1802@gmail.com','licuadora','Activo'),('1001016838',1,'Jhoana','Gomez Giraldo','jhoisgo@gmail.com','jhoanitap','Activo'),('1001237602',1,'Jose Daniel','Caratar Rivera','crjosedaniel18@gmail.com','cabezoncitop','Activo'),('1002193475',1,'Natalia','Alzate Castaño','nata-1712@hotmail.com','natalia','Activo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ebanisteria'
--

--
-- Dumping routines for database 'ebanisteria'
--
/*!50003 DROP PROCEDURE IF EXISTS `crudEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crudEmpresa`(
in Nombre varchar (100),
in Ubicacion varchar(100),
in Telefono varchar(100),
in Fax varchar (100),
in Email varchar(100),
in Estado varchar(100)
)
BEGIN
/*declarar las constantes de procedimiento*/
set @estado =  'Activo';
/*/Metodos de la clase: */
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
/*!50003 DROP PROCEDURE IF EXISTS `crudUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
select concat('Se ha agregado el usuario', Nombres, Apellidos) as Mensaje;
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
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DatoUsua`(
in idTipoUsua varchar (45),
in idUsuario varchar (45),
in Genero varchar (45),
in FechNace date,
in Direccion varchar(200),
in Telefono varchar (45),
in Celular varchar(45),
in Estado varchar(45)
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
insert into usuario values (Genero, FechName, Direccion, Telefono, Celular, @estado);
select concat('Se ha agregado datos al usuario') as Mensaje;
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

-- Dump completed on 2018-07-24 10:58:37
