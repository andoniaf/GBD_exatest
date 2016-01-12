-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-01-2016 a las 18:59:03
-- Versión del servidor: 5.5.44-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `exatest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE IF NOT EXISTS `alumnos` (
  `idAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apellido1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apellido2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` char(9) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idAlumno`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`idAlumno`, `nombre`, `apellido1`, `apellido2`, `email`, `telefono`, `usuario`, `password`) VALUES
(1, 'Ginevra', 'Weasley', 'Wisly', 'ginny@griffindor.org', '963141592', 'gweasley', '87ae45b2c1b1f3d3334b76a83092097d1b1c237ac210a13d2dd7d0248907b19415eb252a8a7f37714cf7b9093ad75d94957fa4876a7648c832f52115286eb720'),
(2, 'Harry', 'Potter', 'Terpo', 'elprota@griffindor.org', '916535897', 'hpotter', '87ae45b2c1b1f3d3334b76a83092097d1b1c237ac210a13d2dd7d0248907b19415eb252a8a7f37714cf7b9093ad75d94957fa4876a7648c832f52115286eb720'),
(3, 'Hermione', 'Granger', 'Watson', 'sexy_emma@griffindor.org', '939323846', 'hgranger', '87ae45b2c1b1f3d3334b76a83092097d1b1c237ac210a13d2dd7d0248907b19415eb252a8a7f37714cf7b9093ad75d94957fa4876a7648c832f52115286eb720'),
(4, 'Serverus', 'Snape', 'Sneip', 'snake@slytherin', '942643383', 'ssnape', '87ae45b2c1b1f3d3334b76a83092097d1b1c237ac210a13d2dd7d0248907b19415eb252a8a7f37714cf7b9093ad75d94957fa4876a7648c832f52115286eb720'),
(5, 'Tom', 'Sorvolo', 'Ryddle', 'voldemort@slytherin', '972795028', 'tsorvolo', '87ae45b2c1b1f3d3334b76a83092097d1b1c237ac210a13d2dd7d0248907b19415eb252a8a7f37714cf7b9093ad75d94957fa4876a7648c832f52115286eb720'),
(6, 'Sirius', 'Black', 'and White', 'blackadnwhite@griffindor.org', '928419716', 'sblack', '87ae45b2c1b1f3d3334b76a83092097d1b1c237ac210a13d2dd7d0248907b19415eb252a8a7f37714cf7b9093ad75d94957fa4876a7648c832f52115286eb720'),
(14, 'Neville', 'Longbottom', 'Shortpants', 'botonlargo@griffindor.org', '928419717', 'nlongbottom', '87ae45b2c1b1f3d3334b76a83092097d1b1c237ac210a13d2dd7d0248907b19415eb252a8a7f37714cf7b9093ad75d94957fa4876a7648c832f52115286eb720');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentos`
--

CREATE TABLE IF NOT EXISTS `intentos` (
  `idIntento` int(11) NOT NULL AUTO_INCREMENT,
  `idAlumno` int(11) NOT NULL,
  `idRespuesta` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`idIntento`),
  KEY `fk_alumnos_intentos` (`idAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL,
  `time` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  KEY `index_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE IF NOT EXISTS `opciones` (
  `idOpcion` int(11) NOT NULL AUTO_INCREMENT,
  `idPregunta` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isTrue` tinyint(1) NOT NULL,
  PRIMARY KEY (`idOpcion`),
  KEY `fk_preguntas_opciones` (`idPregunta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`idOpcion`, `idPregunta`, `descripcion`, `isTrue`) VALUES
(1, 1, 'George Lucas', 0),
(2, 1, 'Stephen Hawking', 1),
(3, 1, 'Amy Acker', 0),
(4, 1, 'Artoo (R2D2)', 0),
(5, 2, 'Groot', 0),
(6, 2, 'Snowden', 0),
(7, 2, 'Amy Acker', 1),
(8, 2, 'Juanmi', 0),
(9, 3, 'Iron Man', 1),
(10, 3, 'Ojo de halcón', 0),
(11, 3, 'Cpt. America', 0),
(12, 3, 'Thor', 0),
(13, 4, 'Madrid', 1),
(14, 4, 'Mordor', 0),
(15, 4, 'Valencia', 0),
(16, 4, 'Londres', 0),
(17, 5, '13', 0),
(18, 5, 'Amy Acker', 0),
(19, 5, 'Taylor Swift', 0),
(20, 5, '42', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idPregunta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idPregunta`, `descripcion`) VALUES
(1, 'Who am I? PiPaPoPU!'),
(2, '¿Quien es root?'),
(3, '¿Quien gana?'),
(4, '"Recuerdo los buenos tiempos, recuerdo buenas historias. Y aún arde _____ en mi memoria."'),
(5, '¿Cual es la respuesta al sentido de la vida el universo y todo lo demas?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE IF NOT EXISTS `respuestas` (
  `idRespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `idPregunta` int(11) NOT NULL,
  `idOpcion` int(11) NOT NULL,
  `idIntento` int(11) NOT NULL,
  PRIMARY KEY (`idRespuesta`),
  KEY `fk_preguntas_respuestas` (`idPregunta`),
  KEY `fk_opciones_respuestas` (`idOpcion`),
  KEY `fk_intentos_respuestas` (`idIntento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `intentos`
--
ALTER TABLE `intentos`
  ADD CONSTRAINT `fk_alumnos_intentos` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`idAlumno`);

--
-- Filtros para la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD CONSTRAINT `login_attempts_ibfk_1` FOREIGN KEY (`id`) REFERENCES `alumnos` (`idAlumno`);

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `fk_preguntas_opciones` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_intentos_respuestas` FOREIGN KEY (`idIntento`) REFERENCES `intentos` (`idIntento`),
  ADD CONSTRAINT `fk_opciones_respuestas` FOREIGN KEY (`idOpcion`) REFERENCES `opciones` (`idOpcion`),
  ADD CONSTRAINT `fk_preguntas_respuestas` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
