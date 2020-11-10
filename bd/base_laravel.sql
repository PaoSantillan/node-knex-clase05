-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-11-2020 a las 06:37:59
-- Versión del servidor: 8.0.22-0ubuntu0.20.04.2
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_laravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `titular` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_cuenta` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `moneda` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nro_cuenta` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cbu` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_id` bigint UNSIGNED NOT NULL,
  `bank_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_record`
--

CREATE TABLE `account_record` (
  `account_id` bigint UNSIGNED NOT NULL,
  `record_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorized`
--

CREATE TABLE `authorized` (
  `titular` tinyint(1) NOT NULL DEFAULT '0',
  `person_id` bigint UNSIGNED NOT NULL,
  `comitente_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banks`
--

CREATE TABLE `banks` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_banking` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `banks`
--

INSERT INTO `banks` (`id`, `nombre`, `imagen`, `web`, `online_banking`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Banco Galicia', 'galicia.jpg', 'http://www.bancogalicia.com', 'https://onlinebanking.bancogalicia.com.ar/login', NULL, NULL, NULL),
(2, 'Banco Macro', 'macro.jpg', 'http://www.macro.com.ar', 'https://macroonline.com.ar/personas', NULL, NULL, NULL),
(3, 'Banco BBVA Francés', 'bbva.jpg', 'https://www.bbvafrances.com.ar', 'https://www.bbvafrances.com.ar', NULL, NULL, NULL),
(4, 'Banco de Córdoba', 'bancor.jpg', 'https://www.bancor.com.ar', 'https://hb.redlink.com.ar/bancor/login.htm', NULL, NULL, NULL),
(5, 'Banco HSBC', 'hsbc.jpg', 'https://www.hsbc.com.ar/es/', 'https://hsbc.com.ar/es/personas/', NULL, NULL, NULL),
(6, 'Banco Patagonia', 'patagonia.jpg', 'https://www.bancopatagonia.com', 'https://ebankpersonas.bancopatagonia.com.ar/eBanking/usuarios/login.htm', NULL, NULL, NULL),
(7, 'Banco de la Nación Argentina', 'nacion.jpg', 'https://www.bna.com.ar', 'https://hb.redlink.com.ar/bna/login.htm', NULL, NULL, NULL),
(8, 'Banco de Provincia de Buenos Aires', 'nacion.jpg', 'https://www.bancoprovincia.com.ar', 'https://www.bancoprovincia.bancainternet.com.ar/eBanking/login/inicio.htm', NULL, NULL, NULL),
(9, 'Industrial and Commercial Bank of China', 'icbc.jpg', 'https://www.icbc.com.ar', 'https://www.accessbanking.com.ar/RetailHomeBankingWeb/init.do?a=b&cm_mmc=icbc-_-access-_-header-_-onlinebanking', NULL, NULL, NULL),
(10, 'Citibank', 'citibank.jpg', 'https://www.citibank.com/icg/sa/latam/argentina/', '', NULL, NULL, NULL),
(11, 'Banco Supervielle', 'supervielle.jpg', 'http://www.supervielle.com.ar/', 'https://personas.supervielle.com.ar/Login.aspx?TimeOut=1', NULL, NULL, NULL),
(12, 'Banco de la ciudad de Buenos Aires', 'bancociudad.jpg', 'https://www.bancociudad.com.ar/', 'https://hb.redlink.com.ar/ciudad/login.htm', NULL, NULL, NULL),
(13, 'Banco Hipotecario', 'hipotecario.jpg', 'https://www.hipotecario.com.ar/', 'https://hb.hipotecario.com.ar/homebanking/login.do', NULL, NULL, NULL),
(14, 'Banco de San Juan', 'sanjuan.jpg', 'https://www.bancosanjuan.com', 'https://hb.redlink.com.ar/bsj/login.htm', NULL, NULL, NULL),
(15, 'Banco del Tucumán', 'bancotucuman.jpg', 'https://www.bancotucuman.com.ar/', 'https://hbsrv.btonline.com.ar/html/Inicio.html', NULL, NULL, NULL),
(16, 'Banco Municipal de Rosario', 'municipalrosario.jpg', 'https://www.bmros.com.ar/', 'https://hb.redlink.com.ar/bmros/login.htm', NULL, NULL, NULL),
(17, 'Banco Santander Río', 'santander-rio.jpg', 'http://www.santanderrio.com.ar', 'https://www.personas.santanderrio.com.ar/hb/html/login/principal.jsp', NULL, NULL, NULL),
(18, 'Banco del chubut', 'chubut.jpg', 'https://www.bancochubut.com.ar/', 'https://hb.redlink.com.ar/bancochubut/login.htm', NULL, NULL, NULL),
(19, 'Banco de Santa Cruz', 'santacruz.jpg', 'https://www.bancosantacruz.com/', 'https://hb.redlink.com.ar/bancosantacruz/login.htm', NULL, NULL, NULL),
(20, 'Banco de la Pampa', 'pampa.jpg', 'https://www.bancodelapampa.com.ar/', 'https://hb.redlink.com.ar/bancodelapampa/login.htm', NULL, NULL, NULL),
(21, 'Banco de Corrientes', 'corrientes.jpg', 'https://www.bancodecorrientes.com.ar/', 'https://hb.redlink.com.ar/bancodecorrientes/login.htm', NULL, NULL, NULL),
(22, 'Banco de Neuquén', 'neuquen.jpg', 'https://www.bpn.com.ar/', 'https://hb.redlink.com.ar/bpn/login.htm', NULL, NULL, NULL),
(23, 'Banco Interfinanzas', 'interfinanzas.jpg', 'https://www.bancointerfinanzas.com.ar/', '', NULL, NULL, NULL),
(24, 'Banco Credicoop', 'credicoop.jpg', 'https://www.bancocredicoop.coop/', 'https://bancainternet.bancocredicoop.coop/bcclbi/', NULL, NULL, NULL),
(25, 'Banco de Valores', 'valores.jpg', 'http://bancodevalores.com/', '', NULL, NULL, NULL),
(26, 'Banco Roela', 'roela.jpg', 'https://www.bancoroela.com.ar/', 'https://hb.redlink.com.ar/bancoroela/login.htm', NULL, NULL, NULL),
(27, 'Banco Mariva', 'mariva.jpg', 'http://www.mariva.com.ar/', 'https://hb.redlink.com.ar/mariva/login.htm', NULL, NULL, NULL),
(28, 'Banco Itaú', 'itau.jpg', 'http://www.itau.com.ar/', 'https://internet.itau.com.ar/internet/sso', NULL, NULL, NULL),
(29, 'Banco BNP Paribas', 'paribas.jpg', 'http://www.bnpparibas.com.ar/', '', NULL, NULL, NULL),
(30, 'Banco de Tierra del Fuego', 'btf.jpg', 'https://www.bancotdf.com.ar', 'https://hb.redlink.com.ar/btf/login.htm', NULL, NULL, NULL),
(31, 'Banco de la República Oriental del Uruguay', 'banco-republica.jpg', 'https://www.portal.brou.com.uy/', 'https://www.canales.brou.com.uy/eBanking/seguridad/loginFlow?execution=e1s1', NULL, NULL, NULL),
(32, 'Banco Saenz', 'banco-saenz.jpg', 'https://www.bancosaenz.com.ar/', 'https://hb.redlink.com.ar/bancosaenz/login.htm', NULL, NULL, NULL),
(33, 'Banco Meridian', 'banco-meridian.jpg', 'https://www.bancomeridian.com/', 'https://hb.redlink.com.ar/bancomeridian/login.htm', NULL, NULL, NULL),
(34, 'Banco Comafi', 'comafi.jpg', 'https://www.comafi.com.ar/', 'https://hb.comafi.com.ar/homebank/HBI.do', NULL, NULL, NULL),
(35, 'Banco Piano', 'banco-piano.jpg', 'https://www.bancopiano.com.ar/', 'https://hb.redlink.com.ar/bancopiano/login.htm', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comitentes`
--

CREATE TABLE `comitentes` (
  `id` bigint UNSIGNED NOT NULL,
  `nro_comitente` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendiente',
  `contrasenia` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `evaluacion` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persons`
--

CREATE TABLE `persons` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_documento` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_documento` int DEFAULT NULL,
  `medio_informado` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_civil` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nacionalidad` int DEFAULT NULL,
  `segunda_nacionalidad` int DEFAULT NULL,
  `pais` int DEFAULT NULL,
  `provincia` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_calle` int DEFAULT NULL,
  `piso` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `sujeto_obligado` tinyint(1) NOT NULL DEFAULT '0',
  `persona_expuesta` tinyint(1) NOT NULL DEFAULT '0',
  `us_person` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_identificacion` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro_identificacion` bigint DEFAULT NULL,
  `pais_fiscal` int DEFAULT NULL,
  `condicion_iva` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion_ganancias` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `situacion_laboral` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profesional` tinyint(1) NOT NULL DEFAULT '0',
  `alcance_actividad` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rubro` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empresa` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antiguedad` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patrimonio` decimal(13,4) DEFAULT NULL,
  `ingresos_inversiones` decimal(5,2) DEFAULT NULL,
  `procedencia_inversion` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_validacion` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person_record`
--

CREATE TABLE `person_record` (
  `person_id` bigint UNSIGNED NOT NULL,
  `record_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'research.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `records`
--

CREATE TABLE `records` (
  `id` bigint UNSIGNED NOT NULL,
  `archivo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_record_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `records`
--

INSERT INTO `records` (`id`, `archivo`, `type_record_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'foto_carnet_paola.jpg', 1, '2020-11-09 09:29:10', '2020-11-09 09:29:10', NULL),
(2, 'archivo.png', 1, '2020-11-09 09:30:59', '2020-11-09 09:30:59', NULL),
(3, 'foto.png', 2, '2020-11-09 09:32:46', '2020-11-09 09:32:46', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relations`
--

CREATE TABLE `relations` (
  `id` bigint UNSIGNED NOT NULL,
  `person_id` bigint UNSIGNED NOT NULL,
  `person_id_relation` bigint UNSIGNED NOT NULL,
  `nro_comitente` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terms`
--

CREATE TABLE `terms` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `term_tag`
--

CREATE TABLE `term_tag` (
  `term_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_records`
--

CREATE TABLE `type_records` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `type_records`
--

INSERT INTO `type_records` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Foto carnet', 'Foto carnet de usuarios de INDEC', '2020-11-09 09:30:01', '2020-11-09 09:30:01', NULL),
(2, 'DNI Frente', 'Foto DNI Frente', '2020-11-09 09:31:38', '2020-11-09 09:31:38', NULL),
(3, 'DNI Dorso', 'Foto DNI Dorso', '2020-11-09 09:32:12', '2020-11-09 09:32:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `timezone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_be_logged_out` tinyint(1) NOT NULL DEFAULT '0',
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `password_changed_at`, `active`, `timezone`, `last_login_at`, `last_login_ip`, `to_be_logged_out`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'admin@admin.com', '2020-09-19 04:21:07', '$2y$10$iWyKzpnmFXs4kV3o6rX/F.z8.EQlP7l5wNZFcqz3mr84rJDm4pSZ2', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2020-09-19 04:21:07', '2020-09-19 04:21:07', NULL),
(2, 'Test User', 'user@user.com', '2020-09-19 04:21:07', '$2y$10$2AYXzJQgIX.ezzhQ3SrhlOUTdVomzc6DIN8PxJr4NLQiNX0/bCpu2', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2020-09-19 04:21:07', '2020-09-19 04:21:07', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_person_id_foreign` (`person_id`),
  ADD KEY `accounts_bank_id_foreign` (`bank_id`);

--
-- Indices de la tabla `account_record`
--
ALTER TABLE `account_record`
  ADD KEY `account_record_account_id_foreign` (`account_id`),
  ADD KEY `account_record_record_id_foreign` (`record_id`);

--
-- Indices de la tabla `authorized`
--
ALTER TABLE `authorized`
  ADD KEY `authorized_person_id_foreign` (`person_id`),
  ADD KEY `authorized_comitente_id_foreign` (`comitente_id`);

--
-- Indices de la tabla `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comitentes`
--
ALTER TABLE `comitentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comitentes_person_id_foreign` (`person_id`);

--
-- Indices de la tabla `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persons_email_unique` (`email`);

--
-- Indices de la tabla `person_record`
--
ALTER TABLE `person_record`
  ADD KEY `person_record_person_id_foreign` (`person_id`),
  ADD KEY `person_record_record_id_foreign` (`record_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `records_type_record_id_foreign` (`type_record_id`);

--
-- Indices de la tabla `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relations_person_id_foreign` (`person_id`),
  ADD KEY `relations_person_id_relation_foreign` (`person_id_relation`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `term_tag`
--
ALTER TABLE `term_tag`
  ADD KEY `term_tag_term_id_foreign` (`term_id`),
  ADD KEY `term_tag_tag_id_foreign` (`tag_id`);

--
-- Indices de la tabla `type_records`
--
ALTER TABLE `type_records`
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
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `comitentes`
--
ALTER TABLE `comitentes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persons`
--
ALTER TABLE `persons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `records`
--
ALTER TABLE `records`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `relations`
--
ALTER TABLE `relations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `terms`
--
ALTER TABLE `terms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `type_records`
--
ALTER TABLE `type_records`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
