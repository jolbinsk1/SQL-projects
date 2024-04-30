-- Dataset: the use of electric cars in over 30 countries between 2010 and 2022
-- Source: Hannah Ritchie (2024) - “Tracking global data on electric vehicles” 
	-- Published online at OurWorldInData.org 
	-- Retrieved from: 'https://ourworldindata.org/electric-car-sales' [Online Resource] 
-- Queried using: MySQL Workbench

	-- Note: the 'entity' column in the tables includes both countries and the following regions:
	-- 'Rest of World','World','Other Europe', 'Europe', and 'European Union (27)'
		-- I will be excluding the above regions in some queries

/* 
 Let's begin by setting up some helpful views to better conceptualize the data in the tables
 */

-- First, let's create a view that contains the year electric car data began being collected for each country/region
-- this will help us grab relevant start years to use for our stored procedures
	-- Note: the last year of data collection for all countries was 2022, so we don't need to worry about the end year 

USE electric_cars;
DROP VIEW IF EXISTS data_start_years;

CREATE OR REPLACE VIEW data_start_years AS
	SELECT
		bp.entity,
		MIN(bp.year) AS battery_plugin_data_start,
		MIN(cs.year) AS car_sales_data_start,
		MIN(ecs.year) AS e_car_stocks_data_start,
		MIN(ess1.year) AS e_sales_share_data_start,
		MIN(ess2.year) AS e_stock_share_data_start,
		MIN(pbe.year) AS percent_b_e_data_start,
		MIN(wp.year) AS population_data_start
	FROM
		battery_plugin_shares bp 
			JOIN (
				SELECT 
					entity,
					MIN(year) AS year
				FROM
					car_sales
				GROUP BY entity) cs ON bp.entity = cs.entity
			JOIN (
				SELECT 
					entity,
					MIN(year) AS year
				FROM
					electric_car_stocks
				GROUP BY entity) ecs ON cs.entity = ecs.entity
			JOIN (
				SELECT 
					entity,
					MIN(year) AS year
				FROM
					electric_sales_share
				GROUP BY entity) ess1 ON ecs.entity = ess1.entity
			JOIN (
				SELECT 
					entity,
					MIN(year) AS year
				FROM
					electric_stock_share
				GROUP BY entity) ess2 ON ess1.entity = ess2.entity
			JOIN (
				SELECT 
					entity,
					MIN(year) AS year
				FROM
					percent_battery_electric
				GROUP BY entity) pbe ON ess2.entity = pbe.entity
			JOIN (
				SELECT 
					entity,
					MIN(year) AS year
				FROM
					world_population
				GROUP BY entity) wp ON pbe.entity = wp.entity
	GROUP BY bp.entity
;
    
SELECT * FROM data_start_years;

-- Here is a view containing data comparing the share of full-battery and hybrid cars per country/region per year

USE electric_cars;
DROP VIEW IF EXISTS battery_electric_comparison;

CREATE OR REPLACE VIEW battery_electric_comparison AS
	SELECT 
		b.entity,
		b.year,
		b.hybrid_share,
		b.battery_electric_share,    
		e.new_electric_car_shares,
		p.battery_electric_percent
	FROM
		battery_plugin_shares b
			JOIN
		percent_battery_electric p ON b.entity = p.entity AND b.year = p.year
			JOIN
		electric_sales_share e ON e.entity = b.entity AND e.year = b.year
;
    
SELECT * FROM battery_electric_comparison;

-- Next is a view cotaining per country/region: 
	-- 1) the number of electric cars sold per year, 
	-- 2) the total number of electric cars on the road in a given year, and 
	-- 3) the share of electric cars compared to total cars in a given year

USE electric_cars;
DROP VIEW IF EXISTS e_sales_stocks_shares;

CREATE OR REPLACE VIEW e_sales_stocks_shares AS
	SELECT 
		ecs.entity,
		ecs.year,
		cs.electric_cars_sold,
		ecs.electric_car_stocks,
		ess.new_electric_car_shares
	FROM
		electric_car_stocks ecs
			JOIN
		electric_sales_share ess ON ecs.entity = ess.entity AND ecs.year = ess.year
			JOIN
		car_sales cs ON cs.entity = ecs.entity AND cs.year = ecs.year
;

SELECT * FROM e_sales_stocks_shares;

-- Finally, below is a view containing:
	-- 1) a country's population in a given year
    -- 2) stock of electric cars per country in a year, and 
    -- 3) electric cars per capita in a year

USE electric_cars;
DROP VIEW IF EXISTS e_stock_per_capita;

CREATE OR REPLACE VIEW e_stock_per_capita AS
	SELECT 
		e.entity,
		e.year,
		e.electric_car_stocks,
		w.total_population,
		(e.electric_car_stocks/w.total_population) AS e_cars_per_capita
	FROM
		electric_car_stocks e 
			JOIN
		world_population w ON e.entity = w.entity AND e.year = w.year
	ORDER BY e.entity, e.year
;

SELECT * FROM e_stock_per_capita;

/*
Now, let's create stored perocedures that will help us quickly compare 
electric car data between two years for a given country/region
*/

-- the percent increase/decrease in share of electric cars in a given country/region between two years

USE electric_cars;
DROP PROCEDURE IF EXISTS e_share_increase;

DELIMITER $$
CREATE PROCEDURE e_share_increase (
	IN p_entity VARCHAR(255), 
	IN p_start_year INTEGER, 
    IN p_end_year INTEGER,
    OUT p_share_increase DECIMAL(10,2))
BEGIN
	SELECT
        ROUND(((e_end.new_electric_car_shares - e_start.new_electric_car_shares)/
			  e_start.new_electric_car_shares) * 100, 2)
	INTO p_share_increase
    FROM
		electric_sales_share AS e_start
			JOIN
		electric_sales_share AS e_end 
			ON e_start.entity = e_end.entity 
    WHERE
		p_entity = e_start.entity AND
        p_start_year = e_start.year AND
        p_end_year = e_end.year;
END$$
DELIMITER ;
    
-- the percent increase/decrease in the stock of electric cars per country/entity between two years

USE electric_cars;
DROP PROCEDURE IF EXISTS e_stock_increase;

DELIMITER $$
CREATE PROCEDURE e_stock_increase (
	IN p_entity VARCHAR(255), 
	IN p_start_year INTEGER, 
    IN p_end_year INTEGER,
    OUT p_stock_increase DECIMAL(10,2))
BEGIN
	SELECT
        ROUND(((e_end.electric_car_stocks - e_start.electric_car_stocks)/
			  e_start.electric_car_stocks)*100, 2)
	INTO p_stock_increase
    FROM
		electric_car_stocks AS e_start
			JOIN
		electric_car_stocks AS e_end 
			ON e_start.entity = e_end.entity 
    WHERE
		p_entity = e_start.entity AND
        p_start_year = e_start.year AND
        p_end_year = e_end.year;
END$$
DELIMITER ;

-- percent increase/decrease in electric cars sold per country/region between two years

USE electric_cars;
DROP PROCEDURE IF EXISTS e_cars_sold_increase;

DELIMITER $$
CREATE PROCEDURE e_cars_sold_increase (
	IN p_entity VARCHAR(255), 
	IN p_start_year INTEGER, 
    IN p_end_year INTEGER,
    OUT p_sale_increase DECIMAL(10,2))
BEGIN
	SELECT
        ROUND(((c_end.electric_cars_sold - c_start.electric_cars_sold)/
			  c_start.electric_cars_sold)*100, 2)
	INTO p_sale_increase
    FROM
		car_sales AS c_start
			JOIN
		car_sales AS c_end 
			ON c_start.entity = c_end.entity 
    WHERE
		p_entity = c_start.entity AND
        p_start_year = c_start.year AND
        p_end_year = c_end.year;
END$$
DELIMITER ;

-- the percent increase/decrease in electric cars sold per country/region between two years

USE electric_cars;
DROP PROCEDURE IF EXISTS non_ecars_sold_increase;

	# I encountered a problem with a column name, so I changed it

		ALTER TABLE car_sales
		CHANGE COLUMN `non-electric_car_sales` non_ecar_sales INTEGER;

DELIMITER $$
CREATE PROCEDURE non_ecars_sold_increase (
	IN p_entity VARCHAR(255), 
	IN p_start_year INTEGER, 
    IN p_end_year INTEGER,
    OUT p_sale_increase DECIMAL(10,2))
BEGIN
	SELECT
        ROUND(((c_end.non_ecar_sales - c_start.non_ecar_sales)/
			  c_start.non_ecar_sales)*100, 2)
	INTO p_sale_increase
    FROM
		car_sales AS c_start
			JOIN
		car_sales AS c_end 
			ON c_start.entity = c_end.entity 
    WHERE
		p_entity = c_start.entity AND
        p_start_year = c_start.year AND
        p_end_year = c_end.year;
END$$
DELIMITER ;

-- percent increase/decrease in total cars sold per country/region between two years

USE electric_cars;
DROP PROCEDURE IF EXISTS total_sales_increase;

DELIMITER $$
CREATE PROCEDURE total_sales_increase (
	IN p_entity VARCHAR(255), 
	IN p_start_year INTEGER, 
    IN p_end_year INTEGER,
    OUT p_total_increase DECIMAL(10,2))
BEGIN
	SELECT
        ROUND(((c_end.total_car_sales - c_start.total_car_sales)/
			  c_start.total_car_sales)*100, 2)
	INTO p_total_increase
    FROM
		car_sales AS c_start
			JOIN
		car_sales AS c_end 
			ON c_start.entity = c_end.entity 
    WHERE
		p_entity = c_start.entity AND
        p_start_year = c_start.year AND
        p_end_year = c_end.year;
END$$
DELIMITER ;

-- percent increase/decrease in electric car stock shares per country/region between two years

USE electric_cars;
DROP PROCEDURE IF EXISTS e_stock_share_increase;

DELIMITER $$
CREATE PROCEDURE e_stock_share_increase (
	IN p_entity VARCHAR(255), 
	IN p_start_year INTEGER, 
    IN p_end_year INTEGER,
    OUT p_stock_share_increase DECIMAL(10,2))
BEGIN
	SELECT
        ROUND(((e_end.electric_car_stock_share - e_start.electric_car_stock_share)/
			  e_start.electric_car_stock_share)*100, 2)
	INTO p_stock_share_increase
    FROM
		electric_stock_share AS e_start
			JOIN
		electric_stock_share AS e_end 
			ON e_start.entity = e_end.entity 
    WHERE
		p_entity = e_start.entity AND
        p_start_year = e_start.year AND
        p_end_year = e_end.year;
END$$
DELIMITER ;


/* 
Now, let's rank the top 10 most populous countries in the year 2022 according to 
*/

-- electric car stocks per capita

SELECT 
	e.entity,
	e.year,
	e.electric_car_stocks,
	w.total_population,
	(e.electric_car_stocks/w.total_population) AS e_cars_per_capita,
    ROW_NUMBER() OVER top AS top_stocks_per_capita_2022
FROM
	electric_car_stocks e
		JOIN
	(SELECT 
		entity,
        total_population
	FROM
		world_population 
	WHERE year = 2022
	ORDER BY total_population DESC
    LIMIT 10) AS w ON e.entity = w.entity 
WHERE e.year = 2022
WINDOW top AS (PARTITION BY e.year ORDER BY (e.electric_car_stocks/w.total_population) DESC)	
;

-- electric car sales

SELECT 
	c.entity,
	c.year,
	c.electric_cars_sold,
	w.total_population,
    ROW_NUMBER() OVER top AS top_electric_sales_2022
FROM
	 car_sales c
		JOIN
	(SELECT 
		entity,
        total_population
	FROM
		world_population 
	WHERE year = 2022
	ORDER BY total_population DESC
    LIMIT 10) AS w ON c.entity = w.entity 
WHERE c.year = 2022
WINDOW top AS (PARTITION BY c.year ORDER BY c.electric_cars_sold DESC)	
;

-- total car sales

SELECT 
	c.entity,
	c.year,
	c.total_car_sales,
	w.total_population,
    ROW_NUMBER() OVER top AS top_total_car_sales_2022
FROM
	 car_sales c
		JOIN
	(SELECT 
		entity,
        total_population
	FROM
		world_population 
	WHERE year = 2022
	ORDER BY total_population DESC
    LIMIT 10) AS w ON c.entity = w.entity 
WHERE c.year = 2022
WINDOW top AS (PARTITION BY c.year ORDER BY c.total_car_sales DESC)	
;

-- This time by greatest increase in electric car sales from 2018 to 2022
-- using a CTE, which can be adjusted to change the year interval you're looking at
	-- Note: I used the top 10 average population between the two years 
	-- as a work-around for selecting the top 10 total population

WITH car_sales_diff AS (
    SELECT 
        c_start.entity,
        c_start.year AS start_year,
        c_end.year AS end_year,
        (c_end.electric_cars_sold - c_start.electric_cars_sold) AS e_car_sales_increase,
        ROUND(((c_end.electric_cars_sold - c_start.electric_cars_sold) / c_start.electric_cars_sold) * 100, 2) AS percent_increase
    FROM
        car_sales AS c_start
    JOIN
        car_sales AS c_end ON c_start.entity = c_end.entity
    WHERE
        c_start.year = 2018
    AND
        c_end.year = 2022)
SELECT 
    w.entity,
    w.avg_population,
    c.start_year,
    c.end_year,
    c.e_car_sales_increase,
    DENSE_RANK() OVER (ORDER BY c.e_car_sales_increase DESC) AS top_electric_sales_2022,
    c.percent_increase
FROM
    car_sales_diff c
		JOIN
    (SELECT 
        entity,
        ROUND(AVG(total_population),0) AS avg_population
    FROM 
        world_population
    WHERE 
        year IN (2018, 2022)
    GROUP BY 
        entity
    ORDER BY 
        avg_population DESC
    LIMIT 11) w ON c.entity = w.entity
GROUP BY w.entity, c.e_car_sales_increase, c.percent_increase
ORDER BY top_electric_sales_2022 ASC
LIMIT 11
;

-- same as above, but now ranked in terms of 
-- greatest percent increase in electric car sales 

WITH car_sales_diff AS (
    SELECT 
        c_start.entity,
        c_start.year AS start_year,
        c_end.year AS end_year,
        (c_end.electric_cars_sold - c_start.electric_cars_sold) AS e_car_sales_increase,
        ROUND(((c_end.electric_cars_sold - c_start.electric_cars_sold) / c_start.electric_cars_sold) * 100, 2) AS percent_increase
    FROM
        car_sales AS c_start
    JOIN
        car_sales AS c_end ON c_start.entity = c_end.entity
    WHERE
        c_start.year = 2018
    AND
        c_end.year = 2022)
SELECT 
    w.entity,
    w.avg_population,
    c.start_year,
    c.end_year,
    c.e_car_sales_increase,
    c.percent_increase,
    ROW_NUMBER() OVER (ORDER BY c.percent_increase DESC) AS top_electric_sales_2022
FROM
    car_sales_diff c
		JOIN
    (SELECT 
        entity,
        ROUND(AVG(total_population),0) AS avg_population
    FROM 
        world_population
    WHERE 
        year IN (2018, 2022)
    GROUP BY 
        entity
    ORDER BY 
        avg_population DESC
    LIMIT 11) w ON c.entity = w.entity
GROUP BY w.entity, c.e_car_sales_increase, c.percent_increase
ORDER BY c.percent_increase DESC
lIMIT 11
;


/*
 Finally, let's look at how countries did in 2022 relative to the world average in new electric car shares
 */

SELECT 
   ess.entity AS country,
   ess.new_electric_car_shares AS country_share,
   world_share.new_electric_car_shares AS world_share,
   (ess.new_electric_car_shares - world_share.new_electric_car_shares) AS share_diff,
   DENSE_RANK() 
		OVER (ORDER BY (ess.new_electric_car_shares - world_share.new_electric_car_shares) DESC) 
            AS share_rank
FROM
	(SELECT 
		*
	FROM
		electric_sales_share
	WHERE 
		entity NOT IN ('Rest of World','Other Europe', 'Europe','European Union (27)')
	) ess
		INNER JOIN
	electric_sales_share world_share ON ess.year = world_share.year
WHERE
	ess.year = 2022
    AND ess.entity != 'World'
    AND world_share.entity = 'World'
ORDER BY share_diff DESC
;


-- and now for electric car stock shares

SELECT 
   ess.entity AS country,
   ess.electric_car_stock_share AS country_sales_share,
   world_sales_share.electric_car_stock_share AS world_sales_share,
   ROUND((ess.electric_car_stock_share - world_sales_share.electric_car_stock_share),2) AS sales_share_diff,
   DENSE_RANK() OVER 
		(ORDER BY (ess.electric_car_stock_share - world_sales_share.electric_car_stock_share) DESC) 
            AS share_rank
FROM
	(SELECT 
		*
	FROM
		electric_stock_share
	WHERE 
		entity NOT IN ('Rest of World','Other Europe', 'Europe','European Union (27)')
	) ess
		INNER JOIN
	electric_stock_share world_sales_share ON ess.year = world_sales_share.year
WHERE
	ess.year = 2022
    AND ess.entity != 'World'
    AND world_sales_share.entity = 'World'
ORDER BY sales_share_diff DESC
;
