-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: electric_cars
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `battery_plugin_shares`
--

DROP TABLE IF EXISTS `battery_plugin_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battery_plugin_shares` (
  `entity` text,
  `code` text,
  `year` int DEFAULT NULL,
  `hybrid_share` double DEFAULT NULL,
  `battery_electric_share` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battery_plugin_shares`
--

LOCK TABLES `battery_plugin_shares` WRITE;
/*!40000 ALTER TABLE `battery_plugin_shares` DISABLE KEYS */;
INSERT INTO `battery_plugin_shares` VALUES ('Australia','AUS',2012,0.01,0.02),('Australia','AUS',2013,0.012,0.022),('Australia','AUS',2014,0.115,0.045),('Australia','AUS',2015,0.114,0.086),('Australia','AUS',2016,0.077,0.073),('Australia','AUS',2017,0.124,0.136),('Australia','AUS',2018,0.21,0.21),('Australia','AUS',2019,0.378,0.822),('Australia','AUS',2020,0.271,0.829),('Australia','AUS',2021,0.467,2.333),('Australia','AUS',2022,0.774,4.326),('Austria','AUT',2015,0.354,0.546),('Austria','AUT',2016,0.36,1.14),('Austria','AUT',2017,0.479,1.521),('Austria','AUT',2018,0.657,1.943),('Austria','AUT',2019,0.67,2.83),('Austria','AUT',2020,3.059,6.441),('Austria','AUT',2021,6.25,13.75),('Austria','AUT',2022,6.085,15.915),('Belgium','BEL',2010,0.001,0.009),('Belgium','BEL',2011,0.003,0.049),('Belgium','BEL',2012,0.071,0.119),('Belgium','BEL',2013,0.013,0.107),('Belgium','BEL',2014,0.137,0.273),('Belgium','BEL',2015,0.494,0.276),('Belgium','BEL',2016,1.312,0.388),('Belgium','BEL',2017,2.122,0.478),('Belgium','BEL',2018,1.745,0.655),('Belgium','BEL',2019,1.609,1.591),('Belgium','BEL',2020,7.489,3.511),('Belgium','BEL',2021,12.169,5.831),('Belgium','BEL',2022,15.814,10.186),('Brazil','BRA',2012,0.001,0.002),('Brazil','BRA',2013,0.001,0.004),('Brazil','BRA',2015,0.001,0.003),('Brazil','BRA',2016,0.003,0.007),('Brazil','BRA',2017,0.017,0.002),('Brazil','BRA',2018,0.011,0.003),('Brazil','BRA',2019,0.061,0.023),('Brazil','BRA',2020,0.109,0.041),('Brazil','BRA',2021,0.586,0.154),('Brazil','BRA',2022,0.53,0.45),('Canada','CAN',2011,0.024,0.017),('Canada','CAN',2012,0.095,0.045),('Canada','CAN',2013,0.102,0.108),('Canada','CAN',2014,0.149,0.181),('Canada','CAN',2015,0.152,0.278),('Canada','CAN',2016,0.397,0.323),('Canada','CAN',2017,0.474,0.516),('Canada','CAN',2018,1.289,1.411),('Canada','CAN',2019,1.192,2.008),('Canada','CAN',2020,1.125,2.975),('Canada','CAN',2021,2.092,4.408),('Canada','CAN',2022,2.391,7.009),('Chile','CHL',2014,0.006,0.001),('Chile','CHL',2015,0.012,0.007),('Chile','CHL',2016,0.004,0.011),('Chile','CHL',2017,0.007,0.054),('Chile','CHL',2018,0.028,0.044),('Chile','CHL',2019,0.065,0.075),('Chile','CHL',2020,0.067,0.093),('Chile','CHL',2021,0.1,0.09),('Chile','CHL',2022,0.203,0.287),('China','CHN',2010,0.002,0.008),('China','CHN',2011,0.002,0.032),('China','CHN',2012,0.002,0.071),('China','CHN',2013,0.004,0.091),('China','CHN',2014,0.132,0.268),('China','CHN',2015,0.289,0.711),('China','CHN',2016,0.35,1.15),('China','CHN',2017,0.455,1.945),('China','CHN',2018,1.214,3.686),('China','CHN',2019,1.085,3.915),('China','CHN',2020,1.119,4.681),('China','CHN',2021,2.708,13.292),('China','CHN',2022,7.373,21.627),('Denmark','DNK',2011,0.001,0.249),('Denmark','DNK',2012,0.007,0.283),('Denmark','DNK',2013,0.005,0.275),('Denmark','DNK',2014,0.048,0.852),('Denmark','DNK',2015,0.205,2.095),('Denmark','DNK',2016,0.259,0.591),('Denmark','DNK',2017,0.28,0.32),('Denmark','DNK',2018,1.415,0.685),('Denmark','DNK',2019,1.743,2.457),('Denmark','DNK',2020,9,7),('Denmark','DNK',2021,21.538,13.462),('Denmark','DNK',2022,17.789,21.211),('Europe','',2010,0,0.014),('Europe','',2011,0.003,0.07),('Europe','',2012,0.067,0.133),('Europe','',2013,0.194,0.246),('Europe','',2014,0.241,0.439),('Europe','',2015,0.638,0.562),('Europe','',2016,0.736,0.564),('Europe','',2017,0.907,0.793),('Europe','',2018,1.121,1.179),('Europe','',2019,1.253,2.147),('Europe','',2020,4.565,5.435),('Europe','',2021,8.609,9.391),('Europe','',2022,8.077,12.923),('European Union (27)','',2010,0,0.012),('European Union (27)','',2011,0.003,0.06),('European Union (27)','',2012,0.072,0.118),('European Union (27)','',2013,0.251,0.219),('European Union (27)','',2014,0.24,0.32),('European Union (27)','',2015,0.647,0.453),('European Union (27)','',2016,0.54,0.44),('European Union (27)','',2017,0.658,0.642),('European Union (27)','',2018,0.871,1.029),('European Union (27)','',2019,1.077,1.923),('European Union (27)','',2020,4.857,5.143),('European Union (27)','',2021,8.949,9.051),('European Union (27)','',2022,9.333,11.667),('Finland','FIN',2012,0.122,0.048),('Finland','FIN',2013,0.162,0.048),('Finland','FIN',2014,0.242,0.168),('Finland','FIN',2015,0.382,0.218),('Finland','FIN',2016,1.014,0.186),('Finland','FIN',2017,2.181,0.419),('Finland','FIN',2018,4.055,0.645),('Finland','FIN',2019,5.241,1.659),('Finland','FIN',2020,13.605,4.395),('Finland','FIN',2021,20.667,10.333),('Finland','FIN',2022,19.613,18.387),('France','FRA',2011,0.005,0.125),('France','FRA',2012,0.032,0.308),('France','FRA',2013,0.047,0.503),('France','FRA',2014,0.115,0.605),('France','FRA',2015,0.301,0.899),('France','FRA',2016,0.378,1.122),('France','FRA',2017,0.584,1.216),('France','FRA',2018,0.685,1.415),('France','FRA',2019,0.858,1.942),('France','FRA',2020,4.459,6.541),('France','FRA',2021,8.867,10.133),('France','FRA',2022,8.029,12.971),('Germany','DEU',2011,0.008,0.044),('Germany','DEU',2012,0.039,0.071),('Germany','DEU',2013,0.054,0.176),('Germany','DEU',2014,0.147,0.303),('Germany','DEU',2015,0.349,0.381),('Germany','DEU',2016,0.395,0.335),('Germany','DEU',2017,0.859,0.741),('Germany','DEU',2018,0.879,1.021),('Germany','DEU',2019,1.208,1.692),('Germany','DEU',2020,6.667,6.333),('Germany','DEU',2021,12.435,13.565),('Germany','DEU',2022,13.446,17.554),('Greece','GRC',2015,0.029,0.046),('Greece','GRC',2016,0.069,0.051),('Greece','GRC',2017,0.162,0.058),('Greece','GRC',2018,0.204,0.086),('Greece','GRC',2019,0.254,0.166),('Greece','GRC',2020,1.789,0.811),('Greece','GRC',2021,4.731,2.169),('Greece','GRC',2022,5.235,2.665),('Iceland','ISL',2012,0.107,0.203),('Iceland','ISL',2013,0.29,1.01),('Iceland','ISL',2014,0.266,1.834),('Iceland','ISL',2015,1.093,2.507),('Iceland','ISL',2016,3.766,1.834),('Iceland','ISL',2017,10.098,3.902),('Iceland','ISL',2018,15.761,4.239),('Iceland','ISL',2019,14.981,8.019),('Iceland','ISL',2020,24.96,27.04),('Iceland','ISL',2021,38.348,33.652),('Iceland','ISL',2022,29.412,40.588),('India','IND',2019,0,0.024),('India','IND',2020,0.002,0.128),('India','IND',2021,0.002,0.398),('India','IND',2022,0.001,1.499),('Israel','ISR',2012,0,0.27),('Israel','ISR',2013,0.007,0.203),('Israel','ISR',2014,0.02,0.002),('Israel','ISR',2015,0.023,0.001),('Israel','ISR',2016,0.02,0.002),('Israel','ISR',2017,0.479,0.041),('Israel','ISR',2018,1.158,0.042),('Israel','ISR',2019,1.314,0.286),('Israel','ISR',2020,2.035,0.565),('Israel','ISR',2021,3.683,3.117),('Israel','ISR',2022,4.837,8.163),('Italy','ITA',2013,0.014,0.066),('Italy','ITA',2014,0.025,0.075),('Italy','ITA',2015,0.046,0.094),('Italy','ITA',2016,0.072,0.078),('Italy','ITA',2017,0.148,0.102),('Italy','ITA',2018,0.247,0.263),('Italy','ITA',2019,0.334,0.566),('Italy','ITA',2020,1.935,2.365),('Italy','ITA',2021,4.888,4.612),('Italy','ITA',2022,5.132,3.868),('Japan','JPN',2011,0,0.31),('Japan','JPN',2012,0.243,0.287),('Japan','JPN',2013,0.304,0.326),('Japan','JPN',2014,0.345,0.345),('Japan','JPN',2015,0.338,0.242),('Japan','JPN',2016,0.231,0.369),('Japan','JPN',2017,0.8,0.4),('Japan','JPN',2018,0.506,0.594),('Japan','JPN',2019,0.415,0.485),('Japan','JPN',2020,0.385,0.385),('Japan','JPN',2021,0.613,0.587),('Japan','JPN',2022,1.206,1.794),('Mexico','MEX',2015,0.001,0.007),('Mexico','MEX',2016,0.034,0.017),('Mexico','MEX',2017,0.067,0.016),('Mexico','MEX',2018,0.116,0.014),('Mexico','MEX',2019,0.108,0.022),('Mexico','MEX',2020,0.221,0.199),('Mexico','MEX',2021,0.404,0.346),('Mexico','MEX',2022,0.433,0.477),('Netherlands','NLD',2011,0.003,0.157),('Netherlands','NLD',2012,0.845,0.155),('Netherlands','NLD',2013,4.867,0.633),('Netherlands','NLD',2014,3.184,0.716),('Netherlands','NLD',2015,9.152,0.848),('Netherlands','NLD',2016,4.935,1.065),('Netherlands','NLD',2017,0.267,2.233),('Netherlands','NLD',2018,0.802,5.498),('Netherlands','NLD',2019,1.099,13.901),('Netherlands','NLD',2020,4.261,20.739),('Netherlands','NLD',2021,9.789,20.211),('Netherlands','NLD',2022,11.121,23.879),('New Zealand','NZL',2011,0.001,0.009),('New Zealand','NZL',2012,0.003,0.014),('New Zealand','NZL',2013,0.003,0.016),('New Zealand','NZL',2014,0.092,0.048),('New Zealand','NZL',2015,0.08,0.12),('New Zealand','NZL',2016,0.126,0.444),('New Zealand','NZL',2017,0.188,1.012),('New Zealand','NZL',2018,0.407,1.493),('New Zealand','NZL',2019,0.649,2.151),('New Zealand','NZL',2020,0.778,2.022),('New Zealand','NZL',2021,1.223,2.377),('New Zealand','NZL',2022,4.241,8.759),('Norway','NOR',2012,0.235,2.865),('Norway','NOR',2013,0.239,5.561),('Norway','NOR',2014,1.175,13.825),('Norway','NOR',2015,5.127,16.873),('Norway','NOR',2016,13.533,15.467),('Norway','NOR',2017,18.242,20.758),('Norway','NOR',2018,18.123,30.877),('Norway','NOR',2019,13.468,42.532),('Norway','NOR',2020,20.519,54.481),('Norway','NOR',2021,22.081,63.919),('Norway','NOR',2022,8.482,79.518),('Other Europe','',2012,0,0.074),('Other Europe','',2014,0,0.13),('Other Europe','',2015,0.015,0.135),('Other Europe','',2016,0.048,0.132),('Other Europe','',2017,0.148,0.262),('Other Europe','',2018,0.179,0.491),('Other Europe','',2019,0.344,0.756),('Other Europe','',2020,1.147,1.853),('Other Europe','',2021,2.167,3.033),('Other Europe','',2022,2.244,4.756),('Poland','POL',2010,0,0.005),('Poland','POL',2012,0.002,0.017),('Poland','POL',2013,0.002,0.011),('Poland','POL',2014,0.019,0.043),('Poland','POL',2015,0.042,0.02),('Poland','POL',2016,0.094,0.026),('Poland','POL',2017,0.13,0.09),('Poland','POL',2018,0.143,0.117),('Poland','POL',2019,0.218,0.272),('Poland','POL',2020,1.043,0.857),('Poland','POL',2021,2.066,1.634),('Poland','POL',2022,2.64,3.36),('Portugal','PRT',2013,0.034,0.156),('Portugal','PRT',2014,0.006,0.134),('Portugal','PRT',2015,0.244,0.326),('Portugal','PRT',2016,0.448,0.362),('Portugal','PRT',2017,1.08,0.82),('Portugal','PRT',2018,1.706,1.794),('Portugal','PRT',2019,2.603,3.097),('Portugal','PRT',2020,8.485,5.515),('Portugal','PRT',2021,11.034,8.966),('Portugal','PRT',2022,10.353,11.647),('Rest of World','',2012,0.001,0.002),('Rest of World','',2013,0,0.001),('Rest of World','',2014,0.003,0.001),('Rest of World','',2015,0.008,0.028),('Rest of World','',2016,0.006,0.007),('Rest of World','',2017,0.005,0.016),('Rest of World','',2018,0.02,0.015),('Rest of World','',2019,0.024,0.041),('Rest of World','',2020,0.028,0.056),('Rest of World','',2021,0.05,0.13),('Rest of World','',2022,0.049,0.231),('South Africa','ZAF',2014,0,0.003),('South Africa','ZAF',2015,0.029,0.029),('South Africa','ZAF',2016,0.074,0.026),('South Africa','ZAF',2017,0.035,0.018),('South Africa','ZAF',2018,0.023,0.018),('South Africa','ZAF',2019,0.02,0.044),('South Africa','ZAF',2020,0.061,0.037),('South Africa','ZAF',2021,0.017,0.072),('South Africa','ZAF',2022,0.033,0.137),('South Korea','KOR',2015,0.016,0.194),('South Korea','KOR',2016,0.021,0.299),('South Korea','KOR',2017,0.042,0.878),('South Korea','KOR',2018,0.267,3.333),('South Korea','KOR',2019,0.166,2.034),('South Korea','KOR',2020,0.548,1.952),('South Korea','KOR',2021,1.295,4.905),('South Korea','KOR',2022,0.789,8.611),('Spain','ESP',2011,0.001,0.048),('Spain','ESP',2012,0.015,0.061),('Spain','ESP',2013,0.01,0.11),('Spain','ESP',2014,0.038,0.162),('Spain','ESP',2015,0.079,0.131),('Spain','ESP',2016,0.133,0.177),('Spain','ESP',2017,0.284,0.316),('Spain','ESP',2018,0.425,0.455),('Spain','ESP',2019,0.595,0.805),('Spain','ESP',2020,2.8,2.1),('Spain','ESP',2021,5.006,2.794),('Spain','ESP',2022,5.318,3.582),('Sweden','SWE',2012,0.22,0.09),('Sweden','SWE',2013,0.381,0.149),('Sweden','SWE',2014,1.035,0.365),('Sweden','SWE',2015,1.572,0.828),('Sweden','SWE',2016,2.636,0.764),('Sweden','SWE',2017,4,1.1),('Sweden','SWE',2018,5.746,1.854),('Sweden','SWE',2019,6.707,4.293),('Sweden','SWE',2020,22.468,9.532),('Sweden','SWE',2021,24.844,18.156),('Sweden','SWE',2022,22.196,31.804),('Switzerland','CHE',2011,0.013,0.127),('Switzerland','CHE',2012,0.124,0.106),('Switzerland','CHE',2013,0.053,0.377),('Switzerland','CHE',2014,0.066,0.894),('Switzerland','CHE',2015,0.716,0.984),('Switzerland','CHE',2016,0.872,1.028),('Switzerland','CHE',2017,1.157,1.543),('Switzerland','CHE',2018,1.482,1.718),('Switzerland','CHE',2019,1.392,4.208),('Switzerland','CHE',2020,5.765,8.235),('Switzerland','CHE',2021,9.37,13.63),('Switzerland','CHE',2022,8.051,16.949),('Turkey','TUR',2014,0.004,0.008),('Turkey','TUR',2015,0.015,0.016),('Turkey','TUR',2016,0.011,0.006),('Turkey','TUR',2017,0.005,0.01),('Turkey','TUR',2018,0.009,0.036),('Turkey','TUR',2019,0.024,0.06),('Turkey','TUR',2020,0.053,0.117),('Turkey','TUR',2021,0.129,0.421),('Turkey','TUR',2022,0.072,0.928),('United Kingdom','GBR',2010,0.001,0.012),('United Kingdom','GBR',2011,0,0.063),('United Kingdom','GBR',2012,0.049,0.081),('United Kingdom','GBR',2013,0.051,0.119),('United Kingdom','GBR',2014,0.323,0.277),('United Kingdom','GBR',2015,0.721,0.379),('United Kingdom','GBR',2016,1.041,0.359),('United Kingdom','GBR',2017,1.357,0.543),('United Kingdom','GBR',2018,1.929,0.671),('United Kingdom','GBR',2019,1.579,1.621),('United Kingdom','GBR',2020,4.202,6.798),('United Kingdom','GBR',2021,7.355,11.645),('United Kingdom','GBR',2022,6.216,16.784),('United States','USA',2011,0.076,0.094),('United States','USA',2012,0.296,0.114),('United States','USA',2013,0.374,0.366),('United States','USA',2014,0.415,0.475),('United States','USA',2015,0.294,0.486),('United States','USA',2016,0.456,0.544),('United States','USA',2017,0.581,0.619),('United States','USA',2018,0.667,1.333),('United States','USA',2019,0.549,1.551),('United States','USA',2020,0.479,1.721),('United States','USA',2021,1.143,3.357),('United States','USA',2022,1.478,6.222),('World','OWID_WRL',2010,0.001,0.01),('World','OWID_WRL',2011,0.013,0.057),('World','OWID_WRL',2012,0.081,0.079),('World','OWID_WRL',2013,0.122,0.148),('World','OWID_WRL',2014,0.169,0.261),('World','OWID_WRL',2015,0.28,0.42),('World','OWID_WRL',2016,0.344,0.546),('World','OWID_WRL',2017,0.498,0.902),('World','OWID_WRL',2018,0.729,1.571),('World','OWID_WRL',2019,0.725,1.875),('World','OWID_WRL',2020,1.372,2.828),('World','OWID_WRL',2021,2.543,6.157),('World','OWID_WRL',2022,3.98,10.02);
/*!40000 ALTER TABLE `battery_plugin_shares` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-04 16:06:28
