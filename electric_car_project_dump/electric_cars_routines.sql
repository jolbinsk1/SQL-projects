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
-- Temporary view structure for view `e_sales_stocks_shares`
--

DROP TABLE IF EXISTS `e_sales_stocks_shares`;
/*!50001 DROP VIEW IF EXISTS `e_sales_stocks_shares`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `e_sales_stocks_shares` AS SELECT 
 1 AS `entity`,
 1 AS `year`,
 1 AS `electric_cars_sold`,
 1 AS `electric_car_stocks`,
 1 AS `new_electric_car_shares`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `data_start_years`
--

DROP TABLE IF EXISTS `data_start_years`;
/*!50001 DROP VIEW IF EXISTS `data_start_years`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `data_start_years` AS SELECT 
 1 AS `entity`,
 1 AS `battery_plugin_data_start`,
 1 AS `car_sales_data_start`,
 1 AS `e_car_stocks_data_start`,
 1 AS `e_sales_share_data_start`,
 1 AS `e_stock_share_data_start`,
 1 AS `percent_b_e_data_start`,
 1 AS `population_data_start`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `battery_electric_comparison`
--

DROP TABLE IF EXISTS `battery_electric_comparison`;
/*!50001 DROP VIEW IF EXISTS `battery_electric_comparison`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `battery_electric_comparison` AS SELECT 
 1 AS `entity`,
 1 AS `year`,
 1 AS `hybrid_share`,
 1 AS `battery_electric_share`,
 1 AS `new_electric_car_shares`,
 1 AS `battery_electric_percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `e_stock_per_capita`
--

DROP TABLE IF EXISTS `e_stock_per_capita`;
/*!50001 DROP VIEW IF EXISTS `e_stock_per_capita`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `e_stock_per_capita` AS SELECT 
 1 AS `entity`,
 1 AS `year`,
 1 AS `electric_car_stocks`,
 1 AS `total_population`,
 1 AS `e_cars_per_capita`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `e_sales_stocks_shares`
--

/*!50001 DROP VIEW IF EXISTS `e_sales_stocks_shares`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `e_sales_stocks_shares` AS select `ecs`.`entity` AS `entity`,`ecs`.`year` AS `year`,`cs`.`electric_cars_sold` AS `electric_cars_sold`,`ecs`.`electric_car_stocks` AS `electric_car_stocks`,`ess`.`new_electric_car_shares` AS `new_electric_car_shares` from ((`electric_car_stocks` `ecs` join `electric_sales_share` `ess` on(((`ecs`.`entity` = `ess`.`entity`) and (`ecs`.`year` = `ess`.`year`)))) join `car_sales` `cs` on(((`cs`.`entity` = `ecs`.`entity`) and (`cs`.`year` = `ecs`.`year`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `data_start_years`
--

/*!50001 DROP VIEW IF EXISTS `data_start_years`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `data_start_years` AS select `bp`.`entity` AS `entity`,min(`bp`.`year`) AS `battery_plugin_data_start`,min(`cs`.`year`) AS `car_sales_data_start`,min(`ecs`.`year`) AS `e_car_stocks_data_start`,min(`ess1`.`year`) AS `e_sales_share_data_start`,min(`ess2`.`year`) AS `e_stock_share_data_start`,min(`pbe`.`year`) AS `percent_b_e_data_start`,min(`wp`.`year`) AS `population_data_start` from ((((((`battery_plugin_shares` `bp` join (select `car_sales`.`entity` AS `entity`,min(`car_sales`.`year`) AS `year` from `car_sales` group by `car_sales`.`entity`) `cs` on((`bp`.`entity` = `cs`.`entity`))) join (select `electric_car_stocks`.`entity` AS `entity`,min(`electric_car_stocks`.`year`) AS `year` from `electric_car_stocks` group by `electric_car_stocks`.`entity`) `ecs` on((`cs`.`entity` = `ecs`.`entity`))) join (select `electric_sales_share`.`entity` AS `entity`,min(`electric_sales_share`.`year`) AS `year` from `electric_sales_share` group by `electric_sales_share`.`entity`) `ess1` on((`ecs`.`entity` = `ess1`.`entity`))) join (select `electric_stock_share`.`entity` AS `entity`,min(`electric_stock_share`.`year`) AS `year` from `electric_stock_share` group by `electric_stock_share`.`entity`) `ess2` on((`ess1`.`entity` = `ess2`.`entity`))) join (select `percent_battery_electric`.`entity` AS `entity`,min(`percent_battery_electric`.`year`) AS `year` from `percent_battery_electric` group by `percent_battery_electric`.`entity`) `pbe` on((`ess2`.`entity` = `pbe`.`entity`))) join (select `world_population`.`entity` AS `entity`,min(`world_population`.`year`) AS `year` from `world_population` group by `world_population`.`entity`) `wp` on((`pbe`.`entity` = `wp`.`entity`))) group by `bp`.`entity` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `battery_electric_comparison`
--

/*!50001 DROP VIEW IF EXISTS `battery_electric_comparison`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `battery_electric_comparison` AS select `b`.`entity` AS `entity`,`b`.`year` AS `year`,`b`.`hybrid_share` AS `hybrid_share`,`b`.`battery_electric_share` AS `battery_electric_share`,`e`.`new_electric_car_shares` AS `new_electric_car_shares`,`p`.`battery_electric_percent` AS `battery_electric_percent` from ((`battery_plugin_shares` `b` join `percent_battery_electric` `p` on(((`b`.`entity` = `p`.`entity`) and (`b`.`year` = `p`.`year`)))) join `electric_sales_share` `e` on(((`e`.`entity` = `b`.`entity`) and (`e`.`year` = `b`.`year`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `e_stock_per_capita`
--

/*!50001 DROP VIEW IF EXISTS `e_stock_per_capita`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `e_stock_per_capita` AS select `e`.`entity` AS `entity`,`e`.`year` AS `year`,`e`.`electric_car_stocks` AS `electric_car_stocks`,`w`.`total_population` AS `total_population`,(`e`.`electric_car_stocks` / `w`.`total_population`) AS `e_cars_per_capita` from (`electric_car_stocks` `e` join `world_population` `w` on(((`e`.`entity` = `w`.`entity`) and (`e`.`year` = `w`.`year`)))) order by `e`.`entity`,`e`.`year` */;
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

-- Dump completed on 2024-07-04 16:06:28
