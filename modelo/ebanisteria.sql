-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2018 a las 17:58:28
-- Versión del servidor: 10.1.22-MariaDB
-- Versión de PHP: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ebanisteria`
--
CREATE DATABASE IF NOT EXISTS `ebanisteria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ebanisteria`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `crudUsuario` (IN `Identificacion` VARCHAR(20), IN `Tipo` INT, IN `Nombres` VARCHAR(100), IN `Apellidos` VARCHAR(100), IN `Email` VARCHAR(100), IN `Contrasena` VARCHAR(100), IN `opcion` VARCHAR(20))  BEGIN

set @estado =  'Activo';


case

when opcion = 'guardar' then
insert into usuario values (Identificacion, Tipo, Nombres, Apellidos, Email, Contrasena, @estado);
select concat('Se ha agregado el usuario', Nombres, Apellidos) as Mensaje;
 
end case; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datousua`
--

CREATE TABLE `datousua` (
  `idDatoUsua` int(11) NOT NULL COMMENT 'Llave primaria del id',
  `idEmpresa` varchar(45) NOT NULL,
  `idTipoDocu` varchar(4) NOT NULL,
  `idTipoUsua` int(11) NOT NULL,
  `idUsuario` varchar(20) NOT NULL,
  `Genero` varchar(45) NOT NULL COMMENT 'Genero del usuario, masculino, femenino o indefinido',
  `FechNace` date NOT NULL COMMENT 'Fecha de nacimiento del usuario',
  `DireUsua` varchar(200) NOT NULL COMMENT 'Direccion del usuario',
  `TeleUsua` varchar(45) NOT NULL COMMENT 'Numero de Telefono del usuario',
  `CelUsua` varchar(45) NOT NULL COMMENT 'Numero celular del usuario',
  `EstaDato` varchar(45) NOT NULL COMMENT 'Estado del dato, activo o inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para los datos del perfil de usuario';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` varchar(45) NOT NULL COMMENT 'Numero de identificacion tributario de la empresa',
  `NomEmpresa` varchar(100) NOT NULL COMMENT 'Nombre de la empresa',
  `UbicEmpresa` varchar(200) NOT NULL COMMENT 'Ubicacion de la empresa',
  `TelEmpresa` varchar(45) NOT NULL COMMENT 'Numero de telefono de la empresa',
  `FaxEmpresa` varchar(45) NOT NULL COMMENT 'Numero de fax de la empresa',
  `EmailEmpresa` varchar(200) NOT NULL COMMENT 'Correo electronico de la empresa',
  `EstaEmpresa` varchar(45) NOT NULL COMMENT 'activo o inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entidad para los datos de la empresa Ebanisteria Ego';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocu`
--

CREATE TABLE `tipodocu` (
  `idTipoDocu` varchar(4) NOT NULL COMMENT 'Abreviacion de tipo de documento de identidad C.C, TI, RC, PS',
  `NoTiDocu` varchar(100) NOT NULL COMMENT 'Nombre de tipo de documento Tarjeta de Identidad, Cedula de Ciudadania, Pasaporte, Registro Civil'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousua`
--

CREATE TABLE `tipousua` (
  `idTipoUsua` int(11) NOT NULL,
  `NoTipoUsua` varchar(45) NOT NULL COMMENT 'Identificador de tipo de usuario:\n1=Administrador\n2=Operador\n3=Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla o entidad para clasificar los tipos de usuarios del sistema\nAdministrador:\nOperario:\nCliente:\n';

--
-- Volcado de datos para la tabla `tipousua`
--

INSERT INTO `tipousua` (`idTipoUsua`, `NoTipoUsua`) VALUES
(1, 'Administtrador'),
(2, 'Operador'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` varchar(20) NOT NULL COMMENT 'Numero de identificacion del usuario',
  `idTipoUsua` int(11) NOT NULL,
  `Nombres` varchar(100) NOT NULL COMMENT 'Nombres del usuario sin apellidos',
  `Apellidos` varchar(100) NOT NULL COMMENT 'Apellidos del usuario sin nombre',
  `Email` varchar(100) NOT NULL COMMENT 'Correo electronico del usuario utilizado para el inicio de sesion',
  `Password` varchar(100) NOT NULL COMMENT 'contraseña del usuario para el inicio de sesion',
  `EstaUsua` varchar(45) NOT NULL COMMENT 'Estado de usuario= igual o inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla o entidad para almacenar los datos prncipales del usuario';

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idTipoUsua`, `Nombres`, `Apellidos`, `Email`, `Password`, `EstaUsua`) VALUES
('1000645598', 1, 'Mariana', 'Gil Montoya', 'marianagil1802@gmail.com', 'licuadora', 'Activo'),
('1001016838', 1, 'Jhoana', 'Gomez Giraldo', 'jhoisgo@gmail.com', 'jhoanipp', 'Activo'),
('1001237602', 1, 'Jose Daniel', 'Caratar Rivera', 'crjosedaniel18@gmail.com', 'cazoncitop', 'Activo'),
('1002193475', 1, 'Natalia', 'Alzate Castaño', 'nata-1712@hotmail.com', 'natalia', 'Activo'),
('12345', 3, 'mauricio', 'hernandez', 'mauricio@mail.com', '1345', 'Activo'),
('43616107', 3, 'Salome', 'Giraldo Salazar', 'Salome@mail.com', 'salome', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datousua`
--
ALTER TABLE `datousua`
  ADD PRIMARY KEY (`idDatoUsua`,`idEmpresa`,`idTipoDocu`,`idTipoUsua`,`idUsuario`),
  ADD KEY `fk_DatoUsua_Empresa1_idx` (`idEmpresa`),
  ADD KEY `fk_DatoUsua_TipoDocu1_idx` (`idTipoDocu`),
  ADD KEY `fk_DatoUsua_Usuario1_idx` (`idUsuario`,`idTipoUsua`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `tipodocu`
--
ALTER TABLE `tipodocu`
  ADD PRIMARY KEY (`idTipoDocu`);

--
-- Indices de la tabla `tipousua`
--
ALTER TABLE `tipousua`
  ADD PRIMARY KEY (`idTipoUsua`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`,`idTipoUsua`),
  ADD KEY `fk_Usuario_TipoUsua_idx` (`idTipoUsua`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipousua`
--
ALTER TABLE `tipousua`
  MODIFY `idTipoUsua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datousua`
--
ALTER TABLE `datousua`
  ADD CONSTRAINT `fk_DatoUsua_Empresa1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_DatoUsua_TipoDocu1` FOREIGN KEY (`idTipoDocu`) REFERENCES `tipodocu` (`idTipoDocu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_DatoUsua_Usuario1` FOREIGN KEY (`idUsuario`,`idTipoUsua`) REFERENCES `usuario` (`idUsuario`, `idTipoUsua`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_TipoUsua` FOREIGN KEY (`idTipoUsua`) REFERENCES `tipousua` (`idTipoUsua`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
