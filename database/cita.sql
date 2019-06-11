-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2019 a las 20:49:09
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cita`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(10) UNSIGNED NOT NULL,
  `sede_id` int(10) UNSIGNED NOT NULL,
  `servicio_id` int(10) UNSIGNED NOT NULL,
  `profesional_id` int(10) UNSIGNED NOT NULL,
  `reservadate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reservatime` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `status` enum('Reservada','En Proceso','FInalizada','Cancelada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Reservada',
  `notas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `sede_id`, `servicio_id`, `profesional_id`, `reservadate`, `reservatime`, `cliente_id`, `status`, `notas`, `user_id`, `created_at`, `updated_at`) VALUES
(37, 1, 2, 2, '2019-01-19', '12:00', 2, 'FInalizada', 'Modificación Realizada a petición del Cliente', 1, '2019-01-19 21:40:43', '2019-01-19 22:13:03'),
(38, 1, 2, 2, '2019-01-19', '14:00', 1, 'Reservada', 'Se le realizo modificación a petición del cliente', 1, '2019-01-19 21:41:34', '2019-01-19 21:54:51'),
(39, 2, 8, 2, '2019-01-22', '10:30', 3, 'Reservada', 'No hay observaciones', 1, '2019-01-19 22:13:58', '2019-01-19 22:25:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `name`, `cedula`, `email`, `telefono`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Cliente 1', '123.456.78', 'lorenzoantonio_16_00@hotmail.com', '3208887654', 'dirección demostrativa', '2019-01-11 21:26:03', '2019-01-19 19:47:37'),
(2, 'Cliente 2', '123456789', 'mariahor798@gmail.com', '3023376678', 'Direcion de mostrativa 2', '2019-01-13 18:52:10', '2019-01-19 19:48:07'),
(3, 'Lorenzo Antonio Rojo Garces', '145349789', 'lorenzorojo12@gmail.com', '3023356659', 'Cl 20F #71-144 int 203', '2019-01-19 17:32:45', '2019-01-19 17:32:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_01_08_131502_create_sedes_table', 1),
(4, '2019_01_08_131503_create_profesionales_table', 1),
(6, '2019_01_08_132304_create_turnos_table', 1),
(7, '2019_01_08_144958_create_clientes_table', 1),
(8, '2019_01_08_151322_create_citas_table', 1),
(10, '2019_01_08_131538_create_servicios_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionales`
--

CREATE TABLE `profesionales` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('activo','suspendido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  `sede_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesionales`
--

INSERT INTO `profesionales` (`id`, `name`, `cedula`, `email`, `telefono`, `status`, `sede_id`, `created_at`, `updated_at`) VALUES
(1, 'Profesional 1', '1.234.567', 'profesional1@gmail.com', '300334567', 'activo', 1, '2019-01-11 21:22:12', '2019-01-11 21:22:12'),
(2, 'Profesional 2', '12334555', 'profesional2@gmail.com', '333333333', 'activo', 2, '2019-01-11 23:47:55', '2019-01-11 23:47:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesional_servicio`
--

CREATE TABLE `profesional_servicio` (
  `id` int(10) UNSIGNED NOT NULL,
  `profesional_id` int(10) UNSIGNED NOT NULL,
  `servicio_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesional_servicio`
--

INSERT INTO `profesional_servicio` (`id`, `profesional_id`, `servicio_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 2, 7, NULL, NULL),
(4, 2, 8, NULL, NULL),
(5, 1, 1, NULL, NULL),
(6, 1, 2, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('activo','suspendido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id`, `name`, `address`, `telefono`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bombona, Medellín', 'Medellín', '300355355', 'bombona@gmail.com', 'activo', '2019-01-11 21:01:31', '2019-01-11 21:01:31'),
(2, 'Laureles, Medellín', 'Medellín, Barrio Laureles', '300355355', 'laureles@gamil.com', 'activo', '2019-01-11 21:02:07', '2019-01-11 21:02:07'),
(3, 'Tequendama, Calí', 'Calí, Tequendama', '3013356656', 'cali@gmail.com', 'activo', '2019-01-11 21:02:46', '2019-01-11 21:02:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede_servicio`
--

CREATE TABLE `sede_servicio` (
  `id` int(10) UNSIGNED NOT NULL,
  `sede_id` int(10) UNSIGNED NOT NULL,
  `servicio_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sede_servicio`
--

INSERT INTO `sede_servicio` (`id`, `sede_id`, `servicio_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 3, 1, NULL, NULL),
(3, 1, 2, NULL, NULL),
(4, 2, 2, NULL, NULL),
(14, 1, 7, '2019-01-18 02:16:17', '2019-01-18 02:16:17'),
(15, 2, 7, '2019-01-18 02:16:17', '2019-01-18 02:16:17'),
(16, 3, 7, '2019-01-18 02:16:17', '2019-01-18 02:16:17'),
(18, 1, 8, '2019-01-19 00:25:49', '2019-01-19 00:25:49'),
(19, 2, 8, '2019-01-19 00:25:49', '2019-01-19 00:25:49'),
(20, 2, 1, '2019-01-19 00:27:24', '2019-01-19 00:27:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `costo` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `name`, `costo`, `created_at`, `updated_at`) VALUES
(1, 'Micro pigmentación', '100.00', '2019-01-11 23:44:30', '2019-01-19 00:27:24'),
(2, 'Pestañas', '1000.00', '2019-01-11 23:44:48', '2019-01-11 23:44:48'),
(7, 'Retoque de pestañas', '40000.00', '2019-01-18 02:16:16', '2019-01-18 02:16:16'),
(8, 'Retoque', '1000000.00', '2019-01-19 00:25:49', '2019-01-19 00:25:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('digitador','administrador') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'digitador',
  `status` enum('activo','suspendido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'admin@panel.com', NULL, '$2y$10$MJJUlU2zxpTeNhz2sBpv9uCp6Xtikfl3CYboKTLe3U15KTiq84dy2', 'administrador', 'activo', '0OYZeBDIoqTJru4q5vEFP6eVrdirLmb2jD8eY6EFih9UO6PWfugxgvPKfqS2', '2019-01-11 20:58:23', '2019-01-11 20:58:57'),
(3, 'Digitador', 'digitador@gmail.com', NULL, '$2y$10$weaONhah5lnv1WcvdXnjT.Eow5FjtuHPkxcAiiP4c6j/.zu/QY3d.', 'digitador', 'activo', 'yQY3xHcS7KRy8qHo5WzKLbw4vwP9W0X8S7ryPSmphNA54q7poFeQ5u55GNAq', '2019-01-16 00:20:44', '2019-01-16 00:20:44');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citas_user_id_foreign` (`user_id`),
  ADD KEY `citas_sede_id_foreign` (`sede_id`),
  ADD KEY `citas_servicio_id_foreign` (`servicio_id`),
  ADD KEY `citas_profesional_id_foreign` (`profesional_id`),
  ADD KEY `citas_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profesionales_sede_id_foreign` (`sede_id`);

--
-- Indices de la tabla `profesional_servicio`
--
ALTER TABLE `profesional_servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profesional_servicio_profesional_id_foreign` (`profesional_id`),
  ADD KEY `profesional_servicio_servicio_id_foreign` (`servicio_id`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sedes_email_unique` (`email`);

--
-- Indices de la tabla `sede_servicio`
--
ALTER TABLE `sede_servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sede_servicio_sede_id_foreign` (`sede_id`),
  ADD KEY `sede_servicio_servicio_id_foreign` (`servicio_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `profesional_servicio`
--
ALTER TABLE `profesional_servicio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sede_servicio`
--
ALTER TABLE `sede_servicio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_profesional_id_foreign` FOREIGN KEY (`profesional_id`) REFERENCES `profesionales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD CONSTRAINT `profesionales_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `profesional_servicio`
--
ALTER TABLE `profesional_servicio`
  ADD CONSTRAINT `profesional_servicio_profesional_id_foreign` FOREIGN KEY (`profesional_id`) REFERENCES `profesionales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `profesional_servicio_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sede_servicio`
--
ALTER TABLE `sede_servicio`
  ADD CONSTRAINT `sede_servicio_sede_id_foreign` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sede_servicio_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
