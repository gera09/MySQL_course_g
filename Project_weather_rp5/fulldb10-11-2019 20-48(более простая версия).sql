#
# TABLE STRUCTURE FOR: br
#

DROP TABLE IF EXISTS `br`;

CREATE TABLE `br` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trading_date` datetime DEFAULT NULL,
  `gtp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'GVIE0001',
  `tg` float unsigned DEFAULT NULL COMMENT '???????? ??????',
  `PminPDG` float unsigned DEFAULT NULL,
  `PmaxPDG` float unsigned DEFAULT NULL,
  `PVsvgo` float unsigned DEFAULT NULL,
  `PminVsvgo` float unsigned DEFAULT NULL,
  `PmaxVsvgo` float unsigned DEFAULT NULL,
  `PminBR` float unsigned DEFAULT NULL,
  `PmaxBR` float unsigned DEFAULT NULL,
  `IBR` float unsigned DEFAULT NULL,
  `CbUP` float unsigned DEFAULT NULL,
  `CbDown` float unsigned DEFAULT NULL,
  `CRSV` float unsigned DEFAULT NULL,
  `TotalBR` float unsigned DEFAULT NULL,
  `EVR` float unsigned DEFAULT NULL,
  `OCPU` float unsigned DEFAULT NULL,
  `OCPS` float unsigned DEFAULT NULL,
  `Pmin` float unsigned DEFAULT NULL,
  `Pmax` float unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trading_date` (`trading_date`),
  KEY `gtp` (`gtp`),
  CONSTRAINT `br_ibfk_1` FOREIGN KEY (`gtp`) REFERENCES `gtp` (`gtp`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('201', '1990-10-28 05:49:17', NULL, '206.872', '0', '5', '0', '6551400', '0', '0', '6678410', '315828', '170048', '8277190', '311984', '0', '4', '2', '5', '21', '0');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('202', '1971-11-12 17:01:45', NULL, '1', '1', '8', '164', '115488000', '1986', '0', '648045', '332485', '6880.49', '6824500', '580579', '26.0683', '3', '8', '8', '23417000', '67630000');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('203', '1997-12-21 11:29:06', NULL, '518603000', '6', '2', '856', '982030', '991', '0', '2487370', '0', '0', '656254000', '29124700', '57.5', '9', '6', '2', '94', '35');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('204', '2019-07-06 14:34:48', NULL, '223040', '5', '8', '8', '21774', '56817', '92771600', '8919.72', '81145', '0', '2728.1', '1429.95', '6996.96', '4', '4', '0', '791238000', '48234100');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('205', '1998-12-01 07:17:41', NULL, '1802.25', '6', '8', '23875900', '5645', '5', '25764.2', '7682.3', '673487', '16865900', '1571.27', '14034.7', '2996700', '2', '5', '8', '79563', '98058400');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('206', '2010-07-23 17:51:11', NULL, '56497000', '6', '8', '4', '421', '1', '47989600', '0', '27.6026', '35442300', '2398940', '28107.4', '4673280', '2', '7', '6', '334242', '3370');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('207', '1989-03-26 23:53:22', NULL, '12550100', '0', '4', '9427', '273277', '0', '0', '21480800', '77402.9', '577667', '11610800', '145422000', '5228930', '5', '2', '2', '357382', '0');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('208', '1986-01-26 16:11:00', NULL, '49.718', '9', '0', '31', '799440', '735743', '71.8325', '6674720', '334639', '47146900', '0', '16.5965', '2485.4', '6', '6', '1', '53764400', '1016');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('209', '1986-12-15 08:32:13', NULL, '72211200', '6', '1', '8370', '5104420', '753055', '169366', '935.028', '65.6', '510525', '0', '6643.34', '60584400', '8', '5', '4', '9869450', '0');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('210', '1989-06-21 20:40:44', NULL, '84.255', '6', '2', '153', '92', '3', '14275300', '2898960', '0.607557', '322547', '1564300', '3668450', '176.172', '4', '5', '8', '3065290', '408817000');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('211', '1970-09-11 09:58:57', NULL, '284101000', '9', '4', '6134', '8808500', '1117550', '271703', '25893', '6.216', '847863', '4310.51', '15863', '50.0268', '9', '8', '1', '472792', '427235000');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('212', '1970-06-23 11:17:41', NULL, '214124000', '1', '1', '673848000', '505533000', '402175000', '22217600', '0', '1772.49', '8.41334', '13722.4', '6.00225', '8.40837', '1', '0', '3', '31597', '308');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('213', '1995-08-24 06:20:09', NULL, '7879.84', '6', '0', '456', '408633', '10719600', '4.56882', '442.771', '2542.38', '385589000', '732305', '0', '422539', '2', '9', '5', '5', '74');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('214', '1991-04-03 10:08:30', NULL, '1011130', '7', '0', '38', '0', '9319', '71.7', '2', '720577', '2.208', '0.602191', '779451000', '1632400', '8', '1', '4', '288', '0');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('215', '1994-02-13 08:28:58', NULL, '3498920', '7', '3', '5', '0', '521', '198665', '0', '120376000', '3606010', '12500.6', '48862.4', '0', '1', '1', '4', '2984850', '5');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('216', '2011-10-03 16:08:00', NULL, '9.2', '8', '4', '1531930', '0', '0', '2146', '508524000', '0.761', '71.9425', '35569900', '340791', '18504.1', '2', '1', '1', '899', '142022000');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('217', '1972-05-24 18:20:46', NULL, '1617700', '9', '9', '1128380', '29885', '300', '115472000', '3170050', '55141300', '0', '1.46', '669.397', '85493600', '3', '1', '6', '87', '0');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('218', '1998-09-18 10:01:15', NULL, '336441', '0', '8', '76936', '49177', '59014300', '403441000', '1872.23', '21.163', '4472.3', '3282.31', '8.7468', '83799400', '6', '3', '6', '6236', '7684');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('219', '2016-11-23 03:31:17', NULL, '2409.76', '5', '4', '44', '2585', '612', '607281', '75.489', '6917.67', '3044120', '3427560', '21.1019', '0', '8', '1', '4', '25068400', '687');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('220', '2010-07-08 06:28:42', NULL, '403610000', '8', '3', '90521', '8868850', '169311000', '1896.64', '1', '133.455', '0', '1.009', '105093', '5.63311', '3', '2', '8', '132162', '63208');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('221', '2002-08-02 07:19:54', NULL, '0.775966', '5', '6', '986712', '11', '98', '11691100', '4.14369', '23076.8', '18048', '158', '0', '37278700', '7', '9', '4', '81922100', '191');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('222', '1984-11-02 03:18:42', NULL, '0', '2', '1', '18175100', '927', '802719000', '2833.77', '193920000', '304101', '45114', '48863000', '60674.4', '8842730', '7', '7', '5', '70751', '0');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('223', '2017-03-07 11:43:34', NULL, '0', '9', '1', '646920000', '311580', '125791', '245303', '2042.1', '142.125', '325.121', '17240.1', '65935.7', '14086500', '9', '4', '9', '838', '37');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('224', '1983-06-01 11:24:57', NULL, '378', '1', '9', '339239', '643111', '338637000', '399473', '19082.7', '7783.23', '6493940', '80.4751', '0.1161', '2495740', '8', '6', '6', '82671000', '51');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('225', '1994-06-29 14:27:15', NULL, '29.54', '3', '5', '31362', '0', '716427', '0', '359439', '1800.15', '46506.3', '2.86055', '1', '3613.97', '7', '4', '0', '91686700', '0');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('226', '1973-10-19 11:49:57', NULL, '0', '8', '7', '30322', '2805', '0', '6', '24919900', '456958', '516.045', '8.315', '3829570', '443009', '4', '7', '0', '94363300', '607');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('227', '1976-08-11 09:21:26', NULL, '134586000', '4', '5', '0', '41', '78525', '4397.76', '0', '46669.4', '116524000', '1179.4', '13323900', '139.439', '8', '7', '2', '322203000', '904487');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('228', '1998-02-20 07:22:27', NULL, '1.99359', '9', '2', '459', '27', '107813', '13168.4', '0', '1087.86', '872629', '2.95', '19285.8', '35.6407', '5', '3', '1', '563818', '250');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('229', '1981-10-18 18:23:43', NULL, '3937.6', '6', '9', '0', '4845', '72366900', '0', '306570', '31994800', '121486000', '2743.01', '351926000', '209.677', '6', '2', '9', '1197900', '893211000');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('230', '2010-07-09 22:17:13', NULL, '0', '2', '4', '649207', '0', '0', '3014600', '1.28', '0', '108926000', '351029', '0', '0.553', '8', '7', '5', '99884500', '4');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('231', '2002-07-23 08:10:54', NULL, '713', '7', '6', '2', '133643', '84437', '2157480', '0', '566842000', '2.992', '470322000', '197419', '304852', '8', '4', '1', '213075', '391333');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('232', '1983-12-29 15:57:12', NULL, '25850800', '9', '2', '14871900', '90', '65438', '4', '4.4917', '32155', '0', '0', '0', '35.8067', '7', '5', '7', '9', '3690270');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('233', '1990-03-18 15:00:27', NULL, '3483.39', '8', '3', '63', '24063', '8', '18.189', '1791280', '473559', '75', '24.8817', '29012900', '134427', '2', '8', '7', '135507', '7542020');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('234', '1979-04-02 08:48:11', NULL, '3834.9', '8', '0', '41073400', '459', '233973000', '532715000', '9078380', '0', '209641000', '31519.8', '346.044', '460424', '9', '1', '3', '205696000', '8453');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('235', '1982-05-06 05:33:56', NULL, '659.906', '3', '0', '0', '406', '92', '704185000', '358.886', '102.135', '461760', '465.48', '3.26', '141.915', '7', '2', '6', '37875800', '39');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('236', '2005-11-04 08:52:30', NULL, '67.5217', '3', '7', '52328', '9802440', '9', '6343.4', '0', '3.6166', '493537', '2938110', '3.4767', '1205210', '6', '0', '2', '51', '6283110');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('237', '1970-10-30 03:17:21', NULL, '64888.2', '4', '5', '0', '99', '193358000', '4496710', '17.263', '2893.33', '61.865', '3094.13', '61920600', '43597', '2', '5', '9', '0', '738');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('238', '1999-11-05 14:57:23', NULL, '0', '7', '6', '9733', '42', '27295', '334.547', '0', '29519.9', '0', '1241350', '0', '577068000', '8', '1', '6', '88180000', '745');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('239', '2013-01-02 16:00:53', NULL, '0', '6', '7', '0', '7', '21137', '468.508', '0', '209939', '286249', '173094', '24759700', '553', '3', '5', '4', '52255', '3162');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('240', '1978-12-23 04:52:03', NULL, '28.4263', '2', '1', '41415400', '0', '25', '3.47341', '1.71038', '0', '3306300', '6907.67', '3915430', '8465.8', '3', '4', '4', '29', '551544000');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('241', '1994-05-08 02:35:04', NULL, '18971.3', '1', '0', '310881', '305', '5', '0', '369.4', '1068.7', '2150.68', '8693520', '122618', '10410800', '3', '2', '6', '1', '50292');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('242', '1989-10-04 14:04:49', NULL, '0', '3', '3', '0', '51493', '3998800', '39893000', '49636.6', '1163910', '46023000', '13266900', '0', '32.309', '9', '7', '7', '451', '71659');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('243', '1975-02-01 12:25:41', NULL, '99198', '6', '9', '8689440', '0', '135', '64725900', '0.49612', '24201.6', '75851200', '4407', '112253', '119598', '9', '7', '6', '919750000', '7903370');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('244', '2017-04-21 13:15:42', NULL, '80045500', '5', '8', '5801470', '7584890', '0', '1.22355', '3353900', '0', '0', '24.8', '5771.22', '0', '8', '3', '4', '7', '8752770');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('245', '1971-04-20 17:17:42', NULL, '3733.59', '3', '0', '13', '784874', '202752000', '58.2143', '1288', '614460000', '870.932', '3341820', '0', '129.564', '8', '9', '6', '332', '87');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('246', '2001-05-11 11:12:03', NULL, '35.7797', '5', '8', '846927000', '463', '86527', '5609.39', '2443190', '2739610', '67151.6', '3.373', '10240', '720.697', '1', '5', '7', '682807000', '30');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('247', '1973-01-21 19:01:50', NULL, '129322000', '2', '7', '0', '186122000', '57580800', '27856', '4570.81', '5522200', '443280', '1990.2', '45651800', '6960020', '7', '9', '7', '340068000', '4');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('248', '2012-08-09 07:24:54', NULL, '71606.1', '8', '4', '74503600', '0', '634012', '3.61455', '32105600', '13.7527', '490', '431451000', '3174.13', '60.8633', '8', '2', '0', '9', '486707');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('249', '1989-12-22 02:57:45', NULL, '0', '2', '5', '6133', '670151', '0', '80934', '293398', '831.733', '2611', '242.712', '432136000', '0', '4', '8', '5', '157941000', '410');
INSERT INTO `br` (`id`, `trading_date`, `gtp`, `tg`, `PminPDG`, `PmaxPDG`, `PVsvgo`, `PminVsvgo`, `PmaxVsvgo`, `PminBR`, `PmaxBR`, `IBR`, `CbUP`, `CbDown`, `CRSV`, `TotalBR`, `EVR`, `OCPU`, `OCPS`, `Pmin`, `Pmax`) VALUES ('250', '1981-08-31 03:04:20', NULL, '184481', '3', '9', '61', '5', '34797000', '572.976', '587015000', '4.158', '9162290', '0', '1.8', '335.071', '5', '7', '1', '0', '53120400');


#
# TABLE STRUCTURE FOR: fact_rp5
#

DROP TABLE IF EXISTS `fact_rp5`;

CREATE TABLE `fact_rp5` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trading_date` datetime DEFAULT NULL,
  `gtpp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PVIE0001',
  `local_time` datetime DEFAULT NULL COMMENT '?????. ?????',
  `temp` float unsigned DEFAULT NULL,
  `humid` float unsigned DEFAULT NULL COMMENT '?????????',
  `w_dir` float unsigned DEFAULT NULL COMMENT '??????????? ?????',
  `w_speed` float unsigned DEFAULT NULL COMMENT '???????? ?????',
  `w_gusts` float unsigned DEFAULT NULL COMMENT '?????? ?????',
  `ww` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '??????? ??????',
  `www` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '??????????? ??????? ??????',
  `?loudy` float unsigned DEFAULT NULL COMMENT '????? ??????????',
  `vv` float unsigned DEFAULT NULL COMMENT '?????????????? ????????? ?????????',
  `td` float unsigned DEFAULT NULL COMMENT '????? ????',
  PRIMARY KEY (`id`),
  KEY `trading_date` (`trading_date`),
  KEY `gtpp` (`gtpp`),
  KEY `local_time` (`local_time`),
  CONSTRAINT `fact_rp5_ibfk_1` FOREIGN KEY (`gtpp`) REFERENCES `gtp` (`gtpp`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('101', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '2', '9', '3', '4', '2', 'Quis rerum velit illo natus expedita doloremque officia.', 'Corrupti vel vel voluptatem illum sunt sed.', NULL, '3', '9');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('102', '1970-06-11 04:56:56', NULL, '1971-06-06 18:53:58', '5', '2', '0', '7', '0', 'Eum eos reiciendis culpa non voluptas aspernatur.', 'Quam facere consequatur error officia quas.', NULL, '9', '1');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('103', '0000-00-00 00:00:00', NULL, '1993-10-24 17:32:09', '0', '6', '6', '6', '8', 'Reiciendis fuga consequatur quaerat sint reiciendis illo.', 'Aut natus hic quam aperiam atque et dolor.', NULL, '6', '0');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('104', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '5', '3', '3', '0', '8', 'Consequuntur qui totam minima iste.', 'Natus corporis tenetur et consectetur.', NULL, '1', '4');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('105', '1970-01-16 18:34:07', NULL, '0000-00-00 00:00:00', '4', '8', '8', '4', '4', 'Nesciunt rerum id labore quae earum nemo.', 'Similique suscipit nihil vel quia aut debitis ut.', NULL, '5', '2');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('106', '1981-05-25 22:55:56', NULL, '0000-00-00 00:00:00', '5', '7', '0', '4', '4', 'Eaque consectetur labore ut et.', 'Maiores magni aut delectus.', NULL, '7', '2');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('107', '0000-00-00 00:00:00', NULL, '1998-01-21 07:26:07', '5', '9', '4', '5', '3', 'Ratione hic temporibus sed in.', 'Consectetur in reprehenderit nobis officiis totam.', NULL, '7', '8');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('108', '2016-03-21 08:43:20', NULL, '1994-12-18 00:25:40', '5', '7', '6', '4', '8', 'Soluta distinctio dolor quos quas.', 'Id consequatur quia modi quisquam enim recusandae dolorem est.', NULL, '5', '8');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('109', '2014-03-29 20:57:49', NULL, '0000-00-00 00:00:00', '4', '8', '6', '3', '7', 'Accusantium dignissimos quis facilis.', 'Sequi quasi accusantium ut sapiente non soluta.', NULL, '6', '0');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('110', '0000-00-00 00:00:00', NULL, '1982-06-01 08:55:39', '5', '6', '8', '2', '2', 'Unde beatae sint id modi quis natus qui.', 'Saepe vel aspernatur non.', NULL, '0', '2');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('111', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '4', '3', '5', '1', '7', 'Quod a repudiandae et consectetur aut nihil a.', 'Quia quisquam facere nostrum eos nisi.', NULL, '1', '7');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('112', '1984-07-07 05:46:42', NULL, '2018-08-15 10:14:53', '1', '4', '6', '6', '5', 'Exercitationem quibusdam veritatis veniam ex aperiam nulla laudantium.', 'Consequatur dolores officiis quaerat dolorem laudantium suscipit.', NULL, '5', '5');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('113', '0000-00-00 00:00:00', NULL, '1974-03-11 09:12:03', '1', '4', '0', '9', '8', 'Error optio doloribus iste qui eum nostrum ea.', 'Esse eum eum qui debitis.', NULL, '6', '5');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('114', '2000-08-12 20:23:11', NULL, '0000-00-00 00:00:00', '7', '8', '9', '9', '0', 'Aut iusto est voluptatem.', 'Corrupti magnam dolor possimus autem consectetur.', NULL, '2', '9');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('115', '0000-00-00 00:00:00', NULL, '1976-01-10 08:30:39', '3', '6', '4', '7', '8', 'Officia aut consequatur natus corporis in deserunt laboriosam.', 'A dolor suscipit voluptatem magnam aliquid dolore quia.', NULL, '5', '0');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('116', '0000-00-00 00:00:00', NULL, '1998-01-14 23:20:06', '5', '4', '5', '1', '7', 'Fugit quia accusantium cumque sint voluptas.', 'Est dolorem et deleniti et voluptas quae.', NULL, '9', '8');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('117', '1973-11-09 21:22:14', NULL, '0000-00-00 00:00:00', '2', '9', '1', '8', '7', 'Et voluptatem et quae exercitationem.', 'Ut sed omnis dolor asperiores consequatur quis voluptatum.', NULL, '9', '3');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('118', '0000-00-00 00:00:00', NULL, '2016-06-14 23:20:38', '3', '9', '1', '5', '2', 'Excepturi assumenda voluptatem est quod quis sint tempora.', 'Numquam eius facere consequatur perspiciatis.', NULL, '7', '3');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('119', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '8', '2', '3', '0', '7', 'Est aut reprehenderit magnam quam placeat dolor.', 'Voluptatem esse rerum nisi fuga voluptatem id.', NULL, '6', '9');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('120', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '6', '2', '2', '9', '5', 'Cupiditate voluptatibus odio aut cupiditate numquam minima enim.', 'Quo ea ea ut.', NULL, '8', '1');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('121', '0000-00-00 00:00:00', NULL, '2019-08-10 09:26:04', '5', '7', '3', '4', '5', 'Unde reprehenderit et minima rerum voluptatem repudiandae.', 'Dolor omnis delectus aperiam.', NULL, '8', '7');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('122', '0000-00-00 00:00:00', NULL, '1979-12-11 06:45:38', '1', '7', '1', '5', '3', 'Accusamus magni laboriosam est et odio.', 'Odio vero nemo nesciunt voluptatem aut maiores.', NULL, '5', '5');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('123', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '8', '9', '0', '6', '5', 'Suscipit ut ipsum inventore.', 'Enim necessitatibus ullam officiis distinctio corporis nihil rem.', NULL, '1', '2');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('124', '2015-06-23 19:09:32', NULL, '0000-00-00 00:00:00', '9', '5', '9', '2', '6', 'Dignissimos voluptas quod quia ratione laudantium doloremque.', 'Molestiae incidunt eaque architecto rerum voluptatibus.', NULL, '4', '6');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('125', '2011-12-03 15:08:25', NULL, '1996-10-07 00:05:23', '0', '1', '7', '1', '9', 'Aperiam repudiandae dolore ut tempora nostrum vel.', 'Culpa laborum dolor dolorem labore ipsa dicta aliquid.', NULL, '0', '4');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('126', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '6', '1', '8', '9', '0', 'Et omnis non eos qui architecto tempore.', 'Nostrum et est asperiores aut quae voluptas nobis.', NULL, '5', '8');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('127', '2009-06-24 04:56:01', NULL, '0000-00-00 00:00:00', '7', '2', '5', '4', '5', 'Quisquam dolor nemo at eaque sunt aut.', 'Molestiae aut similique et asperiores aut voluptatem.', NULL, '5', '7');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('128', '0000-00-00 00:00:00', NULL, '2000-07-15 12:42:42', '3', '6', '7', '3', '5', 'Itaque voluptatem esse adipisci quo.', 'Perspiciatis non quae blanditiis aut et placeat ut quaerat.', NULL, '3', '5');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('129', '0000-00-00 00:00:00', NULL, '1993-01-24 21:36:33', '0', '8', '0', '6', '8', 'Alias ea itaque dolor praesentium et sed.', 'Maxime itaque soluta necessitatibus et.', NULL, '3', '7');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('130', '1991-12-09 01:45:53', NULL, '0000-00-00 00:00:00', '0', '6', '4', '4', '2', 'Nulla rerum itaque cupiditate facere aliquid.', 'Quo iste sint voluptatem.', NULL, '6', '1');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('131', '2012-08-09 18:42:24', NULL, '1977-09-15 15:07:10', '5', '3', '6', '5', '4', 'Facere delectus sit quis architecto.', 'Veritatis consequatur aut qui ullam perferendis est enim rem.', NULL, '4', '0');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('132', '0000-00-00 00:00:00', NULL, '1987-01-13 23:13:28', '8', '4', '8', '0', '6', 'Voluptatem est porro possimus architecto.', 'Voluptas quo modi unde possimus similique expedita alias.', NULL, '3', '3');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('133', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '6', '1', '5', '3', '9', 'Nulla architecto maiores nobis quibusdam.', 'Ex asperiores nobis quas ad laudantium et in.', NULL, '5', '5');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('134', '1975-07-15 00:25:02', NULL, '2004-11-26 16:29:02', '9', '8', '7', '3', '8', 'Quis rerum ut labore voluptas.', 'Expedita possimus aut tenetur assumenda.', NULL, '8', '9');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('135', '1989-06-14 03:19:28', NULL, '0000-00-00 00:00:00', '1', '1', '7', '2', '3', 'Fugiat dolor voluptas consequuntur hic voluptatem.', 'Doloribus id repellat vero porro.', NULL, '7', '6');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('136', '1981-09-02 00:30:18', NULL, '0000-00-00 00:00:00', '1', '0', '1', '3', '7', 'Placeat quidem ab expedita dignissimos.', 'Inventore nulla deleniti aliquid autem ut quaerat nihil.', NULL, '8', '1');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('137', '1971-01-05 13:01:03', NULL, '2018-09-29 02:41:23', '4', '2', '5', '6', '3', 'Quas et est atque.', 'Voluptatum rem sed aspernatur qui beatae.', NULL, '8', '8');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('138', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '8', '8', '9', '0', '4', 'Ut libero recusandae deleniti reiciendis provident.', 'Numquam mollitia voluptatem velit et est assumenda dolorum aliquid.', NULL, '4', '3');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('139', '1999-05-03 06:11:17', NULL, '2015-06-26 01:15:03', '6', '6', '5', '7', '0', 'Unde ipsa eum natus molestiae ipsa nemo dolore.', 'Iusto veritatis et tempora ut quidem dolor.', NULL, '0', '2');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('140', '2003-06-02 18:36:05', NULL, '2019-02-18 02:03:52', '3', '3', '6', '9', '4', 'Aut error nam sint velit eius omnis eos.', 'Sed nihil saepe quasi repellendus sint nobis deleniti.', NULL, '6', '3');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('141', '0000-00-00 00:00:00', NULL, '2011-05-23 05:38:01', '3', '4', '6', '6', '4', 'Natus mollitia est quia beatae ducimus rerum.', 'Qui aspernatur quidem rem accusantium.', NULL, '9', '9');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('142', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '0', '4', '1', '0', '0', 'Quo sit facere minus est voluptas dolor ut eligendi.', 'Fugiat maiores non illum a maxime.', NULL, '9', '6');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('143', '0000-00-00 00:00:00', NULL, '1994-08-28 02:27:05', '1', '4', '7', '5', '7', 'Nostrum reprehenderit repellat illo qui.', 'Quasi magnam sit veritatis.', NULL, '3', '1');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('144', '1977-07-06 13:00:10', NULL, '1989-05-02 21:32:05', '6', '9', '6', '5', '7', 'Odio vero ea ex ut dolorum.', 'Tenetur tenetur sed sunt quia voluptatem.', NULL, '1', '9');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('145', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '2', '0', '8', '7', '6', 'Enim rem vitae explicabo.', 'Quia et et provident porro.', NULL, '8', '4');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('146', '1997-01-19 21:10:19', NULL, '1988-06-07 00:06:04', '4', '5', '3', '9', '2', 'Saepe odit explicabo eos numquam quis et.', 'Ad debitis modi assumenda dolorem.', NULL, '4', '7');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('147', '0000-00-00 00:00:00', NULL, '1996-03-18 11:56:54', '9', '5', '2', '9', '6', 'Rerum exercitationem et sunt dolor.', 'Ut itaque commodi consequatur et ipsum laboriosam ducimus.', NULL, '2', '0');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('148', '0000-00-00 00:00:00', NULL, '1992-01-15 03:54:26', '7', '0', '2', '4', '4', 'Enim non aut perferendis.', 'Non voluptatem occaecati explicabo voluptas.', NULL, '7', '3');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('149', '2011-05-16 06:37:51', NULL, '0000-00-00 00:00:00', '9', '3', '1', '8', '8', 'Nostrum alias aut voluptatem distinctio expedita molestiae commodi.', 'Cupiditate illo et est quae.', NULL, '2', '8');
INSERT INTO `fact_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `temp`, `humid`, `w_dir`, `w_speed`, `w_gusts`, `ww`, `www`, `?loudy`, `vv`, `td`) VALUES ('150', '1995-04-24 16:00:37', NULL, '0000-00-00 00:00:00', '1', '0', '7', '2', '7', 'Maiores libero ut consequatur ut sed.', 'Qui beatae maxime ipsum suscipit quia illo veniam.', NULL, '9', '4');


#
# TABLE STRUCTURE FOR: forecast_rp5
#

DROP TABLE IF EXISTS `forecast_rp5`;

CREATE TABLE `forecast_rp5` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trading_date` datetime DEFAULT NULL,
  `gtpp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PVIE0001',
  `local_time` datetime DEFAULT NULL COMMENT '?????. ?????',
  `cloudy_v` float unsigned DEFAULT NULL COMMENT '?????? ????????????? ????????',
  `cloudy_l` float unsigned DEFAULT NULL COMMENT '?????? ??????? ?????',
  `cloudy_m` float unsigned DEFAULT NULL COMMENT '?????? ???????? ?????',
  `cloudy_h` float unsigned DEFAULT NULL COMMENT '?????? ???????? ?????',
  `hrecip` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '?????? ???????? (????/?????)',
  `hrecip_level` float unsigned DEFAULT NULL COMMENT '?????? ?????????? ??',
  `ww` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '??????? ??????',
  `vis` float unsigned DEFAULT NULL COMMENT '?????????????? ?????????',
  `temp` float unsigned DEFAULT NULL,
  `w_speed` float unsigned DEFAULT NULL COMMENT '???????? ?????',
  `w_gusts` float unsigned DEFAULT NULL COMMENT '?????? ?????',
  `w_dir` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '??????????? ?????',
  `humid` float unsigned DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`id`),
  KEY `trading_date` (`trading_date`),
  KEY `gtpp` (`gtpp`),
  KEY `local_time` (`local_time`),
  CONSTRAINT `forecast_rp5_ibfk_1` FOREIGN KEY (`gtpp`) REFERENCES `gtp` (`gtpp`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('1', '1997-10-16 10:51:47', NULL, '1977-10-24 09:29:37', '64286100', '2', '2', '4', 'Illum ut similique officia omnis laboriosam.', '0', 'Consequuntur accusantium debitis aspernatur.', '1', '7', '9', '8', 'tyrq', '7');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('2', '2001-12-05 21:34:08', NULL, '1983-01-17 17:53:00', '0', '6', '3', '6', 'Eos ducimus inventore delectus eum qui officiis ea dolorum.', '2', 'Nulla omnis nesciunt perferendis magni nostrum doloribus quo.', '1', '6', '0', '7', 'oqav', '0');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('3', '1984-01-04 02:34:00', NULL, '1977-10-28 13:07:40', '75569200', '8', '9', '5', 'Provident nihil nulla doloribus dolores maiores accusamus.', '4', 'Id sint maxime exercitationem quae nesciunt.', '0', '2', '4', '2', 'pbep', '0');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('4', '1972-11-16 03:57:12', NULL, '1992-05-08 18:50:15', '395577000', '8', '8', '2', 'Iste aut expedita eum earum sunt est aspernatur.', '6', 'Eum nam et quia quia magnam officiis.', '9', '7', '7', '3', 'bgkl', '8');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('5', '2011-05-20 12:34:05', NULL, '2009-12-17 06:38:57', '1033.4', '9', '5', '1', 'Iste sunt cupiditate nam dolore in omnis.', '9', 'Quae in quidem dolorem doloremque molestias sit quidem.', '3', '6', '6', '8', 'ookv', '2');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('6', '1970-05-06 04:40:43', NULL, '1999-09-07 07:15:16', '428.75', '1', '6', '5', 'Quia et maiores assumenda animi et adipisci ad.', '9', 'Incidunt quae molestiae quia vel.', '0', '8', '9', '0', 'eskr', '5');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('7', '2018-12-26 14:45:04', NULL, '2016-12-06 07:02:21', '34.0767', '3', '3', '2', 'Quibusdam laborum sequi est.', '0', 'Repellat qui laboriosam in cum consequatur voluptatem consequatur.', '4', '1', '6', '1', 'deob', '0');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('8', '1977-08-20 12:41:24', NULL, '2007-08-30 12:55:11', '4911', '5', '2', '2', 'Nihil voluptatem in ut aperiam ducimus similique dolorem facilis.', '3', 'Ullam dolor praesentium repudiandae perferendis vitae ut modi optio.', '7', '7', '0', '6', 'ddsx', '3');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('9', '2000-05-15 16:30:08', NULL, '1985-11-29 04:16:30', '142393000', '4', '9', '3', 'Et ad et ipsum fuga soluta repellat.', '1', 'Architecto iure esse voluptas quos nemo eius et.', '3', '7', '3', '3', 'xtjb', '0');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('10', '1999-10-31 04:41:40', NULL, '2015-07-10 10:47:12', '2.29996', '9', '5', '0', 'Qui ut aut esse magni quisquam et.', '8', 'Enim consequatur fuga sint architecto non quis.', '4', '1', '9', '4', 'asgr', '6');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('11', '2007-09-14 11:49:38', NULL, '2003-04-16 19:10:52', '4737.04', '1', '2', '1', 'Ipsam beatae sunt dolorum rerum ab inventore rerum.', '6', 'Reprehenderit ratione voluptatem consequuntur et.', '3', '3', '5', '8', 'lhan', '0');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('12', '1971-07-10 13:36:01', NULL, '1982-02-14 12:48:58', '570.89', '2', '5', '2', 'Asperiores a impedit laborum.', '2', 'Aut molestias aut quo corporis unde.', '7', '1', '6', '5', 'fdbk', '6');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('13', '1973-06-16 23:27:24', NULL, '1989-08-10 05:11:40', '1.55017', '4', '7', '0', 'Et quia dignissimos quasi molestiae sit aliquam.', '8', 'Et voluptates tempore saepe sunt laboriosam id nihil.', '5', '4', '0', '3', 'rxhd', '8');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('14', '1991-08-23 19:57:46', NULL, '2004-09-17 13:07:46', '320.815', '7', '8', '9', 'Incidunt temporibus et maiores beatae sunt tenetur dolor.', '1', 'Deleniti dicta eaque sit reiciendis quia in ipsam.', '6', '7', '6', '0', 'fzvq', '4');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('15', '1995-10-20 07:54:23', NULL, '1979-09-24 22:03:36', '59756400', '8', '3', '7', 'Ipsum sit aliquid at est ad iste.', '8', 'Minima quam aut aliquam quia quo.', '0', '0', '1', '6', 'sdve', '6');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('16', '1992-04-24 14:50:47', NULL, '2000-02-25 02:24:48', '45.5774', '1', '3', '5', 'Voluptas voluptas repudiandae mollitia similique eos.', '2', 'Aut rerum voluptatem dolor aut.', '2', '5', '8', '7', 'tkcq', '8');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('17', '2011-04-08 05:35:03', NULL, '2015-10-06 02:06:58', '185551', '9', '5', '5', 'Tempora facilis unde voluptates explicabo eaque error.', '5', 'Voluptatem debitis rerum labore quasi ducimus.', '0', '0', '2', '3', 'ueey', '1');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('18', '1988-03-09 22:18:34', NULL, '1994-03-22 11:20:06', '763.529', '0', '3', '5', 'Unde tempore ipsa quidem dolores.', '9', 'Ut et dolore tempora rem officiis commodi magni.', '4', '9', '4', '7', 'megj', '7');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('19', '2000-06-03 06:11:16', NULL, '1972-05-12 13:14:53', '62.63', '5', '4', '0', 'Totam sint ea ad temporibus eligendi optio rem.', '8', 'Placeat occaecati iure dolor dolor.', '5', '9', '4', '4', 'crqn', '2');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('20', '2016-09-18 13:10:15', NULL, '1987-03-08 06:10:32', '97.5293', '1', '6', '6', 'Eius inventore labore doloremque a et.', '6', 'Et impedit quaerat fuga quia.', '9', '9', '0', '1', 'vsnn', '2');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('21', '1988-03-28 17:28:04', NULL, '1981-05-23 18:15:22', '113637', '5', '9', '4', 'Reprehenderit sunt vel eum aut dolorem qui quos rem.', '6', 'Laboriosam est aut aut quia autem voluptatum.', '8', '6', '8', '7', 'tqvm', '2');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('22', '2015-01-22 14:17:20', NULL, '2016-09-08 14:39:11', '3670.09', '8', '5', '3', 'Vitae voluptatem dolore nostrum nesciunt.', '1', 'Quod quibusdam dignissimos sequi vero aspernatur tempora.', '0', '9', '0', '4', 'ersx', '7');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('23', '1975-07-31 13:12:19', NULL, '2014-08-19 16:52:36', '7615.46', '4', '8', '4', 'Animi voluptates quisquam molestiae modi.', '8', 'Molestiae nam error et autem voluptatem.', '6', '2', '7', '4', 'tiys', '2');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('24', '1975-04-28 01:03:40', NULL, '1975-07-21 21:52:40', '1963.7', '7', '3', '7', 'Quam non similique quos doloremque tempore sed consequatur.', '5', 'In reiciendis non non pariatur quia ut aut illum.', '6', '9', '0', '6', 'qymn', '6');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('25', '1970-02-14 00:54:08', NULL, '1985-01-14 04:48:17', '13629300', '4', '6', '8', 'Facere harum unde corrupti temporibus repellat recusandae et.', '8', 'Esse dolor quos rerum et itaque.', '2', '8', '9', '2', 'nhpq', '3');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('26', '2011-04-03 02:41:23', NULL, '2017-08-19 10:18:49', '0', '1', '3', '6', 'Minus quia animi aut consequatur amet.', '0', 'Dolores eos aut in et id porro.', '0', '8', '7', '2', 'ucjv', '2');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('27', '1982-02-17 18:58:55', NULL, '1979-05-28 08:05:38', '1477.19', '6', '8', '4', 'Repellendus dignissimos facilis assumenda error id.', '6', 'Architecto laboriosam hic voluptatem totam vero in esse.', '6', '1', '4', '3', 'ofny', '3');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('28', '1976-04-03 17:25:29', NULL, '1978-01-20 20:57:08', '156296', '7', '6', '0', 'Libero dolorem aut debitis.', '3', 'Quia voluptatem recusandae occaecati aut eveniet beatae perspiciatis.', '8', '0', '1', '6', 'riyx', '3');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('29', '1976-05-25 05:48:24', NULL, '1999-07-09 16:01:08', '80.581', '1', '3', '6', 'Et placeat eum est cupiditate et.', '6', 'Nihil et officiis quia maxime perspiciatis accusantium nulla.', '3', '8', '3', '9', 'zluq', '3');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('30', '1998-08-14 11:24:48', NULL, '1970-04-28 16:02:09', '0.943203', '3', '5', '5', 'Rerum ipsum repellendus repellat dolor ab.', '0', 'Rerum animi dolorem at dolore perferendis eveniet aliquam.', '0', '1', '3', '0', 'lnle', '3');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('31', '1990-12-11 22:21:48', NULL, '1987-04-02 14:42:43', '225577000', '8', '3', '0', 'Numquam aliquid repellat velit.', '5', 'Sint sit recusandae laborum.', '4', '3', '0', '4', 'svjr', '9');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('32', '1990-11-30 15:47:02', NULL, '1988-09-25 09:52:51', '6.241', '5', '0', '6', 'Natus necessitatibus voluptatibus et itaque architecto facilis.', '4', 'Et accusamus exercitationem iste repudiandae consequatur odit.', '6', '0', '0', '7', 'plds', '8');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('33', '2007-02-07 12:41:07', NULL, '2000-05-09 13:57:44', '1688', '3', '1', '7', 'Tempora dolores aut a voluptatem iste nihil corporis.', '7', 'Sunt aut quis tempore voluptas cum quaerat.', '4', '7', '9', '2', 'eeoo', '7');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('34', '1993-10-11 08:46:55', NULL, '2010-11-17 07:01:55', '105945', '6', '3', '5', 'Consequatur molestiae aperiam autem molestiae alias dignissimos.', '0', 'Optio expedita quasi quae ut placeat earum.', '7', '2', '0', '2', 'rynb', '1');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('35', '1995-05-15 19:04:21', NULL, '1974-11-13 03:57:15', '0', '7', '5', '7', 'Qui aut sunt delectus ut deleniti omnis earum alias.', '5', 'Nam quis exercitationem aut.', '1', '3', '3', '1', 'gmvy', '8');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('36', '2012-07-21 02:09:40', NULL, '2015-07-14 04:46:01', '0', '9', '4', '6', 'Id minus nihil ipsum velit doloremque cupiditate.', '9', 'Similique provident ut esse maxime rerum.', '7', '2', '1', '8', 'tgpy', '5');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('37', '1971-02-08 10:09:20', NULL, '2000-12-11 22:19:11', '617241', '7', '8', '4', 'Sequi laboriosam ut vel sunt.', '7', 'Praesentium illum et velit aliquid culpa.', '1', '3', '1', '8', 'ryfr', '2');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('38', '2002-12-23 19:01:33', NULL, '1996-03-07 01:55:57', '405349000', '3', '9', '4', 'Nam eveniet odit animi maxime illum.', '6', 'In commodi velit nobis dolorem suscipit quam.', '7', '5', '1', '7', 'jxwe', '3');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('39', '1994-04-19 02:21:17', NULL, '2015-08-20 03:35:33', '20.8245', '2', '0', '8', 'Enim sunt velit aspernatur commodi voluptatem.', '8', 'Vero quod ex odio ad aut dolorum aperiam.', '1', '6', '8', '2', 'rtsh', '2');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('40', '1989-11-08 11:53:06', NULL, '2014-11-22 07:57:58', '5921', '4', '8', '5', 'Totam natus inventore eos ut ipsam rem.', '2', 'Sed iste ea similique non vel nihil.', '3', '6', '7', '6', 'wlbn', '7');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('41', '1975-03-18 11:39:34', NULL, '1984-06-01 01:40:22', '2.6884', '8', '8', '9', 'Nihil et est non cupiditate.', '7', 'Provident qui quod nemo aliquid soluta.', '5', '9', '8', '9', 'hdnf', '5');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('42', '1977-06-06 19:07:24', NULL, '1973-06-28 09:04:31', '156.62', '5', '6', '2', 'Nisi sapiente debitis debitis maxime voluptatem ipsa ut.', '9', 'Et quia et sed labore cum et non.', '3', '4', '8', '5', 'gkwb', '4');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('43', '1977-01-27 02:31:53', NULL, '2017-06-09 20:55:12', '0', '1', '6', '9', 'Excepturi dicta voluptatem voluptatem nobis voluptas ea.', '5', 'Ipsum eum non quibusdam.', '5', '7', '4', '6', 'ecys', '9');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('44', '1979-12-29 13:20:39', NULL, '1993-03-09 03:35:01', '22917.8', '8', '7', '1', 'Voluptatum quas autem vel amet.', '3', 'Maiores sit autem beatae adipisci incidunt.', '2', '6', '2', '8', 'qbrd', '7');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('45', '1993-11-06 18:54:08', NULL, '2004-09-08 03:13:01', '444.603', '1', '0', '0', 'Et quisquam necessitatibus quos.', '3', 'Nemo quis quis vero et est.', '0', '1', '7', '0', 'rixe', '4');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('46', '2012-09-04 22:41:51', NULL, '1974-04-15 22:07:37', '51.5764', '2', '5', '7', 'Ipsum ut nostrum qui earum vel libero.', '4', 'Quidem accusamus sit inventore.', '4', '5', '8', '5', 'nhqu', '4');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('47', '1972-09-26 14:43:21', NULL, '2006-01-09 16:57:00', '41255.4', '8', '5', '1', 'Quidem velit magnam sunt.', '5', 'Sed voluptatem voluptatem in aut est molestias.', '6', '5', '6', '6', 'aepr', '8');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('48', '1971-04-09 06:02:02', NULL, '2010-12-06 16:58:16', '67.5819', '7', '5', '4', 'Rerum natus non autem alias quibusdam nesciunt quia quia.', '4', 'Officiis nihil incidunt voluptatem neque eveniet nam et.', '8', '3', '9', '6', 'crhz', '0');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('49', '2001-05-31 11:38:55', NULL, '1988-04-06 20:36:29', '0', '9', '5', '7', 'Quia molestiae ea nihil et tempora incidunt.', '8', 'Facilis officiis aut aliquid soluta sit quae.', '5', '6', '7', '9', 'dcsq', '0');
INSERT INTO `forecast_rp5` (`id`, `trading_date`, `gtpp`, `local_time`, `cloudy_v`, `cloudy_l`, `cloudy_m`, `cloudy_h`, `hrecip`, `hrecip_level`, `ww`, `vis`, `temp`, `w_speed`, `w_gusts`, `w_dir`, `humid`) VALUES ('50', '1994-09-03 22:22:29', NULL, '1973-07-10 22:55:03', '54.3635', '0', '9', '3', 'Repudiandae explicabo vel nam et hic qui consequuntur.', '7', 'Libero sed temporibus natus recusandae magnam nihil.', '3', '1', '2', '8', 'zeql', '9');


#
# TABLE STRUCTURE FOR: gtp
#

DROP TABLE IF EXISTS `gtp`;

CREATE TABLE `gtp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gtps` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'SVIE0001',
  `gtpp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PVIE0001',
  `gtp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'GVIE0001',
  `name_ses` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '???????????? ???',
  PRIMARY KEY (`id`),
  KEY `id_gtp` (`id`),
  KEY `gtps_gtp` (`gtps`),
  KEY `gtpp_gtp` (`gtpp`),
  KEY `gtp_gtp` (`gtp`),
  KEY `name_ses_gtp` (`name_ses`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('1', 'bssh', 'zqag', 'eixu', 'eos');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('2', 'mdak', 'mgvt', 'oimb', 'esse');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('3', 'jruu', 'xxbl', 'prwo', 'eaque');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('4', 'hyfz', 'nipx', 'kyov', 'corrupti');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('5', 'fiwa', 'amat', 'dheh', 'eaque');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('6', 'crsx', 'zbfs', 'mcvj', 'esse');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('7', 'ppvk', 'oanh', 'yfaf', 'temporibus');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('8', 'xqxw', 'tyeq', 'rkvu', 'illo');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('9', 'gbkv', 'jugd', 'smtd', 'error');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('10', 'eluw', 'xibq', 'aogs', 'voluptatibus');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('11', 'wpen', 'jqvj', 'jwij', 'voluptatem');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('12', 'cqla', 'xaom', 'zqpu', 'nihil');
INSERT INTO `gtp` (`id`, `gtps`, `gtpp`, `gtp`, `name_ses`) VALUES ('13', 'nizg', 'lpff', 'wxsx', 'accusantium');


#
# TABLE STRUCTURE FOR: insol
#

DROP TABLE IF EXISTS `insol`;

CREATE TABLE `insol` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trading_date` datetime DEFAULT NULL,
  `gtpp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PVIE0001',
  `id_param` float unsigned DEFAULT NULL COMMENT 'ID ????????? ?? ????? Grafanya',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '???????????? ????????',
  `value` double DEFAULT NULL COMMENT '???? ????????',
  PRIMARY KEY (`id`),
  KEY `trading_date` (`trading_date`),
  KEY `gtpp` (`gtpp`),
  KEY `name` (`name`),
  KEY `id_param` (`id_param`),
  CONSTRAINT `insol_ibfk_1` FOREIGN KEY (`gtpp`) REFERENCES `gtp` (`gtpp`),
  CONSTRAINT `insol_ibfk_2` FOREIGN KEY (`id_param`) REFERENCES `links_obj_insol` (`id_param`),
  CONSTRAINT `insol_ibfk_3` FOREIGN KEY (`gtpp`) REFERENCES `links_obj_insol` (`gtpp`),
  CONSTRAINT `insol_ibfk_4` FOREIGN KEY (`name`) REFERENCES `links_obj_insol` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('401', NULL, NULL, NULL, NULL, '136050023.18384');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('402', NULL, NULL, NULL, NULL, '0.0145186');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('403', NULL, NULL, NULL, NULL, '153374.03678');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('404', NULL, NULL, NULL, NULL, '309690');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('405', NULL, NULL, NULL, NULL, '49275176.23');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('406', NULL, NULL, NULL, NULL, '355203060.319');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('407', NULL, NULL, NULL, NULL, '91.7982');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('408', NULL, NULL, NULL, NULL, '36812930.009');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('409', NULL, NULL, NULL, NULL, '2758828.53');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('410', NULL, NULL, NULL, NULL, '390645.3279671');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('411', NULL, NULL, NULL, NULL, '393950.933217');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('412', NULL, NULL, NULL, NULL, '0');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('413', NULL, NULL, NULL, NULL, '2891.8540578');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('414', NULL, NULL, NULL, NULL, '5307.10257054');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('415', NULL, NULL, NULL, NULL, '0');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('416', NULL, NULL, NULL, NULL, '744.989');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('417', NULL, NULL, NULL, NULL, '599414.98585976');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('418', NULL, NULL, NULL, NULL, '0.60628');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('419', NULL, NULL, NULL, NULL, '2659.6074');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('420', NULL, NULL, NULL, NULL, '0.86294');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('421', NULL, NULL, NULL, NULL, '0');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('422', NULL, NULL, NULL, NULL, '39371808.8');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('423', NULL, NULL, NULL, NULL, '4175681.02');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('424', NULL, NULL, NULL, NULL, '377841263.53127');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('425', NULL, NULL, NULL, NULL, '17175.979264');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('426', NULL, NULL, NULL, NULL, '360159.4459804');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('427', NULL, NULL, NULL, NULL, '0');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('428', NULL, NULL, NULL, NULL, '58326.115841839');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('429', NULL, NULL, NULL, NULL, '3366.6933');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('430', NULL, NULL, NULL, NULL, '927986');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('431', NULL, NULL, NULL, NULL, '0');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('432', NULL, NULL, NULL, NULL, '82240.73');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('433', NULL, NULL, NULL, NULL, '0.087');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('434', NULL, NULL, NULL, NULL, '17654329.132488');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('435', NULL, NULL, NULL, NULL, '20672');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('436', NULL, NULL, NULL, NULL, '1870037.3742');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('437', NULL, NULL, NULL, NULL, '6611.12275799');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('438', NULL, NULL, NULL, NULL, '5.66659');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('439', NULL, NULL, NULL, NULL, '4051445.25');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('440', NULL, NULL, NULL, NULL, '0');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('441', NULL, NULL, NULL, NULL, '1959.721969352');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('442', NULL, NULL, NULL, NULL, '4.96958');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('443', NULL, NULL, NULL, NULL, '4465.5157');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('444', NULL, NULL, NULL, NULL, '3044311.8186713');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('445', NULL, NULL, NULL, NULL, '20148.98844');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('446', NULL, NULL, NULL, NULL, '6.87574');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('447', NULL, NULL, NULL, NULL, '25.328469');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('448', NULL, NULL, NULL, NULL, '59216.06');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('449', NULL, NULL, NULL, NULL, '408943206.7');
INSERT INTO `insol` (`id`, `trading_date`, `gtpp`, `id_param`, `name`, `value`) VALUES ('450', NULL, NULL, NULL, NULL, '267254661.628');


#
# TABLE STRUCTURE FOR: links_meteo_lok
#

DROP TABLE IF EXISTS `links_meteo_lok`;

CREATE TABLE `links_meteo_lok` (
  `gtpp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PVIE0001',
  `link` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '?????? ?? ???????? ? ????????? ??????',
  `link_fact` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '?????? ?? ???????? ? ?????? ??????',
  `name_ses` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '???????????? ???',
  KEY `gtpp` (`gtpp`),
  KEY `name_ses` (`name_ses`),
  CONSTRAINT `links_meteo_lok_ibfk_1` FOREIGN KEY (`gtpp`) REFERENCES `gtp` (`gtpp`),
  CONSTRAINT `links_meteo_lok_ibfk_2` FOREIGN KEY (`name_ses`) REFERENCES `gtp` (`name_ses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://hayes.org/', 'http://buckridge.com/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://connelly.com/', 'http://www.fay.biz/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://vandervort.org/', 'http://www.wiegandkiehn.com/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://considine.info/', 'http://hand.biz/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://whiteswift.com/', 'http://www.sporer.net/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://www.pollichlesch.com/', 'http://www.conroy.com/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://king.info/', 'http://www.douglasgrant.net/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://kerlukeskiles.net/', 'http://www.lynch.com/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://skilestoy.com/', 'http://mante.com/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://www.moorerogahn.info/', 'http://turner.com/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://www.lemke.biz/', 'http://bechtelarhagenes.com/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://miller.com/', 'http://www.mills.net/', NULL);
INSERT INTO `links_meteo_lok` (`gtpp`, `link`, `link_fact`, `name_ses`) VALUES (NULL, 'http://www.jerdeorn.com/', 'http://www.windler.com/', NULL);


#
# TABLE STRUCTURE FOR: links_obj_insol
#

DROP TABLE IF EXISTS `links_obj_insol`;

CREATE TABLE `links_obj_insol` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_param` float unsigned DEFAULT NULL COMMENT 'ID ????????? ?? ????? Grafanya',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '???????????? ????????',
  `gtpp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PVIE0001',
  `name_ses` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '???????????? ???',
  PRIMARY KEY (`id`),
  KEY `id_param` (`id_param`),
  KEY `name` (`name`),
  KEY `gtpp` (`gtpp`),
  KEY `name_ses` (`name_ses`),
  CONSTRAINT `links_obj_insol_ibfk_1` FOREIGN KEY (`gtpp`) REFERENCES `gtp` (`gtpp`),
  CONSTRAINT `links_obj_insol_ibfk_2` FOREIGN KEY (`name_ses`) REFERENCES `gtp` (`name_ses`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('235', '37965', 'quam', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('236', '1458560', 'tempora', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('237', '99', 'eum', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('238', '769462000', 'ipsa', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('239', '348413', 'omnis', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('240', '37559200', 'vel', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('241', '31973300', 'neque', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('242', '11', 'ipsa', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('243', '0', 'atque', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('244', '38', 'cum', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('245', '5790080', 'quia', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('246', '93', 'soluta', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('247', '5540880', 'necessitatibus', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('248', '5', 'dignissimos', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('249', '86037', 'et', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('250', '7105320', 'pariatur', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('251', '82122', 'nam', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('252', '83396500', 'maiores', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('253', '318241', 'voluptatum', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('254', '799135000', 'voluptatem', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('255', '715', 'harum', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('256', '66344', 'excepturi', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('257', '2', 'necessitatibus', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('258', '76', 'recusandae', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('259', '5826010', 'velit', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('260', '53668800', 'distinctio', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('261', '9420240', 'et', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('262', '3', 'ipsum', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('263', '55973', 'neque', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('264', '222', 'soluta', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('265', '33594', 'officia', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('266', '168', 'ad', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('267', '39513200', 'amet', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('268', '602916000', 'sequi', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('269', '368', 'inventore', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('270', '28', 'molestiae', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('271', '64707100', 'asperiores', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('272', '997616', 'et', NULL, NULL);
INSERT INTO `links_obj_insol` (`id`, `id_param`, `name`, `gtpp`, `name_ses`) VALUES ('273', '5676', 'ab', NULL, NULL);


#
# TABLE STRUCTURE FOR: logs
#

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_txt` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '????? ????',
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '?????? ???? - ??????, ?????????? ? ??.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('1', 'Ea nihil consequuntur sint fugit.', 'Perspiciatis et rerum qui rerum dolores iste repel');
INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('2', 'Eum expedita cupiditate voluptatem corrupti repudiandae voluptatibus.', 'Numquam temporibus quis possimus dolores aliquam a');
INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('3', 'Laborum sunt et architecto quasi.', 'Quisquam placeat quidem ullam quia facilis quia. C');
INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('4', 'Velit placeat culpa dicta et distinctio.', 'Voluptates sed dolore accusamus dolorem placeat. M');
INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('5', 'Similique magnam id et.', 'Iure quae non minima rem autem veniam quasi aut. B');
INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('6', 'Corrupti hic quo provident et consequuntur quod animi.', 'Itaque maiores accusantium temporibus omnis sit. Q');
INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('7', 'Voluptatibus quod illum eum nemo laboriosam eum.', 'Et dolor quo amet eligendi voluptatem impedit. Sed');
INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('8', 'Optio ut nemo perferendis repellat.', 'Unde impedit nobis deleniti doloribus voluptatem f');
INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('9', 'Ea temporibus aperiam et adipisci voluptatibus recusandae et.', 'Voluptas ullam quidem aperiam. Aut saepe quam veni');
INSERT INTO `logs` (`id`, `log_txt`, `status`) VALUES ('10', 'Illum consequuntur aliquid nihil numquam quis.', 'In consequatur earum error architecto sit. Aut iur');


#
# TABLE STRUCTURE FOR: report_27
#

DROP TABLE IF EXISTS `report_27`;

CREATE TABLE `report_27` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trading_date` datetime DEFAULT NULL,
  `gtp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'GVIE0001',
  `v_bid_so` float unsigned DEFAULT NULL COMMENT '?????? ???????? - ?????????? ???*???.',
  `t_min` float unsigned DEFAULT NULL COMMENT '??????????? ???????',
  `p_max` float unsigned DEFAULT NULL COMMENT '?????** ??? ?? ??????? 8',
  `change_load_down` smallint(5) unsigned DEFAULT NULL COMMENT '?????? ???????? ????????? ???????? ??????????? - ????????',
  `change_load_up` smallint(5) unsigned DEFAULT NULL COMMENT '?????? ???????? ????????? ???????? ??????????? - ?????????',
  `trade_graph` float unsigned DEFAULT NULL COMMENT '????? ????????? ??????? ???*???',
  `p_unreg` float unsigned DEFAULT NULL COMMENT '???????????????? ???? ?? ??????? (?? ???????? ????????? ???????) ???/(???*???)',
  `v_sell_rsv` float unsigned DEFAULT NULL COMMENT '??????? ? ??? - ????? ??????? ???*???',
  `p_sell_rsv` float unsigned DEFAULT NULL COMMENT '??????? ? ??? - ???? ???/(???*???)',
  `v_buy_sdd` float unsigned DEFAULT NULL COMMENT '??????? ? ??????????? ??? (????) - ????? ??????? ???*???',
  `p_buy_sdd` float unsigned DEFAULT NULL COMMENT '??????? ? ??????????? ??? (????) - ???? ???/(???*???)',
  `korr_v` float unsigned DEFAULT NULL COMMENT '????????????????? ?????? ???????? - ?????????? ???*???',
  PRIMARY KEY (`id`),
  KEY `trading_date` (`trading_date`),
  KEY `gtp` (`gtp`),
  CONSTRAINT `report_27_ibfk_1` FOREIGN KEY (`gtp`) REFERENCES `gtp` (`gtp`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('101', '2007-06-29 13:49:45', NULL, '1072380', '5800', '7785150', 3, 8, '8', '9', '1', '8', '7', '8', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('102', '1988-05-23 07:39:43', NULL, '57813.8', '743309', '165358', 4, 3, '6', '1', '8', '8', '9', '1', '3');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('103', '1995-09-22 13:44:38', NULL, '7.2084', '42989', '9185970', 4, 1, '4', '2', '1', '5', '2', '5', '6');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('104', '1971-07-03 09:50:35', NULL, '7847', '2202', '2089', 6, 7, '6', '3', '6', '5', '6', '1', '8');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('105', '1974-08-06 17:21:02', NULL, '76.7409', '30630', '5469', 1, 1, '8', '3', '8', '2', '1', '5', '1');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('106', '2010-01-07 01:40:38', NULL, '40177800', '132', '26', 6, 2, '2', '6', '9', '3', '6', '0', '8');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('107', '1988-03-27 12:44:37', NULL, '0', '685443000', '17612', 5, 4, '7', '9', '6', '9', '9', '1', '9');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('108', '1976-12-26 01:34:48', NULL, '0', '34660200', '0', 6, 6, '9', '1', '2', '3', '8', '3', '4');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('109', '1990-01-24 08:25:46', NULL, '1696200', '37', '8505340', 9, 5, '9', '0', '1', '5', '0', '0', '5');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('110', '2002-08-28 05:16:45', NULL, '8167570', '2501840', '63567900', 0, 3, '3', '7', '4', '8', '0', '5', '5');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('111', '1997-01-06 16:47:35', NULL, '1.99837', '532235000', '81238', 9, 5, '2', '9', '9', '8', '2', '3', '4');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('112', '2006-11-29 07:50:15', NULL, '3287950', '27', '2790140', 0, 6, '8', '3', '6', '4', '8', '0', '8');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('113', '2015-06-16 05:01:31', NULL, '32.1299', '50334500', '7348', 4, 6, '8', '6', '6', '5', '5', '9', '5');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('114', '1992-09-25 02:12:21', NULL, '11030.5', '890783', '32262', 3, 5, '3', '8', '0', '3', '6', '4', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('115', '2006-08-07 01:04:48', NULL, '40178.8', '0', '708452', 9, 9, '7', '9', '9', '9', '1', '8', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('116', '1974-10-20 16:43:32', NULL, '343956', '8192900', '7830060', 6, 5, '5', '9', '0', '0', '2', '8', '5');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('117', '1987-01-27 14:33:50', NULL, '8879900', '67', '374664', 7, 5, '8', '0', '3', '9', '6', '9', '5');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('118', '1986-08-17 11:22:41', NULL, '3.40645', '694', '29962', 6, 3, '0', '3', '3', '6', '0', '5', '9');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('119', '2013-08-19 17:21:27', NULL, '34307700', '4029', '5', 4, 8, '4', '9', '3', '9', '1', '1', '4');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('120', '1992-01-20 06:25:32', NULL, '3615', '69873500', '13718', 5, 5, '5', '9', '5', '3', '8', '9', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('121', '2011-01-10 10:46:25', NULL, '0', '0', '62378', 1, 5, '5', '5', '0', '2', '9', '3', '8');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('122', '1993-12-23 12:04:00', NULL, '20206000', '5928', '798618', 2, 2, '1', '7', '3', '3', '3', '7', '9');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('123', '1977-10-29 05:19:47', NULL, '19347200', '377', '8725', 2, 0, '0', '0', '1', '3', '5', '0', '9');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('124', '1985-09-07 09:22:45', NULL, '65.6175', '31871000', '0', 5, 4, '9', '4', '4', '0', '7', '1', '1');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('125', '2003-10-27 21:36:24', NULL, '12415700', '0', '0', 1, 7, '8', '2', '5', '0', '4', '3', '6');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('126', '1983-01-24 07:06:33', NULL, '61773', '34', '9598', 9, 0, '6', '6', '8', '8', '3', '2', '3');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('127', '1978-04-07 12:10:31', NULL, '4418.56', '43545600', '40613', 5, 7, '4', '9', '3', '3', '6', '6', '8');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('128', '2018-04-11 03:31:45', NULL, '1988.01', '63888500', '57131700', 2, 6, '5', '8', '1', '3', '2', '2', '6');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('129', '1994-05-21 16:09:05', NULL, '417735', '73248', '0', 3, 3, '7', '9', '2', '3', '2', '2', '5');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('130', '2013-10-06 00:33:29', NULL, '0', '0', '97401', 3, 1, '4', '9', '8', '7', '1', '1', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('131', '1992-09-01 09:34:16', NULL, '5674.3', '256888000', '4582600', 5, 3, '2', '8', '2', '4', '9', '7', '4');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('132', '2009-03-16 13:43:35', NULL, '42038200', '329', '833', 4, 0, '0', '0', '5', '7', '6', '5', '5');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('133', '1978-01-15 17:03:33', NULL, '645.674', '449103', '906', 3, 3, '3', '5', '1', '9', '4', '8', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('134', '1991-05-03 00:42:47', NULL, '26.3', '2', '167272', 2, 0, '2', '7', '2', '5', '8', '1', '5');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('135', '2002-12-31 08:29:39', NULL, '6413530', '986', '98022', 7, 0, '9', '1', '0', '3', '1', '3', '4');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('136', '2018-05-02 18:15:58', NULL, '70241', '0', '29023', 1, 6, '1', '4', '4', '6', '9', '6', '2');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('137', '1993-09-30 14:11:37', NULL, '63165000', '196252000', '3', 5, 1, '8', '8', '6', '6', '8', '0', '1');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('138', '2000-08-15 13:16:49', NULL, '0', '6933', '91', 0, 0, '0', '4', '2', '9', '9', '5', '6');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('139', '2002-09-12 06:55:16', NULL, '432.222', '30401200', '39', 0, 0, '5', '3', '1', '1', '1', '8', '2');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('140', '1980-06-27 11:38:06', NULL, '70165.5', '411692', '83727', 1, 5, '7', '8', '5', '4', '7', '9', '2');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('141', '1982-02-12 19:34:33', NULL, '14628900', '45335', '52248', 0, 0, '2', '7', '1', '1', '0', '2', '2');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('142', '2009-07-16 18:59:15', NULL, '0', '0', '0', 0, 5, '6', '7', '2', '2', '2', '8', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('143', '2018-11-06 23:49:24', NULL, '3366.11', '394', '707', 7, 1, '5', '9', '8', '8', '3', '6', '8');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('144', '2007-12-16 08:30:06', NULL, '2698710', '415397000', '48', 8, 6, '5', '4', '3', '8', '0', '4', '1');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('145', '1993-05-26 20:12:13', NULL, '2475480', '44', '1', 2, 4, '9', '6', '2', '8', '8', '8', '2');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('146', '2007-09-19 13:21:47', NULL, '723535', '277559000', '799375', 7, 2, '6', '5', '2', '8', '2', '6', '9');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('147', '2016-02-23 13:46:26', NULL, '680.31', '477', '77752', 1, 2, '7', '1', '8', '0', '9', '4', '0');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('148', '1983-07-18 21:03:06', NULL, '12289400', '529294', '22593800', 7, 1, '1', '1', '6', '8', '7', '4', '1');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('149', '1998-01-20 03:30:04', NULL, '5678140', '450', '384623', 0, 9, '6', '9', '8', '8', '9', '6', '5');
INSERT INTO `report_27` (`id`, `trading_date`, `gtp`, `v_bid_so`, `t_min`, `p_max`, `change_load_down`, `change_load_up`, `trade_graph`, `p_unreg`, `v_sell_rsv`, `p_sell_rsv`, `v_buy_sdd`, `p_buy_sdd`, `korr_v`) VALUES ('150', '2011-07-25 22:04:58', NULL, '2408680', '6183', '253736', 4, 3, '5', '4', '2', '0', '0', '3', '5');


#
# TABLE STRUCTURE FOR: report_28
#

DROP TABLE IF EXISTS `report_28`;

CREATE TABLE `report_28` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trading_date` datetime DEFAULT NULL,
  `gtpp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PVIE0001',
  `v_SO_zayav` float unsigned DEFAULT NULL COMMENT '?????????? ????? ? ??',
  `trade_graph` float unsigned DEFAULT NULL COMMENT '????? ????????? ??????? ???*???',
  `p_unreg` float unsigned DEFAULT NULL COMMENT '???????????????? ???? ?? ??????? (?? ???????? ????????? ???????) ???/(???*???)',
  `tr_graph_gp` float unsigned DEFAULT NULL COMMENT '????? ?? ?? ??????? ????-???????, ? ?????? ????????? ??????? ????????? ????????? ?? ?? (??*)???*???',
  `v_buy_rsv` float unsigned DEFAULT NULL COMMENT '??????? ? ??? - ????? ??????? ???*???',
  `p_buy_rsv` float unsigned DEFAULT NULL COMMENT '??????? ? ??? - ???? ???/(???*???)',
  `v_sell_sdd` float unsigned DEFAULT NULL COMMENT '??????? ? ??????????? ??? (????) - ????? ??????? ???*???',
  `p_sell_sdd` float unsigned DEFAULT NULL COMMENT '??????? ? ??????????? ??? (????) - ???? ???/(???*???)',
  PRIMARY KEY (`id`),
  KEY `trading_date` (`trading_date`),
  KEY `gtpp` (`gtpp`),
  CONSTRAINT `report_28_ibfk_1` FOREIGN KEY (`gtpp`) REFERENCES `gtp` (`gtpp`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('401', '2005-03-26 07:09:21', NULL, '925', '0', '0', '4', '6', '7', '4', '2');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('402', '2006-08-23 02:40:03', NULL, '128', '274.808', '4', '9', '4', '8', '4', '7');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('403', '1988-07-30 21:36:36', NULL, '923', '2006.57', '7', '7', '2', '3', '6', '0');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('404', '2017-11-02 17:11:21', NULL, '888', '7287.61', '6', '7', '5', '6', '9', '9');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('405', '1987-10-29 16:11:40', NULL, '136', '445201000', '7', '5', '1', '1', '7', '7');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('406', '1999-01-29 18:12:06', NULL, '457', '185870', '5', '5', '3', '8', '8', '6');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('407', '2012-03-28 01:06:31', NULL, '470', '0', '3', '9', '7', '7', '9', '3');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('408', '1989-07-10 03:04:23', NULL, '124', '496237000', '9', '9', '8', '6', '1', '4');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('409', '2008-10-21 21:14:05', NULL, '633', '36751800', '0', '0', '0', '7', '8', '7');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('410', '1994-12-06 05:22:38', NULL, '40', '43.8266', '1', '4', '9', '9', '9', '6');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('411', '1973-04-06 01:01:26', NULL, '873', '0', '9', '9', '4', '1', '1', '4');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('412', '1972-04-04 12:03:54', NULL, '621', '4715', '6', '9', '2', '9', '7', '3');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('413', '2008-07-08 09:36:42', NULL, '725', '1.79391', '4', '5', '3', '6', '6', '5');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('414', '2008-05-18 14:43:13', NULL, '800', '6390760', '2', '4', '4', '2', '5', '6');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('415', '1984-07-11 08:58:29', NULL, '972', '0', '9', '1', '6', '1', '5', '6');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('416', '1990-08-31 04:02:15', NULL, '691', '0', '6', '2', '8', '2', '7', '7');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('417', '2003-09-29 00:44:24', NULL, '186', '2137.88', '9', '5', '1', '9', '3', '3');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('418', '2011-12-08 01:06:28', NULL, '662', '4713960', '2', '6', '3', '0', '4', '4');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('419', '1987-07-05 13:06:48', NULL, '728', '4.28175', '2', '9', '8', '2', '4', '8');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('420', '1972-10-10 19:32:33', NULL, '655', '175843000', '4', '0', '4', '4', '7', '1');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('421', '2003-01-21 09:30:24', NULL, '37', '5127720', '0', '0', '3', '5', '2', '5');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('422', '2010-04-30 15:53:13', NULL, '34', '29602600', '8', '4', '0', '4', '2', '3');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('423', '1993-12-15 10:26:25', NULL, '869', '194.609', '6', '2', '6', '8', '8', '7');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('424', '1983-06-03 11:18:55', NULL, '354', '45', '8', '3', '8', '3', '4', '1');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('425', '2011-05-13 03:19:25', NULL, '976', '111396', '3', '8', '3', '2', '3', '7');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('426', '1989-01-01 02:38:23', NULL, '540', '0', '2', '2', '0', '1', '7', '5');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('427', '1999-06-15 02:20:03', NULL, '454', '57031100', '9', '1', '0', '7', '6', '0');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('428', '1972-04-11 05:27:41', NULL, '892', '230.349', '2', '3', '9', '7', '4', '8');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('429', '2019-02-06 06:13:54', NULL, '102', '1841350', '6', '1', '7', '0', '7', '7');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('430', '2001-07-19 01:11:46', NULL, '924', '0', '8', '9', '2', '7', '1', '8');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('431', '1981-12-09 19:00:43', NULL, '239', '0', '7', '9', '5', '2', '3', '9');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('432', '1977-04-11 07:20:35', NULL, '504', '14865.1', '7', '2', '1', '0', '3', '8');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('433', '2018-03-30 08:16:30', NULL, '757', '2.57322', '6', '0', '2', '6', '7', '5');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('434', '1972-10-30 03:03:11', NULL, '751', '17384', '3', '5', '2', '6', '5', '0');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('435', '1977-12-17 00:33:49', NULL, '297', '228023', '4', '3', '8', '6', '5', '6');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('436', '2008-03-17 22:01:01', NULL, '961', '75', '2', '2', '5', '8', '2', '5');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('437', '1974-07-02 17:57:02', NULL, '782', '31490.3', '2', '3', '3', '3', '6', '0');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('438', '2012-09-06 09:16:30', NULL, '345', '236.1', '6', '6', '5', '6', '2', '5');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('439', '1980-04-07 00:41:54', NULL, '355', '582.524', '2', '4', '9', '2', '1', '1');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('440', '1981-05-30 13:27:39', NULL, '508', '0', '0', '3', '6', '2', '3', '7');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('441', '2019-07-17 01:33:49', NULL, '814', '76379700', '3', '1', '7', '2', '7', '3');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('442', '1979-11-18 12:20:03', NULL, '253', '0', '5', '5', '7', '2', '9', '8');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('443', '2007-10-30 15:01:46', NULL, '956', '328.88', '8', '1', '8', '6', '5', '2');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('444', '1987-01-07 18:49:29', NULL, '69', '1675170', '5', '3', '1', '2', '9', '9');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('445', '1989-10-11 08:45:33', NULL, '669', '396234', '5', '9', '3', '4', '5', '1');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('446', '1992-12-27 14:30:32', NULL, '443', '0.164375', '8', '2', '3', '0', '0', '1');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('447', '2016-10-25 08:07:47', NULL, '638', '7030880', '2', '4', '5', '3', '5', '8');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('448', '1975-10-10 20:34:54', NULL, '465', '1010010', '1', '4', '7', '3', '8', '7');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('449', '1973-09-16 22:03:50', NULL, '287', '1769.16', '0', '5', '6', '0', '9', '3');
INSERT INTO `report_28` (`id`, `trading_date`, `gtpp`, `v_SO_zayav`, `trade_graph`, `p_unreg`, `tr_graph_gp`, `v_buy_rsv`, `p_buy_rsv`, `v_sell_sdd`, `p_sell_sdd`) VALUES ('450', '1982-10-28 10:43:10', NULL, '468', '1595340', '4', '4', '0', '7', '0', '0');


