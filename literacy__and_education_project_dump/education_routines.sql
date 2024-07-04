-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: education
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
-- Temporary view structure for view `youth_literacy_and_gdp`
--

DROP TABLE IF EXISTS `youth_literacy_and_gdp`;
/*!50001 DROP VIEW IF EXISTS `youth_literacy_and_gdp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `youth_literacy_and_gdp` AS SELECT 
 1 AS `country`,
 1 AS `year`,
 1 AS `per_cap_GDP`,
 1 AS `male_youth_literacy`,
 1 AS `female_youth_literacy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `world_literacy_and_gdp`
--

DROP TABLE IF EXISTS `world_literacy_and_gdp`;
/*!50001 DROP VIEW IF EXISTS `world_literacy_and_gdp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `world_literacy_and_gdp` AS SELECT 
 1 AS `country`,
 1 AS `year`,
 1 AS `per_cap_GDP`,
 1 AS `percent_literacy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tertiary_ed_and_gdp`
--

DROP TABLE IF EXISTS `tertiary_ed_and_gdp`;
/*!50001 DROP VIEW IF EXISTS `tertiary_ed_and_gdp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tertiary_ed_and_gdp` AS SELECT 
 1 AS `country`,
 1 AS `year`,
 1 AS `per_cap_GDP`,
 1 AS `tertiary_ed_percent`,
 1 AS `percent_literacy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_total_education_and_literacy`
--

DROP TABLE IF EXISTS `v_total_education_and_literacy`;
/*!50001 DROP VIEW IF EXISTS `v_total_education_and_literacy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_total_education_and_literacy` AS SELECT 
 1 AS `country`,
 1 AS `year`,
 1 AS `est_literacy`,
 1 AS `avg_ed_years`,
 1 AS `years_of_school_adj`,
 1 AS `tertiary_ed_percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_youth_literacy_and_gdp`
--

DROP TABLE IF EXISTS `v_youth_literacy_and_gdp`;
/*!50001 DROP VIEW IF EXISTS `v_youth_literacy_and_gdp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_youth_literacy_and_gdp` AS SELECT 
 1 AS `country`,
 1 AS `year`,
 1 AS `per_cap_GDP`,
 1 AS `male_youth_literacy`,
 1 AS `female_youth_literacy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_tertiary_ed_and_gdp`
--

DROP TABLE IF EXISTS `v_tertiary_ed_and_gdp`;
/*!50001 DROP VIEW IF EXISTS `v_tertiary_ed_and_gdp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_tertiary_ed_and_gdp` AS SELECT 
 1 AS `country`,
 1 AS `year`,
 1 AS `per_cap_GDP`,
 1 AS `tertiary_ed_percent`,
 1 AS `percent_literacy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_world_literacy_and_gdp`
--

DROP TABLE IF EXISTS `v_world_literacy_and_gdp`;
/*!50001 DROP VIEW IF EXISTS `v_world_literacy_and_gdp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_world_literacy_and_gdp` AS SELECT 
 1 AS `country`,
 1 AS `year`,
 1 AS `per_cap_GDP`,
 1 AS `percent_literacy`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `youth_literacy_and_gdp`
--

/*!50001 DROP VIEW IF EXISTS `youth_literacy_and_gdp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `youth_literacy_and_gdp` AS select `mf`.`country` AS `country`,`mf`.`year` AS `year`,`g`.`per_cap_GDP` AS `per_cap_GDP`,`mf`.`male_youth_literacy` AS `male_youth_literacy`,`mf`.`female_youth_literacy` AS `female_youth_literacy` from (`literacy_rates_male_female` `mf` join `per_cap_gdp_test` `g` on(((`mf`.`country` = `g`.`country`) and (`mf`.`year` = `g`.`year`)))) group by `mf`.`country`,`mf`.`year`,`mf`.`male_youth_literacy`,`mf`.`female_youth_literacy` order by `g`.`per_cap_GDP` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `world_literacy_and_gdp`
--

/*!50001 DROP VIEW IF EXISTS `world_literacy_and_gdp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `world_literacy_and_gdp` AS select `w`.`country` AS `country`,`w`.`year` AS `year`,`g`.`per_cap_GDP` AS `per_cap_GDP`,`w`.`percent_literacy` AS `percent_literacy` from (`world_literacy_rates` `w` join `per_cap_gdp_test` `g` on(((`w`.`country` = `g`.`country`) and (`w`.`year` = `g`.`year`)))) group by `w`.`country`,`w`.`year` order by `g`.`per_cap_GDP` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tertiary_ed_and_gdp`
--

/*!50001 DROP VIEW IF EXISTS `tertiary_ed_and_gdp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tertiary_ed_and_gdp` AS select `te`.`country` AS `country`,`te`.`year` AS `year`,`g`.`per_cap_GDP` AS `per_cap_GDP`,`te`.`tertiary_ed_percent` AS `tertiary_ed_percent`,`w`.`percent_literacy` AS `percent_literacy` from ((`tertiary_education` `te` join `per_cap_gdp_test` `g` on(((`te`.`country` = `g`.`country`) and (`te`.`year` = `g`.`year`)))) join `world_literacy_rates` `w` on(((`w`.`country` = `te`.`country`) and (`w`.`year` = `te`.`year`)))) group by `te`.`country`,`te`.`year`,`g`.`per_cap_GDP`,`te`.`tertiary_ed_percent`,`w`.`percent_literacy` order by `g`.`per_cap_GDP` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_total_education_and_literacy`
--

/*!50001 DROP VIEW IF EXISTS `v_total_education_and_literacy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_total_education_and_literacy` AS select `ls`.`country` AS `country`,`ls`.`year` AS `year`,`ls`.`est_literacy` AS `est_literacy`,`ls`.`avg_ed_years` AS `avg_ed_years`,`asy`.`years_of_school_adj` AS `years_of_school_adj`,`te`.`tertiary_ed_percent` AS `tertiary_ed_percent` from ((`literacy_vs_avg_schooling` `ls` join `adjusted_school_years` `asy` on(((`asy`.`country` = `ls`.`country`) and (`asy`.`year` = `ls`.`year`)))) join `tertiary_education` `te` on(((`te`.`country` = `ls`.`country`) and (`te`.`year` = `ls`.`year`)))) order by `ls`.`est_literacy` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_youth_literacy_and_gdp`
--

/*!50001 DROP VIEW IF EXISTS `v_youth_literacy_and_gdp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_youth_literacy_and_gdp` AS select `mf`.`country` AS `country`,`mf`.`year` AS `year`,`g`.`per_cap_GDP` AS `per_cap_GDP`,`mf`.`male_youth_literacy` AS `male_youth_literacy`,`mf`.`female_youth_literacy` AS `female_youth_literacy` from (`literacy_rates_male_female` `mf` join `per_cap_gdp_test` `g` on(((`mf`.`country` = `g`.`country`) and (`mf`.`year` = `g`.`year`)))) group by `mf`.`country`,`mf`.`year`,`mf`.`male_youth_literacy`,`mf`.`female_youth_literacy` order by `g`.`per_cap_GDP` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tertiary_ed_and_gdp`
--

/*!50001 DROP VIEW IF EXISTS `v_tertiary_ed_and_gdp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tertiary_ed_and_gdp` AS select `te`.`country` AS `country`,`te`.`year` AS `year`,`g`.`per_cap_GDP` AS `per_cap_GDP`,`te`.`tertiary_ed_percent` AS `tertiary_ed_percent`,`w`.`percent_literacy` AS `percent_literacy` from ((`tertiary_education` `te` join `per_cap_gdp_test` `g` on(((`te`.`country` = `g`.`country`) and (`te`.`year` = `g`.`year`)))) join `world_literacy_rates` `w` on(((`w`.`country` = `te`.`country`) and (`w`.`year` = `te`.`year`)))) group by `te`.`country`,`te`.`year`,`g`.`per_cap_GDP`,`te`.`tertiary_ed_percent`,`w`.`percent_literacy` order by `g`.`per_cap_GDP` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_world_literacy_and_gdp`
--

/*!50001 DROP VIEW IF EXISTS `v_world_literacy_and_gdp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_world_literacy_and_gdp` AS select `w`.`country` AS `country`,`w`.`year` AS `year`,`g`.`per_cap_GDP` AS `per_cap_GDP`,`w`.`percent_literacy` AS `percent_literacy` from (`world_literacy_rates` `w` join `per_cap_gdp_test` `g` on(((`w`.`country` = `g`.`country`) and (`w`.`year` = `g`.`year`)))) group by `w`.`country`,`w`.`year` order by `g`.`per_cap_GDP` desc */;
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

-- Dump completed on 2024-07-04 16:06:55
