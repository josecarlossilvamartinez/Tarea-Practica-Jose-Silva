-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2026 a las 18:52:40
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Ingenieria', 'Libros de ingenieria y tecnologia'),
(2, 'Matematicas', 'Algebra, calculo y estadistica'),
(3, 'Fisica', 'Mecanica, electromagnetismo y termodinamica'),
(4, 'Programacion', 'Lenguajes y desarrollo de software'),
(5, 'Bases de datos', 'Diseño y administracion de bases de datos'),
(6, 'Administracion', 'Gestion empresarial y operaciones'),
(7, 'Literatura', 'Novelas, cuentos y poesia'),
(8, 'Historia', 'Historia universal y de Centroamerica'),
(9, 'Economia', 'Micro y macroeconomia'),
(10, 'Idiomas', 'Gramatica y aprendizaje de idiomas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `año_publicacion` year(4) DEFAULT NULL,
  `ejemplares` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `titulo`, `autor`, `año_publicacion`, `ejemplares`, `id_categoria`) VALUES
(1, 'Ingenieria de Metodos', 'Benjamin Niebel', '2009', 3, 1),
(2, 'Calculo de una variable', 'James Stewart', '2012', 5, 2),
(3, 'Fisica Universitaria', 'Sears y Zemansky', '2013', 4, 3),
(4, 'Python para todos', 'Raul Gonzalez Duque', '2011', 2, 4),
(5, 'Fundamentos de Bases de Datos', 'Abraham Silberschatz', '2014', 3, 5),
(6, 'Administracion de Operaciones', 'Jay Heizer', '2015', 3, 6),
(7, 'Cien años de soledad', 'Gabriel Garcia Marquez', '1967', 2, 7),
(8, 'Historia de Centroamerica', 'Hector Perez Brignoli', '1985', 1, 8),
(9, 'Principios de Economia', 'Gregory Mankiw', '2012', 4, 9),
(10, 'Gramatica de la lengua española', 'Real Academia Española', '2010', 2, 10),
(11, 'Investigacion de Operaciones', 'Hamdy Taha', '2012', 3, 1),
(12, 'Estadistica para ingenieros', 'Douglas Montgomery', '2011', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamos` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `estado` enum('Prestado','Devuelto') NOT NULL DEFAULT 'Prestado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamos`, `id_libro`, `id_socio`, `fecha_prestamo`, `fecha_devolucion`, `estado`) VALUES
(1, 1, 1, '2026-09-01', '2026-09-08', 'Devuelto'),
(2, 11, 1, '2026-09-10', '2026-09-17', 'Devuelto'),
(3, 2, 2, '2026-09-02', '2026-09-09', 'Devuelto'),
(4, 4, 2, '2026-09-15', NULL, 'Prestado'),
(5, 3, 4, '2026-09-05', '2026-09-12', 'Devuelto'),
(6, 5, 8, '2026-09-07', '2026-09-14', 'Devuelto'),
(7, 6, 5, '2026-09-12', NULL, 'Prestado'),
(8, 7, 9, '2026-09-18', '2026-09-25', 'Devuelto'),
(9, 8, 6, '2026-09-20', NULL, 'Prestado'),
(10, 9, 7, '2026-09-22', '2026-09-29', 'Devuelto'),
(11, 10, 3, '2026-09-25', NULL, 'Prestado'),
(12, 12, 10, '2026-10-01', NULL, 'Prestado'),
(13, 1, 11, '2026-10-03', NULL, 'Prestado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `id_socio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `carrera` varchar(80) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id_socio`, `nombre`, `carrera`, `correo`, `telefono`) VALUES
(1, 'Jose Silva', 'Ingeniería Industrial', 'Jose.Silva@correo.com', '7010-1001'),
(2, 'Carlos Hernández', 'Ingeniería Informática', 'carlos.hernandez@correo.com', '7010-1002'),
(3, 'Lucía Ramírez', 'Arquitectura', 'lucia.ramirez@correo.com', '7010-1003'),
(4, 'Diego Flores', 'Ingeniería Industrial', 'diego.flores@correo.com', '7010-1004'),
(5, 'María López', 'Administración', 'maria.lopez@correo.com', '7010-1005'),
(6, 'José Castillo', 'Ingeniería Civil', 'jose.castillo@correo.com', '7010-1006'),
(7, 'Sofía Mejía', 'Economía', 'sofia.mejia@correo.com', '7010-1007'),
(8, 'Andrés Rivas', 'Ingeniería Informática', 'andres.rivas@correo.com', '7010-1008'),
(9, 'Valeria Cruz', 'Psicología', 'valeria.cruz@correo.com', '7010-1009'),
(10, 'Mario Guzmán', 'Ingeniería Industrial', 'mario.guzman@correo.com', '7010-1010'),
(11, 'Paola Serrano', 'Arquitectura', 'paola.serrano@correo.com', '7010-1011');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `fk_libros_categorias` (`id_categoria`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamos`),
  ADD KEY `fk_prestamos_libros` (`id_libro`),
  ADD KEY `fk_prestamos_socios` (`id_socio`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id_socio`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `id_socio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_libros_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fk_prestamos_libros` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  ADD CONSTRAINT `fk_prestamos_socios` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
