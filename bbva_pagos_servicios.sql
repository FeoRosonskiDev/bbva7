-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2019 a las 21:45:16
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bbva_pagos_servicios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `IDCLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `CLAVE` varchar(10) NOT NULL,
  `TELEFONO` varchar(9) NOT NULL,
  `ESTADO` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`IDCLIENTE`, `NOMBRE`, `DNI`, `CLAVE`, `TELEFONO`, `ESTADO`) VALUES
(1, 'AMERICO CORNELIO BALTAZAR', '71844254', '65656', '93573081', 'A'),
(2, 'Quiroz Sotelo Liz Fiorella', '73584670', '12354', '93579981', 'A'),
(3, 'Juan Luis Perez Ramirez', '73584499', '23245', '93578881', 'A'),
(4, 'AMERICO LUIS CHAVEZ', '71844004', '11111', '93773081', 'A'),
(5, 'AMERICO CORNELIO BALTAZAR', '71844254', '12345', '93573081', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `IDCLIENTE` int(11) NOT NULL,
  `IDSERVICIO` int(11) NOT NULL,
  `IDFACTURA` int(11) NOT NULL,
  `MONTOPAGO` varchar(20) NOT NULL,
  `FECHAEMISION` date NOT NULL,
  `FECHAVECIMIENTO` date NOT NULL,
  `ESTADOFACTURA` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO FACTURA (`IDCLIENTE`,`IDSERVICIO`,`IDFACTURA`,`MONTOPAGO`,`FECHAEMISION`,`FECHAVECIMIENTO`,`ESTADOFACTURA`)

VALUES (1,1,1,'240','19/07/2019','27/09/2019','C'),

        (2,2,2,'280','14/07/2019','26/09/2019','C'),

        (3,3,3,'240','14/07/2019','29/09/2019','D'),

        (4,4,4,'280','16/07/2019','27/09/2019','D');
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `IDPROVEEDOR` int(11) NOT NULL,
  `RAZONSOCIAL` varchar(45) NOT NULL,
  `IDSERVICIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `proveedor` (`IDPROVEEDOR`, `RAZONSOCIAL`, `IDSERVICIO`) VALUES
(1,'EDELNOR',3),
(2,'SEDAPAL',1),
(3,'TELEFONICA',2);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `IDSERVICIO` int(11) NOT NULL,
  `IDPROVEEDOR` int(11) NOT NULL,
  `IDTIPOSERVICIO` int(11) NOT NULL,
  `IDENTIFICADOR` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `servicio` (`IDSERVICIO`, `IDPROVEEDOR`, `IDTIPOSERVICIO`,`IDENTIFICADOR`) VALUES
(1,1,3,'LUZ790'),
(2,2,1,'AGU542'),       
(3,2,1,'AGU543'),
(4,3,2,'123456789'),
(5,1,3,'LUZ791');
-- --------------------------------------------------------

-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `IDCLIENTE` int(11) NOT NULL,
  `IDTARJETA` int(11) NOT NULL,
  `TIPOTARJETA` varchar(10) NOT NULL,
  `NUMEROTARJETA` varchar(16) NOT NULL,
  `saldo` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`IDCLIENTE`, `IDTARJETA`, `TIPOTARJETA`, `NUMEROTARJETA`, `saldo`) VALUES
(1, 1, 'DEBITO', '1234567891234567', NULL),
(2, 2, 'CREDITO', '1234567891234569', 2000),
(2, 3, 'DEBITO', '1234567891234567', 3000),
(2, 4, 'DEBITO', '1234567891234567', 40000),
(5, 6, 'DEBITO', '1234567891234567', 60000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposervicio`
--

CREATE TABLE `tiposervicio` (
  `IDTIPOSERVICIO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposervicio`
--

INSERT INTO `tiposervicio` (`IDTIPOSERVICIO`, `DESCRIPCION`) VALUES
(1, 'AGUA'),
(2, 'TELEFONO'),
(3, 'LUZ'),
(4, 'INTERNET'),
(5, 'CABLE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IDCLIENTE`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`IDFACTURA`),
  ADD KEY `FK_ID_CLIENTE` (`IDCLIENTE`),
  ADD KEY `FK_ID_SERVICIO` (`IDSERVICIO`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`IDPROVEEDOR`),
  ADD KEY `FK_ID_SERVICIO_PROVEEDOR` (`IDSERVICIO`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`IDSERVICIO`),
  ADD KEY `FK_ID_PROVEEDOR` (`IDPROVEEDOR`),
  ADD KEY `FK_ID_TIPO_SERVICIO` (`IDTIPOSERVICIO`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`IDTARJETA`),
  ADD KEY `FK_ID_CLIENTE_TARJETA` (`IDCLIENTE`);

--
-- Indices de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  ADD PRIMARY KEY (`IDTIPOSERVICIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `IDCLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `IDFACTURA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IDPROVEEDOR` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `IDSERVICIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `IDTARJETA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  MODIFY `IDTIPOSERVICIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FK_ID_CLIENTE` FOREIGN KEY (`IDCLIENTE`) REFERENCES `clientes` (`IDCLIENTE`),
  ADD CONSTRAINT `FK_ID_SERVICIO` FOREIGN KEY (`IDSERVICIO`) REFERENCES `servicio` (`IDSERVICIO`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `FK_ID_SERVICIO_PROVEEDOR` FOREIGN KEY (`IDSERVICIO`) REFERENCES `servicio` (`IDSERVICIO`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `FK_ID_PROVEEDOR` FOREIGN KEY (`IDPROVEEDOR`) REFERENCES `proveedor` (`IDPROVEEDOR`),
  ADD CONSTRAINT `FK_ID_TIPO_SERVICIO` FOREIGN KEY (`IDTIPOSERVICIO`) REFERENCES `tiposervicio` (`IDTIPOSERVICIO`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `FK_ID_CLIENTE_TARJETA` FOREIGN KEY (`IDCLIENTE`) REFERENCES `clientes` (`IDCLIENTE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
