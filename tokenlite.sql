-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2022 at 06:55 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokenlite`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `device` varchar(191) NOT NULL,
  `browser` varchar(191) NOT NULL,
  `ip` varchar(191) NOT NULL,
  `extra` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `greeting` varchar(191) DEFAULT NULL,
  `message` text NOT NULL,
  `regards` varchar(191) DEFAULT NULL,
  `notify` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `slug`, `subject`, `greeting`, `message`, `regards`, `notify`, `created_at`, `updated_at`) VALUES
(1, 'Token Purchase - Order Placed by Online Gateway (USER)', 'order-submit-online-user', 'Order placed for Token Purchase #[[order_id]]', 'Thank you for your contribution!', 'You have requested to purchase [[token_symbol]] token. Your order has been received and is now being waiting for payment. You order details are show below for your reference.\n\n[[order_details]]\n\nYour token balance will appear in your account as soon as we have confirmed your payment from [[payment_gateway]].\n\nFeel free to contact us if you have any questions.\n', 'true', 1, '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(2, 'Token Purchase - Order Unpaid/Rejected by Gateway (USER)', 'order-canceled-user', 'Unpaid Order Canceled #[[order_id]]', 'Hello [[user_name]],', 'We noticed that you just tried to purchase [[token_symbol]] token, however we have not received your payment of [[payment_amount]] via [[payment_gateway]] for [[total_tokens]] Token.\n\nIt looks like your payment gateway ([[payment_gateway]]) has been rejected the transaction. \n\n[[order_details]]\n\nIf you want to pay manually, please feel free to contact us via [[support_email]]\n ', 'true', 1, '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(3, 'Token Purchase - Payment Approved by Gateway (ADMIN)', 'order-successful-admin', 'Payment Received - Order #[[order_id]]', 'Hello Admin,', 'You just received a payment of [[payment_amount]] for order (#[[order_id]]) via [[payment_gateway]]. \n\nThis order has now been approved automatically and token balance added to contributor ([[user_email]]) account. \n\n\nPS. Do not reply to this email.  \nThank you.\n ', 'false', 1, '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(4, 'Token Purchase - Payment Rejected/Canceled by Gateway (ADMIN)', 'order-rejected-admin', 'Payment Rejected - Order #[[order_id]]', 'Hello Admin,', 'The order (#[[order_id]]) has been canceled, however the payment was not successful and [[payment_gateway]] rejected or canceled the transaction. \n\n\n[[order_details]] \n\n\nPS. Do not reply to this email.  \nThank you.\n ', 'false', 1, '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(5, 'Welcome Email', 'welcome-email', 'Welcome to [[site_name]]', 'Hi [[user_name]],', 'Thanks for joining our platform! \n\nAs a member of our platform, you can mange your account, purchase token, referrals etc. \n\nFind out more about in - [[site_url]]', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(6, 'Send Email to User', 'send-user-email', 'New Message - [[site_name]]', 'Hi [[user_name]], ', '[[messages]]', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(7, 'Password Change Email', 'users-change-password-email', 'Password change request on [[site_name]]', 'Hello [[user_name]],', 'You are receiving this email because we received a password change request for your account.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(8, 'Unusual Login Email', 'users-unusual-login-email    ', 'Unusual Login Attempt on [[site_name]]!!!!', 'Hi [[user_name]], ', 'Someone tried to log in too many times in your [[site_name]] account.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(9, 'Confirm Your Email', 'users-confirm-password-email', 'Please verify your email address - [[site_name]]', 'Welcome!', 'Hello [[user_name]]! \n\nThank you for registering on our platform. You\'re almost ready to start.\n\nSimply click the button below to confirm your email address and active your account.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(10, 'Password Reset Email by Admin', 'users-reset-password-email', 'Your Password is reseted on [[site_name]]', 'Hello [[user_name]],', 'We are reset your login password as per your requested via support.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(11, '2FA Disable Confirmation by Admin', 'users-reset-2fa-email', 'Disable 2FA Authentication Request', 'Hello [[user_name]],', 'We are reset your 2FA authentication as per your requested via support.\n\n If you really want to reset 2FA authentication security in your account, then click the button below to confirm and reset 2FA security.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(12, 'KYC Approved Email', 'kyc-approved-email', 'KYC Verified: Contribute in [[site_name]] ICO', 'Hello [[user_name]],', 'Thank you for submitting your verification request. \n\nWe are pleased to let you know that your identity (KYC) has been verified and you are granted to participate in our token sale.\n\nWe invite you to get back to contributor account and purchase token before sales end.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(13, 'KYC Rejected Email', 'kyc-rejected-email', 'KYC Application has been rejected - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'re having difficulties verifying your identity. \n\nThe information you had submitted was unfortunately rejected for following reason: \n[[message]]\n\nDon\'t be upset! Still you want to verity your identity, please get back to your account and fill form with proper information and upload correct documents to complete your identity verification process.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(14, 'KYC Missing Email', 'kyc-missing-email', 'Identity Verification: Action Required - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'re having difficulties verifying your identity. \n\nThe information you had submitted was unfortunately rejected because of the following reason:\n[[message]]\n\nWe request to get back to your account in order to upload new documents and complete the identity verification.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(15, 'KYC Submitted Email', 'kyc-submit-email', 'Document submitted for Identity Verification - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'ve received your submitted document and other information for identity verification.\n\nWe\'ll review your information and if all is in order will approve your identity. If the information is incorrect or something missing, we will request this as soon as possible.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(16, 'Token Purchase - Order Placed by Manual payment (USER)', 'order-submit-user', 'Order placed for Token Purchase #[[order_id]]', 'Thank you for your contribution!', 'You have requested to purchase [[token_symbol]] token. Your order has been received and is now being processed. You order details are show below for your reference. \n\n[[order_details]]\n\nIf you have not made the payment yet, please send your payments to the following address: [[payment_from]]\n\nYour order will be processed within 6 hours from the receipt of payment and token balance will appear in your account as soon as we have confirmed your payment. \n\nFeel free to contact us if you have any questions.', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(17, 'Token Purchase - Order Successful (USER)', 'order-successful-user', 'Token Purchase Successful - Order #[[order_id]]', 'Congratulation [[user_name]], you order has been processed successfully.', 'Thank you for your contribution and purchase our [[token_symbol]] Token! \n\n[[order_details]]\n\nYour token balances now appear in your account. Please login into your and check your balance. Please note that, we will send smart contract end of the token sales. \n\nFeel free to contact us if you have any questions.\n', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(18, 'Token Purchase - Order Rejected by Admin (USER)', 'order-rejected-user', 'Canceled Order #[[order_id]]', 'Hello [[user_name]],', 'The order (#[[order_id]]) has been canceled. \n\nWe noticed that you just tried to purchase [[token_symbol]] token, however we have not received your payment of [[payment_amount]] from your wallet ([[payment_from]]) for [[total_tokens]] Token.\n\nIf you still want to contribute please login into account and purchase the token again. \n[[site_login]]\n\nFeel free to contact us if you have any questions.\n', 'true', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(19, 'Token Purchase - Order Placed (ADMIN)', 'order-placed-admin', 'New Token Purchase Request #[[order_id]]', 'Hello Admin,', 'You have received a token purchased request form [[user_name]].\n\n[[order_details]]\n\nOrder By: [[user_name]]\nEmail Address: [[user_email]]\n\nPlease login into account and check details of transaction and take necessary steps.\n\n\nPS. Do not reply to this email. \nThank you.\n', 'false', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(20, 'Token Purchase - Canceled by User (ADMIN)', 'order-canceled-admin', 'Order #[[order_id]] Canceled by Contributor', 'Hello Admin,', 'The order (#[[order_id]]) has been canceled by [[user_name]] (contributor).\n\n\nPS. Do not reply to this email.\nThank you.\n', 'false', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(21, 'Token Refund - Refund By Admin (USER)', 'order-refund-token', 'Your order has been refunded', 'Hello [[user_name]],', 'Thank you for purchase [[token_symbol]] token from [[site_name]].\n\nWe found some problem in your payment so we have refunded your order and readjusted your token balance. Please find below your refund and original purchase order details.\n[[refund_details]]\n[[order_details]]\n\nNote: Your payment already refunded via same payment method that you used for payment.\n\nIf you have any questions about this refund, please feel free to contact us.\n', 'true', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `global_metas`
--

CREATE TABLE `global_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ico_metas`
--

CREATE TABLE `ico_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `stage_id` int(11) NOT NULL,
  `option_name` varchar(191) NOT NULL,
  `option_value` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ico_metas`
--

INSERT INTO `ico_metas` (`id`, `stage_id`, `option_name`, `option_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(2, 1, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(3, 2, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(4, 2, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(5, 3, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(6, 3, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(7, 4, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(8, 4, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(9, 5, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(10, 5, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(11, 6, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(12, 6, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(13, 7, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(14, 7, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(15, 8, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(16, 8, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(17, 9, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(18, 9, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(19, 10, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(20, 10, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(21, 11, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(22, 11, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(23, 12, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(24, 12, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(25, 13, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(26, 13, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(27, 14, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(28, 14, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(29, 15, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(30, 15, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2022-10-18 20:39:41', '2022-10-18 20:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `ico_stages`
--

CREATE TABLE `ico_stages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `total_tokens` bigint(20) NOT NULL,
  `base_price` double NOT NULL,
  `min_purchase` bigint(20) NOT NULL DEFAULT 0,
  `max_purchase` bigint(20) NOT NULL DEFAULT 0,
  `soft_cap` bigint(20) NOT NULL DEFAULT 0,
  `hard_cap` bigint(20) NOT NULL DEFAULT 0,
  `display_mode` varchar(191) NOT NULL,
  `private` int(11) NOT NULL DEFAULT 0,
  `user_panel_display` int(11) NOT NULL DEFAULT 0,
  `sales_token` double NOT NULL DEFAULT 0,
  `sales_amount` double NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ico_stages`
--

INSERT INTO `ico_stages` (`id`, `name`, `start_date`, `end_date`, `total_tokens`, `base_price`, `min_purchase`, `max_purchase`, `soft_cap`, `hard_cap`, `display_mode`, `private`, `user_panel_display`, `sales_token`, `sales_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Stage 1', '2022-10-18 16:39:39', '2022-11-18 16:39:39', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(2, 'Demo Stage 2', '2022-11-18 16:39:39', '2022-12-18 16:39:39', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(3, 'Demo Stage 3', '2022-11-18 16:39:39', '2022-12-18 16:39:39', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(4, 'Demo Stage 4', '2022-11-18 16:39:39', '2022-12-18 16:39:39', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(5, 'Demo Stage 5', '2022-11-18 16:39:39', '2022-12-18 16:39:39', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(6, 'Demo Stage 6', '2022-11-18 16:39:40', '2022-12-18 16:39:40', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(7, 'Demo Stage 7', '2022-11-18 16:39:40', '2022-12-18 16:39:40', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(8, 'Demo Stage 8', '2022-11-18 16:39:40', '2022-12-18 16:39:40', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(9, 'Demo Stage 9', '2022-11-18 16:39:40', '2022-12-18 16:39:40', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(10, 'Demo Stage 10', '2022-11-18 16:39:40', '2022-12-18 16:39:40', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(11, 'Demo Stage 11', '2022-11-18 16:39:40', '2022-12-18 16:39:40', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:40', '2022-10-18 20:39:40'),
(12, 'Demo Stage 12', '2022-11-18 16:39:41', '2022-12-18 16:39:41', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(13, 'Demo Stage 13', '2022-11-18 16:39:41', '2022-12-18 16:39:41', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(14, 'Demo Stage 14', '2022-11-18 16:39:41', '2022-12-18 16:39:41', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:41', '2022-10-18 20:39:41'),
(15, 'Demo Stage 15', '2022-11-18 16:39:41', '2022-12-18 16:39:41', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2022-10-18 20:39:41', '2022-10-18 20:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `firstName` varchar(191) NOT NULL,
  `lastName` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `dob` varchar(191) DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `address1` varchar(191) DEFAULT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `telegram` varchar(191) DEFAULT '',
  `documentType` varchar(191) DEFAULT '',
  `document` varchar(191) DEFAULT '',
  `document2` varchar(191) DEFAULT '',
  `document3` varchar(191) DEFAULT '',
  `walletName` varchar(191) DEFAULT '',
  `walletAddress` varchar(191) DEFAULT '',
  `notes` text DEFAULT NULL,
  `reviewedBy` int(11) NOT NULL DEFAULT 0,
  `reviewedAt` datetime DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `label` varchar(191) NOT NULL,
  `short` varchar(191) DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `label`, `short`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'English', 'EN', 'en', 1, '2022-10-18 20:40:23', '2022-10-18 20:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_01_043848_create_settings_table', 1),
(4, '2018_11_03_084440_create_activities_table', 1),
(5, '2018_11_03_091911_create_user_metas_table', 1),
(6, '2018_11_03_100212_create_transactions_table', 1),
(7, '2018_11_05_055256_create_kycs_table', 1),
(8, '2018_11_08_110810_create_ico_stages_table', 1),
(9, '2018_11_10_054817_create_ico_metas_table', 1),
(10, '2018_11_12_090411_create_payment_methods_table', 1),
(11, '2018_11_22_102451_create_pages_table', 1),
(12, '2018_11_27_123445_create_email_templates_table', 1),
(13, '2018_12_11_134112_create_global_metas_table', 1),
(14, '2019_05_05_123232_create_referrals_table', 1),
(15, '2019_07_16_133004_add_refund_column_in_transactions_table', 1),
(16, '2019_08_28_124836_add_lang_column_in_pages_table', 1),
(17, '2019_08_28_130012_create_languages_table', 1),
(18, '2019_08_28_130334_create_translates_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `menu_title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `custom_slug` varchar(191) NOT NULL,
  `meta_keyword` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_index` int(11) NOT NULL DEFAULT 1,
  `description` longtext NOT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `lang` varchar(191) NOT NULL DEFAULT 'en',
  `public` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `menu_title`, `slug`, `custom_slug`, `meta_keyword`, `meta_description`, `meta_index`, `description`, `external_link`, `status`, `lang`, `public`, `created_at`, `updated_at`) VALUES
(1, 'Thank you for your interest to our [[site_name]]', 'Welcome block', 'home_top', 'home-top-block', NULL, NULL, 1, 'You can contribute [[token_symbol]] token go through Buy Token page. \n\n You can get a quick response to any questions, and chat with the project in our Telegram: https://t.me/icocrypto \n\n<strong>Don’t hesitate to invite your friends!</strong> \n\n[[whitepaper_download_button]]', NULL, 'active', 'en', 0, '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(2, 'How to buy?', 'How to buy?', 'how_buy', 'how-to-buy', NULL, NULL, 1, 'Login with your email and password then go to Buy Token!', NULL, 'active', 'en', 0, '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(3, 'FAQ ', 'FAQ ', 'faq', 'faq', NULL, NULL, 1, 'Frequently Ask Questions...', NULL, 'active', 'en', 0, '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(4, 'Privacy and Policy', 'Privacy and Policy', 'privacy', 'privacy-policy', NULL, NULL, 1, '[[site_name]] Privacy and Policies...', NULL, 'active', 'en', 1, '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(5, 'Terms and Condition', 'Terms and Condition', 'terms', 'terms-and-condition', NULL, NULL, 1, '[[site_name]] Terms and Condition...', NULL, 'active', 'en', 1, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(6, 'ICO Distribution', 'ICO Distribution', 'distribution', 'ico-distribution', NULL, NULL, 1, 'Distribution page content', NULL, 'hide', 'en', 0, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(7, 'Referral', 'Referral', 'referral', 'referral', NULL, NULL, 1, 'Invite your friends and family and receive free tokens. \nThe referral link may be used during a token contribution, in the pre-sale and the ICO. \n\nImagine giving your unique referral link to your crypto-friend and he or she contributes tokens using your link, the bonus will be sent to your account automatically. The strategy is simple: the more links you send to your colleagues, family and friends - the more tokens you may earn!', NULL, 'hide', 'en', 0, '2022-10-18 20:39:43', '2022-10-18 20:39:43'),
(8, 'Custom Page', 'Custom Page', 'custom_page', 'custom-page', NULL, NULL, 1, 'Details about the page!', NULL, 'hide', 'en', 0, '2022-10-18 20:39:43', '2022-10-18 20:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `data` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `payment_method`, `title`, `description`, `data`, `status`, `created_at`, `updated_at`) VALUES
(1, 'manual', 'Pay via Crypto', 'You can send payment direct to our wallets. We will manually verify.', '{\"eth\":{\"status\":\"inactive\",\"address\":null,\"limit\":null,\"price\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"btc\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"ltc\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"bch\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"bnb\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"trx\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"xlm\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"xrp\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"usdt\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"usdc\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"dash\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"waves\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"xmr\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"busd\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"ada\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"doge\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"sol\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"uni\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"link\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"cake\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"}}', 'inactive', '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(2, 'bank', 'Pay via Bank Transfer', 'You can send payment direct to our bank account.', '{\"bank_account_name\":null,\"bank_account_number\":null,\"bank_holder_address\":null,\"bank_name\":null,\"bank_address\":null,\"routing_number\":null,\"iban\":null,\"swift_bic\":null}', 'inactive', '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(3, 'paypal', 'Pay with PayPal', 'You can send your payment using your PayPal account.', '{\"email\":null,\"sandbox\":0,\"clientId\":null,\"clientSecret\":null,\"is_active\":0}', 'inactive', '2022-10-18 20:39:39', '2022-10-18 20:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_bonus` double DEFAULT NULL,
  `refer_by` int(11) DEFAULT NULL,
  `refer_bonus` double DEFAULT NULL,
  `meta_data` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `field`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'TokenLite', '2022-10-18 20:39:19', '2022-10-18 20:39:19'),
(2, 'site_email', 'info@yourdomain.com', '2022-10-18 20:39:19', '2022-10-18 20:39:19'),
(3, 'site_base_currency', 'USD', '2022-10-18 20:39:19', '2022-10-18 20:39:19'),
(4, 'site_copyright', 'All Right Reserved.', '2022-10-18 20:39:19', '2022-10-18 20:39:19'),
(5, 'site_support_address', '', '2022-10-18 20:39:19', '2022-10-18 20:39:19'),
(6, 'site_support_phone', '', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(7, 'site_support_email', '', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(8, 'token_default_in_userpanel', 'ETH', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(9, 'token_sales_raised', 'token', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(10, 'token_sales_total', 'token', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(11, 'token_sales_cap', 'token', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(12, 'tokenlite_credible', 'none', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(13, 'main_website_url', NULL, '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(14, 'pm_automatic_rate_time', '30', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(15, 'theme_admin', 'style', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(16, 'theme_user', 'style', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(17, 'theme_custom', '0', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(18, 'theme_auth_layout', 'default', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(19, 'site_date_format', 'd M, Y', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(20, 'site_time_format', 'h:i A', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(21, 'site_timezone', 'UTC', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(22, 'tokenlite_ukey', '5hcPWdxQ', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(23, 'site_social_links', '{\"onsite\":\"on\",\"onlogin\":\"on\",\"facebook\":null,\"twitter\":null,\"linkedin\":null,\"github\":null,\"medium\":null,\"youtube\":null,\"telegram\":null}', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(24, 'tokenlite_install', '2022-10-18 16:39:20', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(25, 'referral_system', '0', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(26, 'referral_allow', 'all_time', '2022-10-18 20:39:20', '2022-10-18 20:39:20'),
(27, 'referral_calc', 'percent', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(28, 'referral_bonus', '10', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(29, 'referral_bonus_join', '10', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(30, 'referral_info_show', '0', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(31, 'referral_allow_join', 'all_time', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(32, 'referral_calc_join', 'percent', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(33, 'token_wallet_opt', '{\"wallet_opt\":[\"ethereum\",\"bitcoin\",\"litecoin\"]}', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(34, 'token_wallet_note', 'Address should be ERC20-compliant.', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(35, 'token_wallet_custom', '{\"cw_name\":null,\"cw_text\":null}', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(36, 'token_wallet_req', '1', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(37, 'token_number_format', '0', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(38, 'user_in_cur1', 'eth', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(39, 'user_in_cur2', 'btc', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(40, 'user_mytoken_page', '1', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(41, 'user_mytoken_stage', '1', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(42, 'user_sales_progress', '1', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(43, 'welcome_img_hide', '0', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(44, 'opt_count_hide', '0', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(45, 'languages_show_as', 'code', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(46, 'languages_switcher', '0', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(47, 'languages_default', 'en', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(48, 'site_mail_driver', 'mail', '2022-10-18 20:39:21', '2022-10-18 20:39:21'),
(49, 'site_mail_host', '', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(50, 'site_mail_port', '587', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(51, 'site_mail_encryption', 'tls', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(52, 'site_mail_from_address', 'noreply@yourdomain.com', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(53, 'site_mail_from_name', 'TokenLite', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(54, 'site_mail_username', '', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(55, 'site_mail_password', '', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(56, 'site_mail_footer', 'Best Regards\n[[site_name]]', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(57, 'tokenlite_pkey', '23604094', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(58, 'site_admin_management', '0', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(59, 'manage_access_default', '{\"level\":[\"none\"]}', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(60, 'kyc_opt_hide', '0', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(61, 'kyc_public', '1', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(62, 'kyc_before_email', '0', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(63, 'kyc_firstname', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(64, 'kyc_lastname', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(65, 'kyc_email', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:22', '2022-10-18 20:39:22'),
(66, 'kyc_phone', '{\"show\":1,\"req\":0}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(67, 'kyc_dob', '{\"show\":1,\"req\":0}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(68, 'kyc_gender', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(69, 'kyc_country', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(70, 'kyc_state', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(71, 'kyc_city', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(72, 'kyc_zip', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(73, 'kyc_address1', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(74, 'kyc_address2', '{\"show\":1,\"req\":0}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(75, 'kyc_telegram', '{\"show\":1,\"req\":0}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(76, 'kyc_document_passport', '1', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(77, 'kyc_document_nidcard', '1', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(78, 'kyc_document_driving', '1', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(79, 'kyc_wallet', '{\"show\":1,\"req\":1}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(80, 'kyc_wallet_custom', '{\"cw_name\":null,\"cw_text\":null}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(81, 'kyc_wallet_note', 'Address should be ERC20-compliant.', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(82, 'kyc_wallet_opt', '{\"wallet_opt\":[\"ethereum\",\"bitcoin\",\"litecoin\"]}', '2022-10-18 20:39:23', '2022-10-18 20:39:23'),
(83, 'token_purchase_usd', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(84, 'pmc_active_usd', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(85, 'token_purchase_eur', '0', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(86, 'pmc_active_eur', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(87, 'token_purchase_gbp', '0', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(88, 'pmc_active_gbp', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(89, 'token_purchase_cad', '0', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(90, 'pmc_active_cad', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(91, 'token_purchase_aud', '0', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(92, 'pmc_active_aud', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(93, 'token_purchase_try', '0', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(94, 'pmc_active_try', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(95, 'token_purchase_rub', '0', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(96, 'pmc_active_rub', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(97, 'token_purchase_inr', '0', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(98, 'pmc_active_inr', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(99, 'token_purchase_brl', '0', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(100, 'pmc_active_brl', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(101, 'token_purchase_nzd', '0', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(102, 'pmc_active_nzd', '1', '2022-10-18 20:39:24', '2022-10-18 20:39:24'),
(103, 'token_purchase_pln', '0', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(104, 'pmc_active_pln', '1', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(105, 'token_purchase_jpy', '0', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(106, 'pmc_active_jpy', '1', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(107, 'token_purchase_myr', '0', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(108, 'pmc_active_myr', '1', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(109, 'token_purchase_idr', '0', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(110, 'pmc_active_idr', '1', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(111, 'token_purchase_ngn', '0', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(112, 'pmc_active_ngn', '1', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(113, 'token_purchase_mxn', '0', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(114, 'pmc_active_mxn', '1', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(115, 'token_purchase_php', '0', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(116, 'pmc_active_php', '1', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(117, 'token_purchase_chf', '0', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(118, 'pmc_active_chf', '1', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(119, 'token_purchase_thb', '0', '2022-10-18 20:39:25', '2022-10-18 20:39:25'),
(120, 'pmc_active_thb', '1', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(121, 'token_purchase_sgd', '0', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(122, 'pmc_active_sgd', '1', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(123, 'token_purchase_czk', '0', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(124, 'pmc_active_czk', '1', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(125, 'token_purchase_nok', '0', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(126, 'pmc_active_nok', '1', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(127, 'token_purchase_zar', '0', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(128, 'pmc_active_zar', '1', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(129, 'token_purchase_sek', '0', '2022-10-18 20:39:26', '2022-10-18 20:39:26'),
(130, 'pmc_active_sek', '1', '2022-10-18 20:39:27', '2022-10-18 20:39:27'),
(131, 'token_purchase_kes', '0', '2022-10-18 20:39:27', '2022-10-18 20:39:27'),
(132, 'pmc_active_kes', '1', '2022-10-18 20:39:27', '2022-10-18 20:39:27'),
(133, 'token_purchase_nad', '0', '2022-10-18 20:39:27', '2022-10-18 20:39:27'),
(134, 'pmc_active_nad', '1', '2022-10-18 20:39:27', '2022-10-18 20:39:27'),
(135, 'token_purchase_dkk', '0', '2022-10-18 20:39:27', '2022-10-18 20:39:27'),
(136, 'pmc_active_dkk', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(137, 'token_purchase_hkd', '0', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(138, 'pmc_active_hkd', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(139, 'token_purchase_huf', '0', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(140, 'pmc_active_huf', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(141, 'token_purchase_pkr', '0', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(142, 'pmc_active_pkr', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(143, 'token_purchase_egp', '0', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(144, 'pmc_active_egp', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(145, 'token_purchase_clp', '0', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(146, 'pmc_active_clp', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(147, 'token_purchase_cop', '0', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(148, 'pmc_active_cop', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(149, 'token_purchase_jmd', '0', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(150, 'pmc_active_jmd', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(151, 'token_purchase_eth', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(152, 'pmc_active_eth', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(153, 'token_purchase_btc', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(154, 'pmc_active_btc', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(155, 'token_purchase_ltc', '1', '2022-10-18 20:39:28', '2022-10-18 20:39:28'),
(156, 'pmc_active_ltc', '1', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(157, 'token_purchase_xrp', '0', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(158, 'pmc_active_xrp', '1', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(159, 'token_purchase_xlm', '0', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(160, 'pmc_active_xlm', '1', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(161, 'token_purchase_bch', '0', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(162, 'pmc_active_bch', '1', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(163, 'token_purchase_bnb', '0', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(164, 'pmc_active_bnb', '1', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(165, 'token_purchase_usdt', '0', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(166, 'pmc_active_usdt', '1', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(167, 'token_purchase_trx', '0', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(168, 'pmc_active_trx', '1', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(169, 'token_purchase_usdc', '0', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(170, 'pmc_active_usdc', '1', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(171, 'token_purchase_dash', '0', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(172, 'pmc_active_dash', '1', '2022-10-18 20:39:29', '2022-10-18 20:39:29'),
(173, 'token_purchase_waves', '0', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(174, 'pmc_active_waves', '1', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(175, 'token_purchase_xmr', '0', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(176, 'pmc_active_xmr', '1', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(177, 'token_purchase_busd', '0', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(178, 'pmc_active_busd', '1', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(179, 'token_purchase_ada', '0', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(180, 'pmc_active_ada', '1', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(181, 'token_purchase_doge', '0', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(182, 'pmc_active_doge', '1', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(183, 'token_purchase_sol', '0', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(184, 'pmc_active_sol', '1', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(185, 'token_purchase_uni', '0', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(186, 'pmc_active_uni', '1', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(187, 'token_purchase_link', '0', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(188, 'pmc_active_link', '1', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(189, 'token_purchase_cake', '0', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(190, 'pmc_active_cake', '1', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(191, 'pm_exchange_method', 'automatic', '2022-10-18 20:39:30', '2022-10-18 20:39:30'),
(192, 'pm_exchange_auto_lastcheck', '2022-10-18 16:29:31', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(193, 'token_calculate', 'normal', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(194, 'token_calculate_note', 'normal', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(195, 'token_default_method', 'ETH', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(196, 'active_payment_modules', '{\"Manual\":{\"type\":\"core\",\"version\":\"1.0\"},\"Bank\":{\"type\":\"core\",\"version\":\"1.0\"},\"Paypal\":{\"type\":\"core\",\"version\":\"1.0\"}}', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(197, 'site_api_key', '14vXuWLm9hmineaWElV5t6iW', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(198, 'site_api_secret', '0PnD65d1ba20SR5K', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(199, 'nio_lkey', 'hIOtFVjJtnmCD8zABcHxGkByNUL3ptS8', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(200, 'pmc_rate_usd', '1', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(201, 'pmc_rate_eur', '1', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(202, 'pmc_rate_gbp', '1', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(203, 'pmc_rate_cad', '1', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(204, 'pmc_rate_aud', '1', '2022-10-18 20:39:31', '2022-10-18 20:39:31'),
(205, 'pmc_rate_try', '1', '2022-10-18 20:39:32', '2022-10-18 20:39:32'),
(206, 'pmc_rate_rub', '1', '2022-10-18 20:39:32', '2022-10-18 20:39:32'),
(207, 'pmc_rate_inr', '1', '2022-10-18 20:39:32', '2022-10-18 20:39:32'),
(208, 'pmc_rate_brl', '1', '2022-10-18 20:39:32', '2022-10-18 20:39:32'),
(209, 'pmc_rate_nzd', '1', '2022-10-18 20:39:32', '2022-10-18 20:39:32'),
(210, 'pmc_rate_pln', '1', '2022-10-18 20:39:32', '2022-10-18 20:39:32'),
(211, 'pmc_rate_jpy', '1', '2022-10-18 20:39:32', '2022-10-18 20:39:32'),
(212, 'pmc_rate_myr', '1', '2022-10-18 20:39:32', '2022-10-18 20:39:32'),
(213, 'pmc_rate_idr', '1', '2022-10-18 20:39:32', '2022-10-18 20:39:32'),
(214, 'pmc_rate_ngn', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(215, 'pmc_rate_mxn', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(216, 'pmc_rate_php', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(217, 'pmc_rate_chf', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(218, 'pmc_rate_thb', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(219, 'pmc_rate_sgd', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(220, 'pmc_rate_czk', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(221, 'pmc_rate_nok', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(222, 'pmc_rate_zar', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(223, 'pmc_rate_sek', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(224, 'pmc_rate_kes', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(225, 'pmc_rate_nad', '1', '2022-10-18 20:39:33', '2022-10-18 20:39:33'),
(226, 'pmc_rate_dkk', '1', '2022-10-18 20:39:34', '2022-10-18 20:39:34'),
(227, 'pmc_rate_hkd', '1', '2022-10-18 20:39:34', '2022-10-18 20:39:34'),
(228, 'pmc_rate_huf', '1', '2022-10-18 20:39:34', '2022-10-18 20:39:34'),
(229, 'pmc_rate_pkr', '1', '2022-10-18 20:39:34', '2022-10-18 20:39:34'),
(230, 'pmc_rate_egp', '1', '2022-10-18 20:39:34', '2022-10-18 20:39:34'),
(231, 'pmc_rate_clp', '1', '2022-10-18 20:39:34', '2022-10-18 20:39:34'),
(232, 'pmc_rate_cop', '1', '2022-10-18 20:39:35', '2022-10-18 20:39:35'),
(233, 'pmc_rate_jmd', '1', '2022-10-18 20:39:35', '2022-10-18 20:39:35'),
(234, 'pmc_rate_eth', '1', '2022-10-18 20:39:35', '2022-10-18 20:39:35'),
(235, 'pmc_rate_btc', '1', '2022-10-18 20:39:35', '2022-10-18 20:39:35'),
(236, 'pmc_rate_ltc', '1', '2022-10-18 20:39:35', '2022-10-18 20:39:35'),
(237, 'pmc_rate_xrp', '1', '2022-10-18 20:39:36', '2022-10-18 20:39:36'),
(238, 'pmc_rate_xlm', '1', '2022-10-18 20:39:36', '2022-10-18 20:39:36'),
(239, 'pmc_rate_bch', '1', '2022-10-18 20:39:36', '2022-10-18 20:39:36'),
(240, 'pmc_rate_bnb', '1', '2022-10-18 20:39:36', '2022-10-18 20:39:36'),
(241, 'pmc_rate_usdt', '1', '2022-10-18 20:39:36', '2022-10-18 20:39:36'),
(242, 'pmc_rate_trx', '1', '2022-10-18 20:39:36', '2022-10-18 20:39:36'),
(243, 'pmc_rate_usdc', '1', '2022-10-18 20:39:37', '2022-10-18 20:39:37'),
(244, 'pmc_rate_dash', '1', '2022-10-18 20:39:37', '2022-10-18 20:39:37'),
(245, 'pmc_rate_waves', '1', '2022-10-18 20:39:37', '2022-10-18 20:39:37'),
(246, 'pmc_rate_xmr', '1', '2022-10-18 20:39:37', '2022-10-18 20:39:37'),
(247, 'pmc_rate_busd', '1', '2022-10-18 20:39:37', '2022-10-18 20:39:37'),
(248, 'pmc_rate_ada', '1', '2022-10-18 20:39:37', '2022-10-18 20:39:37'),
(249, 'pmc_rate_doge', '1', '2022-10-18 20:39:37', '2022-10-18 20:39:37'),
(250, 'pmc_rate_sol', '1', '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(251, 'pmc_rate_uni', '1', '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(252, 'pmc_rate_link', '1', '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(253, 'pmc_rate_cake', '1', '2022-10-18 20:39:38', '2022-10-18 20:39:38'),
(254, 'actived_stage', '1', '2022-10-18 20:39:39', '2022-10-18 20:39:39'),
(255, 'token_name', 'TokenLite', '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(256, 'token_symbol', 'TLE', '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(257, 'token_decimal_min', '2', '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(258, 'token_decimal_max', '6', '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(259, 'token_decimal_show', '3', '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(260, 'token_price_show', '1', '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(261, 'token_before_kyc', '0', '2022-10-18 20:39:42', '2022-10-18 20:39:42'),
(262, 'site_db_version', '217132', '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(263, 'lang_last_update_en', '1666111223', '2022-10-18 20:40:23', '2022-10-18 20:40:23'),
(264, 'lang_last_generate_en', '1666111223', '2022-10-18 20:40:23', '2022-10-18 20:40:23'),
(265, 'lang_db_version', '220415', '2022-10-18 20:40:23', '2022-10-18 20:40:23'),
(266, 'installed_update', '1666111223', '2022-10-18 20:40:23', '2022-10-18 20:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `tnx_id` varchar(191) NOT NULL,
  `tnx_type` varchar(191) NOT NULL,
  `tnx_time` datetime NOT NULL,
  `tokens` double NOT NULL DEFAULT 0,
  `bonus_on_base` double NOT NULL DEFAULT 0,
  `bonus_on_token` double NOT NULL DEFAULT 0,
  `total_bonus` double NOT NULL DEFAULT 0,
  `total_tokens` double NOT NULL,
  `stage` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `receive_amount` double NOT NULL DEFAULT 0,
  `receive_currency` varchar(191) DEFAULT NULL,
  `base_amount` double DEFAULT NULL,
  `base_currency` varchar(191) DEFAULT NULL,
  `base_currency_rate` double DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `currency_rate` double DEFAULT NULL,
  `all_currency_rate` text DEFAULT NULL,
  `wallet_address` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_id` varchar(191) NOT NULL DEFAULT '',
  `payment_to` varchar(191) DEFAULT NULL,
  `checked_by` text DEFAULT NULL,
  `added_by` text DEFAULT NULL,
  `checked_time` datetime DEFAULT NULL,
  `details` varchar(191) NOT NULL DEFAULT '',
  `extra` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT '',
  `dist` int(11) NOT NULL DEFAULT 0,
  `refund` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translates`
--

CREATE TABLE `translates` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `text` text DEFAULT NULL,
  `pages` varchar(191) NOT NULL DEFAULT 'global',
  `group` varchar(191) NOT NULL DEFAULT 'system',
  `panel` varchar(191) NOT NULL DEFAULT 'any',
  `load` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `translates`
--

INSERT INTO `translates` (`id`, `key`, `name`, `text`, `pages`, `group`, `panel`, `load`, `created_at`, `updated_at`) VALUES
(1, 'messages.email_exist', 'base', 'Email is already exist!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(2, 'messages.email.unique', 'base', 'Email address should be unique!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(3, 'messages.email.reset', 'base', 'Somthing is wrong! We are unable to send reset link to your email. Please! contact with administrator via :email.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(4, 'messages.email.verify', 'base', 'Somthing is wrong! We are unable to send the verification link to your email. Please! contact with administrator via :email.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(5, 'messages.email.password_change', 'base', 'Somthing is wrong! We are unable to send the confirmation link to your email. Please! contact with administrator via :email.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(6, 'messages.email.failed', 'base', 'But email was not send to user. Please check your mail setting credential.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(7, 'messages.form.invalid', 'base', 'Invalid form data!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(8, 'messages.form.wrong', 'base', 'Something wrong in form submission!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(9, 'messages.wrong', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:44', '2022-10-18 20:39:44'),
(10, 'messages.nothing', 'base', 'Nothing to do!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(11, 'messages.agree', 'base', 'You should agree our terms and policy.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(12, 'messages.errors', 'base', 'An error occurred. Please try again.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(13, 'messages.login.email_verify', 'base', 'Please login to verify you email address.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(14, 'messages.login.inactive', 'base', 'Your account may inactive or suspended. Please contact us if something wrong.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(15, 'messages.register.success.heading', 'base', 'Thank you!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(16, 'messages.register.success.subhead', 'base', 'Your sign-up process is almost done.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(17, 'messages.register.success.msg', 'base', 'Please check your email and verify your account.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(18, 'messages.verify.verified', 'base', 'Email address is already verified.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(19, 'messages.verify.not_found', 'base', 'User Account is not found!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(20, 'messages.verify.expired', 'base', 'Your verification link is expired!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(21, 'messages.verify.invalid', 'base', 'Your verification link is invalid!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(22, 'messages.verify.confirmed', 'base', 'Your email is verified now!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(23, 'messages.verify.success.heading', 'base', 'Congratulations!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(24, 'messages.verify.success.subhead', 'base', 'You\'ve successfully verified your email address and your account is now active.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(25, 'messages.verify.success.msg', 'base', 'Please sign-in to start token purchase.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:45', '2022-10-18 20:39:45'),
(26, 'messages.trnx.created', 'base', 'Transaction successful, You will redirect to payment page.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(27, 'messages.trnx.wrong', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(28, 'messages.trnx.required', 'base', 'Transaction id is required!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(29, 'messages.trnx.canceled', 'base', 'Transaction failed! Try again.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(30, 'messages.trnx.notfound', 'base', 'Transaction id is not found', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(31, 'messages.trnx.reviewing', 'base', 'We are reviewing your payment!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(32, 'messages.trnx.canceled_own', 'base', 'You had canceled your order', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(33, 'messages.trnx.require_currency', 'base', 'Currency is required!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(34, 'messages.trnx.require_token', 'base', 'Token amount is required!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(35, 'messages.trnx.select_method', 'base', 'Select payment method!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(36, 'messages.trnx.minimum_token', 'base', 'You have to purchase more than 1 token.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(37, 'messages.trnx.purchase_token', 'base', 'Tokens Purchase', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(38, 'messages.trnx.referral_bonus', 'base', 'Referral Bonus', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(39, 'messages.trnx.payments.not_available', 'base', 'Sorry! Currently payment method not available in your selected currency!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(40, 'messages.trnx.manual.success', 'base', 'Transaction successful!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(41, 'messages.trnx.manual.failed', 'base', 'Transaction Failed!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:46', '2022-10-18 20:39:46'),
(42, 'messages.trnx.admin.approved', 'base', 'Transaction approved and token added to user.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(43, 'messages.trnx.admin.canceled', 'base', 'Transaction canceled.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(44, 'messages.trnx.admin.deleted', 'base', 'Transaction Deleted.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(45, 'messages.trnx.admin.already_deleted', 'base', 'This transaction is already deleted.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(46, 'messages.trnx.admin.already_approved', 'base', 'This transaction is already approved.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(47, 'messages.trnx.admin.already_canceled', 'base', 'This transaction is already canceled.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(48, 'messages.trnx.admin.already_updated', 'base', 'This transaction is already updated to :status.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(49, 'messages.token.success', 'base', 'Token added to the user account!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(50, 'messages.token.failed', 'base', 'Failed to add token!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(51, 'messages.insert.success', 'base', ':what insert successful!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(52, 'messages.insert.warning', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:47', '2022-10-18 20:39:47'),
(53, 'messages.insert.failed', 'base', ':what insert failed!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(54, 'messages.stage.expired', 'base', 'Sorry, this stage is expired!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(55, 'messages.stage.inactive', 'base', 'Currently no active stage found!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(56, 'messages.stage.notice', 'base', 'Please create a new stage or update stage date, because this stage is expired!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(57, 'messages.stage.upcoming', 'base', 'Stage will start at :time', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(58, 'messages.stage.delete_failed', 'base', 'You can not remove the last stage.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(59, 'messages.stage.not_started', 'base', 'Our sell have not started yet. Please check after some times.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(60, 'messages.stage.completed', 'base', 'Our token sales has been finished. Thank you very much for your contribution.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(61, 'messages.update.success', 'base', ':what has been updated!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(62, 'messages.update.warning', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(63, 'messages.update.failed', 'base', ':what updating failed!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(64, 'messages.password.old_err', 'base', 'Your old password is incorrect.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(65, 'messages.password.success', 'base', 'Password successfully changed!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(66, 'messages.password.changed', 'base', 'We have sent a verification code to your email please confirm and change.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(67, 'messages.password.failed', 'base', 'Varification link has expired!!! try again', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(68, 'messages.password.token', 'base', 'Invalid link/token!!! try again', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(69, 'messages.delete.delete', 'base', ':what is deleted!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(70, 'messages.delete.delete_failed', 'base', ':what is deletion failed!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(71, 'messages.kyc.approved', 'base', 'KYC application approved successfully!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(72, 'messages.kyc.missing', 'base', 'KYC application is missing!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(73, 'messages.kyc.rejected', 'base', 'KYC application is rejected!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:48', '2022-10-18 20:39:48'),
(74, 'messages.kyc.wait', 'base', 'Your KYC Application is placed, please wait for our review.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(75, 'messages.kyc.mandatory', 'base', 'Identity verification (KYC/AML) is mandatory to participate in our token sale.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(76, 'messages.kyc.forms.submitted', 'base', 'You have successfully submitted your application for identity verification.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(77, 'messages.kyc.forms.failed', 'base', 'We weren\'t able to process the application submission for identity verification. Please reload this page and fill the form again and submit. ', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(78, 'messages.kyc.forms.document', 'base', ':NAME is required, Please upload your document.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(79, 'messages.upload.success', 'base', ':what has been uploaded!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(80, 'messages.upload.warning', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(81, 'messages.upload.invalid', 'base', 'This type of file is not supported!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(82, 'messages.upload.failed', 'base', ':what uploading failed!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(83, 'messages.invalid.address', 'base', 'Enter a valid wallet address.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(84, 'messages.invalid.address_is', 'base', 'Enter a valid :is wallet address.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(85, 'messages.invalid.social', 'base', 'Sorry, Social login is not available now.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(86, 'messages.mail.send', 'base', 'Email has been send successfully.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(87, 'messages.mail.failed', 'base', 'Failed to send email.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(88, 'messages.mail.issues', 'base', 'Unable to send email! Please check your mail setting credential.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(89, 'messages.wallet.change', 'base', 'Wallet address change request submitted.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(90, 'messages.wallet.cancel', 'base', 'Wallet address change request is canceled.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(91, 'messages.wallet.approved', 'base', 'Wallet address change request is approved.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(92, 'messages.wallet.failed', 'base', 'Wallet address change request is failed.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(93, 'messages.ico_not_setup', 'base', 'ICO Sales opening soon, Please check after sometimes.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(94, 'messages.demo_payment_note', 'base', 'All the <span class=\"badge badge-xs badge-purple ucap\">Add-ons</span> type payment modules is NOT part of main product. You\'ve to purchase separately from CodeCanyon to get those. <strong><a href=\"https://codecanyon.net/user/softnio/portfolio\" target=\"_blank\">Check out here</a></strong>.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(95, 'messages.demo_user', 'base', 'Your action can\'t perform as you login with a Demo Account. For full-access, please send an email at info@softnio.com.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:49', '2022-10-18 20:39:49'),
(96, 'messages.demo_preview', 'base', 'You can\'t perform this action as this is preview purpose.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(97, 'messages.stage_update', 'base', 'Successfully :status the stage!!', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(98, 'messages.payment_method_update', 'base', 'Payment method :status', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(99, 'messages.required_app', 'base', 'The :what payment module required minimum :version version of application. Please update your core application to latest version.', 'messages, global', 'system', 'any', 1, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(100, 'messages.permission', 'base', 'You do not have enough permissions to perform requested operation.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(101, 'messages.unable_proceed', 'base', 'Unable to proceed request!', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(102, 'messages.transfer.wrong', 'base', 'Something is wrong, please try again later!', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(103, 'messages.transfer.request_submitted', 'base', 'Your request successfully submitted and waiting for our team approval.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(104, 'messages.transfer.balance_insufficient', 'base', 'You balance is insufficient for send token.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(105, 'messages.transfer.can_not_send_token', 'base', 'You can not send your token to your own account.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(106, 'messages.transfer.invalid_email_address', 'base', 'Sorry! your provided email address is invalid or not associated with our platform.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(107, 'messages.transfer.send_maximum_amount', 'base', 'You can send maximum :amount :symbol at once.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(108, 'messages.transfer.minimum_amount_required', 'base', 'Minimum :amount :symbol required to send.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(109, 'messages.transfer.invalid_transaction', 'base', 'Invalid transaction or not found!', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(110, 'messages.transfer.transaction_approved', 'base', 'Transaction approved successfully.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(111, 'messages.transfer.account_not_found', 'base', 'The receiver account not found.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(112, 'messages.transfer.transaction_rejected', 'base', 'Transaction has been rejected.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(113, 'messages.transfer.transaction_already', 'base', 'Transaction already :status.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(114, 'messages.withdraw.approved', 'base', 'Withdraw transaction has been approved successfully.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(115, 'messages.withdraw.rejected', 'base', 'Withdraw transaction has been rejected.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(116, 'messages.withdraw.deleted', 'base', 'Withdraw transaction has been deleted.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(117, 'messages.withdraw.already_approved', 'base', 'Withdraw transaction has been already approved.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(118, 'messages.withdraw.canceled', 'base', 'Withdraw transaction has been canceled.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(119, 'messages.withdraw.unable_delete', 'base', 'Unable delete the withdraw transaction.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(120, 'messages.withdraw.successfully_placed_progress', 'base', 'Your withdrawal has been successfully placed. You can see its progress on this withdrawal page.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:50', '2022-10-18 20:39:50'),
(121, 'messages.withdraw.wrong', 'base', 'Something is wrong! Unable to process your request.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(122, 'messages.withdraw.insufficient_balance', 'base', 'You balance is insufficient for a withdrawal.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(123, 'messages.withdraw.withdraw_maximum', 'base', 'You can withdraw maximum :amount :symbol at once.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(124, 'messages.withdraw.minimum_required', 'base', 'Minimum :amount :symbol required to withdraw.', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(125, 'messages.cancel_order', 'base', 'Do you really cancel your order?', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(126, 'messages.unable_process', 'base', 'Unable process request!', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(127, 'messages.sure', 'base', 'Are you sure?', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(128, 'messages.unable_perform', 'base', 'Unable to perform!', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(129, 'messages.use_modern_browser', 'base', 'Please use a modern browser to properly view this template!', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(130, 'messages.copied_to_clipboard', 'base', 'Copied to Clipboard', 'messages, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(131, 'pagination.previous', 'base', '&laquo; Previous', 'pagination, global', 'system', 'any', 1, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(132, 'pagination.next', 'base', 'Next &raquo;', 'pagination, global', 'system', 'any', 1, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(133, 'pagination.prev', 'base', 'Prev', 'pagination, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(134, 'pagination.msg_next', 'base', 'Next', 'pagination, global', 'system', 'any', 0, '2022-10-18 20:39:51', '2022-10-18 20:39:51'),
(135, 'pagination.first', 'base', 'First', 'pagination, global', 'system', 'any', 0, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(136, 'pagination.last', 'base', 'Last', 'pagination, global', 'system', 'any', 0, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(137, 'passwords.password', 'base', 'Passwords must be at least six characters and match the confirmation.', 'passwords, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(138, 'passwords.reset', 'base', 'Your password has been reset!', 'passwords, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(139, 'passwords.sent', 'base', 'We have e-mailed your password reset link!', 'passwords, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(140, 'passwords.token', 'base', 'This password reset token is invalid.', 'passwords, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(141, 'passwords.user', 'base', 'We can\'t find a user with that e-mail address.', 'passwords, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(142, 'auth.failed', 'base', 'These credentials do not match our records.', 'auth, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(143, 'auth.throttle', 'base', 'Too many login attempts. Please try again in :seconds', 'auth, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(144, 'auth.recaptcha', 'base', 'Your request failed to complete as bot detected.', 'auth, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(145, 'auth.health.save_action', 'base', 'Please register and activate the application to perform the action.', 'auth, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(146, 'auth.health.fail', 'base', 'Invalidated-the-license-due-to-wrong-key', 'auth, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(147, 'validation.accepted', 'base', 'The :attribute must be accepted.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(148, 'validation.active_url', 'base', 'The :attribute is not a valid URL.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(149, 'validation.after', 'base', 'The :attribute must be a date after :date.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(150, 'validation.after_or_equal', 'base', 'The :attribute must be a date after or equal to :date.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(151, 'validation.alpha', 'base', 'The :attribute may only contain letters.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(152, 'validation.alpha_dash', 'base', 'The :attribute may only contain letters, numbers, dashes and underscores.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(153, 'validation.alpha_num', 'base', 'The :attribute may only contain letters and numbers.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:52', '2022-10-18 20:39:52'),
(154, 'validation.array', 'base', 'The :attribute must be an array.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(155, 'validation.before', 'base', 'The :attribute must be a date before :date.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(156, 'validation.before_or_equal', 'base', 'The :attribute must be a date before or equal to :date.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(157, 'validation.between.numeric', 'base', 'The :attribute must be between :min and :max.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(158, 'validation.between.file', 'base', 'The :attribute must be between :min and :max kilobytes.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(159, 'validation.between.string', 'base', 'The :attribute must be between :min and :max characters.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(160, 'validation.between.array', 'base', 'The :attribute must have between :min and :max items.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(161, 'validation.boolean', 'base', 'The :attribute field must be true or false.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(162, 'validation.confirmed', 'base', 'The :attribute confirmation does not match.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(163, 'validation.date', 'base', 'The :attribute is not a valid date.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(164, 'validation.date_equals', 'base', 'The :attribute must be a date equal to :date.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(165, 'validation.date_format', 'base', 'The :attribute does not match the format :format.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(166, 'validation.different', 'base', 'The :attribute and :other must be different.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(167, 'validation.digits', 'base', 'The :attribute must be :digits digits.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(168, 'validation.digits_between', 'base', 'The :attribute must be between :min and :max digits.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(169, 'validation.dimensions', 'base', 'The :attribute has invalid image dimensions.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(170, 'validation.distinct', 'base', 'The :attribute field has a duplicate value.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(171, 'validation.email', 'base', 'The :attribute must be a valid email address.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(172, 'validation.exists', 'base', 'The selected :attribute is invalid.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(173, 'validation.file', 'base', 'The :attribute must be a file.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(174, 'validation.filled', 'base', 'The :attribute field must have a value.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(175, 'validation.gt.numeric', 'base', 'The :attribute must be greater than :value.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(176, 'validation.gt.file', 'base', 'The :attribute must be greater than :value kilobytes.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(177, 'validation.gt.string', 'base', 'The :attribute must be greater than :value characters.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:53', '2022-10-18 20:39:53'),
(178, 'validation.gt.array', 'base', 'The :attribute must have more than :value items.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(179, 'validation.gte.numeric', 'base', 'The :attribute must be greater than or equal :value.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(180, 'validation.gte.file', 'base', 'The :attribute must be greater than or equal :value kilobytes.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(181, 'validation.gte.string', 'base', 'The :attribute must be greater than or equal :value characters.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(182, 'validation.gte.array', 'base', 'The :attribute must have :value items or more.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(183, 'validation.image', 'base', 'The :attribute must be an image.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(184, 'validation.in', 'base', 'The selected :attribute is invalid.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(185, 'validation.in_array', 'base', 'The :attribute field does not exist in :other.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(186, 'validation.integer', 'base', 'The :attribute must be an integer.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(187, 'validation.ip', 'base', 'The :attribute must be a valid IP address.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(188, 'validation.ipv4', 'base', 'The :attribute must be a valid IPv4 address.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(189, 'validation.ipv6', 'base', 'The :attribute must be a valid IPv6 address.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(190, 'validation.json', 'base', 'The :attribute must be a valid JSON string.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:54', '2022-10-18 20:39:54'),
(191, 'validation.lt.numeric', 'base', 'The :attribute must be less than :value.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(192, 'validation.lt.file', 'base', 'The :attribute must be less than :value kilobytes.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(193, 'validation.lt.string', 'base', 'The :attribute must be less than :value characters.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(194, 'validation.lt.array', 'base', 'The :attribute must have less than :value items.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(195, 'validation.lte.numeric', 'base', 'The :attribute must be less than or equal :value.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(196, 'validation.lte.file', 'base', 'The :attribute must be less than or equal :value kilobytes.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(197, 'validation.lte.string', 'base', 'The :attribute must be less than or equal :value characters.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(198, 'validation.lte.array', 'base', 'The :attribute must not have more than :value items.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(199, 'validation.max.numeric', 'base', 'The :attribute may not be greater than :max.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(200, 'validation.max.file', 'base', 'The :attribute may not be greater than :max kilobytes.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(201, 'validation.max.string', 'base', 'The :attribute may not be greater than :max characters.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:55', '2022-10-18 20:39:55'),
(202, 'validation.max.array', 'base', 'The :attribute may not have more than :max items.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(203, 'validation.mimes', 'base', 'The :attribute must be a file of type: :values.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(204, 'validation.mimetypes', 'base', 'The :attribute must be a file of type: :values.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(205, 'validation.min.numeric', 'base', 'The :attribute must be at least :min.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(206, 'validation.min.file', 'base', 'The :attribute must be at least :min kilobytes.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(207, 'validation.min.string', 'base', 'The :attribute must be at least :min characters.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(208, 'validation.min.array', 'base', 'The :attribute must have at least :min items.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(209, 'validation.not_in', 'base', 'The selected :attribute is invalid.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(210, 'validation.not_regex', 'base', 'The :attribute format is invalid.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(211, 'validation.numeric', 'base', 'The :attribute must be a number.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(212, 'validation.present', 'base', 'The :attribute field must be present.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(213, 'validation.regex', 'base', 'The :attribute format is invalid.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(214, 'validation.required', 'base', 'The :attribute field is required.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(215, 'validation.required_if', 'base', 'The :attribute field is required when :other is :value.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(216, 'validation.required_unless', 'base', 'The :attribute field is required unless :other is in :values.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(217, 'validation.required_with', 'base', 'The :attribute field is required when :values is present.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:56', '2022-10-18 20:39:56'),
(218, 'validation.required_with_all', 'base', 'The :attribute field is required when :values are present.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(219, 'validation.required_without', 'base', 'The :attribute field is required when :values is not present.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(220, 'validation.required_without_all', 'base', 'The :attribute field is required when none of :values are present.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(221, 'validation.same', 'base', 'The :attribute and :other must match.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(222, 'validation.size.numeric', 'base', 'The :attribute must be :size.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(223, 'validation.size.file', 'base', 'The :attribute must be :size kilobytes.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(224, 'validation.size.string', 'base', 'The :attribute must be :size characters.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(225, 'validation.size.array', 'base', 'The :attribute must contain :size items.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(226, 'validation.starts_with', 'base', 'The :attribute must start with one of the following: :values', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(227, 'validation.string', 'base', 'The :attribute must be a string.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(228, 'validation.timezone', 'base', 'The :attribute must be a valid zone.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(229, 'validation.unique', 'base', 'The :attribute has already been taken.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(230, 'validation.uploaded', 'base', 'The :attribute failed to upload.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(231, 'validation.url', 'base', 'The :attribute format is invalid.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:57', '2022-10-18 20:39:57'),
(232, 'validation.uuid', 'base', 'The :attribute must be a valid UUID.', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(233, 'validation.custom.attribute-name.rule-name', 'base', 'custom-message', 'validation, global', 'system', 'any', 1, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(234, 'validation.only.required', 'base', 'Required.', 'validation, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(235, 'validation.min.char', 'base', 'At least :num chars.', 'validation, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(236, 'validation.max.char', 'base', 'Maximum :num chars.', 'validation, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(237, 'validation.same.value', 'base', 'Enter the same value.', 'validation, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(238, 'validation.email.valid', 'base', 'Enter valid email.', 'validation, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(239, 'validation.issue', 'base', 'Currently we are facing some technical issue, please try again after sometime.', 'validation, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(240, 'auth.signin', 'base', 'Sign-in', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(241, 'auth.sign_in_btn', 'base', 'Sign In', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(242, 'auth.sign_in', 'base', 'Sign in', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(243, 'auth.with_your', 'base', 'with your', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(244, 'auth.account', 'base', 'Account', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(245, 'auth.your_email', 'base', 'Your Email', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(246, 'auth.password', 'base', 'Password', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(247, 'auth.remember_me', 'base', 'Remember Me', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:58', '2022-10-18 20:39:58'),
(248, 'auth.forgot_password', 'base', 'Forgot password?', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(249, 'auth.no_account', 'base', 'Don’t have an account?', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(250, 'auth.sign_with', 'base', 'Or Sign in with', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(251, 'auth.facebook', 'base', 'Facebook', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(252, 'auth.google', 'base', 'Google', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(253, 'auth.sign_here', 'base', 'Sign up here', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(254, 'auth.welcome', 'base', 'Welcome!', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(255, 'auth.logout', 'base', 'Logout', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(256, 'auth.sign_up', 'base', 'Sign up', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(257, 'auth.create_new', 'base', 'Create New', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(258, 'auth.email_verified', 'base', 'Email Verified', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(259, 'auth.resend_email', 'base', 'Resend Email', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(260, 'auth.set_admin_account', 'base', 'Please setup admin account.', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(261, 'auth.repeat_password', 'base', 'Repeat Password', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(262, 'auth.reset_password', 'base', 'Reset password', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(263, 'auth.forgot_password_note', 'base', 'If you forgot your password, well, then we\'ll email you instructions to reset your password.', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(264, 'auth.your_email_address', 'base', 'Your Email Address', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(265, 'auth.your_name', 'base', 'Your Name', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(266, 'auth.your_full_name', 'base', 'Your Full Name', 'auth, global', 'system', 'any', 0, '2022-10-18 20:39:59', '2022-10-18 20:39:59'),
(267, 'auth.your_mobile', 'base', 'Your Mobile Number', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(268, 'auth.enter_full_name', 'base', 'Enter Full Name', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(269, 'auth.enter_email_address', 'base', 'Enter Email Address', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(270, 'auth.enter_mobile', 'base', 'Enter Mobile Number', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(271, 'auth.enter_password', 'base', 'Enter Password', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(272, 'auth.reset_link', 'base', 'Send Reset Link', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(273, 'auth.return_login', 'base', 'Return to login', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(274, 'auth.agree', 'base', 'I agree to the', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(275, 'auth.agree_and', 'base', 'and', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(276, 'auth.agree_terms', 'base', 'By registering you agree to the terms and conditions.', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(277, 'auth.agree_confirm', 'base', 'You should accept our terms and policy.', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(278, 'auth.create_account', 'base', 'Create Account', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(279, 'auth.already_account', 'base', 'Already have an account ?', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(280, 'auth.sign_instead', 'base', 'Sign in instead', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(281, 'auth.verify_email', 'base', 'Please verify your email address.', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(282, 'auth.cancel_signup', 'base', 'Cancel Signup', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(283, 'auth.sign_out', 'base', 'Sign Out', 'auth, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(284, 'dashboard.main_site', 'base', 'Main Site', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(285, 'dashboard.title_user_dashboard', 'base', 'User Dashboard', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(286, 'dashboard.title_user_transactions', 'base', 'User Transactions', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(287, 'dashboard.title_user_account', 'base', 'User Account', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(288, 'dashboard.title_user_token', 'base', ':symbol Token Balance', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(289, 'dashboard.title_token', 'base', 'My Token', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(290, 'dashboard.title_kyc', 'base', 'KYC Application', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(291, 'dashboard.title_dashboard', 'base', 'Dashboard', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:00', '2022-10-18 20:40:00'),
(292, 'dashboard.title_transactions', 'base', 'Transactions', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(293, 'dashboard.title_profile', 'base', 'Profile', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(294, 'dashboard.kyc_details', 'base', 'User KYC Details', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(295, 'dashboard.id_verification', 'base', 'Begin ID-Verification', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(296, 'dashboard.buy_token', 'base', 'Buy Token', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(297, 'dashboard.current_price', 'base', 'Current Price', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(298, 'dashboard.buy_token_now', 'base', 'Buy Token Now', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(299, 'dashboard.kyc_approved', 'base', 'KYC Approved', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(300, 'dashboard.kyc_application', 'base', 'KYC Application', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01');
INSERT INTO `translates` (`id`, `key`, `name`, `text`, `pages`, `group`, `panel`, `load`, `created_at`, `updated_at`) VALUES
(301, 'dashboard.kyc_pending', 'base', 'KYC Pending', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(302, 'dashboard.submit_kyc', 'base', 'Submit KYC', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(303, 'dashboard.your_contribution_in', 'base', 'Your Contribution in', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(304, 'dashboard.token_balance', 'base', 'Token Balance', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(305, 'dashboard.token_name', 'base', 'Token Name', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(306, 'dashboard.token_symbol', 'base', 'Token Symbol', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(307, 'dashboard.white_paper', 'base', 'White Paper', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(308, 'dashboard.contact_support', 'base', 'Contact Support', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(309, 'dashboard.my_profile', 'base', 'My Profile', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(310, 'dashboard.referral', 'base', 'Referral', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(311, 'dashboard.referral_url', 'base', 'Referral URL', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:01', '2022-10-18 20:40:01'),
(312, 'dashboard.referral_lists', 'base', 'Referral Lists', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(313, 'dashboard.activity', 'base', 'Activity', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(314, 'dashboard.download_whitepaper', 'base', 'Download Whitepaper', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(315, 'dashboard.add_wallet_befor', 'base', 'Add your wallet address before buy', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(316, 'dashboard.account_status', 'base', 'Your Account Status', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(317, 'dashboard.receiving_wallet', 'base', 'Receiving Wallet', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(318, 'dashboard.new_address', 'base', 'New address under review for approve.', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(319, 'dashboard.your_wallet', 'base', 'Add Your Wallet Address', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(320, 'dashboard.earn_with_referral', 'base', 'Earn with Referral', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(321, 'dashboard.invite_friends', 'base', 'Invite your friends & family.', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(322, 'dashboard.refer_link', 'base', 'Use above link to refer your friend and get referral bonus.', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(323, 'dashboard.contact_support_team', 'base', 'Contact our support team via email', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(324, 'dashboard.current_bonus', 'base', 'Current Bonus', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(325, 'dashboard.start_date', 'base', 'Start Date', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(326, 'dashboard.end_date', 'base', 'End Date', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:02', '2022-10-18 20:40:02'),
(327, 'dashboard.bonus_start_in', 'base', 'The Bonus Start in', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(328, 'dashboard.bonus_end_in', 'base', 'The Bonus End in', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(329, 'dashboard.token_sales_progress', 'base', 'Token Sales Progress', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(330, 'dashboard.raised', 'base', 'Raised', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(331, 'dashboard.total', 'base', 'Total', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(332, 'dashboard.sales_end_in', 'base', 'Sales End in', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(333, 'dashboard.sales_end_at', 'base', 'Sales End at', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(334, 'dashboard.sales_start_in', 'base', 'Sales Start in', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(335, 'dashboard.sales_start_at', 'base', 'Sales Start at', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(336, 'dashboard.raised_amount', 'base', 'Raised Amount', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(337, 'dashboard.total_token', 'base', 'Total Token', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(338, 'dashboard.hard_cap', 'base', 'Hard Cap', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(339, 'dashboard.hardcap', 'base', 'Hardcap', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(340, 'dashboard.soft_cap', 'base', 'Soft Cap', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(341, 'dashboard.softcap', 'base', 'Softcap', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(342, 'dashboard.token_sales_finished', 'base', 'Our token sales has been finished. Thank you very much for your contribution.', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(343, 'dashboard.view_transaction', 'base', 'View Transaction', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(344, 'dashboard.tranx_types', 'base', 'Types', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(345, 'dashboard.tranx_type', 'base', 'Type', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(346, 'dashboard.purchased_title', 'base', 'Purchased', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(347, 'dashboard.user_name', 'base', 'User Name', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(348, 'dashboard.title_note', 'base', 'Note:', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(349, 'dashboard.title_details', 'base', 'Details', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:03', '2022-10-18 20:40:03'),
(350, 'dashboard.oops', 'base', 'Oops!!!', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(351, 'dashboard.token_title', 'base', 'My :symbol Token', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(352, 'dashboard.buy_more', 'base', 'Buy More Token', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(353, 'dashboard.equivalent_to', 'base', 'Equivalent to', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(354, 'dashboard.total_token_amount', 'base', 'Total Token Amount', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(355, 'dashboard.purchased_token', 'base', 'Purchased Token', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(356, 'dashboard.referral_token', 'base', 'Referral Token', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(357, 'dashboard.bonuses_token', 'base', 'Bonuses Token', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(358, 'dashboard.total_contributed', 'base', 'Total Contributed', 'dashboard, global', 'system', 'any', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(359, 'profile.profile_details', 'base', 'Profile Details', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(360, 'profile.email_confirm', 'base', 'Your password will only change after your confirmation by email.', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(361, 'profile.personal_data', 'base', 'Personal Data', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(362, 'profile.settings', 'base', 'Settings', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(363, 'profile.full_name', 'base', 'Full Name', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(364, 'profile.email_address', 'base', 'Email Address', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(365, 'profile.mobile_number', 'base', 'Mobile Number', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(366, 'profile.date_of_birth', 'base', 'Date of Birth', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(367, 'profile.nationality', 'base', 'Nationality', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:04', '2022-10-18 20:40:04'),
(368, 'profile.select_country', 'base', 'Select Country', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(369, 'profile.update_profile', 'base', 'Update Profile', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(370, 'profile.security_settings', 'base', 'Security Settings', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(371, 'profile.save_activities_log', 'base', 'Save my activities log', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(372, 'profile.confirm_email', 'base', 'Confirm me through email before password change', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(373, 'profile.manage_notification', 'base', 'Manage Notification', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(374, 'profile.resumption_notify', 'base', 'Notify me by email about resumption of sales', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(375, 'profile.sales_notify', 'base', 'Notify me by email about sales and latest news', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(376, 'profile.unusual_activity', 'base', 'Alert me by email in case of unusual activity in my account', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(377, 'profile.update', 'base', 'Update', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(378, 'profile.old_password', 'base', 'Old Password', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(379, 'profile.new_password', 'base', 'New Password', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(380, 'profile.confirm_password', 'base', 'Confirm New Password', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(381, 'profile.min_6_digit', 'base', 'Password should be a minimum of 6 digits and include lower and uppercase letter.', 'user_profile, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(382, 'profile.activitiy_log', 'base', 'Account Activities Log', 'user_profile, user_activity, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(383, 'profile.activitiy_clear', 'base', 'Clear All', 'user_profile, user_activity, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(384, 'profile.activitiy_note', 'base', 'Here is your recent activities. You can clear this log as well as disable the feature from profile settings tabs.', 'user_profile, user_activity, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(385, 'profile.activitiy_date', 'base', 'Date', 'user_profile, user_activity, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(386, 'profile.activitiy_device', 'base', 'Device', 'user_profile, user_activity, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(387, 'profile.activitiy_browser', 'base', 'Browser', 'user_profile, user_activity, global', 'system', 'user', 0, '2022-10-18 20:40:05', '2022-10-18 20:40:05'),
(388, 'profile.activitiy_ip', 'base', 'IP', 'user_profile, user_activity, global', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(389, 'profile.activitiy_delete_log', 'base', 'Once Delete, You will not get back this log in future!', 'user_profile, user_activity, global', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(390, 'profile.tranx_list', 'base', 'Transactions list', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(391, 'profile.tranx_amount', 'base', 'Amount', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(392, 'profile.tranx_from', 'base', 'From', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(393, 'profile.tranx_to', 'base', 'To', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(394, 'profile.tranx_pay', 'base', 'Pay', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(395, 'profile.token_types', 'base', 'Token Types', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(396, 'profile.tokens', 'base', 'Tokens', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(397, 'profile.tranx_no', 'base', 'Tranx NO', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(398, 'profile.no_data', 'base', 'No data available in table', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(399, 'profile.no_records', 'base', 'No records', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(400, 'profile.search_placeholder', 'base', 'Type in to Search', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(401, 'profile.cap_types', 'base', 'TYPES', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(402, 'profile.any_type', 'base', 'Any Type', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(403, 'profile.purchase', 'base', 'Purchase', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(404, 'profile.cap_status', 'base', 'STATUS', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:06', '2022-10-18 20:40:06'),
(405, 'profile.cap_show_all', 'base', 'Show All', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(406, 'profile.approved', 'base', 'Approved', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(407, 'profile.pending', 'base', 'Pending', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(408, 'profile.canceled', 'base', 'Canceled', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(409, 'profile.status', 'base', 'Status', 'user_profile, user_transaction', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(410, 'kyc.verify_title', 'base', 'KYC Verification', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(411, 'kyc.verify_title_sub', 'base', 'To comply with regulations each participant is required to go through identity verification (KYC/AML) to prevent fraud, money laundering operations, transactions banned under the sanctions regime or those which fund terrorism. Please, complete our fast and secure verification process to participate in token offerings.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(412, 'kyc.identity_title', 'base', 'Identity Verification - KYC', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(413, 'kyc.identity_desc', 'base', 'To comply with regulation, participant will have to go through identity verification.', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(414, 'kyc.form_not_submitted', 'base', 'You have not submitted your necessary documents to verify your identity.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(415, 'kyc.form_submit', 'base', 'It would great if you please submit the form. If you have any question, please feel free to contact our support team.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(416, 'kyc.complete_kyc', 'base', 'Click here to complete your KYC', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(417, 'kyc.completed_kyc', 'base', 'You have completed the process of KYC', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(418, 'kyc.waiting_id_verify', 'base', 'We are still waiting for your identity verification. Once our team verified your identity, you will be notified by email. You can also check your KYC compliance status from your profile page.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(419, 'kyc.back_to_profile', 'base', 'Back to Profile', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(420, 'kyc.under_process', 'base', 'Your application verification under process.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(421, 'kyc.still_working', 'base', 'We are still working on your identity verification. Once our team verified your identity, you will be notified by email.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(422, 'kyc.resubmit_form', 'base', 'In our verification process, we found information that is incorrect or missing. Please resubmit the form. In case of any issues with the submission please contact our support team.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:07', '2022-10-18 20:40:07'),
(423, 'kyc.submit_again', 'base', 'Submit Again', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(424, 'kyc.verified_title', 'base', 'Your identity verified successfully.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(425, 'kyc.verified_desc', 'base', 'One of our team members verified your identity. Now you can participate in our token sale. Thank you.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(426, 'kyc.info_missing', 'base', 'We found some information to be missing.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(427, 'kyc.form_rejected', 'base', 'Sorry! Your application was rejected.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(428, 'kyc.verify_head', 'base', 'Begin your ID-Verification', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(429, 'kyc.verify_text', 'base', 'In order to purchase our tokens, please verify your identity.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(430, 'kyc.verify_text_token', 'base', 'Verify your identity to participate in token sale.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(431, 'kyc.not_submitted', 'base', 'You have not submitted your documents to verify your identity (KYC).', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(432, 'kyc.click_proceed', 'base', 'Click to Proceed', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(433, 'kyc.document_received', 'base', 'We have received your document.', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(434, 'kyc.review_information', 'base', 'We will review your information and if all is in order will approve your identity. You will be notified by email once we verified your identity (KYC).', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(435, 'kyc.kyc_rejected', 'base', 'KYC Application has been rejected!', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(436, 'kyc.resubmit_application', 'base', 'We were having difficulties verifying your identity. In our verification process, we found information are incorrect or missing. Please re-submit the application again and verify your identity.', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(437, 'kyc.resubmit', 'base', 'Resubmit', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(438, 'kyc.kyc_verified', 'base', 'Identity (KYC) has been verified.', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(439, 'kyc.token_sale', 'base', 'One for our team verified your identity. You are eligible to participate in our token sale.', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(440, 'kyc.purchase_token', 'base', 'Purchase Token', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(441, 'kyc.kyc_verification_required', 'base', 'KYC verification required for purchase token', 'dashboard, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(442, 'kyc.form.personal_details', 'base', 'Personal Details', 'kyc, kyc_form, global', 'system', 'user', 0, '2022-10-18 20:40:08', '2022-10-18 20:40:08'),
(443, 'kyc.form.personal_details_sub', 'base', 'Your basic personal information is required for identification purposes.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(444, 'kyc.form.personal_details_note', 'base', 'Please type carefully and fill out the form with your personal details. You are not allowed to edit the details once you have submitted the application.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(445, 'kyc.form.first_name', 'base', 'First Name', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(446, 'kyc.form.last_name', 'base', 'Last Name', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(447, 'kyc.form.phone_number', 'base', 'Phone Number', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(448, 'kyc.form.gender', 'base', 'Gender', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(449, 'kyc.form.select_gender', 'base', 'Select Gender', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(450, 'kyc.form.male', 'base', 'Male', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(451, 'kyc.form.female', 'base', 'Female', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(452, 'kyc.form.other', 'base', 'Other', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(453, 'kyc.form.telegram_username', 'base', 'Telegram Username', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(454, 'kyc.form.your_address', 'base', 'Your Address', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(455, 'kyc.form.country', 'base', 'Country', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(456, 'kyc.form.state', 'base', 'State', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(457, 'kyc.form.city', 'base', 'City', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(458, 'kyc.form.postal_code', 'base', 'Zip / Postal Code', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(459, 'kyc.form.address_line_1', 'base', 'Address Line 1', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(460, 'kyc.form.address_line_2', 'base', 'Address Line 2', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(461, 'kyc.form.document_upload', 'base', 'Document Upload', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:09', '2022-10-18 20:40:09'),
(462, 'kyc.form.scan_documents', 'base', 'To verify your identity, we ask you to upload high-quality scans or photos of your official identification documents issued by the government.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(463, 'kyc.form.upload_documents', 'base', 'In order to complete, please upload any of the following personal documents.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(464, 'kyc.form.passport', 'base', 'Passport', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(465, 'kyc.form.national_id_card', 'base', 'National ID Card', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(466, 'kyc.form.driver_license', 'base', 'Driver’s License', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(467, 'kyc.form.check_requirements', 'base', 'To avoid delays with verification process, please double-check to ensure the below requirements are fully met:', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(468, 'kyc.form.visible_documents', 'base', 'Document should be in good condition and clearly visible.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(469, 'kyc.form.no_glare', 'base', 'There is no light glare or reflections on the card.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(470, 'kyc.form.not_expire_credentials', 'base', 'Chosen credential must not be expired.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(471, 'kyc.form.file_limitation', 'base', 'File is at least 1 MB in size and has at least 300 dpi resolution.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(472, 'kyc.form.drag_and_drop_file', 'base', 'Drag and drop file', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(473, 'kyc.form.select', 'base', 'Select', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(474, 'kyc.form.or', 'base', 'or', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(475, 'kyc.form.upload_doc_copy', 'base', 'Upload Here Your :doctype Copy', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(476, 'kyc.form.nid_back_side', 'base', 'Upload Here Your National ID Back Side', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(477, 'kyc.form.photo_selfie', 'base', 'Upload a selfie as a Photo Proof while holding document in your hand', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(478, 'kyc.form.paying_wallet', 'base', 'Your Paying Wallet', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(479, 'kyc.form.paying_wallet_submit', 'base', 'Submit your wallet address that you are going to send funds', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(480, 'kyc.form.paying_wallet_note', 'base', 'DO NOT USE your exchange wallet address such as Kraken, Bitfinex, Bithumb, Binance etc.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(481, 'kyc.form.select_wallet', 'base', 'Select Wallet', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(482, 'kyc.form.enter_your_wallet', 'base', 'Enter your wallet address', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(483, 'kyc.form.your_wallet_address', 'base', 'Your personal wallet address', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(484, 'kyc.form.agree_terms', 'base', 'I have read the', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:10', '2022-10-18 20:40:10'),
(485, 'kyc.form.agree_info', 'base', 'All the personal information I have entered is correct.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(486, 'kyc.form.agree_individual', 'base', 'I certify that, I am registering to participate in the token distribution event(s) in the capacity of an individual (and beneficial owner) and not as an agent or representative of a third party corporate entity.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(487, 'kyc.form.agree_final', 'base', 'I understand that, I can participate in the token distribution event(s) only with the wallet address that was entered in the application form.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(488, 'kyc.form.proceed', 'base', 'Proceed to Verify', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(489, 'kyc.form.confirm_terms', 'base', 'You should read our terms and policy.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(490, 'kyc.form.confirm_info', 'base', 'Confirm that all information is correct.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(491, 'kyc.form.confirm_individual', 'base', 'Certify that you are individual.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(492, 'kyc.form.confirm_final', 'base', 'Confirm that you understand.', 'kyc', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(493, 'buy_token.sale_start_soon', 'base', 'Our sale will start soon. Please check back at a later date/time or feel free to contact us.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(494, 'buy_token.calculate', 'base', 'Choose currency and calculate :SYMBOL token price', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(495, 'buy_token.choose_currency', 'base', 'You can buy our :SYMBOL token using the below currency choices to become part of our project.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(496, 'buy_token.amount_of_contribute', 'base', 'Amount of contribute', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(497, 'buy_token.contribute_amout', 'base', 'Enter the amount you would like to contribute in order to calculate the amount of tokens you will receive. The calculator below helps to convert the required quantity of tokens into the amount of your selected currency.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(498, 'buy_token.minimum_amount', 'base', 'Minimum contribution amount is required.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(499, 'buy_token.bonus', 'base', 'Bonus', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(500, 'buy_token.on_sale', 'base', 'On Sale', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(501, 'buy_token.sale_bonus', 'base', 'Sale Bonus', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(502, 'buy_token.amount_bonus', 'base', 'Amount Bonus', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(503, 'buy_token.exchange_note', 'base', 'Your contribution will be calculated based on exchange rate at the moment when your transaction is confirmed.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(504, 'buy_token.payment_button', 'base', 'Make Payment', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(505, 'buy_token.token_note', 'base', 'Tokens will appear in your account after payment successfully made and approved by our team. Please note that, :SYMBOL token will be distributed after the token sales end-date.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(506, 'buy_token.token_sales', 'base', 'Token Sales', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(507, 'buy_token.token_price', 'base', 'Token Price', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(508, 'buy_token.exchange_rate', 'base', 'Exchange Rate', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:11', '2022-10-18 20:40:11'),
(509, 'buy_token.end_at', 'base', 'End at', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(510, 'buy_token.choose_method', 'base', 'You can choose any of following payment method to make your payment. The token balance will appear in your account after successful payment.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(511, 'buy_token.select_method', 'base', 'Select payment method:', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(512, 'buy_token.appear_address', 'base', 'Our payment address will appear or redirect you for payment after your order placed.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(513, 'buy_token.charge_fee', 'base', 'Payment gateway may charge you a processing fees.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(514, 'buy_token.maximum_amount_reached', 'base', 'Maximum amount reached, You can purchase maximum :amount :symbol per transaction.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(515, 'buy_token.purchase_minimum_amount', 'base', 'You must purchase minimum :amount :symbol.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(516, 'buy_token.sales_finished', 'base', 'Our sales has been finished. Thank you very much for your interest.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(517, 'buy_token.token_not_available', 'base', ':amount :symbol Token is not available.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(518, 'buy_token.available_amount', 'base', 'Available :amount :symbol only, You can purchase less than :amount :symbol Token.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(519, 'buy_token.transaction_may_deleted', 'base', 'Sorry, we\'re unable to proceed the transaction. This transaction may deleted. Please contact with administrator.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(520, 'buy_token.transaction_already_status', 'base', 'Your transaction is already :status. Sorry, we\'re unable to proceed the transaction.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(521, 'buy_token.transaction_status_check_account', 'base', 'Your transaction is already :status. Please check your account balance.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:12', '2022-10-18 20:40:12'),
(522, 'buy_token.transaction_not_found', 'base', 'Transaction is not found!!', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(523, 'buy_token.transaction_not_valid', 'base', 'Transaction id or key is not valid!', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(524, 'buy_token.maximum_purchase', 'base', 'Maximum you can purchase :maximum_token token per contribution.', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(525, 'buy_token.minimum_token', 'base', 'Enter minimum :minimum_token token and select currency!', 'buy_token', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(526, 'payment.order.title', 'base', 'Confirmation Your Payment', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(527, 'payment.order.cancel_title', 'base', 'Oops! Payment Canceled!', 'payment, cancel', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(528, 'payment.order.cancel_desc', 'base', 'You have canceled your payment. If you continue to have issues, please contact us with order no. :orderid.', 'payment, cancel', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(529, 'payment.order.close', 'base', 'Close', 'payment, cancel', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(530, 'payment.order.placed', 'base', 'Your Order no. :orderid has been placed successfully.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(531, 'payment.order.pending', 'base', 'Your Order no. :orderid has been placed & waiting for payment.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(532, 'payment.order.onhold', 'base', 'Your Order no. :orderid has been placed & waiting for team approval.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(533, 'payment.info.crypto_amount', 'base', 'Please send :amount :currency to the address below. The token balance will appear in your account only after transaction gets :num confirmation and approved by our team.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(534, 'payment.info.crypto_receive', 'base', 'To receiving :token :symbol token, please send :amount :currency to the address below. The token balance will appear in your account only after transaction gets :num confirmation and approved by our team.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(535, 'payment.info.bank_amount', 'base', 'Please make your payment of :amount :currency through bank to the below bank address. The token balance will appear in your account only after your transaction gets approved by our team.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(536, 'payment.info.bank_receive', 'base', 'To receiving :token :symbol token, please make your payment of :amount :currency through bank to the below bank address. The token balance will appear in your account only after your transaction gets approved by our team.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(537, 'payment.info.gateway_amount', 'base', 'The token balance will appear in your account only after you transaction gets :num confirmations and approved by :gateway.', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(538, 'payment.info.gateway_receive', 'base', 'To receiving :token :symbol token, please make your payment of :amount :currency through :gateway. The token balance will appear in your account after we received your payment.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(539, 'payment.info.wallet_verify', 'base', 'To speed up verification process please enter your wallet address from where you\'ll transferring your amount to our address.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(540, 'payment.info.hash_verify', 'base', 'To speed up verification process, please enter your transaction hash or payment id.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(541, 'payment.wallet_address', 'base', 'Enter Your Wallet Address', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(542, 'payment.payment_address', 'base', 'Insert your payment address', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(543, 'payment.cancel_order', 'base', 'Cancel Order', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:13', '2022-10-18 20:40:13'),
(544, 'payment.select_method', 'base', 'Select your payment method.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(545, 'payment.note_hint', 'base', 'Do not make payment through exchange (Kraken, Bitfinex). You can use MyEtherWallet, MetaMask, Mist wallets etc.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(546, 'payment.note_alert', 'base', 'In case you send a different amount, number of :SYMBOL token will update accordingly.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(547, 'payment.note_redirect', 'base', 'Our payment address will appear or redirect you for payment after the order is placed.', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(548, 'payment.payment_process', 'base', 'Payment Process', 'payment, global', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(549, 'payment.payment_confirm', 'base', 'Confirm Payment', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(550, 'payment.skip_address', 'base', 'I\'ll provide wallet address later', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(551, 'payment.gas_limit', 'base', 'SET GAS LIMIT:', 'payment, offline', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(552, 'payment.gas_price', 'base', 'SET GAS PRICE:', 'payment, offline', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(553, 'payment.send_amount_to', 'base', 'Send Amount:', 'payment, order', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(554, 'payment.amount_with_bonus', 'base', 'Please make payment of :amount to receive :token_amount token including bonus :token_bonus token.', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(555, 'payment.amount_no_bonus', 'base', 'Please make payment of :amount to receive :token_amount token.', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(556, 'payment.deposit_title', 'base', 'Payment Address for Deposit', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(557, 'payment.deposit_address', 'base', 'Payment to the following :Name Wallet Address', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(558, 'payment.deposit_address_or_scan', 'base', 'Payment to the following :Name Wallet Address Or scan the QR code', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(559, 'payment.scan_code', 'base', 'Scan QR code to payment.', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(560, 'payment.agree_terms', 'base', 'I hereby agree to the token purchase agreement and token sale term.', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(561, 'payment.no_method', 'base', 'Sorry! There is no payment method available for this currency. Please choose another currency or contact our support team.', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(562, 'payment.review_title', 'base', 'We\'re reviewing your payment.', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(563, 'payment.review_desc', 'base', 'We\'ll review your transaction and get back to your within 6 hours. You\'ll receive an email with the details of your contribution.', 'payment, manual', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(564, 'payment.already_paid', 'base', 'Click here if you already paid', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(565, 'payment.bellow_address', 'base', 'Make your payment to the below address', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(566, 'payment.check_status', 'base', 'Check Status', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(567, 'payment.gateway_status', 'base', 'Check status on :gateway', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(568, 'payment.send_amount', 'base', 'Please send :amount :currency to the address below.', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:14', '2022-10-18 20:40:14'),
(569, 'payment.pay_or_cancel', 'base', 'Click the Pay button below to make payment for this transaction, or you can cancel this transaction.', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(570, 'payment.refunded_token', 'base', 'Refunded Token', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(571, 'payment.refunded_amount', 'base', 'Refunded Amount', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(572, 'payment.refund_note', 'base', 'Refund Note', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(573, 'payment.we_have_received_payment', 'base', 'Thank you, we have received your payment!', 'payment, online', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(574, 'payment.bank_details', 'base', 'Bank Details for Payment', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(575, 'payment.bank_note', 'base', 'The token balance will appear in your account only after your transaction gets approved by our team.', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(576, 'payment.bank_iban', 'base', 'IBAN', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(577, 'payment.bank_name', 'base', 'Bank Name', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(578, 'payment.bank_address', 'base', 'Bank Address', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(579, 'payment.bank_routing', 'base', 'Routing Number', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(580, 'payment.bank_swift', 'base', 'Swift/BIC', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(581, 'payment.bank_account_name', 'base', 'Account Name', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(582, 'payment.bank_account_number', 'base', 'Account Number', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(583, 'payment.bank_account_address', 'base', 'Account Holder Address', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(584, 'payment.bank_make_payment', 'base', 'Make Payment to the Following Bank Account', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(585, 'payment.bank_referance', 'base', 'Use this transaction id (#:orderid) as reference. Make your payment within 24 hours, If we will not received your payment within 24 hours, then we will cancel the transaction.', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(586, 'payment.pay_via', 'base', 'Pay via', 'payment, bank', 'system', 'user', 0, '2022-10-18 20:40:15', '2022-10-18 20:40:15'),
(587, 'tranx.details', 'base', 'Transaction Details', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(588, 'tranx.order_no', 'base', 'The order no. :orderid was placed on :datetime.', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(589, 'tranx.successfully_paid', 'base', 'You have successfully paid this transaction', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(590, 'tranx.via', 'base', 'via', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(591, 'tranx.wallet', 'base', 'wallet', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(592, 'tranx.order_failed', 'base', 'Sorry! Your order has been :status due to payment.', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(593, 'tranx.canceled_transfer_request', 'base', 'The transfer request was canceled at :time.', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(594, 'tranx.under_review', 'base', 'The transaction is currently under review. We will send you an email once our review is complete.', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(595, 'tranx.canceled_admin', 'base', 'The transaction was canceled by Administrator at :time.', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(596, 'tranx.canceled_user', 'base', 'You have canceled this transaction.', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(597, 'tranx.approved_admin', 'base', 'Transaction has been approved at :time.', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16');
INSERT INTO `translates` (`id`, `key`, `name`, `text`, `pages`, `group`, `panel`, `load`, `created_at`, `updated_at`) VALUES
(598, 'tranx.token_details', 'base', 'Token Details', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(599, 'tranx.token_of_stage', 'base', 'Token of Stage', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(600, 'tranx.token_amount', 'base', 'Token Amount (T)', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(601, 'tranx.bonus_token', 'base', 'Bonus Token (B)', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(602, 'tranx.offline_payment', 'base', 'Offline Payment', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(603, 'tranx.online_payment', 'base', 'Online Payment', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(604, 'tranx.issue_occured', 'base', 'Sorry, seems there is an issues occurred and we couldn’t process your request. Please contact us with your order no. :orderid, if you continue to having the issues.', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(605, 'tranx.total_payment', 'base', 'Total Payment', 'transaction, global', 'system', 'user', 0, '2022-10-18 20:40:16', '2022-10-18 20:40:16'),
(606, 'wallet.do_not_use', 'base', 'DO NOT USE your exchange wallet address OR if you don\'t have a private key of the your address. You WILL NOT receive your token and WILL LOSE YOUR FUNDS if you do.', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(607, 'wallet.erc_address', 'base', 'Address should be ERC20-compliant.', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(608, 'wallet.receive_info', 'base', 'In order to receive your :SYMBOL token, please select your wallet address and you have to put the address below input box. You will receive :SYMBOL token to this address after the token sale end.', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(609, 'wallet.current', 'base', 'Current Wallet', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(610, 'wallet.type', 'base', 'Wallet Type', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(611, 'wallet.receive_address', 'base', ':Name Wallet Address for receiving token', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(612, 'wallet.add_wallet', 'base', 'Add Wallet', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(613, 'wallet.enter_wallet', 'base', 'Enter your :Name wallet address', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(614, 'wallet.enter_new_wallet', 'base', 'Enter your new :Name wallet address', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(615, 'wallet.request', 'base', 'Request for change', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(616, 'wallet.request_update', 'base', 'Request for Update Wallet', 'user_wallet', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(617, 'status.approved', 'base', 'Approved', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:17', '2022-10-18 20:40:17'),
(618, 'status.pending', 'base', 'Pending', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(619, 'status.progress', 'base', 'Progress', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(620, 'status.rejected', 'base', 'Rejected', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(621, 'status.warning', 'base', 'Warning', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(622, 'status.success', 'base', 'Success', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(623, 'status.running', 'base', 'Running', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(624, 'status.upcoming', 'base', 'Upcoming', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(625, 'status.completed', 'base', 'Completed', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(626, 'status.expired', 'base', 'Expired', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(627, 'status.pause', 'base', 'Pause', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(628, 'status.inactive', 'base', 'Inactive', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(629, 'status.edit', 'base', 'Edit', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(630, 'status.add', 'base', 'Add', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(631, 'status.see', 'base', 'See', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(632, 'status.more', 'base', 'More', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(633, 'status.view', 'base', 'View', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(634, 'status.enable', 'base', 'Enable', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(635, 'status.enabled', 'base', 'Enabled', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(636, 'status.disable', 'base', 'Disable', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:18', '2022-10-18 20:40:18'),
(637, 'status.disabled', 'base', 'Disabled', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(638, 'status.proceed', 'base', 'Proceed', 'status, global', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(639, 'auth.2fa.hello', 'base', 'Hello', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(640, 'auth.2fa.title', 'base', '2FA', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(641, 'auth.2fa.reset_2fa', 'base', 'Reset 2FA', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(642, 'auth.2fa.enable_2fa', 'base', 'Enable 2FA', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(643, 'auth.2fa.confirm_2fa', 'base', 'Confirm 2FA', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(644, 'auth.2fa.disable_2fa', 'base', 'Disable 2FA', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(645, 'auth.2fa.current_status', 'base', 'Current Status:', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(646, 'auth.2fa.authentication', 'base', '2FA Authentication', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(647, 'auth.2fa.two-factor_verification', 'base', 'Two-Factor Verification', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(648, 'auth.2fa.verify_code', 'base', 'Enter the Code to verify', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(649, 'auth.2fa.reset_authentication', 'base', 'Reset 2FA Authentication', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(650, 'auth.2fa.authentication_code', 'base', 'Enter your authentication code', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(651, 'auth.2fa.google_code', 'base', 'Enter Google Authenticator Code', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(652, 'auth.2fa.auth', 'base', 'Two-factor authentication is a method for protection of your account. When it is activated you are required to enter not only your password, but also a special code. You can receive this code in mobile app. Even if third party gets access to your password, they still won\'t be able to access your account without the 2FA code.', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(653, 'auth.2fa.lost_access', 'base', 'If you lost your phone or uninstall the Google Authenticator app, then you will lost access of your account.', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(654, 'auth.2fa.step_2', 'base', 'Step 2:', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(655, 'auth.2fa.scan_qr_code', 'base', 'Scan the below QR code by your Google Authenticator app, or you can add account manually.', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(656, 'auth.2fa.manually_add_account', 'base', 'Manually add Account:', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(657, 'auth.2fa.account_name', 'base', 'Account Name:', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(658, 'auth.2fa.key', 'base', 'Key:', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(659, 'auth.2fa.verification_code', 'base', 'Enter the verification code generated by your mobile application (Google Authenticator).', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:19', '2022-10-18 20:40:19'),
(660, 'auth.2fa.contact_us', 'base', 'If you lost your phone or Uninstall the Google Authenticator app and enable to access your account please contact with us.', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(661, 'auth.2fa.step_1', 'base', 'Step 1:', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(662, 'auth.2fa.install_this_app_from', 'base', 'Install this app from', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(663, 'auth.2fa.google_play', 'base', 'Google Play', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(664, 'auth.2fa.store_or', 'base', 'store or', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(665, 'auth.2fa.app_store', 'base', 'App Store', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(666, 'auth.2fa.reset_auth', 'base', 'Please enter your account password to reset 2FA authentication.', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(667, 'auth.2fa.invalid', 'base', 'You have provide a invalid 2FA authentication code!', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(668, 'auth.2fa.wrong', 'base', 'Please enter a valid authentication code!', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(669, 'auth.2fa.enabled', 'base', 'Successfully enable 2FA security in your account.', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(670, 'auth.2fa.disabled', 'base', 'Successfully disable 2FA security in your account.', 'user_2fa', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(671, 'transfer.send_token_friend', 'base', 'Send Token to Your Friend', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(672, 'transfer.available_token_balance', 'base', 'Available Token Balance:', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(673, 'transfer.receiver_email', 'base', 'Receiver/Friend Email', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(674, 'transfer.enter_receiver_email', 'base', 'Enter receiver email', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(675, 'transfer.enter_valid_email_address', 'base', 'Enter a valid email address, which is associated with our platform.', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(676, 'transfer.enter_token_number', 'base', 'Enter token number', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(677, 'transfer.minimum_send', 'base', 'Minimum Send: :amount :symbol', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(678, 'transfer.you_do_not_have_token', 'base', 'You do not have enough token to send.', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(679, 'transfer.you_can_not_send_token_now', 'base', 'You can not send token right now.', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(680, 'transfer.enter_number_of_token', 'base', 'Enter number of token you would like to send.', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(681, 'transfer.please_enter_minimum', 'base', 'Please enter minimum number of token.', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:20', '2022-10-18 20:40:20'),
(682, 'transfer.before_clicking_proceed', 'base', 'Before clicking the &quot;Proceed&quot; button, be sure that you want to send token. You can not cancel the request once you proceed.', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(683, 'transfer.can_not_send_token_to_friend', 'base', 'Sorry! right now you can not send token to your friend account. Please contact us if you have any question.', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(684, 'transfer.invite_your_friend_send_token', 'base', 'You can invite your friend to join our platform and also you can send your token to your friend using his email address.', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(685, 'transfer.see_transactions', 'base', 'See Transactions', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(686, 'transfer.send_token', 'base', 'Send Token', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(687, 'transfer.token_send_to', 'base', 'Token Send To', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(688, 'transfer.token_receive_from', 'base', 'Token Receive From', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(689, 'transfer.transfered_tokens', 'base', 'Transfered Tokens', 'transfer, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(690, 'withdraw.withdrawal', 'base', 'Withdrawal', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(691, 'withdraw.withdraw_wallet', 'base', 'Withdraw Wallet', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(692, 'withdraw.reference_hash', 'base', 'Reference Hash', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(693, 'withdraw.Wwithdraw_details', 'base', 'Withdraw Details', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(694, 'withdraw.request_at', 'base', 'Request At', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(695, 'withdraw.notes', 'base', 'Notes', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(696, 'withdraw.received_withdraw_request', 'base', 'We have received your withdraw request and our team will proceed shortly. We will send you an email once we have completed your withdraw.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(697, 'withdraw.withdraw_transaction', 'base', 'Withdraw transaction has been :status at :time.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(698, 'withdraw.canceled_withdraw_request', 'base', 'You have canceled the withdraw request.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(699, 'withdraw.token', 'base', 'Withdraw Token', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(700, 'withdraw.amount', 'base', 'Withdraw Amount (:TOKEN)', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(701, 'withdraw.minimum', 'base', 'Minimum Withdraw:', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(702, 'withdraw.choose_coin', 'base', 'Choose Coin', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(703, 'withdraw.on_same', 'base', 'Withdraw will be on same.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(704, 'withdraw.receiving_wallet_address', 'base', 'Wallet Address for Receiving', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(705, 'withdraw.your_wallet_address', 'base', 'Your wallet address', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:21', '2022-10-18 20:40:21'),
(706, 'withdraw.provide_valid_wallet_address', 'base', 'Provide a valid wallet address for withdraw your token.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(707, 'withdraw.your_will_get', 'base', 'Your will Get:', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(708, 'withdraw.withdraw', 'base', 'Withdraw', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(709, 'withdraw.do_not_have_token_to_withdraw', 'base', 'You do not have enough token to withdraw.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(710, 'withdraw.can_not_withdraw', 'base', 'You can not withdraw right now.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(711, 'see_', 'base', 'Withdraw History', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(712, 'withdraw.id', 'base', 'Withdraw ID', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(713, 'withdraw.wallet', 'base', 'Wallet Address', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(714, 'withdraw.information', 'base', 'Information', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(715, 'withdraw.enter_wallet', 'base', 'Enter your wallet address for withdraw.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(716, 'withdraw.can_not_withdraw_token', 'base', 'Sorry! right now you can not withdraw token. Please contact us if you have any question.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(717, 'withdraw.withdraw_funds_process', 'base', 'You can withdraw the your funds and we will process soon.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(718, 'withdraw.withdraw_your_token', 'base', 'Withdraw Your Token', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(719, 'withdraw.withdraw_your_token_any_time', 'base', 'You can withdraw your token any time, we will processed withing 24 hours after your withdraw request.', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(720, 'withdraw.see_history', 'base', 'See Withdraw History', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(721, 'withdraw.tokens_withdraw', 'base', 'Tokens Withdraw', 'withdraw, transaction', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(722, 'referral.referee', 'base', 'Referee', 'referral', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(723, 'referral.earn_token', 'base', 'Earn Token', 'referral', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(724, 'referral.bought_token', 'base', 'Bought Token', 'referral', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(725, 'referral.register_date', 'base', 'Register Date', 'referral', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(726, 'referral.no_one_join_yet!', 'base', 'No one join yet!', 'referral', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(727, 'referral.not_purchased', 'base', 'Not purchased yet', 'referral', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(728, 'referral.token_purchase', 'base', 'Token purchase by', 'referral', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(729, 'referral.referred_by', 'base', 'You are referred by', 'referral', 'system', 'user', 0, '2022-10-18 20:40:22', '2022-10-18 20:40:22'),
(730, 'referral.received_token', 'base', 'You have received bonus token.', 'referral', 'system', 'user', 0, '2022-10-18 20:40:23', '2022-10-18 20:40:23'),
(731, 'referral.refered_by', 'base', 'Your were invited by :userid', 'referral', 'system', 'user', 0, '2022-10-18 20:40:23', '2022-10-18 20:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `registerMethod` varchar(191) DEFAULT 'Email',
  `social_id` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `dateOfBirth` varchar(191) DEFAULT NULL,
  `nationality` varchar(191) DEFAULT NULL,
  `lastLogin` datetime NOT NULL,
  `walletType` varchar(191) DEFAULT NULL,
  `walletAddress` varchar(191) DEFAULT NULL,
  `role` enum('admin','manager','user') NOT NULL DEFAULT 'user',
  `contributed` double DEFAULT NULL,
  `tokenBalance` double DEFAULT NULL,
  `referral` varchar(191) DEFAULT NULL,
  `referralInfo` text DEFAULT NULL,
  `google2fa` int(11) NOT NULL DEFAULT 0,
  `google2fa_secret` text DEFAULT NULL,
  `type` enum('demo','main') NOT NULL DEFAULT 'main',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_metas`
--

CREATE TABLE `user_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `notify_admin` int(11) NOT NULL DEFAULT 0,
  `newsletter` int(11) NOT NULL DEFAULT 1,
  `unusual` int(11) NOT NULL DEFAULT 1,
  `save_activity` varchar(191) NOT NULL DEFAULT 'TRUE',
  `pwd_chng` varchar(191) NOT NULL DEFAULT 'TRUE',
  `pwd_temp` varchar(191) DEFAULT NULL,
  `email_expire` datetime DEFAULT NULL,
  `email_token` varchar(220) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_slug_unique` (`slug`);

--
-- Indexes for table `global_metas`
--
ALTER TABLE `global_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ico_metas`
--
ALTER TABLE `ico_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ico_stages`
--
ALTER TABLE `ico_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_payment_method_unique` (`payment_method`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translates`
--
ALTER TABLE `translates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_metas`
--
ALTER TABLE `user_metas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `global_metas`
--
ALTER TABLE `global_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ico_metas`
--
ALTER TABLE `ico_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ico_stages`
--
ALTER TABLE `ico_stages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translates`
--
ALTER TABLE `translates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=732;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_metas`
--
ALTER TABLE `user_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
