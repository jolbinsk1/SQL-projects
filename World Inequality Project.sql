-- Dataset: Comparing measures of economic inequality with GDP 
-- Sources:
	-- World Bank Poverty and Inequality Platform (2023) – with major processing by Our World in Data
	-- World Inequality Database (WID.world) (2023) – processed by Our World in Data
    -- World Bank (2023) – with minor processing by Our World in Data
    -- UNDP, Human Development Report (2021-22) (2022) – with minor processing by Our World in Data
-- Queried using mySQL Workbench

/* 
The following queries will compare countries along two measures of inequality against GDP data. 
The measures are:
	1) the Gini coefficient, which is commonly used to examine income dispersion from 0 to 1, 
		with values closer to 1 representing high inequality. I will use this more frequently my queries,
        since it is the most commonly used measure.
	2) the Atkinson index, which also measures wealth inequality on a scale from 0 to 1 (with 1 being total inequality), 
		but adjusts for how much a population sees inequality as just/fair.
*/


/* 
First, we will create the tables we will use
*/

-- Creating the economic inequality table 

USE inequality;
DROP TABLE IF EXISTS economic_inequality;

CREATE TABLE economic_inequality (
	entity VARCHAR(255) NOT NULL,
    code VARCHAR(255) NULL,
    year YEAR(4) NOT NULL,
    gini_coefficient DECIMAL(5,2) NOT NULL,
    CONSTRAINT entity_year PRIMARY KEY(entity,year)
);

SELECT * FROM economic_inequality;

-- Income inequality table 

USE inequality;
DROP TABLE IF EXISTS income_inequality; 

CREATE TABLE income_inequality (
	entity VARCHAR(255) NOT NULL,
    code VARCHAR(255) NULL,
    year YEAR(4) NOT NULL,
    atkinson_index DECIMAL(5,2) NOT NULL,
    CONSTRAINT entity_year PRIMARY KEY(entity,year)
);

SELECT * FROM income_inequality;

-- Total GDP table

USE inequality;
DROP TABLE IF EXISTS GDP_worldbank; 

CREATE TABLE GDP_worldbank (
	entity VARCHAR(255) NOT NULL,
    code VARCHAR(255) NULL,
    year YEAR(4) NOT NULL,
	GDP BIGINT NOT NULL,
    GDP_billion NUMERIC(11,3),
    CONSTRAINT entity_year PRIMARY KEY(entity,year)
);

SELECT * FROM GDP_worldbank;

-- GDP per capita

USE inequality;
DROP TABLE IF EXISTS GDP_per_capita; 

CREATE TABLE GDP_per_capita (
	entity VARCHAR(255) NOT NULL,
    code VARCHAR(255) NULL,
    year YEAR(4) NOT NULL,
	GDP_per_cap NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (entity,year) REFERENCES GDP_worldbank (entity,year)
);

SELECT * FROM GDP_per_capita;

-- GDP per employed person

USE inequality;
DROP TABLE IF EXISTS GDP_per_emp_person; 

CREATE TABLE GDP_per_emp_person (
	entity VARCHAR(255) NOT NULL,
    code VARCHAR(255) NULL,
    year YEAR(4) NOT NULL,
	emp_person_GDP NUMERIC(10,2) NOT NULL,
    PRIMARY KEY entity_year (entity,year)
);

SELECT * FROM GDP_per_emp_person;

-- Share of top 10%

USE inequality;
DROP TABLE IF EXISTS top_10; 

CREATE TABLE top_10 (
	entity VARCHAR(255) NOT NULL,
    code VARCHAR(255) NULL,
    year YEAR(4) NOT NULL,
	est_pretax_share_10 DECIMAL(5,2) NOT NULL,
	CONSTRAINT entity_year PRIMARY KEY(entity,year)
);

SELECT * FROM top_10;

-- Share of top 1%

USE inequality;
DROP TABLE IF EXISTS top_1; 

CREATE TABLE top_1 (
	entity VARCHAR(255) NOT NULL,
    code VARCHAR(255) NULL,
    year YEAR(4) NOT NULL,
	est_pretax_share_1 DECIMAL(5,2) NOT NULL,
	CONSTRAINT entity_year PRIMARY KEY(entity,year)
);

SELECT * FROM top_1;

/* 
For our first calculations, lets create some helpful views
*/

-- Dsicrepancy between gini and atkinson values for each country in the year 2019 (pre-COVID), 
-- ranked in order of discrepancy magnitude

USE inequality;
DROP VIEW IF EXISTS ineq_measure_discrepancy;

CREATE OR REPLACE VIEW ineq_measure_discrepancy AS
	SELECT 
		e.entity,
		e.code,
		e.year,
		e.gini_coefficient,
		i.atkinson_index,
		(e.gini_coefficient - i.atkinson_index) AS discrepancy,
        RANK() OVER (ORDER BY (e.gini_coefficient - i.atkinson_index) DESC) 
            AS highest_discrepancy
	FROM
		economic_inequality e
			JOIN
		income_inequality i ON e.year = i.year AND e.entity = i.entity
	WHERE e.year = 2019
	GROUP BY e.entity, e.code, e.year
	HAVING e.code LIKE '%'
	;

SELECT * FROM ineq_measure_discrepancy;
    
-- Complete GDP data per country 

USE inequality;
DROP VIEW IF EXISTS total_GDP_data;

CREATE OR REPLACE VIEW total_GDP_data AS
	SELECT 
		w.entity,
		w.code,
		w.year,
		w.GDP_billion,
		c.GDP_per_cap,
		e.emp_person_GDP
	FROM
		GDP_worldbank w 
			JOIN
		GDP_per_capita c ON c.entity = w.entity AND c.year = w.year 
			JOIN
		GDP_per_emp_person e ON e.entity = c.entity AND e.year = c.year
	GROUP BY w.entity, w.year, c.GDP_per_cap
	ORDER BY w.entity, w.year
	; 
    
SELECT * FROM total_GDP_data;

-- Complete GDP data per country in 2019, with rankings

USE inequality;
DROP VIEW IF EXISTS GDP_rankings_2019;

CREATE OR REPLACE VIEW GDP_rankings_2019 AS
	SELECT 
		w.entity,
		w.code,
		w.year,
		w.GDP_billion,
        RANK() OVER(ORDER BY w.GDP_billion DESC) AS total_GDP_rank,
		c.GDP_per_cap,
        RANK() OVER(ORDER BY c.GDP_per_cap DESC) AS per_cap_GDP_rank,
		e.emp_person_GDP,
         RANK() OVER(ORDER BY e.emp_person_GDP DESC) AS per_emp_GDP_rank
	FROM
		GDP_worldbank w 
			JOIN
		GDP_per_capita c ON c.entity = w.entity AND c.year = w.year 
			JOIN
		GDP_per_emp_person e ON e.entity = c.entity AND e.year = c.year
	WHERE w.year = 2019 AND w.code NOT LIKE '' AND w.entity != 'World'
	GROUP BY w.entity, w.year, c.GDP_per_cap
	ORDER BY total_GDP_rank
	; 
    
SELECT * FROM GDP_rankings_2019;

/*
Next, lets make a stored procedure that calculates the change in Gini coefficient 
and Atkinson index for each country between two given years
*/

USE inequality;
DROP PROCEDURE IF EXISTS ineq_diff;

DELIMITER $$
CREATE PROCEDURE ineq_diff (
	IN p_entity VARCHAR(255),
    IN p_start_year INT,
    IN p_end_year INT,
    OUT gini_diff DECIMAL(4,2),
    OUT atkinson_diff DECIMAL (4,2))
BEGIN
	DECLARE start_gini DECIMAL (4,2);
    DECLARE end_gini DECIMAL (4,2);
    DECLARE start_atkinson DECIMAL (4,2);
    DECLARE end_atkinson DECIMAL (4,2);
	
    SELECT 
		e.gini_coefficient 
	INTO start_gini
	FROM
		economic_inequality e
	WHERE e.entity = p_entity AND e.year = p_start_year
;
    SELECT 
		e.gini_coefficient
	INTO end_gini
    FROM
		economic_inequality e
	WHERE e.entity = p_entity AND e.year = p_end_year
;
    SELECT 
		i.atkinson_index
	INTO start_atkinson
    FROM 
		income_inequality i 
    WHERE i.entity = p_entity AND i.year = p_start_year
;
	SELECT 
		i.atkinson_index
	INTO end_atkinson 
	FROM
		income_inequality i 
	WHERE i.entity = p_entity AND i.year = p_end_year
;
    SET gini_diff = end_gini - start_gini;
	SET atkinson_diff = end_atkinson - start_atkinson;

END$$

DELIMITER ;

/*
Now let's compare the inequality in 2019 among the top 25 countries in:
*/

-- Total GDP (using CTEs)

USE inequality;

WITH top_GDP AS (
    SELECT 
        e.entity,
        e.year,
        e.gini_coefficient,
        i.atkinson_index,
        g.GDP_billion,
        ROW_NUMBER() OVER (ORDER BY g.GDP_billion DESC) AS GDP_rank
	FROM
        economic_inequality e 
			JOIN
        income_inequality i ON e.entity = i.entity AND e.year = i.year
			JOIN
        GDP_worldbank g ON i.entity = g.entity AND i.year = g.year
    WHERE e.year = 2019
),
highest_gini AS (
    SELECT 
        e.entity,
        e.year,
        e.gini_coefficient,
        i.atkinson_index,
        g.GDP_billion,
        RANK() OVER (ORDER BY e.gini_coefficient DESC) AS gini_rank
	FROM
        economic_inequality e 
			JOIN
        income_inequality i ON e.entity = i.entity AND e.year = i.year
			JOIN
        GDP_worldbank g ON i.entity = g.entity AND i.year = g.year
    WHERE e.year = 2019
)
SELECT 
    tg.entity,
    tg.year,
    tg.gini_coefficient,
    tg.atkinson_index,
    tg.GDP_billion,
    tg.GDP_rank AS largest_economies,
    hg.gini_rank AS highest_inequality_gini,
    (SELECT COUNT(*) FROM highest_gini) AS total_countries
FROM
    top_GDP tg
		LEFT JOIN
    highest_gini hg ON tg.entity = hg.entity
WHERE tg.GDP_rank <= 25 
ORDER BY tg.GDP_rank     
;

-- GDP per capita (using subqueries)

USE inequality;
    
SELECT 
    pc.entity,
    pc.year,
    pc.gini_coefficient,
    pc.atkinson_index,
    pc.GDP_per_cap,
    pc.GDP_rank AS largest_per_cap_GDP,
    hg.gini_rank AS highest_inequality_gini,
    (SELECT COUNT(*) FROM (
		SELECT
			e.entity
		FROM	
			economic_inequality e 
				JOIN
			income_inequality i ON e.entity = i.entity AND e.year = i.year
				JOIN
			GDP_per_capita g ON i.entity = g.entity AND i.year = g.year
		WHERE e.year = 2019) tc ) AS total_countries
FROM
    (SELECT 
        e.entity,
        e.year,
        e.gini_coefficient,
        i.atkinson_index,
        g.GDP_per_cap,
        ROW_NUMBER() OVER (ORDER BY g.GDP_per_cap DESC) AS GDP_rank
    FROM
        economic_inequality e 
			JOIN
        income_inequality i ON e.entity = i.entity AND e.year = i.year
			JOIN
        GDP_per_capita g ON i.entity = g.entity AND i.year = g.year
    WHERE e.year = 2019) pc 
		JOIN
    (SELECT 
        e.entity,
        e.year,
        e.gini_coefficient,
        i.atkinson_index,
        g.GDP_per_cap,
        RANK() OVER (ORDER BY e.gini_coefficient DESC) AS gini_rank
    FROM
        economic_inequality e 
			JOIN
        income_inequality i ON e.entity = i.entity AND e.year = i.year
			JOIN
        GDP_per_capita g ON i.entity = g.entity AND i.year = g.year
    WHERE e.year = 2019) hg ON pc.entity = hg.entity
WHERE pc.GDP_rank <= 25
GROUP BY pc.entity, GDP_per_cap
ORDER BY pc.GDP_rank   
;

-- GDP per employed person

USE inequality;

WITH GDP_emp AS (
	SELECT 
		e.entity,
        e.year,
        e.gini_coefficient,
        i.atkinson_index,
        g.emp_person_GDP,
        ROW_NUMBER() OVER (ORDER BY g.emp_person_GDP DESC) AS GDP_rank
	FROM
		economic_inequality e 
			JOIN
		income_inequality i ON e.entity = i.entity AND e.year = i.year
			JOIN 
		GDP_per_emp_person g ON g.entity = i.entity AND g.year = i.year
	WHERE e.year = 2019
),
highest_gini AS (
	SELECT 
		e.entity,
        e.year,
        e.gini_coefficient,
        i.atkinson_index,
        g.emp_person_GDP,
        RANK() OVER (ORDER BY e.gini_coefficient DESC) AS gini_rank
	FROM
		economic_inequality e 
			JOIN
		income_inequality i ON e.entity = i.entity AND e.year = i.year
			JOIN 
		GDP_per_emp_person g ON g.entity = i.entity AND g.year = i.year
	WHERE e.year = 2019) 
SELECT
	ge.entity,
    ge.year,
    ge.gini_coefficient,
    ge.atkinson_index,
    ge.emp_person_GDP,
    ge.GDP_rank AS largest_per_emp_GDP,
    hg.gini_rank AS highest_inequality_gini,
    (SELECT COUNT(*) FROM highest_gini) AS total_countries
FROM
	GDP_emp ge
		JOIN
    highest_gini hg ON ge.entity = hg.entity
WHERE ge.GDP_rank <= 25 
ORDER BY ge.GDP_rank     
;
    
/* 
Finally, let's examine the share of top 1% and 10% 
in terms of:
*/
	
    -- Note: the data for 2019 was sparce,
    -- so I used the data from 2018 in the queries below

-- Total GDP rank

USE inequality;

SELECT 
	t1.entity,
    t1.year,
	t1.est_pretax_share_1,
    RANK() OVER(ORDER BY t1.est_pretax_share_1 DESC) AS highest_1_percent_share,
    t10.est_pretax_share_10,
    RANK() OVER(ORDER BY t10.est_pretax_share_10 DESC) AS highest_10_percent_share,
	RANK() OVER(ORDER BY g.GDP_billion DESC) AS GDP_rank
FROM
	top_1 t1
		JOIN
	top_10 t10 ON t1.entity = t10.entity AND t1.year = t10.year
		JOIN 
	(SELECT 
		entity,
        GDP_billion,
        RANK() OVER(ORDER BY GDP_billion DESC) AS GDP_rank
	FROM 
		GDP_worldbank 
	WHERE year = 2018 AND code NOT LIKE '' AND entity != 'World'
	ORDER BY GDP_billion DESC
    ) g ON t1.entity = g.entity
WHERE t1.year = 2018 AND t1.code NOT LIKE ''     
ORDER BY t1.est_pretax_share_1 DESC
;

-- GDP per capita 

USE inequality;

SELECT 
	t1.entity,
    t1.year,
	t1.est_pretax_share_1,
    RANK() OVER(ORDER BY t1.est_pretax_share_1 DESC) AS highest_1_percent_share,
    t10.est_pretax_share_10,
    RANK() OVER(ORDER BY t10.est_pretax_share_10 DESC) AS highest_10_percent_share,
	RANK() OVER(ORDER BY g.GDP_per_cap DESC) AS per_cap_GDP_rank
FROM
	top_1 t1
		JOIN
	top_10 t10 ON t1.entity = t10.entity AND t1.year = t10.year
		JOIN 
	(SELECT 
		entity,
        GDP_per_cap,
        RANK() OVER(ORDER BY GDP_per_cap DESC) AS per_cap_GDP_rank
	FROM 
		GDP_per_capita 
	WHERE year = 2018 AND code NOT LIKE '' AND entity != 'World'
	ORDER BY GDP_per_cap DESC
    ) g ON t1.entity = g.entity
WHERE t1.year = 2018 AND t1.code NOT LIKE ''     
ORDER BY t1.est_pretax_share_1 DESC
;

-- GDP per employed person 

USE inequality;

SELECT 
	t1.entity,
    t1.year,
	t1.est_pretax_share_1,
    RANK() OVER(ORDER BY t1.est_pretax_share_1 DESC) AS highest_1_percent_share,
    t10.est_pretax_share_10,
    RANK() OVER(ORDER BY t10.est_pretax_share_10 DESC) AS highest_10_percent_share,
	RANK() OVER(ORDER BY g.emp_person_GDP DESC) AS per_emp_GDP_rank
FROM
	top_1 t1
		JOIN
	top_10 t10 ON t1.entity = t10.entity AND t1.year = t10.year
		JOIN 
	(SELECT 
		entity,
        emp_person_GDP,
        RANK() OVER(ORDER BY emp_person_GDP DESC) AS per_emp_GDP_rank
	FROM 
		GDP_per_emp_person
	WHERE year = 2018 AND code NOT LIKE '' AND entity != 'World'
	ORDER BY emp_person_GDP DESC
    ) g ON t1.entity = g.entity
WHERE t1.year = 2018 AND t1.code NOT LIKE ''     
ORDER BY t1.est_pretax_share_1 DESC
;
    
-- Gini/Atkinson values

USE inequality;

SELECT 
	t1.entity,
    t1.year,
	t1.est_pretax_share_1,
    RANK() OVER(ORDER BY t1.est_pretax_share_1 DESC) AS highest_1_percent_share,
    t10.est_pretax_share_10,
    RANK() OVER(ORDER BY t10.est_pretax_share_10 DESC) AS highest_10_percent_share,
    RANK() OVER(ORDER BY ee.gini_coefficient DESC) AS gini_rank,
    ee.gini_coefficient,      
    ee.atkinson_index
FROM
	top_1 t1
		JOIN
	top_10 t10 ON t1.entity = t10.entity AND t1.year = t10.year
		JOIN 
	(SELECT 
		e.entity,
        RANK() OVER(ORDER BY e.gini_coefficient DESC) AS gini_rank,
        e.gini_coefficient,
        i.atkinson_index
	FROM 
		economic_inequality e
			JOIN
		income_inequality i ON e.entity = i.entity AND e.year = i.year
	WHERE e.year = 2018 AND e.code NOT LIKE '' AND e.entity != 'World'
    ) ee ON t1.entity = ee.entity
WHERE t1.year = 2018 AND t1.code NOT LIKE ''     
ORDER BY t1.est_pretax_share_1 DESC
;

