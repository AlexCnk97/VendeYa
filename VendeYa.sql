-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 19-10-2019 a las 11:27:02
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `VendeYa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `Img` varchar(200) NOT NULL,
  `Descripcion` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Categorias`
--

INSERT INTO `Categorias` (`idCategoria`, `nombre`, `Img`, `Descripcion`) VALUES
(1, 'Vehiculos', 'fas fa-car carro text-primary', 'Automoviles, Motos, Accesorios, Camiones-Vehículos Comerciales, Otros Vehículos.'),
(2, 'Inmuebles-Propiedades', 'fas fa-home carro text-primary', 'Apartamentos, Terrenos, Oficinas, Locales, Alquiler.'),
(3, 'Teléfonos-Tablets', 'fas fa-mobile-alt carro text-primary', 'Teléfonos Celulares, Tablets, Accesorios, Protectores, Audífonos, Otros Accesorios.'),
(4, 'Electrónicos-Video', 'fas fa-desktop carro text-primary', 'Computadoras, Laptops, Consolas, TV - Audio-video.'),
(5, 'Casa-Muebles-Jardin', 'fas fa-couch carro text-primary', 'Muebles, Electrodomésticos, Oficina, Jardín.'),
(6, 'Moda y Belleza', 'fas fa-tshirt carro text-primary', 'Ropa y Calzado, Relojes, Accesorios, Salud, Belleza, Bebés, Niños.'),
(7, 'Hobbies-Arte-Deportes', 'fas fa-running carro text-primary', 'Deportes, Bicicletas, Juegos, Juguetes, Instrumentos, Libros.'),
(8, 'Animales y Mascotas', 'fas fa-dog carro text-primary', 'Perros, Gatos, Otros Animales, Accesorios para Mascotas.'),
(9, 'Clases-Tutorias', 'fas fa-chalkboard-teacher carro text-primary', 'Tutores, Clases Particulares, Otros Cursos, Cursos de Idiomas.'),
(10, 'Trabajo', 'fas fa-briefcase carro text-primary', 'Construcción, Obrero, Abogados, Multimedia, Informática, Otros Trabajos.'),
(11, 'Servicios', 'far fa-calendar-alt carro text-primary', 'Eventos, Turismo, Mantenimiento, Reparación, Transporte, Otros Servicios.'),
(12, 'Comunidad', 'fas fa-users carro text-primary', 'Voluntarios, Músicos, Artistas, Grupos, Perdido y Encontrado, Comunidad\n                            Varios.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cuentas`
--

CREATE TABLE `Cuentas` (
  `idCuenta` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `fec_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Cuentas`
--

INSERT INTO `Cuentas` (`idCuenta`, `idUsuario`, `foto`, `fec_creacion`) VALUES
(1, 1, 'null', '2019-10-15 19:28:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `idSubCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`idProducto`, `nombre`, `precio`, `idSubCategoria`) VALUES
(88, 'Vendo Iphone x', '100.00', 1),
(89, 'Vendo Compu ACER', '200.00', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos_Imagenes`
--

CREATE TABLE `Productos_Imagenes` (
  `idProducto_Imagen` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Imagen` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Productos_Imagenes`
--

INSERT INTO `Productos_Imagenes` (`idProducto_Imagen`, `idProducto`, `Imagen`) VALUES
(1, 89, 'https://firebasestorage.googleapis.com/v0/b/vendeya-a46cc.appspot.com/o/usuario/08/98/1.jpg?alt=media');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Publicaciones`
--

CREATE TABLE `Publicaciones` (
  `idPublicacion` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idCuenta` int(11) NOT NULL,
  `fec_Post` datetime DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `ubicacion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Publicaciones`
--

INSERT INTO `Publicaciones` (`idPublicacion`, `idProducto`, `idCuenta`, `fec_Post`, `estado`, `ubicacion`) VALUES
(58, 88, 1, '2019-10-18 13:00:07', 0, 'Sonzacate,Sonsonate'),
(59, 89, 1, '2019-10-18 13:02:29', 0, 'Sonzacate,Sonsonate');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subCategorias`
--

CREATE TABLE `subCategorias` (
  `idsubCategoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subCategorias`
--

INSERT INTO `subCategorias` (`idsubCategoria`, `nombre`, `idCategoria`) VALUES
(1, 'Autos', 1),
(2, 'Accesorios para Autos', 1),
(3, 'Motos', 1),
(4, 'Camiones-Vehículos Comerciales', 1),
(5, 'Otros Vehículos', 1),
(6, 'Apartamentos-Casas en Venta', 2),
(7, 'Apartamentos-Casas en Alquiler', 2),
(8, 'Terrenos', 2),
(9, 'Oficinas y Locales', 2),
(10, 'Alquiler Temporario-Vacaciones', 2),
(11, 'Nuevos Proyectos-VENTA', 2),
(12, 'Telefonos-Celulares', 3),
(13, 'Accesorios', 3),
(14, 'Tablets', 3),
(15, 'Computadoras-Laptops', 4),
(16, 'Consolas-Videojuegos', 4),
(17, 'TV-Audio-Video', 4),
(18, 'Cámaras y Accesorios', 4),
(19, 'Muebles', 5),
(20, 'Electrodomésticos', 5),
(21, 'Almacenes y Oficinas', 5),
(22, 'Decoración-Jardín-Accesorios', 5),
(23, 'Ropa y Calzado', 6),
(24, 'Relojes-Joyas-Accesorios', 6),
(25, 'Salud y Belleza', 6),
(26, 'Bebés y Niños', 6),
(27, 'Deportes-Bicicletas', 7),
(28, 'Juegos y Juguetes', 7),
(29, 'Instrumentos Musicales', 7),
(30, 'Antiguedades y Arte', 7),
(31, 'Libros-CDs-DVDs', 7),
(32, 'Manualidades', 7),
(33, 'Perros', 8),
(34, 'Gatos', 8),
(35, 'Otros Animales', 8),
(36, 'Accesorios para Mascotas', 8),
(37, 'Tutores-Clases Particulares', 9),
(38, 'Otros Cursos', 9),
(39, 'Clases de Idiomas', 9),
(40, 'Musica-Danza-Teatro', 9),
(41, 'Multimedia-Computacional', 9),
(42, 'Otros Trabajos', 10),
(43, 'Construcción-Obrero', 10),
(44, 'Abogados', 10),
(45, 'Vendedor-Asesor de Venta', 10),
(46, 'Hostelería-Meseros-Restauración', 10),
(47, 'Ingenieros-Arquitectos', 10),
(48, 'Atención al Cliente', 10),
(49, 'Medicina-Enfermería', 10),
(50, 'Marketing-Publicidad', 10),
(51, 'Contable-Financiero-Banquero', 10),
(52, 'Educación-Maestros-Profesores', 10),
(53, 'Turismo-Hostelería', 10),
(54, 'Recursos Humanos', 10),
(55, 'Multimedia-Informática', 10),
(56, 'Inmobiliarias', 10),
(57, 'Voluntario-Trabajo Social', 10),
(58, 'Programador-Diseñador-Administrador', 10),
(59, 'Promotores-Azafatas-Edecanes', 10),
(60, 'Otros Servicios', 11),
(61, 'Reparación-Mantenimiento', 11),
(62, 'Tutorías', 11),
(63, 'Planeación de Eventos', 11),
(64, 'Transporte-Viajes', 11),
(65, 'Salud y Belleza', 11),
(66, 'Informática-Mantenimiento', 11),
(67, 'Turismo-Paquetes Turísticos', 11),
(68, 'Traductor', 11),
(69, 'Casting-Modelaje', 11),
(70, 'Comunidad Varios', 12),
(71, 'Eventos', 12),
(72, 'Músicos-Artistas-Grupos', 12),
(73, 'Compartir Coche', 12),
(74, 'Voluntarios', 12),
(75, 'Perdido y Encontrado', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(100) NOT NULL,
  `numeroTelefono` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`idUsuario`, `nombreUsuario`, `numeroTelefono`, `email`, `password`) VALUES
(1, 'AlexChinke', '76142668', 'alexchinke97@gmail.com', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `Cuentas`
--
ALTER TABLE `Cuentas`
  ADD PRIMARY KEY (`idCuenta`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idSubCategoria` (`idSubCategoria`);

--
-- Indices de la tabla `Productos_Imagenes`
--
ALTER TABLE `Productos_Imagenes`
  ADD PRIMARY KEY (`idProducto_Imagen`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `Publicaciones`
--
ALTER TABLE `Publicaciones`
  ADD PRIMARY KEY (`idPublicacion`),
  ADD KEY `idCuenta` (`idCuenta`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `subCategorias`
--
ALTER TABLE `subCategorias`
  ADD PRIMARY KEY (`idsubCategoria`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `Cuentas`
--
ALTER TABLE `Cuentas`
  MODIFY `idCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT de la tabla `Productos_Imagenes`
--
ALTER TABLE `Productos_Imagenes`
  MODIFY `idProducto_Imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Publicaciones`
--
ALTER TABLE `Publicaciones`
  MODIFY `idPublicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT de la tabla `subCategorias`
--
ALTER TABLE `subCategorias`
  MODIFY `idsubCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Cuentas`
--
ALTER TABLE `Cuentas`
  ADD CONSTRAINT `Cuentas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuario`);

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`idSubCategoria`) REFERENCES `subCategorias` (`idsubCategoria`);

--
-- Filtros para la tabla `Productos_Imagenes`
--
ALTER TABLE `Productos_Imagenes`
  ADD CONSTRAINT `Productos_Imagenes_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `Productos` (`idProducto`);

--
-- Filtros para la tabla `Publicaciones`
--
ALTER TABLE `Publicaciones`
  ADD CONSTRAINT `Publicaciones_ibfk_1` FOREIGN KEY (`idCuenta`) REFERENCES `Cuentas` (`idCuenta`),
  ADD CONSTRAINT `Publicaciones_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `Productos` (`idProducto`);

--
-- Filtros para la tabla `subCategorias`
--
ALTER TABLE `subCategorias`
  ADD CONSTRAINT `subCategorias_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `Categorias` (`idCategoria`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
