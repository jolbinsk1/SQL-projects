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
-- Table structure for table `electric_stock_share`
--

DROP TABLE IF EXISTS `electric_stock_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electric_stock_share` (
  `entity` text,
  `code` text,
  `year` int DEFAULT NULL,
  `electric_car_stock_share` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electric_stock_share`
--

LOCK TABLES `electric_stock_share` WRITE;
/*!40000 ALTER TABLE `electric_stock_share` DISABLE KEYS */;
INSERT INTO `electric_stock_share` VALUES ('Australia','AUS',2011,0.0005),('Australia','AUS',2012,0.0028),('Australia','AUS',2013,0.0054),('Australia','AUS',2014,0.017),('Australia','AUS',2015,0.032),('Australia','AUS',2016,0.043),('Australia','AUS',2017,0.061),('Australia','AUS',2018,0.089),('Australia','AUS',2019,0.16),('Australia','AUS',2020,0.22),('Australia','AUS',2021,0.39),('Australia','AUS',2022,0.59),('Austria','AUT',2010,0.0079),('Austria','AUT',2011,0.022),('Austria','AUT',2012,0.033),('Austria','AUT',2013,0.053),('Austria','AUT',2014,0.089),('Austria','AUT',2015,0.14),('Austria','AUT',2016,0.24),('Austria','AUT',2017,0.38),('Austria','AUT',2018,0.53),('Austria','AUT',2019,0.75),('Austria','AUT',2020,1.2),('Austria','AUT',2021,2.1),('Austria','AUT',2022,3),('Belgium','BEL',2010,0.0013),('Belgium','BEL',2011,0.0064),('Belgium','BEL',2012,0.022),('Belgium','BEL',2013,0.033),('Belgium','BEL',2014,0.067),('Belgium','BEL',2015,0.13),('Belgium','BEL',2016,0.29),('Belgium','BEL',2017,0.53),('Belgium','BEL',2018,0.75),('Belgium','BEL',2019,1),('Belgium','BEL',2020,1.8),('Belgium','BEL',2021,3),('Belgium','BEL',2022,4.5),('Brazil','BRA',2014,0.0002),('Brazil','BRA',2015,0.0004),('Brazil','BRA',2016,0.0009),('Brazil','BRA',2017,0.0019),('Brazil','BRA',2018,0.0028),('Brazil','BRA',2019,0.0078),('Brazil','BRA',2020,0.014),('Brazil','BRA',2021,0.051),('Brazil','BRA',2022,0.098),('Canada','CAN',2011,0.0028),('Canada','CAN',2012,0.012),('Canada','CAN',2013,0.027),('Canada','CAN',2014,0.052),('Canada','CAN',2015,0.085),('Canada','CAN',2016,0.14),('Canada','CAN',2017,0.21),('Canada','CAN',2018,0.38),('Canada','CAN',2019,0.59),('Canada','CAN',2020,0.73),('Canada','CAN',2021,1.2),('Canada','CAN',2022,1.6),('Chile','CHL',2011,0.0003),('Chile','CHL',2012,0.0005),('Chile','CHL',2013,0.0006),('Chile','CHL',2014,0.0012),('Chile','CHL',2015,0.0025),('Chile','CHL',2016,0.0035),('Chile','CHL',2017,0.0079),('Chile','CHL',2018,0.013),('Chile','CHL',2019,0.02),('Chile','CHL',2020,0.026),('Chile','CHL',2021,0.042),('Chile','CHL',2022,0.082),('China','CHN',2010,0.003),('China','CHN',2011,0.009),('China','CHN',2012,0.019),('China','CHN',2013,0.03),('China','CHN',2014,0.069),('China','CHN',2015,0.2),('China','CHN',2016,0.38),('China','CHN',2017,0.64),('China','CHN',2018,1.1),('China','CHN',2019,1.5),('China','CHN',2020,1.8),('China','CHN',2021,2.9),('China','CHN',2022,4.9),('Denmark','DNK',2010,0.0037),('Denmark','DNK',2011,0.023),('Denmark','DNK',2012,0.056),('Denmark','DNK',2013,0.068),('Denmark','DNK',2014,0.13),('Denmark','DNK',2015,0.35),('Denmark','DNK',2016,0.4),('Denmark','DNK',2017,0.42),('Denmark','DNK',2018,0.59),('Denmark','DNK',2019,0.96),('Denmark','DNK',2020,2.3),('Denmark','DNK',2021,5.2),('Denmark','DNK',2022,7.8),('Europe','',2010,0.0027),('Europe','',2011,0.0065),('Europe','',2012,0.017),('Europe','',2013,0.037),('Europe','',2014,0.07),('Europe','',2015,0.13),('Europe','',2016,0.21),('Europe','',2017,0.29),('Europe','',2018,0.41),('Europe','',2019,0.56),('Europe','',2020,0.98),('Europe','',2021,1.7),('Europe','',2022,2.4),('European Union (27)','',2010,0.0014),('European Union (27)','',2011,0.005),('European Union (27)','',2012,0.014),('European Union (27)','',2013,0.035),('European Union (27)','',2014,0.06),('European Union (27)','',2015,0.11),('European Union (27)','',2016,0.17),('European Union (27)','',2017,0.23),('European Union (27)','',2018,0.33),('European Union (27)','',2019,0.45),('European Union (27)','',2020,0.86),('European Union (27)','',2021,1.6),('European Union (27)','',2022,2.3),('Finland','FIN',2011,0.002),('Finland','FIN',2012,0.0089),('Finland','FIN',2013,0.018),('Finland','FIN',2014,0.036),('Finland','FIN',2015,0.061),('Finland','FIN',2016,0.12),('Finland','FIN',2017,0.27),('Finland','FIN',2018,0.57),('Finland','FIN',2019,1.1),('Finland','FIN',2020,2.3),('Finland','FIN',2021,3.6),('Finland','FIN',2022,5.4),('France','FRA',2010,0.0009),('France','FRA',2011,0.0093),('France','FRA',2012,0.029),('France','FRA',2013,0.059),('France','FRA',2014,0.098),('France','FRA',2015,0.17),('France','FRA',2016,0.26),('France','FRA',2017,0.37),('France','FRA',2018,0.51),('France','FRA',2019,0.59),('France','FRA',2020,1.1),('France','FRA',2021,1.9),('France','FRA',2022,2.7),('Germany','DEU',2010,0.0006),('Germany','DEU',2011,0.0044),('Germany','DEU',2012,0.012),('Germany','DEU',2013,0.028),('Germany','DEU',2014,0.056),('Germany','DEU',2015,0.11),('Germany','DEU',2016,0.16),('Germany','DEU',2017,0.24),('Germany','DEU',2018,0.38),('Germany','DEU',2019,0.5),('Germany','DEU',2020,1.3),('Germany','DEU',2021,2.7),('Germany','DEU',2022,4),('Greece','GRC',2013,0.0001),('Greece','GRC',2014,0.0008),('Greece','GRC',2015,0.0023),('Greece','GRC',2016,0.0042),('Greece','GRC',2017,0.0078),('Greece','GRC',2018,0.014),('Greece','GRC',2019,0.022),('Greece','GRC',2020,0.061),('Greece','GRC',2021,0.18),('Greece','GRC',2022,0.36),('Iceland','ISL',2010,0.0068),('Iceland','ISL',2011,0.0068),('Iceland','ISL',2012,0.019),('Iceland','ISL',2013,0.067),('Iceland','ISL',2014,0.17),('Iceland','ISL',2015,0.4),('Iceland','ISL',2016,0.87),('Iceland','ISL',2017,2),('Iceland','ISL',2018,3.3),('Iceland','ISL',2019,4.4),('Iceland','ISL',2020,6.3),('Iceland','ISL',2021,11),('Iceland','ISL',2022,16),('India','IND',2010,0.0052),('India','IND',2011,0.007),('India','IND',2012,0.013),('India','IND',2013,0.012),('India','IND',2014,0.013),('India','IND',2015,0.015),('India','IND',2016,0.016),('India','IND',2017,0.021),('India','IND',2018,0.022),('India','IND',2019,0.023),('India','IND',2020,0.03),('India','IND',2021,0.059),('India','IND',2022,0.16),('Israel','ISR',2010,0.0003),('Israel','ISR',2011,0.0035),('Israel','ISR',2012,0.024),('Israel','ISR',2013,0.039),('Israel','ISR',2014,0.046),('Israel','ISR',2015,0.046),('Israel','ISR',2016,0.046),('Israel','ISR',2017,0.095),('Israel','ISR',2018,0.2),('Israel','ISR',2019,0.33),('Israel','ISR',2020,0.51),('Israel','ISR',2021,1.1),('Israel','ISR',2022,2.2),('Italy','ITA',2010,0.0018),('Italy','ITA',2011,0.002),('Italy','ITA',2012,0.0033),('Italy','ITA',2013,0.0059),('Italy','ITA',2014,0.0096),('Italy','ITA',2015,0.015),('Italy','ITA',2016,0.023),('Italy','ITA',2017,0.035),('Italy','ITA',2018,0.059),('Italy','ITA',2019,0.1),('Italy','ITA',2020,0.25),('Italy','ITA',2021,0.6),('Italy','ITA',2022,0.92),('Japan','JPN',2010,0.0061),('Japan','JPN',2011,0.028),('Japan','JPN',2012,0.069),('Japan','JPN',2013,0.12),('Japan','JPN',2014,0.18),('Japan','JPN',2015,0.22),('Japan','JPN',2016,0.25),('Japan','JPN',2017,0.31),('Japan','JPN',2018,0.36),('Japan','JPN',2019,0.41),('Japan','JPN',2020,0.45),('Japan','JPN',2021,0.51),('Japan','JPN',2022,0.64),('Mexico','MEX',2011,0),('Mexico','MEX',2012,0.0005),('Mexico','MEX',2013,0.0005),('Mexico','MEX',2014,0.0008),('Mexico','MEX',2015,0.0012),('Mexico','MEX',2016,0.0048),('Mexico','MEX',2017,0.01),('Mexico','MEX',2018,0.019),('Mexico','MEX',2019,0.027),('Mexico','MEX',2020,0.048),('Mexico','MEX',2021,0.082),('Mexico','MEX',2022,0.13),('Netherlands','NLD',2010,0.0036),('Netherlands','NLD',2011,0.015),('Netherlands','NLD',2012,0.079),('Netherlands','NLD',2013,0.36),('Netherlands','NLD',2014,0.55),('Netherlands','NLD',2015,1.1),('Netherlands','NLD',2016,1.4),('Netherlands','NLD',2017,1.4),('Netherlands','NLD',2018,1.7),('Netherlands','NLD',2019,2.3),('Netherlands','NLD',2020,3.3),('Netherlands','NLD',2021,4.2),('Netherlands','NLD',2022,5.6),('New Zealand','NZL',2010,0.0006),('New Zealand','NZL',2011,0.0013),('New Zealand','NZL',2012,0.0026),('New Zealand','NZL',2013,0.0043),('New Zealand','NZL',2014,0.019),('New Zealand','NZL',2015,0.042),('New Zealand','NZL',2016,0.11),('New Zealand','NZL',2017,0.25),('New Zealand','NZL',2018,0.46),('New Zealand','NZL',2019,0.51),('New Zealand','NZL',2020,0.66),('New Zealand','NZL',2021,1),('New Zealand','NZL',2022,1.8),('Norway','NOR',2010,0.12),('Norway','NOR',2011,0.16),('Norway','NOR',2012,0.34),('Norway','NOR',2013,0.63),('Norway','NOR',2014,1.4),('Norway','NOR',2015,2.6),('Norway','NOR',2016,4.3),('Norway','NOR',2017,6.5),('Norway','NOR',2018,9),('Norway','NOR',2019,12),('Norway','NOR',2020,17),('Norway','NOR',2021,22),('Norway','NOR',2022,27),('Other Europe','',2010,0.0003),('Other Europe','',2011,0.001),('Other Europe','',2012,0.0039),('Other Europe','',2013,0.0053),('Other Europe','',2014,0.011),('Other Europe','',2015,0.016),('Other Europe','',2016,0.022),('Other Europe','',2017,0.034),('Other Europe','',2018,0.056),('Other Europe','',2019,0.09),('Other Europe','',2020,0.15),('Other Europe','',2021,0.26),('Other Europe','',2022,0.48),('Poland','POL',2015,0.012),('Poland','POL',2016,0.017),('Poland','POL',2017,0.018),('Poland','POL',2018,0.021),('Poland','POL',2019,0.049),('Poland','POL',2020,0.071),('Poland','POL',2021,0.18),('Poland','POL',2022,0.32),('Portugal','PRT',2010,0.015),('Portugal','PRT',2011,0.019),('Portugal','PRT',2012,0.023),('Portugal','PRT',2013,0.027),('Portugal','PRT',2014,0.029),('Portugal','PRT',2015,0.053),('Portugal','PRT',2016,0.09),('Portugal','PRT',2017,0.17),('Portugal','PRT',2018,0.32),('Portugal','PRT',2019,0.54),('Portugal','PRT',2020,0.88),('Portugal','PRT',2021,1.4),('Portugal','PRT',2022,2),('Rest of World','',2011,0),('Rest of World','',2012,0.0003),('Rest of World','',2013,0.0004),('Rest of World','',2014,0.0008),('Rest of World','',2015,0.0038),('Rest of World','',2016,0.0048),('Rest of World','',2017,0.0062),('Rest of World','',2018,0.0086),('Rest of World','',2019,0.013),('Rest of World','',2020,0.018),('Rest of World','',2021,0.03),('Rest of World','',2022,0.047),('South Africa','ZAF',2013,0.0006),('South Africa','ZAF',2014,0.0008),('South Africa','ZAF',2015,0.0046),('South Africa','ZAF',2016,0.01),('South Africa','ZAF',2017,0.013),('South Africa','ZAF',2018,0.015),('South Africa','ZAF',2019,0.018),('South Africa','ZAF',2020,0.022),('South Africa','ZAF',2021,0.026),('South Africa','ZAF',2022,0.032),('South Korea','KOR',2010,0.0004),('South Korea','KOR',2011,0.0022),('South Korea','KOR',2012,0.0055),('South Korea','KOR',2013,0.0092),('South Korea','KOR',2014,0.017),('South Korea','KOR',2015,0.036),('South Korea','KOR',2016,0.064),('South Korea','KOR',2017,0.15),('South Korea','KOR',2018,0.34),('South Korea','KOR',2019,0.52),('South Korea','KOR',2020,0.72),('South Korea','KOR',2021,1.2),('South Korea','KOR',2022,1.7),('Spain','ESP',2010,0.0003),('Spain','ESP',2011,0.0021),('Spain','ESP',2012,0.0045),('Spain','ESP',2013,0.0086),('Spain','ESP',2014,0.016),('Spain','ESP',2015,0.026),('Spain','ESP',2016,0.04),('Spain','ESP',2017,0.071),('Spain','ESP',2018,0.12),('Spain','ESP',2019,0.19),('Spain','ESP',2020,0.36),('Spain','ESP',2021,0.61),('Spain','ESP',2022,0.91),('Sweden','SWE',2010,0.0001),('Sweden','SWE',2011,0.0041),('Sweden','SWE',2012,0.028),('Sweden','SWE',2013,0.059),('Sweden','SWE',2014,0.15),('Sweden','SWE',2015,0.31),('Sweden','SWE',2016,0.55),('Sweden','SWE',2017,0.89),('Sweden','SWE',2018,1.4),('Sweden','SWE',2019,2),('Sweden','SWE',2020,3.6),('Sweden','SWE',2021,6),('Sweden','SWE',2022,8.8),('Switzerland','CHE',2011,0.01),('Switzerland','CHE',2012,0.028),('Switzerland','CHE',2013,0.058),('Switzerland','CHE',2014,0.12),('Switzerland','CHE',2015,0.25),('Switzerland','CHE',2016,0.36),('Switzerland','CHE',2017,0.54),('Switzerland','CHE',2018,0.76),('Switzerland','CHE',2019,1.1),('Switzerland','CHE',2020,1.8),('Switzerland','CHE',2021,2.9),('Switzerland','CHE',2022,4.2),('Turkey','TUR',2013,0.0036),('Turkey','TUR',2014,0.0038),('Turkey','TUR',2015,0.0053),('Turkey','TUR',2016,0.0083),('Turkey','TUR',2017,0.0093),('Turkey','TUR',2018,0.012),('Turkey','TUR',2019,0.023),('Turkey','TUR',2020,0.032),('Turkey','TUR',2021,0.073),('Turkey','TUR',2022,0.14),('United Kingdom','GBR',2010,0.0055),('United Kingdom','GBR',2011,0.0093),('United Kingdom','GBR',2012,0.018),('United Kingdom','GBR',2013,0.028),('United Kingdom','GBR',2014,0.072),('United Kingdom','GBR',2015,0.15),('United Kingdom','GBR',2016,0.27),('United Kingdom','GBR',2017,0.4),('United Kingdom','GBR',2018,0.56),('United Kingdom','GBR',2019,0.76),('United Kingdom','GBR',2020,1.3),('United Kingdom','GBR',2021,2.1),('United Kingdom','GBR',2022,2.8),('United States','USA',2010,0.0017),('United States','USA',2011,0.0099),('United States','USA',2012,0.034),('United States','USA',2013,0.078),('United States','USA',2014,0.14),('United States','USA',2015,0.19),('United States','USA',2016,0.26),('United States','USA',2017,0.33),('United States','USA',2018,0.48),('United States','USA',2019,0.62),('United States','USA',2020,0.77),('United States','USA',2021,0.95),('United States','USA',2022,1.3),('World','OWID_WRL',2010,0.002),('World','OWID_WRL',2011,0.0074),('World','OWID_WRL',2012,0.02),('World','OWID_WRL',2013,0.041),('World','OWID_WRL',2014,0.072),('World','OWID_WRL',2015,0.12),('World','OWID_WRL',2016,0.19),('World','OWID_WRL',2017,0.28),('World','OWID_WRL',2018,0.45),('World','OWID_WRL',2019,0.6),('World','OWID_WRL',2020,0.83),('World','OWID_WRL',2021,1.3),('World','OWID_WRL',2022,2.1);
/*!40000 ALTER TABLE `electric_stock_share` ENABLE KEYS */;
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
