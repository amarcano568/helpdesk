-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para roles
CREATE DATABASE IF NOT EXISTS `roles` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `roles`;

-- Volcando estructura para tabla roles.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla roles.permissions: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
REPLACE INTO `permissions` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Navegar usuarios', 'users.index', 'Lista y Navega todos los Usuarios del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(2, 'Ver detalle de usuarios', 'users.show', 'Ver detalle de cada Usuarios del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(3, 'Edición de usuarios', 'users.edit', 'Editar cualquier dato de un Usuarios del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(4, 'Eliminar usuarios', 'users.destroy', 'Eliminar cualquier Usuarios del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(5, 'Navegar roles', 'roles.index', 'Lista y Navega todos los Roles del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(6, 'Ver detalle de roles', 'roles.show', 'Ver detalle de cada Roles del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(7, 'Creación de rol', 'roles.create', 'Editar cualquier dato de un Roles del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(8, 'Edición de rol', 'roles.edit', 'Editar cualquier dato de un Roles del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(9, 'Eliminar rol', 'roles.destroy', 'Eliminar cualquier Productos del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(10, 'Navegar Productos', 'products.index', 'Lista y Navega todos los Productos del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(11, 'Ver detalle de Productos', 'products.show', 'Ver detalle de cada Productos del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(12, 'Creación de producto', 'products.create', 'Editar cualquier dato de un Productos del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(13, 'Edición de producto', 'products.edit', 'Editar cualquier dato de un Productos del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40'),
	(14, 'Eliminar producto', 'products.destroy', 'Eliminar cualquier Productos del Sistema', '2019-12-10 19:37:40', '2019-12-10 19:37:40');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Volcando estructura para tabla roles.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla roles.permission_role: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
REPLACE INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(7, 1, 6, '2019-12-11 16:19:36', '2019-12-11 16:19:36'),
	(8, 2, 6, '2019-12-11 16:19:36', '2019-12-11 16:19:36'),
	(9, 5, 6, '2019-12-11 16:19:36', '2019-12-11 16:19:36'),
	(10, 6, 6, '2019-12-11 16:19:36', '2019-12-11 16:19:36'),
	(11, 10, 6, '2019-12-11 16:19:36', '2019-12-11 16:19:36'),
	(12, 11, 6, '2019-12-11 16:19:36', '2019-12-11 16:19:36');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Volcando estructura para tabla roles.permission_user
CREATE TABLE IF NOT EXISTS `permission_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla roles.permission_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;

-- Volcando estructura para tabla roles.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `special` enum('all-access','no-access') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla roles.roles: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`, `special`) VALUES
	(1, 'Admin', 'admin', 'Administrador de Roles', '2019-12-10 19:37:40', '2019-12-10 19:37:40', 'all-access'),
	(6, 'Supervisor', 'supervisor.sistemas', 'Supervisor Sistemas', '2019-12-11 16:19:36', '2019-12-11 16:19:36', NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla roles.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla roles.role_user: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
REPLACE INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 21, NULL, NULL),
	(3, 6, 22, '2019-12-11 16:23:43', '2019-12-11 16:23:43');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
