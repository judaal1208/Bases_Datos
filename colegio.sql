-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2023 a las 03:24:54
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
-- Base de datos: `colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `ID_estudiante` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `ID_grado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`ID_estudiante`, `nombre`, `ID_grado`) VALUES
(1, 'Juan', 1),
(2, 'Pedro', 2),
(3, 'Maria', 3),
(4, 'Paula', 4),
(5, 'Teo', 5),
(6, 'Frank', 6),
(7, 'Jhonny', 7),
(8, 'Luisa', 8),
(9, 'Stef', 9),
(10, 'Lucy', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `ID_grado` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `CodigoPuerta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`ID_grado`, `Nombre`, `CodigoPuerta`) VALUES
(1, 'Primero', '1'),
(2, 'Segundo', '2'),
(3, 'Tercero', '3'),
(4, 'Cuarto', '4'),
(5, 'Quinto', '5'),
(6, 'Sexto', '6'),
(7, 'Septimo', '7'),
(8, 'Octavo', '8'),
(9, 'Noveno', '9'),
(10, 'Decimo', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imparte`
--

CREATE TABLE `imparte` (
  `ID_imparte` int(11) NOT NULL,
  `ID_profesor` int(11) NOT NULL,
  `ID_grado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imparte`
--

INSERT INTO `imparte` (`ID_imparte`, `ID_profesor`, `ID_grado`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `ID_materia` int(11) NOT NULL,
  `NombreMateria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`ID_materia`, `NombreMateria`) VALUES
(1, 'Matemáticas'),
(2, 'Ciencias'),
(3, 'Ciencias sociales'),
(4, 'Educación física'),
(5, 'Literatura'),
(6, 'Formación cívica y ética'),
(7, 'Educación artística'),
(8, 'Educación socioemocional'),
(9, 'Música Clásica y Composición'),
(10, 'Lengua extranjera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `ID_profesor` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `materia` varchar(255) NOT NULL,
  `ID_materia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`ID_profesor`, `nombre`, `cedula`, `materia`, `ID_materia`) VALUES
(1, 'Karl', '1', 'Matemáticas', 1),
(2, 'Jess', '2', 'Ciencias', 2),
(3, 'Fer', '3', 'Ciencias sociales', 3),
(4, 'Louis', '4', 'Educación física', 4),
(5, 'Tommy', '5', 'Literatura', 5),
(6, 'Mari', '6', 'Formación cívica y ética', 6),
(7, 'Paula', '7', 'Educación artística', 7),
(8, 'Sam', '8', 'Educación socioemocional', 8),
(9, 'Tarot', '9', 'Música Clásica y Composición', 9),
(10, 'Molly', '10', 'Lengua extranjera', 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`ID_estudiante`),
  ADD KEY `FK_Estudiantes_Cursos` (`ID_grado`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`ID_grado`),
  ADD UNIQUE KEY `CodigoPuerta` (`CodigoPuerta`);

--
-- Indices de la tabla `imparte`
--
ALTER TABLE `imparte`
  ADD PRIMARY KEY (`ID_imparte`),
  ADD KEY `ID_profesor` (`ID_profesor`),
  ADD KEY `ID_grado` (`ID_grado`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`ID_materia`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`ID_profesor`),
  ADD KEY `FK_profesores_mateia` (`ID_materia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `ID_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `ID_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `imparte`
--
ALTER TABLE `imparte`
  MODIFY `ID_imparte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `ID_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `ID_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `FK_Estudiantes_Cursos` FOREIGN KEY (`ID_grado`) REFERENCES `grados` (`ID_grado`);

--
-- Filtros para la tabla `imparte`
--
ALTER TABLE `imparte`
  ADD CONSTRAINT `imparte_ibfk_1` FOREIGN KEY (`ID_profesor`) REFERENCES `profesores` (`ID_profesor`),
  ADD CONSTRAINT `imparte_ibfk_2` FOREIGN KEY (`ID_grado`) REFERENCES `grados` (`ID_grado`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `FK_profesores_mateia` FOREIGN KEY (`ID_materia`) REFERENCES `materias` (`ID_materia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
