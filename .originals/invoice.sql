-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Temps de generació: 28-04-2014 a les 17:48:37
-- Versió del servidor: 5.5.35
-- Versió de PHP : 5.5.10-1+deb.sury.org~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de dades: `invoice`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timezone_id` int(10) unsigned DEFAULT NULL,
  `date_format_id` int(10) unsigned DEFAULT NULL,
  `datetime_format_id` int(10) unsigned DEFAULT NULL,
  `currency_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `address1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `invoice_terms` text COLLATE utf8_unicode_ci NOT NULL,
  `email_footer` text COLLATE utf8_unicode_ci NOT NULL,
  `industry_id` int(10) unsigned DEFAULT NULL,
  `size_id` int(10) unsigned DEFAULT NULL,
  `invoice_taxes` tinyint(1) NOT NULL DEFAULT '1',
  `invoice_item_taxes` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_design_id` int(10) unsigned NOT NULL DEFAULT '1',
  `work_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `work_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pro_plan_paid` date NOT NULL,
  `custom_label1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_value1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_label2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_value2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_client_label1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_client_label2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_key_unique` (`account_key`),
  KEY `accounts_timezone_id_foreign` (`timezone_id`),
  KEY `accounts_date_format_id_foreign` (`date_format_id`),
  KEY `accounts_datetime_format_id_foreign` (`datetime_format_id`),
  KEY `accounts_country_id_foreign` (`country_id`),
  KEY `accounts_currency_id_foreign` (`currency_id`),
  KEY `accounts_industry_id_foreign` (`industry_id`),
  KEY `accounts_size_id_foreign` (`size_id`),
  KEY `accounts_invoice_design_id_foreign` (`invoice_design_id`),
  KEY `accounts_language_id_foreign` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `accounts`
--

INSERT INTO `accounts` (`id`, `timezone_id`, `date_format_id`, `datetime_format_id`, `currency_id`, `created_at`, `updated_at`, `deleted_at`, `name`, `ip`, `account_key`, `last_login`, `address1`, `address2`, `city`, `state`, `postal_code`, `country_id`, `invoice_terms`, `email_footer`, `industry_id`, `size_id`, `invoice_taxes`, `invoice_item_taxes`, `invoice_design_id`, `work_phone`, `work_email`, `language_id`, `pro_plan_paid`, `custom_label1`, `custom_value1`, `custom_label2`, `custom_value2`, `custom_client_label1`, `custom_client_label2`) VALUES
(1, 42, 1, 1, 1, '2014-04-09 13:37:58', '2014-04-28 13:15:36', NULL, 'Cedase', '192.168.1.80', 'xOQzlDNAIj0dVzPrP3AgDDQ2hEsjeNs6', '2014-04-28 13:15:36', 'Av. Ronda de Mar 53', '', 'Vilafranca del Penedès', 'Barcelona', '08720', 724, '', '', NULL, NULL, 1, 0, 1, 'D12345678', 'cedase@cedase.com', 7, '0000-00-00', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de la taula `account_gateways`
--

CREATE TABLE IF NOT EXISTS `account_gateways` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `gateway_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `public_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_gateways_account_id_public_id_unique` (`account_id`,`public_id`),
  KEY `account_gateways_gateway_id_foreign` (`gateway_id`),
  KEY `account_gateways_user_id_foreign` (`user_id`),
  KEY `account_gateways_public_id_index` (`public_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `credit_id` int(10) unsigned NOT NULL,
  `invitation_id` int(10) unsigned NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `json_backup` text COLLATE utf8_unicode_ci NOT NULL,
  `activity_type_id` int(11) NOT NULL,
  `adjustment` decimal(13,4) NOT NULL,
  `balance` decimal(13,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_account_id_foreign` (`account_id`),
  KEY `activities_client_id_foreign` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Bolcant dades de la taula `activities`
--

INSERT INTO `activities` (`id`, `created_at`, `updated_at`, `account_id`, `client_id`, `user_id`, `contact_id`, `payment_id`, `invoice_id`, `credit_id`, `invitation_id`, `message`, `json_backup`, `activity_type_id`, `adjustment`, `balance`) VALUES
(1, '2014-04-09 13:46:35', '2014-04-09 13:46:35', 1, 1, 1, 0, 0, 0, 0, 0, 'Francesc Beumala created [client:1:Test]', '', 1, 0.0000, 0.0000),
(2, '2014-04-09 13:46:35', '2014-04-09 13:46:35', 1, 1, 1, 0, 0, 1, 0, 0, 'Francesc Beumala created [invoice:1:0001]', '', 4, 4530.0000, 4530.0000),
(3, '2014-04-09 13:46:59', '2014-04-09 13:46:59', 1, 1, 1, 0, 1, 1, 0, 0, 'Francesc Beumala entered payment', '', 10, -4530.0000, 0.0000),
(4, '2014-04-09 14:23:13', '2014-04-09 14:23:13', 1, 1, 1, 0, 0, 1, 0, 0, 'Francesc Beumala updated [invoice:1:0001]', '{"invoice_number":"0001","discount":"0.00","po_number":"","invoice_date":"2014-04-09","due_date":null,"terms":"","public_notes":"","tax_name":"","tax_rate":"0.0000","amount":"4530.0000","balance":"0.0000","invoice_design_id":"1","invoice_items":[{"product_key":"1","notes":"blabla","cost":"10.0000","qty":"453.0000","tax_name":"","tax_rate":"0.0000"}],"client":{"currency_id":"1","name":"Test","address1":"","address2":"","city":"","state":"","postal_code":"","work_phone":"","payment_terms":"0","contacts":[{"first_name":"","last_name":"","email":"francesc+invoice@gestinet.com","phone":""}]},"account":{"currency_id":"3","name":"Gestinet","address1":"","address2":"","city":"","state":"","postal_code":"","work_phone":"","work_email":""}}', 5, -9060.0000, -9060.0000),
(5, '2014-04-23 09:25:13', '2014-04-23 09:25:13', 1, 1, 1, 0, 0, 1, 0, 0, 'Francesc Beumala updated [invoice:1:0001]', '{"invoice_number":"0001","discount":"0.00","po_number":"","invoice_date":"2014-04-09","due_date":null,"terms":"","public_notes":"","tax_name":"","tax_rate":"0.0000","amount":"-4530.0000","balance":"-9060.0000","invoice_design_id":"1","invoice_items":[{"product_key":"1","notes":"blabla","cost":"10.0000","qty":"-453.0000","tax_name":"","tax_rate":"0.0000"}],"client":{"currency_id":"1","name":"Test","address1":"","address2":"","city":"","state":"","postal_code":"","work_phone":"","payment_terms":"0","contacts":[{"first_name":"","last_name":"","email":"francesc+invoice@gestinet.com","phone":""}]},"account":{"currency_id":"3","name":"Cedase","address1":"Av. Ronda de Mar 53","address2":"","city":"Vilafranca del Pened\\u00e8s","state":"Barcelona","postal_code":"08720","work_phone":"","work_email":"cedase@cedase.com"}}', 5, -448470.0000, -457530.0000),
(6, '2014-04-24 05:51:35', '2014-04-24 05:51:35', 1, 1, 1, 0, 0, 1, 0, 0, 'Francesc Beumala updated [invoice:1:0001]', '{"invoice_number":"0001","discount":"0.00","po_number":"","invoice_date":"2014-04-09","due_date":null,"terms":"","public_notes":"","tax_name":"","tax_rate":"0.0000","amount":"-453000.0000","balance":"-457530.0000","invoice_design_id":"1","invoice_items":[{"product_key":"1","notes":"blabla","cost":"1000.0000","qty":"-453.0000","tax_name":"","tax_rate":"0.0000"}],"client":{"currency_id":"1","name":"Test","address1":"","address2":"","city":"","state":"","postal_code":"","work_phone":"","payment_terms":"0","custom_value1":"","custom_value2":"","contacts":[{"first_name":"","last_name":"","email":"francesc+invoice@gestinet.com","phone":""}]},"account":{"currency_id":"1","name":"Cedase","address1":"Av. Ronda de Mar 53","address2":"","city":"Vilafranca del Pened\\u00e8s","state":"Barcelona","postal_code":"08720","work_phone":"D12345678","work_email":"cedase@cedase.com","custom_label1":"","custom_value1":"","custom_label2":"","custom_value2":"","custom_client_label1":"","custom_client_label2":""}}', 5, 452451.8700, -5078.1300);

-- --------------------------------------------------------

--
-- Estructura de la taula `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `work_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `private_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `balance` decimal(13,4) NOT NULL,
  `paid_to_date` decimal(13,4) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `industry_id` int(10) unsigned DEFAULT NULL,
  `size_id` int(10) unsigned DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `payment_terms` int(11) NOT NULL,
  `public_id` int(10) unsigned NOT NULL,
  `custom_value1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_value2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_account_id_public_id_unique` (`account_id`,`public_id`),
  KEY `clients_user_id_foreign` (`user_id`),
  KEY `clients_country_id_foreign` (`country_id`),
  KEY `clients_industry_id_foreign` (`industry_id`),
  KEY `clients_size_id_foreign` (`size_id`),
  KEY `clients_currency_id_foreign` (`currency_id`),
  KEY `clients_account_id_index` (`account_id`),
  KEY `clients_public_id_index` (`public_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `clients`
--

INSERT INTO `clients` (`id`, `user_id`, `account_id`, `currency_id`, `created_at`, `updated_at`, `deleted_at`, `name`, `address1`, `address2`, `city`, `state`, `postal_code`, `country_id`, `work_phone`, `private_notes`, `balance`, `paid_to_date`, `last_login`, `website`, `industry_id`, `size_id`, `is_deleted`, `payment_terms`, `public_id`, `custom_value1`, `custom_value2`) VALUES
(1, 1, 1, 1, '2014-04-09 13:46:35', '2014-04-24 05:51:35', NULL, 'Test', '', '', '', '', '', NULL, '', '', -5078.1300, 4530.0000, NULL, '', NULL, NULL, 0, 0, 1, '', ''),
(2, 1, 1, 1, '2014-04-22 08:16:22', '2014-04-22 08:16:22', NULL, 'Client de Prova SL', 'C. Ronda del Pepe 21', '', 'Valls', 'Barcelona', '08659', 20, '654789123', '', 0.0000, 0.0000, '2014-04-22 08:16:22', 'http://loc.empresasmantenimientoinformatico.com/mantenimiento-informatico/pentasys/', NULL, NULL, 0, 0, 2, '', '');

-- --------------------------------------------------------

--
-- Estructura de la taula `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `send_invoice` tinyint(1) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `public_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contacts_account_id_public_id_unique` (`account_id`,`public_id`),
  KEY `contacts_user_id_foreign` (`user_id`),
  KEY `contacts_client_id_index` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `contacts`
--

INSERT INTO `contacts` (`id`, `account_id`, `user_id`, `client_id`, `created_at`, `updated_at`, `deleted_at`, `is_primary`, `send_invoice`, `first_name`, `last_name`, `email`, `phone`, `last_login`, `public_id`) VALUES
(1, 1, 1, 1, '2014-04-09 13:46:35', '2014-04-24 05:51:35', NULL, 1, 1, '', '', 'francesc+invoice@gestinet.com', '', '0000-00-00 00:00:00', 1),
(2, 1, 1, 2, '2014-04-22 08:21:11', '2014-04-22 08:21:11', NULL, 1, 1, '', '', 'prova-client1@example.com', '', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Estructura de la taula `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `capital` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `citizenship` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_sub_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_3166_2` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso_3166_3` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `region_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sub_region_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `eea` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=895 ;

--
-- Bolcant dades de la taula `countries`
--

INSERT INTO `countries` (`id`, `capital`, `citizenship`, `country_code`, `currency`, `currency_code`, `currency_sub_unit`, `full_name`, `iso_3166_2`, `iso_3166_3`, `name`, `region_code`, `sub_region_code`, `eea`) VALUES
(20, 'Andorra la Vella', 'Andorrà', '020', 'euro', 'EUR', 'cent', 'Principat d''Andorra', 'AD', 'AND', 'Andorra', '150', '039', 0),
(724, 'Madrid', 'Español', '724', 'euro', 'EUR', 'cent', 'Reino de España', 'ES', 'ESP', 'España', '150', '039', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `credits`
--

CREATE TABLE IF NOT EXISTS `credits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `amount` decimal(13,4) NOT NULL,
  `balance` decimal(13,4) NOT NULL,
  `credit_date` date DEFAULT NULL,
  `credit_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `private_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `public_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credits_account_id_public_id_unique` (`account_id`,`public_id`),
  KEY `credits_user_id_foreign` (`user_id`),
  KEY `credits_account_id_index` (`account_id`),
  KEY `credits_client_id_index` (`client_id`),
  KEY `credits_public_id_index` (`public_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `precision` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Bolcant dades de la taula `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `code`) VALUES
(1, 'Euro', '€', '2', '.', ',', 'EUR'),
(3, 'US Dollar', '$', '2', ',', '.', 'USD');

-- --------------------------------------------------------

--
-- Estructura de la taula `datetime_formats`
--

CREATE TABLE IF NOT EXISTS `datetime_formats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Bolcant dades de la taula `datetime_formats`
--

INSERT INTO `datetime_formats` (`id`, `format`, `label`) VALUES
(1, 'd/m/Y g:i a', '10/03/2013 10:43 am'),
(2, 'd-m-Y g:i a', '10-Mar-2013 10:43 am'),
(3, 'd/F/Y g:i a', '10/March/2013'),
(4, 'd-F-Y g:i a', '10-March-2013'),
(5, 'M j, Y g:i a', 'Mar 10, 2013 6:15 pm'),
(6, 'F j, Y g:i a', 'March 10, 2013 6:15 pm'),
(7, 'D M jS, Y g:ia', 'Mon March 10th, 2013 6:15 pm');

-- --------------------------------------------------------

--
-- Estructura de la taula `date_formats`
--

CREATE TABLE IF NOT EXISTS `date_formats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picker_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Bolcant dades de la taula `date_formats`
--

INSERT INTO `date_formats` (`id`, `format`, `picker_format`, `label`) VALUES
(1, 'd/m/Y', 'dd/m/yyyy', '10/03/2013'),
(2, 'd-m-Y', 'dd-m-yyyy', '10-03-2013');

-- --------------------------------------------------------

--
-- Estructura de la taula `frequencies`
--

CREATE TABLE IF NOT EXISTS `frequencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Bolcant dades de la taula `frequencies`
--

INSERT INTO `frequencies` (`id`, `name`) VALUES
(1, 'Semanal'),
(2, 'Dos demanas'),
(4, 'Mensual'),
(5, 'Tres meses'),
(6, 'Seis meses'),
(7, 'Anual');

-- --------------------------------------------------------

--
-- Estructura de la taula `gateways`
--

CREATE TABLE IF NOT EXISTS `gateways` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `payment_library_id` int(10) unsigned NOT NULL DEFAULT '1',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '10000',
  `recommended` tinyint(1) NOT NULL,
  `site_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gateways_payment_library_id_foreign` (`payment_library_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Bolcant dades de la taula `gateways`
--

INSERT INTO `gateways` (`id`, `created_at`, `updated_at`, `name`, `provider`, `visible`, `payment_library_id`, `sort_order`, `recommended`, `site_url`) VALUES
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Authorize.Net AIM', 'AuthorizeNet_AIM', 1, 1, 10000, 0, ''),
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Authorize.Net SIM', 'AuthorizeNet_SIM', 1, 1, 10000, 0, ''),
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CardSave', 'CardSave', 1, 1, 10000, 0, ''),
(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Eway Rapid', 'Eway_Rapid', 1, 1, 10000, 0, ''),
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FirstData Connect', 'FirstData_Connect', 1, 1, 10000, 0, ''),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GoCardless', 'GoCardless', 1, 1, 10000, 0, ''),
(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Migs ThreeParty', 'Migs_ThreeParty', 1, 1, 10000, 0, ''),
(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Migs TwoParty', 'Migs_TwoParty', 1, 1, 10000, 0, ''),
(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mollie', 'Mollie', 1, 1, 10000, 0, ''),
(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MultiSafepay', 'MultiSafepay', 1, 1, 10000, 0, ''),
(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Netaxept', 'Netaxept', 1, 1, 10000, 0, ''),
(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NetBanx', 'NetBanx', 1, 1, 10000, 0, ''),
(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PayFast', 'PayFast', 1, 1, 10000, 0, ''),
(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Payflow Pro', 'Payflow_Pro', 1, 1, 10000, 0, ''),
(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PaymentExpress PxPay', 'PaymentExpress_PxPay', 1, 1, 10000, 0, ''),
(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PaymentExpress PxPost', 'PaymentExpress_PxPost', 1, 1, 10000, 0, ''),
(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PayPal Express', 'PayPal_Express', 1, 1, 10000, 0, ''),
(18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PayPal Pro', 'PayPal_Pro', 1, 1, 10000, 0, ''),
(19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pin', 'Pin', 1, 1, 10000, 0, ''),
(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SagePay Direct', 'SagePay_Direct', 1, 1, 10000, 0, ''),
(21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SagePay Server', 'SagePay_Server', 1, 1, 10000, 0, ''),
(22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SecurePay DirectPost', 'SecurePay_DirectPost', 1, 1, 10000, 0, ''),
(23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stripe', 'Stripe', 1, 1, 10000, 0, ''),
(24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TargetPay Direct eBanking', 'TargetPay_Directebanking', 1, 1, 10000, 0, ''),
(25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TargetPay Ideal', 'TargetPay_Ideal', 1, 1, 10000, 0, ''),
(26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TargetPay Mr Cash', 'TargetPay_Mrcash', 1, 1, 10000, 0, ''),
(27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TwoCheckout', 'TwoCheckout', 1, 1, 10000, 0, ''),
(28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'WorldPay', 'WorldPay', 1, 1, 10000, 0, '');

-- --------------------------------------------------------

--
-- Estructura de la taula `industries`
--

CREATE TABLE IF NOT EXISTS `industries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Bolcant dades de la taula `industries`
--

INSERT INTO `industries` (`id`, `name`) VALUES
(1, 'Accounting & Legal'),
(2, 'Advertising'),
(3, 'Aerospace'),
(4, 'Agriculture'),
(5, 'Automotive'),
(6, 'Banking & Finance'),
(7, 'Biotechnology'),
(8, 'Broadcasting'),
(9, 'Business Services'),
(10, 'Commodities & Chemicals'),
(11, 'Communications'),
(12, 'Computers & Hightech'),
(13, 'Defense'),
(14, 'Energy'),
(15, 'Entertainment'),
(16, 'Government'),
(17, 'Healthcare & Life Sciences'),
(18, 'Insurance'),
(19, 'Manufacturing'),
(20, 'Marketing'),
(21, 'Media'),
(22, 'Nonprofit & Higher Ed'),
(23, 'Pharmaceuticals'),
(24, 'Professional Services & Consulting'),
(25, 'Real Estate'),
(26, 'Retail & Wholesale'),
(27, 'Sports'),
(28, 'Transportation'),
(29, 'Travel & Luxury'),
(30, 'Other');

-- --------------------------------------------------------

--
-- Estructura de la taula `invitations`
--

CREATE TABLE IF NOT EXISTS `invitations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `invitation_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `transaction_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sent_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `public_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invitations_account_id_public_id_unique` (`account_id`,`public_id`),
  UNIQUE KEY `invitations_invitation_key_unique` (`invitation_key`),
  KEY `invitations_user_id_foreign` (`user_id`),
  KEY `invitations_contact_id_foreign` (`contact_id`),
  KEY `invitations_invoice_id_index` (`invoice_id`),
  KEY `invitations_public_id_index` (`public_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `invitations`
--

INSERT INTO `invitations` (`id`, `account_id`, `user_id`, `contact_id`, `invoice_id`, `invitation_key`, `created_at`, `updated_at`, `deleted_at`, `transaction_reference`, `sent_date`, `viewed_date`, `public_id`) VALUES
(1, 1, 1, 1, 1, 'M1f63vQjYJCXTK8hXWKOkgtCbBLDmx8c', '2014-04-09 13:46:35', '2014-04-09 13:46:35', NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `invoice_status_id` int(10) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` float(8,2) NOT NULL,
  `po_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `terms` text COLLATE utf8_unicode_ci NOT NULL,
  `public_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `is_recurring` tinyint(1) NOT NULL,
  `frequency_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `last_sent_date` timestamp NULL DEFAULT NULL,
  `recurring_invoice_id` int(10) unsigned DEFAULT NULL,
  `tax_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_rate` decimal(13,4) NOT NULL,
  `amount` decimal(13,4) NOT NULL,
  `balance` decimal(13,4) NOT NULL,
  `public_id` int(10) unsigned NOT NULL,
  `invoice_design_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_account_id_public_id_unique` (`account_id`,`public_id`),
  UNIQUE KEY `invoices_account_id_invoice_number_unique` (`account_id`,`invoice_number`),
  KEY `invoices_user_id_foreign` (`user_id`),
  KEY `invoices_invoice_status_id_foreign` (`invoice_status_id`),
  KEY `invoices_client_id_index` (`client_id`),
  KEY `invoices_account_id_index` (`account_id`),
  KEY `invoices_recurring_invoice_id_index` (`recurring_invoice_id`),
  KEY `invoices_public_id_index` (`public_id`),
  KEY `invoices_invoice_design_id_foreign` (`invoice_design_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `invoices`
--

INSERT INTO `invoices` (`id`, `client_id`, `user_id`, `account_id`, `invoice_status_id`, `created_at`, `updated_at`, `deleted_at`, `invoice_number`, `discount`, `po_number`, `invoice_date`, `due_date`, `terms`, `public_notes`, `is_deleted`, `is_recurring`, `frequency_id`, `start_date`, `end_date`, `last_sent_date`, `recurring_invoice_id`, `tax_name`, `tax_rate`, `amount`, `balance`, `public_id`, `invoice_design_id`) VALUES
(1, 1, 1, 1, 1, '2014-04-09 13:46:35', '2014-04-24 05:51:35', NULL, '0001', 0.00, '', '2014-04-09', NULL, 'blal bla bla', 'iepo', 0, 0, 1, '2014-04-09', NULL, NULL, NULL, 'Regular', 21.0000, -548.1300, -5078.1300, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `invoice_designs`
--

CREATE TABLE IF NOT EXISTS `invoice_designs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Bolcant dades de la taula `invoice_designs`
--

INSERT INTO `invoice_designs` (`id`, `name`) VALUES
(1, 'Limpia'),
(2, 'Negrita'),
(3, 'Moderna'),
(4, 'Plana');

-- --------------------------------------------------------

--
-- Estructura de la taula `invoice_items`
--

CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `product_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `cost` decimal(13,4) NOT NULL,
  `qty` decimal(13,4) NOT NULL,
  `tax_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_rate` decimal(13,4) NOT NULL,
  `public_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_items_account_id_public_id_unique` (`account_id`,`public_id`),
  KEY `invoice_items_product_id_foreign` (`product_id`),
  KEY `invoice_items_user_id_foreign` (`user_id`),
  KEY `invoice_items_invoice_id_index` (`invoice_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Bolcant dades de la taula `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `account_id`, `user_id`, `invoice_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`, `product_key`, `notes`, `cost`, `qty`, `tax_name`, `tax_rate`, `public_id`) VALUES
(5, 1, 1, 1, 1, '2014-04-24 05:51:35', '2014-04-24 05:51:35', NULL, '1', 'blabla', 1.0000, -453.0000, '', 0.0000, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `invoice_statuses`
--

CREATE TABLE IF NOT EXISTS `invoice_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Bolcant dades de la taula `invoice_statuses`
--

INSERT INTO `invoice_statuses` (`id`, `name`) VALUES
(1, 'Borrador'),
(2, 'Enviada'),
(3, 'Vista'),
(4, 'Parcial'),
(5, 'Pagada');

-- --------------------------------------------------------

--
-- Estructura de la taula `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Bolcant dades de la taula `languages`
--

INSERT INTO `languages` (`id`, `name`, `locale`) VALUES
(1, 'English', 'en'),
(7, 'Spanish', 'es');

-- --------------------------------------------------------

--
-- Estructura de la taula `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Bolcant dades de la taula `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2013_11_05_180133_confide_setup_users_table', 1),
('2013_11_28_195703_setup_countries_table', 1),
('2014_02_13_151500_add_cascase_drops', 1),
('2014_02_19_151817_add_support_for_invoice_designs', 1),
('2014_03_03_155556_add_phone_to_account', 1),
('2014_03_19_201454_add_language_support', 1),
('2014_03_23_051736_enable_forcing_jspdf', 1),
('2014_04_03_191105_add_pro_plan', 1),
('2014_03_20_200300_create_payment_libraries', 2),
('2014_03_25_102200_add_sort_and_recommended_to_gateways', 2),
('2014_04_17_100523_add_remember_token', 2),
('2014_04_17_145108_add_custom_fields', 2);

-- --------------------------------------------------------

--
-- Estructura de la taula `password_reminders`
--

CREATE TABLE IF NOT EXISTS `password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `invitation_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `account_gateway_id` int(10) unsigned DEFAULT NULL,
  `payment_type_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `amount` decimal(13,4) NOT NULL,
  `payment_date` date NOT NULL,
  `transaction_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payer_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `public_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_account_id_public_id_unique` (`account_id`,`public_id`),
  KEY `payments_invoice_id_foreign` (`invoice_id`),
  KEY `payments_contact_id_foreign` (`contact_id`),
  KEY `payments_account_gateway_id_foreign` (`account_gateway_id`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_payment_type_id_foreign` (`payment_type_id`),
  KEY `payments_account_id_index` (`account_id`),
  KEY `payments_client_id_index` (`client_id`),
  KEY `payments_public_id_index` (`public_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `payments`
--

INSERT INTO `payments` (`id`, `invoice_id`, `account_id`, `client_id`, `contact_id`, `invitation_id`, `user_id`, `account_gateway_id`, `payment_type_id`, `created_at`, `updated_at`, `deleted_at`, `is_deleted`, `amount`, `payment_date`, `transaction_reference`, `payer_id`, `public_id`) VALUES
(1, 1, 1, 1, NULL, NULL, 1, NULL, 14, '2014-04-09 13:46:59', '2014-04-09 13:46:59', NULL, 0, 4530.0000, '2014-04-09', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `payment_libraries`
--

CREATE TABLE IF NOT EXISTS `payment_libraries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `payment_libraries`
--

INSERT INTO `payment_libraries` (`id`, `created_at`, `updated_at`, `name`, `visible`) VALUES
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Omnipay', 1),
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PHP-Payments', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `payment_terms`
--

CREATE TABLE IF NOT EXISTS `payment_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num_days` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Bolcant dades de la taula `payment_terms`
--

INSERT INTO `payment_terms` (`id`, `num_days`, `name`) VALUES
(1, 7, '7 días'),
(2, 10, '10 días'),
(3, 14, '14 días'),
(4, 15, '15 días'),
(5, 30, '30 días'),
(6, 60, '60 días');

-- --------------------------------------------------------

--
-- Estructura de la taula `payment_types`
--

CREATE TABLE IF NOT EXISTS `payment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Bolcant dades de la taula `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`) VALUES
(1, 'Crédito de la empresa'),
(2, 'Transferencia Bancaria'),
(3, 'Efectivo'),
(4, 'Débito'),
(6, 'Visa'),
(7, 'MasterCard'),
(13, 'Otra tarjeta de crédito'),
(14, 'PayPal'),
(15, 'Google Wallet');

-- --------------------------------------------------------

--
-- Estructura de la taula `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `product_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `cost` decimal(13,4) NOT NULL,
  `qty` decimal(13,4) NOT NULL,
  `public_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_account_id_public_id_unique` (`account_id`,`public_id`),
  KEY `products_user_id_foreign` (`user_id`),
  KEY `products_account_id_index` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `products`
--

INSERT INTO `products` (`id`, `account_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `product_key`, `notes`, `cost`, `qty`, `public_id`) VALUES
(1, 1, 1, '2014-04-09 13:46:35', '2014-04-09 13:46:35', NULL, '1', '', 0.0000, 0.0000, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `sizes`
--

CREATE TABLE IF NOT EXISTS `sizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Bolcant dades de la taula `sizes`
--

INSERT INTO `sizes` (`id`, `name`) VALUES
(1, '1 - 3'),
(2, '4 - 10'),
(3, '11 - 50'),
(4, '51 - 100'),
(5, '101 - 500'),
(6, '500+');

-- --------------------------------------------------------

--
-- Estructura de la taula `tax_rates`
--

CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` decimal(13,4) NOT NULL,
  `public_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_account_id_public_id_unique` (`account_id`,`public_id`),
  KEY `tax_rates_user_id_foreign` (`user_id`),
  KEY `tax_rates_account_id_index` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `account_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `name`, `rate`, `public_id`) VALUES
(1, 1, 1, '2014-04-24 05:51:35', '2014-04-24 05:51:35', NULL, 'Regular', 21.0000, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Bolcant dades de la taula `themes`
--

INSERT INTO `themes` (`id`, `name`) VALUES
(1, 'amelia'),
(2, 'cerulean'),
(3, 'cosmo'),
(4, 'cyborg'),
(5, 'flatly'),
(6, 'journal'),
(7, 'readable'),
(8, 'simplex'),
(9, 'slate'),
(10, 'spacelab'),
(11, 'united'),
(12, 'yeti');

-- --------------------------------------------------------

--
-- Estructura de la taula `timezones`
--

CREATE TABLE IF NOT EXISTS `timezones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=113 ;

--
-- Bolcant dades de la taula `timezones`
--

INSERT INTO `timezones` (`id`, `name`, `location`) VALUES
(1, 'Pacific/Midway', '(GMT-11:00) Midway Island'),
(2, 'US/Samoa', '(GMT-11:00) Samoa'),
(3, 'US/Hawaii', '(GMT-10:00) Hawaii'),
(4, 'US/Alaska', '(GMT-09:00) Alaska'),
(5, 'US/Pacific', '(GMT-08:00) Pacific Time (US &amp; Canada)'),
(6, 'America/Tijuana', '(GMT-08:00) Tijuana'),
(7, 'US/Arizona', '(GMT-07:00) Arizona'),
(8, 'US/Mountain', '(GMT-07:00) Mountain Time (US &amp; Canada)'),
(9, 'America/Chihuahua', '(GMT-07:00) Chihuahua'),
(10, 'America/Mazatlan', '(GMT-07:00) Mazatlan'),
(11, 'America/Mexico_City', '(GMT-06:00) Mexico City'),
(12, 'America/Monterrey', '(GMT-06:00) Monterrey'),
(13, 'Canada/Saskatchewan', '(GMT-06:00) Saskatchewan'),
(14, 'US/Central', '(GMT-06:00) Central Time (US &amp; Canada)'),
(15, 'US/Eastern', '(GMT-05:00) Eastern Time (US &amp; Canada)'),
(16, 'US/East-Indiana', '(GMT-05:00) Indiana (East)'),
(17, 'America/Bogota', '(GMT-05:00) Bogota'),
(18, 'America/Lima', '(GMT-05:00) Lima'),
(19, 'America/Caracas', '(GMT-04:30) Caracas'),
(20, 'Canada/Atlantic', '(GMT-04:00) Atlantic Time (Canada)'),
(21, 'America/La_Paz', '(GMT-04:00) La Paz'),
(22, 'America/Santiago', '(GMT-04:00) Santiago'),
(23, 'Canada/Newfoundland', '(GMT-03:30) Newfoundland'),
(24, 'America/Buenos_Aires', '(GMT-03:00) Buenos Aires'),
(25, 'Greenland', '(GMT-03:00) Greenland'),
(26, 'Atlantic/Stanley', '(GMT-02:00) Stanley'),
(27, 'Atlantic/Azores', '(GMT-01:00) Azores'),
(28, 'Atlantic/Cape_Verde', '(GMT-01:00) Cape Verde Is.'),
(29, 'Africa/Casablanca', '(GMT) Casablanca'),
(30, 'Europe/Dublin', '(GMT) Dublin'),
(31, 'Europe/Lisbon', '(GMT) Lisbon'),
(32, 'Europe/London', '(GMT) London'),
(33, 'Africa/Monrovia', '(GMT) Monrovia'),
(34, 'Europe/Amsterdam', '(GMT+01:00) Amsterdam'),
(35, 'Europe/Belgrade', '(GMT+01:00) Belgrade'),
(36, 'Europe/Berlin', '(GMT+01:00) Berlin'),
(37, 'Europe/Bratislava', '(GMT+01:00) Bratislava'),
(38, 'Europe/Brussels', '(GMT+01:00) Brussels'),
(39, 'Europe/Budapest', '(GMT+01:00) Budapest'),
(40, 'Europe/Copenhagen', '(GMT+01:00) Copenhagen'),
(41, 'Europe/Ljubljana', '(GMT+01:00) Ljubljana'),
(42, 'Europe/Madrid', '(GMT+01:00) Madrid'),
(43, 'Europe/Paris', '(GMT+01:00) Paris'),
(44, 'Europe/Prague', '(GMT+01:00) Prague'),
(45, 'Europe/Rome', '(GMT+01:00) Rome'),
(46, 'Europe/Sarajevo', '(GMT+01:00) Sarajevo'),
(47, 'Europe/Skopje', '(GMT+01:00) Skopje'),
(48, 'Europe/Stockholm', '(GMT+01:00) Stockholm'),
(49, 'Europe/Vienna', '(GMT+01:00) Vienna'),
(50, 'Europe/Warsaw', '(GMT+01:00) Warsaw'),
(51, 'Europe/Zagreb', '(GMT+01:00) Zagreb'),
(52, 'Europe/Athens', '(GMT+02:00) Athens'),
(53, 'Europe/Bucharest', '(GMT+02:00) Bucharest'),
(54, 'Africa/Cairo', '(GMT+02:00) Cairo'),
(55, 'Africa/Harare', '(GMT+02:00) Harare'),
(56, 'Europe/Helsinki', '(GMT+02:00) Helsinki'),
(57, 'Europe/Istanbul', '(GMT+02:00) Istanbul'),
(58, 'Asia/Jerusalem', '(GMT+02:00) Jerusalem'),
(59, 'Europe/Kiev', '(GMT+02:00) Kyiv'),
(60, 'Europe/Minsk', '(GMT+02:00) Minsk'),
(61, 'Europe/Riga', '(GMT+02:00) Riga'),
(62, 'Europe/Sofia', '(GMT+02:00) Sofia'),
(63, 'Europe/Tallinn', '(GMT+02:00) Tallinn'),
(64, 'Europe/Vilnius', '(GMT+02:00) Vilnius'),
(65, 'Asia/Baghdad', '(GMT+03:00) Baghdad'),
(66, 'Asia/Kuwait', '(GMT+03:00) Kuwait'),
(67, 'Africa/Nairobi', '(GMT+03:00) Nairobi'),
(68, 'Asia/Riyadh', '(GMT+03:00) Riyadh'),
(69, 'Asia/Tehran', '(GMT+03:30) Tehran'),
(70, 'Europe/Moscow', '(GMT+04:00) Moscow'),
(71, 'Asia/Baku', '(GMT+04:00) Baku'),
(72, 'Europe/Volgograd', '(GMT+04:00) Volgograd'),
(73, 'Asia/Muscat', '(GMT+04:00) Muscat'),
(74, 'Asia/Tbilisi', '(GMT+04:00) Tbilisi'),
(75, 'Asia/Yerevan', '(GMT+04:00) Yerevan'),
(76, 'Asia/Kabul', '(GMT+04:30) Kabul'),
(77, 'Asia/Karachi', '(GMT+05:00) Karachi'),
(78, 'Asia/Tashkent', '(GMT+05:00) Tashkent'),
(79, 'Asia/Kolkata', '(GMT+05:30) Kolkata'),
(80, 'Asia/Kathmandu', '(GMT+05:45) Kathmandu'),
(81, 'Asia/Yekaterinburg', '(GMT+06:00) Ekaterinburg'),
(82, 'Asia/Almaty', '(GMT+06:00) Almaty'),
(83, 'Asia/Dhaka', '(GMT+06:00) Dhaka'),
(84, 'Asia/Novosibirsk', '(GMT+07:00) Novosibirsk'),
(85, 'Asia/Bangkok', '(GMT+07:00) Bangkok'),
(86, 'Asia/Jakarta', '(GMT+07:00) Jakarta'),
(87, 'Asia/Krasnoyarsk', '(GMT+08:00) Krasnoyarsk'),
(88, 'Asia/Chongqing', '(GMT+08:00) Chongqing'),
(89, 'Asia/Hong_Kong', '(GMT+08:00) Hong Kong'),
(90, 'Asia/Kuala_Lumpur', '(GMT+08:00) Kuala Lumpur'),
(91, 'Australia/Perth', '(GMT+08:00) Perth'),
(92, 'Asia/Singapore', '(GMT+08:00) Singapore'),
(93, 'Asia/Taipei', '(GMT+08:00) Taipei'),
(94, 'Asia/Ulaanbaatar', '(GMT+08:00) Ulaan Bataar'),
(95, 'Asia/Urumqi', '(GMT+08:00) Urumqi'),
(96, 'Asia/Irkutsk', '(GMT+09:00) Irkutsk'),
(97, 'Asia/Seoul', '(GMT+09:00) Seoul'),
(98, 'Asia/Tokyo', '(GMT+09:00) Tokyo'),
(99, 'Australia/Adelaide', '(GMT+09:30) Adelaide'),
(100, 'Australia/Darwin', '(GMT+09:30) Darwin'),
(101, 'Asia/Yakutsk', '(GMT+10:00) Yakutsk'),
(102, 'Australia/Brisbane', '(GMT+10:00) Brisbane'),
(103, 'Australia/Canberra', '(GMT+10:00) Canberra'),
(104, 'Pacific/Guam', '(GMT+10:00) Guam'),
(105, 'Australia/Hobart', '(GMT+10:00) Hobart'),
(106, 'Australia/Melbourne', '(GMT+10:00) Melbourne'),
(107, 'Pacific/Port_Moresby', '(GMT+10:00) Port Moresby'),
(108, 'Australia/Sydney', '(GMT+10:00) Sydney'),
(109, 'Asia/Vladivostok', '(GMT+11:00) Vladivostok'),
(110, 'Asia/Magadan', '(GMT+12:00) Magadan'),
(111, 'Pacific/Auckland', '(GMT+12:00) Auckland'),
(112, 'Pacific/Fiji', '(GMT+12:00) Fiji');

-- --------------------------------------------------------

--
-- Estructura de la taula `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `registered` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `theme_id` int(11) NOT NULL,
  `notify_sent` tinyint(1) NOT NULL DEFAULT '1',
  `notify_viewed` tinyint(1) NOT NULL DEFAULT '0',
  `notify_paid` tinyint(1) NOT NULL DEFAULT '1',
  `public_id` int(10) unsigned NOT NULL,
  `force_pdfjs` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_account_id_public_id_unique` (`account_id`,`public_id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_account_id_index` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `users`
--

INSERT INTO `users` (`id`, `account_id`, `created_at`, `updated_at`, `deleted_at`, `first_name`, `last_name`, `phone`, `username`, `email`, `password`, `confirmation_code`, `registered`, `confirmed`, `theme_id`, `notify_sent`, `notify_viewed`, `notify_paid`, `public_id`, `force_pdfjs`, `remember_token`) VALUES
(1, 1, '2014-04-09 13:37:58', '2014-04-28 13:15:15', NULL, 'Francesc', 'Beumala', '', 'francesc@gestinet.com', 'francesc@gestinet.com', '$2y$10$h1vWYoG.gWLtR4V/.0rDqueVqz7fF9hlKSVhMw/3M1CHJZH6T89W.', 'd529f9590e9869bcf9694fb8b44226a7', 1, 0, 0, 1, 0, 1, 0, 0, 'RdKSMimpqVTk9ysg4oCCPG349eHuict3Bas8H88ZRNdWDYJLJeB8FikmCUJB');

--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `accounts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `accounts_datetime_format_id_foreign` FOREIGN KEY (`datetime_format_id`) REFERENCES `datetime_formats` (`id`),
  ADD CONSTRAINT `accounts_date_format_id_foreign` FOREIGN KEY (`date_format_id`) REFERENCES `date_formats` (`id`),
  ADD CONSTRAINT `accounts_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`id`),
  ADD CONSTRAINT `accounts_invoice_design_id_foreign` FOREIGN KEY (`invoice_design_id`) REFERENCES `invoice_designs` (`id`),
  ADD CONSTRAINT `accounts_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `accounts_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  ADD CONSTRAINT `accounts_timezone_id_foreign` FOREIGN KEY (`timezone_id`) REFERENCES `timezones` (`id`);

--
-- Restriccions per la taula `account_gateways`
--
ALTER TABLE `account_gateways`
  ADD CONSTRAINT `account_gateways_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_gateways_gateway_id_foreign` FOREIGN KEY (`gateway_id`) REFERENCES `gateways` (`id`),
  ADD CONSTRAINT `account_gateways_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activities_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clients_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `clients_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `clients_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`id`),
  ADD CONSTRAINT `clients_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  ADD CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `credits`
--
ALTER TABLE `credits`
  ADD CONSTRAINT `credits_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `credits_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `credits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `gateways`
--
ALTER TABLE `gateways`
  ADD CONSTRAINT `gateways_payment_library_id_foreign` FOREIGN KEY (`payment_library_id`) REFERENCES `payment_libraries` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `invitations_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invitations_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_invoice_design_id_foreign` FOREIGN KEY (`invoice_design_id`) REFERENCES `invoice_designs` (`id`),
  ADD CONSTRAINT `invoices_invoice_status_id_foreign` FOREIGN KEY (`invoice_status_id`) REFERENCES `invoice_statuses` (`id`),
  ADD CONSTRAINT `invoices_recurring_invoice_id_foreign` FOREIGN KEY (`recurring_invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `invoice_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_account_gateway_id_foreign` FOREIGN KEY (`account_gateway_id`) REFERENCES `account_gateways` (`id`),
  ADD CONSTRAINT `payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `payments_payment_type_id_foreign` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`),
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restriccions per la taula `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
