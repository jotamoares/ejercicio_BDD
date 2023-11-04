-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2023 a las 08:37:07
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
-- Base de datos: `ejerciciobdd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumnos` int(10) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `dni` int(15) NOT NULL,
  `sexo` varchar(3) NOT NULL,
  `nro_celular` int(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `nacimiento` date NOT NULL,
  `ciudadania` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumnos`, `apellido`, `nombre`, `dni`, `sexo`, `nro_celular`, `email`, `nacimiento`, `ciudadania`) VALUES
(2, 'Vanquito', 'Armando Esteban', 1984923923, 'mas', 1534234737, 'armando@gmail.com', '2023-11-01', 'rhodesia'),
(5, 'Papanopulos', 'Tereso', 832741994, 'fem', 183492385, 'teresp@gmail.com', '1013-11-07', 'Feliniano'),
(6, 'Acampando', 'Acapulco', 666666666, 'mas', 55559999, 'acampa@enlaselva.com', '2015-11-24', 'charruense'),
(7, 'Oceanografico', 'Mar', 99999, 'fem', 5555555, 'oceanografico@geocities.com', '1013-11-07', 'maritima'),
(8, 'Salame', 'Vos Sos Un', 9999999, 'mas', 777777777, 'salame@yahoo.com', '2023-11-15', 'Tandilense'),
(9, 'Dominado', 'Barón', 77273727, 'fem', 88888888, 'biscocho@correo.com', '1888-08-08', 'Serendipity');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` tinyint(10) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `meses` tinyint(2) NOT NULL,
  `docente_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nombre`, `meses`, `docente_id`) VALUES
(6, 'lavado de pies y manos', 1, 1),
(7, 'Como gastar plata', 24, 4),
(8, 'Barrido de la vereda con tenedores', 9, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id_docente` tinyint(4) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `celular` int(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id_docente`, `apellido`, `nombre`, `celular`, `email`) VALUES
(1, 'Bazaga', 'José', 9393932, 'nariga@gmail.com'),
(2, 'Pastoruti', 'Toro', 202020, 'papadesoledad@gmail.com'),
(4, 'Cafrune', 'Jorge', 74747324, 'cafrune@gmail.com'),
(5, 'Sabelotodo', 'Soy', 7474734, 'capo@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` tinyint(10) NOT NULL,
  `curso_id` tinyint(10) NOT NULL,
  `alumno_id` int(10) NOT NULL,
  `anio` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id_inscripcion`, `curso_id`, `alumno_id`, `anio`) VALUES
(1, 7, 9, 2023),
(2, 6, 8, 2023),
(3, 7, 5, 2023),
(4, 8, 7, 2023);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumnos`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `docente_id` (`docente_id`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id_docente`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `curso_id` (`curso_id`),
  ADD KEY `id_alumno` (`alumno_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumnos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id_docente` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id_docente`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id_alumnos`),
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id_curso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
