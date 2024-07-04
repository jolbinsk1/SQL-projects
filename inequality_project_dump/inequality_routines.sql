-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: inequality
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
-- Temporary view structure for view `total_gdp_data`
--

DROP TABLE IF EXISTS `total_gdp_data`;
/*!50001 DROP VIEW IF EXISTS `total_gdp_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_gdp_data` AS SELECT 
 1 AS `entity`,
 1 AS `code`,
 1 AS `year`,
 1 AS `GDP_billion`,
 1 AS `GDP_per_cap`,
 1 AS `emp_person_GDP`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `gdp_rankings_2019`
--

DROP TABLE IF EXISTS `gdp_rankings_2019`;
/*!50001 DROP VIEW IF EXISTS `gdp_rankings_2019`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gdp_rankings_2019` AS SELECT 
 1 AS `entity`,
 1 AS `code`,
 1 AS `year`,
 1 AS `GDP_billion`,
 1 AS `total_GDP_rank`,
 1 AS `GDP_per_cap`,
 1 AS `per_cap_GDP_rank`,
 1 AS `emp_person_GDP`,
 1 AS `per_emp_GDP_rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ineq_measure_discrepancy`
--

DROP TABLE IF EXISTS `ineq_measure_discrepancy`;
/*!50001 DROP VIEW IF EXISTS `ineq_measure_discrepancy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ineq_measure_discrepancy` AS SELECT 
 1 AS `entity`,
 1 AS `code`,
 1 AS `year`,
 1 AS `gini_coefficient`,
 1 AS `atkinson_index`,
 1 AS `discrepancy`,
 1 AS `highest_discrepancy`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `total_gdp_data`
--

/*!50001 DROP VIEW IF EXISTS `total_gdp_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_gdp_data` AS select `w`.`entity` AS `entity`,`w`.`code` AS `code`,`w`.`year` AS `year`,`w`.`GDP_billion` AS `GDP_billion`,`c`.`GDP_per_cap` AS `GDP_per_cap`,`e`.`emp_person_GDP` AS `emp_person_GDP` from ((`gdp_worldbank` `w` join `gdp_per_capita` `c` on(((`c`.`entity` = `w`.`entity`) and (`c`.`year` = `w`.`year`)))) join `gdp_per_emp_person` `e` on(((`e`.`entity` = `c`.`entity`) and (`e`.`year` = `c`.`year`)))) group by `w`.`entity`,`w`.`year`,`c`.`GDP_per_cap` order by `w`.`entity`,`w`.`year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gdp_rankings_2019`
--

/*!50001 DROP VIEW IF EXISTS `gdp_rankings_2019`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gdp_rankings_2019` AS select `w`.`entity` AS `entity`,`w`.`code` AS `code`,`w`.`year` AS `year`,`w`.`GDP_billion` AS `GDP_billion`,rank() OVER (ORDER BY `w`.`GDP_billion` desc )  AS `total_GDP_rank`,`c`.`GDP_per_cap` AS `GDP_per_cap`,rank() OVER (ORDER BY `c`.`GDP_per_cap` desc )  AS `per_cap_GDP_rank`,`e`.`emp_person_GDP` AS `emp_person_GDP`,rank() OVER (ORDER BY `e`.`emp_person_GDP` desc )  AS `per_emp_GDP_rank` from ((`gdp_worldbank` `w` join `gdp_per_capita` `c` on(((`c`.`entity` = `w`.`entity`) and (`c`.`year` = `w`.`year`)))) join `gdp_per_emp_person` `e` on(((`e`.`entity` = `c`.`entity`) and (`e`.`year` = `c`.`year`)))) where ((`w`.`year` = 2019) and (not((`w`.`code` like ''))) and (`w`.`entity` <> 'World')) group by `w`.`entity`,`w`.`year`,`c`.`GDP_per_cap` order by `total_GDP_rank` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ineq_measure_discrepancy`
--

/*!50001 DROP VIEW IF EXISTS `ineq_measure_discrepancy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ineq_measure_discrepancy` AS select `e`.`entity` AS `entity`,`e`.`code` AS `code`,`e`.`year` AS `year`,`e`.`gini_coefficient` AS `gini_coefficient`,`i`.`atkinson_index` AS `atkinson_index`,(`e`.`gini_coefficient` - `i`.`atkinson_index`) AS `discrepancy`,rank() OVER (ORDER BY (`e`.`gini_coefficient` - `i`.`atkinson_index`) desc )  AS `highest_discrepancy` from (`economic_inequality` `e` join `income_inequality` `i` on(((`e`.`year` = `i`.`year`) and (`e`.`entity` = `i`.`entity`)))) where (`e`.`year` = 2019) group by `e`.`entity`,`e`.`code`,`e`.`year` having (`e`.`code` like '%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-04 16:07:39
