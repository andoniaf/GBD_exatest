-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-01-2016 a las 07:28:13
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
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` char(9) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` char(128) NOT NULL,
  PRIMARY KEY (`idAlumno`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
(7, 'Neville', 'Longbottom', 'Shortpants', 'botonlargo@griffindor.org', '928419717', 'nlongbottom', '87ae45b2c1b1f3d3334b76a83092097d1b1c237ac210a13d2dd7d0248907b19415eb252a8a7f37714cf7b9093ad75d94957fa4876a7648c832f52115286eb720');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL,
  KEY `index_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE IF NOT EXISTS `notas` (
  `idNota` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `aciertos` int(10) NOT NULL,
  `blancos` int(10) NOT NULL,
  `errores` int(10) NOT NULL,
  `nota` double(4,3) NOT NULL,
  PRIMARY KEY (`idNota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `opcion1` varchar(255) NOT NULL,
  `opcion2` varchar(255) NOT NULL,
  `opcion3` varchar(255) NOT NULL,
  `opcion4` varchar(255) NOT NULL,
  `opcion_true` varchar(255) NOT NULL,
  PRIMARY KEY (`idPregunta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idPregunta`, `descripcion`, `opcion1`, `opcion2`, `opcion3`, `opcion4`, `opcion_true`) VALUES
(1, 'Who am I? PiPaPoPU!', 'George Lucas', 'Stephen Hawking', 'Amy Acker', 'Artoo (R2D2)', '2'),
(2, '¿Quien es root?', 'Juanmi', 'Groot', 'Amy Acker', 'Snowden', '3'),
(3, '¿Quien gana?', 'Thor', 'Cpt. America', 'Iron Man', 'Ojo de halcón', '3'),
(4, '"Recuerdo los buenos tiempos, recuerdo buenas historias. Y aún arde _____ en mi memoria."', 'Londres', 'Madrid', 'Valencia', 'Mordor', '2'),
(5, '¿Cual es la respuesta al sentido de la vida el universo y todo lo demas?', '42', '13', 'Amy Acker', 'Taylor Swift', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE IF NOT EXISTS `respuestas` (
  `idRespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `idPregunta` int(11) NOT NULL,
  `idOpcion` int(11) NOT NULL,
  `time` varchar(150) NOT NULL,
  PRIMARY KEY (`idRespuesta`),
  KEY `fk_preguntas_respuestas` (`idPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD CONSTRAINT `login_attempts_ibfk_1` FOREIGN KEY (`id`) REFERENCES `alumnos` (`idAlumno`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_preguntas_respuestas` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
