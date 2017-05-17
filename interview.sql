-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-05-2017 a las 15:22:31
-- Versión del servidor: 5.5.55-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `interview`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` varchar(40) NOT NULL DEFAULT '',
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`) VALUES
('001', 'Pepe'),
('002', 'Juan'),
('003', 'Quique'),
('004', 'Roque'),
('005', 'Pablo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `id` varchar(40) NOT NULL DEFAULT '',
  `idcliente` varchar(40) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `emision` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `idcliente`, `total`, `emision`) VALUES
('001', '003', 100, '0000-00-00'),
('002', '002', 100, '0000-00-00'),
('003', '005', 50, '0000-00-00'),
('004', '004', 75, '0000-00-00'),
('005', '001', 40, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

CREATE TABLE IF NOT EXISTS `impuesto` (
  `id` varchar(40) NOT NULL DEFAULT '',
  `idfactura` varchar(40) DEFAULT NULL,
  `codigo` enum('IVA','IIBB','SOBRETASA') DEFAULT NULL,
  `porcentaje` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idfactura` (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` varchar(40) NOT NULL DEFAULT '',
  `idfactura` varchar(40) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idfactura` (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`id`, `idfactura`, `total`, `producto`) VALUES
('001', '002', 1500, 'paraguas'),
('002', '004', 2015, 'lisoform'),
('003', '001', 654, 'esponja'),
('004', '003', 12, 'memoria'),
('005', '005', 321, 'ataud');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `impuesto`
--
ALTER TABLE `impuesto`
  ADD CONSTRAINT `impuesto_ibfk_1` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`id`);

--
-- Filtros para la tabla `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
