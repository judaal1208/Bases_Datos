-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2023 a las 03:47:59
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
-- Base de datos: `final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `ID_alumno` int(11) NOT NULL,
  `numero_matricula` int(11) NOT NULL,
  `CI` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `ID_TFC` int(11) DEFAULT NULL,
  `ID_profesor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colabora`
--

CREATE TABLE `colabora` (
  `ID_colabora` int(11) NOT NULL,
  `ID_alumno` int(11) NOT NULL,
  `ID_profesor` int(11) NOT NULL,
  `ID_tfc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `ID_profesor` int(11) NOT NULL,
  `CI` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `domicilio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tfc`
--

CREATE TABLE `tfc` (
  `ID_TFC` int(11) NOT NULL,
  `numero_orden` int(11) NOT NULL,
  `tema` varchar(255) NOT NULL,
  `ID_tribunal` int(11) DEFAULT NULL,
  `fecha_examen` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tribunal`
--

CREATE TABLE `tribunal` (
  `ID_tribunal` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `lugar_examen` varchar(255) NOT NULL,
  `numero_componentes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tribunales_profesor`
--

CREATE TABLE `tribunales_profesor` (
  `ID_tribunales_profesor` int(11) NOT NULL,
  `ID_tribunal` int(11) NOT NULL,
  `ID_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`ID_alumno`),
  ADD KEY `FK_alumno_tfc` (`ID_TFC`);

--
-- Indices de la tabla `colabora`
--
ALTER TABLE `colabora`
  ADD PRIMARY KEY (`ID_colabora`),
  ADD KEY `ID_alumno` (`ID_alumno`),
  ADD KEY `ID_profesor` (`ID_profesor`),
  ADD KEY `ID_tfc` (`ID_tfc`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`ID_profesor`);

--
-- Indices de la tabla `tfc`
--
ALTER TABLE `tfc`
  ADD PRIMARY KEY (`ID_TFC`),
  ADD KEY `fk_tribunal` (`ID_tribunal`);

--
-- Indices de la tabla `tribunal`
--
ALTER TABLE `tribunal`
  ADD PRIMARY KEY (`ID_tribunal`);

--
-- Indices de la tabla `tribunales_profesor`
--
ALTER TABLE `tribunales_profesor`
  ADD PRIMARY KEY (`ID_tribunales_profesor`),
  ADD KEY `ID_tribunal` (`ID_tribunal`),
  ADD KEY `ID_profesor` (`ID_profesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `ID_alumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `colabora`
--
ALTER TABLE `colabora`
  MODIFY `ID_colabora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `ID_profesor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tfc`
--
ALTER TABLE `tfc`
  MODIFY `ID_TFC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tribunal`
--
ALTER TABLE `tribunal`
  MODIFY `ID_tribunal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tribunales_profesor`
--
ALTER TABLE `tribunales_profesor`
  MODIFY `ID_tribunales_profesor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `FK_alumno_tfc` FOREIGN KEY (`ID_TFC`) REFERENCES `tfc` (`ID_TFC`);

--
-- Filtros para la tabla `colabora`
--
ALTER TABLE `colabora`
  ADD CONSTRAINT `colabora_ibfk_1` FOREIGN KEY (`ID_alumno`) REFERENCES `alumnos` (`ID_alumno`),
  ADD CONSTRAINT `colabora_ibfk_2` FOREIGN KEY (`ID_profesor`) REFERENCES `profesor` (`ID_profesor`),
  ADD CONSTRAINT `colabora_ibfk_3` FOREIGN KEY (`ID_tfc`) REFERENCES `tfc` (`ID_TFC`);

--
-- Filtros para la tabla `tfc`
--
ALTER TABLE `tfc`
  ADD CONSTRAINT `fk_tribunal` FOREIGN KEY (`ID_tribunal`) REFERENCES `tribunal` (`ID_tribunal`);

--
-- Filtros para la tabla `tribunales_profesor`
--
ALTER TABLE `tribunales_profesor`
  ADD CONSTRAINT `tribunales_profesor_ibfk_1` FOREIGN KEY (`ID_tribunal`) REFERENCES `tribunal` (`ID_tribunal`),
  ADD CONSTRAINT `tribunales_profesor_ibfk_2` FOREIGN KEY (`ID_profesor`) REFERENCES `profesor` (`ID_profesor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
