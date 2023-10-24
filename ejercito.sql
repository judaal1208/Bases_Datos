-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2023 a las 04:04:01
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañias`
--

CREATE TABLE `compañias` (
  `numeroCompañia` int(11) NOT NULL,
  `actividad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles`
--

CREATE TABLE `cuarteles` (
  `codigoCuartel` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `ubicacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpo`
--

CREATE TABLE `cuerpo` (
  `codigoCuerpo` int(11) NOT NULL,
  `denominación` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `códigoServicio` int(11) NOT NULL,
  `descripción` varchar(255) NOT NULL,
  `fecha_hora_servicio` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigoSoldado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldadocuerpo`
--

CREATE TABLE `soldadocuerpo` (
  `codigo_soldadoCuerpos` int(11) NOT NULL,
  `codigoCuerpo` int(11) DEFAULT NULL,
  `codigoSoldado` int(11) DEFAULT NULL,
  `numeroCompañia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldados`
--

CREATE TABLE `soldados` (
  `codigoSoldado` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `graduacion` varchar(255) DEFAULT NULL,
  `numeroCompañia` int(11) DEFAULT NULL,
  `codigoCuerpo` int(11) DEFAULT NULL,
  `codigoCuartel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `codigoUbicacion` int(11) NOT NULL,
  `codigoSoldado` int(11) DEFAULT NULL,
  `numeroCompañia` int(11) DEFAULT NULL,
  `codigoCuartel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañias`
--
ALTER TABLE `compañias`
  ADD PRIMARY KEY (`numeroCompañia`);

--
-- Indices de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD PRIMARY KEY (`codigoCuartel`);

--
-- Indices de la tabla `cuerpo`
--
ALTER TABLE `cuerpo`
  ADD PRIMARY KEY (`codigoCuerpo`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`códigoServicio`),
  ADD KEY `FK_ID_soldado` (`codigoSoldado`);

--
-- Indices de la tabla `soldadocuerpo`
--
ALTER TABLE `soldadocuerpo`
  ADD PRIMARY KEY (`codigo_soldadoCuerpos`),
  ADD KEY `FK_codigoCuerpo` (`codigoCuerpo`),
  ADD KEY `FK_codigoSoldado` (`codigoSoldado`),
  ADD KEY `FK_numeroCompañia` (`numeroCompañia`);

--
-- Indices de la tabla `soldados`
--
ALTER TABLE `soldados`
  ADD PRIMARY KEY (`codigoSoldado`),
  ADD KEY `FK_ID_compañia` (`numeroCompañia`),
  ADD KEY `FK_ID_codigo` (`codigoCuerpo`),
  ADD KEY `FK_ID_cuartel` (`codigoCuartel`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`codigoUbicacion`),
  ADD KEY `FK_ID_soldadoUbicacion` (`codigoSoldado`),
  ADD KEY `FK_ID_compañiaUbicacion` (`numeroCompañia`),
  ADD KEY `FK_ID_cuartelUbicacion` (`codigoCuartel`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañias`
--
ALTER TABLE `compañias`
  MODIFY `numeroCompañia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  MODIFY `codigoCuartel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpo`
--
ALTER TABLE `cuerpo`
  MODIFY `codigoCuerpo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `códigoServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldadocuerpo`
--
ALTER TABLE `soldadocuerpo`
  MODIFY `codigo_soldadoCuerpos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldados`
--
ALTER TABLE `soldados`
  MODIFY `codigoSoldado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `codigoUbicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `FK_ID_soldado` FOREIGN KEY (`codigoSoldado`) REFERENCES `soldados` (`codigoSoldado`);

--
-- Filtros para la tabla `soldadocuerpo`
--
ALTER TABLE `soldadocuerpo`
  ADD CONSTRAINT `FK_codigoCuerpo` FOREIGN KEY (`codigoCuerpo`) REFERENCES `cuerpo` (`codigoCuerpo`),
  ADD CONSTRAINT `FK_codigoSoldado` FOREIGN KEY (`codigoSoldado`) REFERENCES `soldados` (`codigoSoldado`),
  ADD CONSTRAINT `FK_numeroCompañia` FOREIGN KEY (`numeroCompañia`) REFERENCES `compañias` (`numeroCompañia`);

--
-- Filtros para la tabla `soldados`
--
ALTER TABLE `soldados`
  ADD CONSTRAINT `FK_ID_codigo` FOREIGN KEY (`codigoCuerpo`) REFERENCES `cuerpo` (`codigoCuerpo`),
  ADD CONSTRAINT `FK_ID_compañia` FOREIGN KEY (`numeroCompañia`) REFERENCES `compañias` (`numeroCompañia`),
  ADD CONSTRAINT `FK_ID_cuartel` FOREIGN KEY (`codigoCuartel`) REFERENCES `cuarteles` (`codigoCuartel`);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `FK_ID_compañiaUbicacion` FOREIGN KEY (`numeroCompañia`) REFERENCES `compañias` (`numeroCompañia`),
  ADD CONSTRAINT `FK_ID_cuartelUbicacion` FOREIGN KEY (`codigoCuartel`) REFERENCES `cuarteles` (`codigoCuartel`),
  ADD CONSTRAINT `FK_ID_soldadoUbicacion` FOREIGN KEY (`codigoSoldado`) REFERENCES `soldados` (`codigoSoldado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
