-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2023 a las 02:15:50
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
-- Base de datos: `universidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro`
--

CREATE TABLE `centro` (
  `ID_centro` int(11) NOT NULL,
  `NombreCentro` varchar(255) DEFAULT NULL,
  `Lugar` varchar(255) DEFAULT NULL,
  `Titulación` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `centro`
--

INSERT INTO `centro` (`ID_centro`, `NombreCentro`, `Lugar`, `Titulación`) VALUES
(1, 'Centro de Jose miguel calle', 'Poblado', 'Ingeniería Informática'),
(2, 'Centro de Jose pablo tobon', 'Tunja', 'Ingeniería de minas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `ID_departamento` int(11) NOT NULL,
  `nombreDepartamento` varchar(255) DEFAULT NULL,
  `Unidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`ID_departamento`, `nombreDepartamento`, `Unidad`) VALUES
(1, 'Departamento de presupuesto Anual', 'Administrativa'),
(2, 'Departamento de Informática', 'Academica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `ID_estudiante` int(11) NOT NULL,
  `NombreEstudiante` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `ID_centro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`ID_estudiante`, `NombreEstudiante`, `Direccion`, `Telefono`, `Email`, `ID_centro`) VALUES
(1, 'Juan Pérez', 'Calle 123, Ciudad', '123-456-7890', 'juan@example.com', NULL),
(2, 'Joan Pérez', 'Calle 456, Ciudad', '123-456-7890', 'juan@example.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `ID_personal` int(11) NOT NULL,
  `NombrePersonal` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Profesion` varchar(255) DEFAULT NULL,
  `ID_departamento` int(11) DEFAULT NULL,
  `ID_centro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`ID_personal`, `NombrePersonal`, `Direccion`, `Telefono`, `Email`, `Profesion`, `ID_departamento`, `ID_centro`) VALUES
(1, 'Juan García', 'Calle Principal 123', '987-654-3210', 'juan@email.com', 'Secretario', NULL, NULL),
(2, 'María López', 'Avenida Central 456', '123-456-7890', 'maria@email.com', 'Contador', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `ID_profesor` int(11) NOT NULL,
  `NombreProfesor` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Profesion` varchar(255) DEFAULT NULL,
  `ID_centro` int(11) DEFAULT NULL,
  `ID_departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`ID_profesor`, `NombreProfesor`, `Direccion`, `Telefono`, `Email`, `Profesion`, `ID_centro`, `ID_departamento`) VALUES
(1, 'Tom', 'Calle Principal 456', '987-654-3210', 'profesor@example.com', 'Matemáticas', NULL, NULL),
(2, 'Bill', 'Calle Principal 456', '987-654-3210', 'profesor@example.com', 'Literatura', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `centro`
--
ALTER TABLE `centro`
  ADD PRIMARY KEY (`ID_centro`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID_departamento`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`ID_estudiante`),
  ADD KEY `ID_centro` (`ID_centro`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`ID_personal`),
  ADD KEY `ID_departamento` (`ID_departamento`),
  ADD KEY `ID_centro` (`ID_centro`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`ID_profesor`),
  ADD KEY `ID_centro` (`ID_centro`),
  ADD KEY `ID_departamento` (`ID_departamento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `centro`
--
ALTER TABLE `centro`
  MODIFY `ID_centro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `ID_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `ID_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `ID_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `ID_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`ID_centro`) REFERENCES `centro` (`ID_centro`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`ID_departamento`) REFERENCES `departamento` (`ID_departamento`),
  ADD CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`ID_centro`) REFERENCES `centro` (`ID_centro`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`ID_centro`) REFERENCES `centro` (`ID_centro`),
  ADD CONSTRAINT `profesores_ibfk_2` FOREIGN KEY (`ID_departamento`) REFERENCES `departamento` (`ID_departamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
