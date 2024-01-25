DROP DATABASE IF EXISTS enterprise_db;
CREATE DATABASE enterprise_db;
USE enterprise_db;

DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT, -- section number
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL, -- name section
  `location` varchar(100) COLLATE utf8_unicode_ci NOT NULL, -- location section
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT, -- employee number
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL, -- name employee
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL, -- name employee
  `rank` varchar(100) COLLATE utf8_unicode_ci NOT NULL, -- rank employee
  `created_at` timestamp NULL DEFAULT NULL, -- date created
  `payment` int(10) unsigned NOT NULL, -- payment employee
  `fee` int(10) unsigned NOT NULL, -- fee employee
  `sect_id` int(10) unsigned NOT NULL, -- section employee
  PRIMARY KEY (`id`),
  KEY `sect_id_foreign` (`sect_id`),
  CONSTRAINT `sect_id_foreign` FOREIGN KEY (`sect_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `section` (`name`, `location`) VALUES
('Software', 'Ciudad de México'),
('Sistemas', 'Guadalajara'),
('Contabilidad', 'Monterrey'),
('Ventas', 'Cancún');

select * from section;

INSERT INTO `employee` (`first_name`, `last_name`, `rank`, `created_at`, `payment`, `fee`, `sect_id`) VALUES
('Juan', 'Pérez', 'Gerente', '2018-05-12', 50000, 1000, 50),
('Ana', 'Gómez', 'Ingeniero', '2015-07-14', 40000, 800, 51),
('Carlos', 'López', 'Contador', '2014-06-05', 35000, 700, 52),
('María', 'Martínez', 'Vendedor', '2015-06-03', 30000, 600, 53),
('Pedro', 'García', 'Software', '2018-03-03', 45000, 900, 50),
('Laura', 'Rodríguez', 'Sistemas', '2014-06-05', 40000, 800, 51),
('Javier', 'Hernández', 'Ventas', '2014-08-02', 35000, 700, 53);

select * from employee;