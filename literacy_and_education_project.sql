-- Dataset: Examining differences in education and literacy worldwide
-- Sources:
	-- Patrinos and Angrist (2018) and UNESCO via World Bank
		-- Data compiled from multiple sources by World Bank 
	-- World Bank (2023), Various sources (2018) 
		-- OurWorldInData.org/literacy
	-- Filmer et al. (2018) via World Bank 
	-- Barro and Lee (2015) and Lee and Lee (2016)
-- Queried using MySQL Workbench


/* 
First, we will create the tables
*/

USE education;
DROP TABLE IF EXISTS world_literacy_rates;

CREATE TABLE world_literacy_rates (
	country VARCHAR(255) NOT NULL,
    code VARCHAR(10),
    year YEAR(4) NOT NULL,
    percent_literacy DECIMAL(5,2) NOT NULL,
    CONSTRAINT country_year PRIMARY KEY(country,year)
);

SELECT * FROM world_literacy_rates;

#---------------------------------------------------------

USE education;
DROP TABLE IF EXISTS tertiary_education;

CREATE TABLE tertiary_education (
	country VARCHAR(255) NOT NULL,
    code VARCHAR(10),
    year YEAR(4) NOT NULL,
    tertiary_ed_percent DECIMAL(5,2) NOT NULL,
    CONSTRAINT country_year PRIMARY KEY(country,year)
);

SELECT * FROM tertiary_education;

#---------------------------------------------------------

USE education;
DROP TABLE IF EXISTS per_cap_GDP_test;

CREATE TABLE per_cap_GDP_test (
	country VARCHAR(255) NOT NULL,
    code VARCHAR(10),
    year YEAR(4) NOT NULL,
    harmonized_test_scores DECIMAL(6,2) NOT NULL,
    per_cap_GDP DECIMAL(10,2) NOT NULL,
    CONSTRAINT country_year PRIMARY KEY (country,year)
);

SELECT * FROM per_cap_GDP_test;

#---------------------------------------------------------

USE education;
DROP TABLE IF EXISTS literacy_vs_avg_schooling;

CREATE TABLE literacy_vs_avg_schooling (
	country VARCHAR(255) NOT NULL,
    code VARCHAR(10),
    year YEAR(4) NOT NULL,
    est_literacy DECIMAL(5,2) NOT NULL,
    avg_ed_years DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (country,year) REFERENCES world_literacy_rates (country,year)
);

SELECT * FROM literacy_vs_avg_schooling;

#---------------------------------------------------------

USE education;
DROP TABLE IF EXISTS literacy_rates_male_female;

CREATE TABLE literacy_rates_male_female (
	country VARCHAR(255) NOT NULL,
    code VARCHAR(10),
    year YEAR(4) NOT NULL,
    male_youth_literacy DECIMAL(5,2) NOT NULL,
    female_youth_literacy DECIMAL(5,2) NOT NULL,
    population BIGINT,
    FOREIGN KEY (country,year) REFERENCES world_literacy_rates (country,year)
);

SELECT * FROM literacy_rates_male_female;

#---------------------------------------------------------

USE education;
DROP TABLE IF EXISTS adjusted_school_years;

CREATE TABLE adjusted_school_years (
	country VARCHAR(255) NOT NULL,
    code VARCHAR(10),
    year YEAR(4) NOT NULL,
    years_of_school_adj DECIMAL(4,2),
    CONSTRAINT country_year PRIMARY KEY (country,year)
);

SELECT * FROM adjusted_school_years;

/*
Since not all countries have data for a given year, let's generate a temporary table
to display the number of entries we have per year per table
*/

USE education;

DROP TEMPORARY TABLE IF EXISTS f_data_years;

CREATE TEMPORARY TABLE f_data_years AS
SELECT
    years.year,
    COALESCE(asy.adj_school_years, 0) AS adj_school_years,
    COALESCE(lr.lit_rate_mf, 0) AS lit_rate_mf,
    COALESCE(las.lit_avg_schooling, 0) AS lit_avg_schooling,
    COALESCE(gdp.pc_GDP_test, 0) AS pc_GDP_test,
    COALESCE(te.tert_ed, 0) AS tert_ed,
    COALESCE(w.world_lit_rates, 0) AS world_lit_rates
FROM 
	(SELECT DISTINCT year FROM adjusted_school_years
		UNION
	SELECT DISTINCT year FROM literacy_rates_male_female
		UNION
	SELECT DISTINCT year FROM literacy_vs_avg_schooling
		UNION
	SELECT DISTINCT year FROM per_cap_GDP_test
		UNION
	SELECT DISTINCT year FROM tertiary_education
		UNION
	SELECT DISTINCT year FROM world_literacy_rates
	) years
LEFT JOIN 
		(SELECT
			year, COUNT(*) AS adj_school_years
		FROM adjusted_school_years 
		GROUP BY year) asy ON years.year = asy.year
LEFT JOIN 
		(SELECT 
			year, COUNT(*) AS lit_rate_mf 
        FROM literacy_rates_male_female 
		GROUP BY year) lr ON years.year = lr.year
LEFT JOIN 
		(SELECT 
			year, COUNT(*) AS lit_avg_schooling 
        FROM literacy_vs_avg_schooling 
		GROUP BY year) las ON years.year = las.year
LEFT JOIN 
		(SELECT 
			year, COUNT(*) AS pc_GDP_test 
        FROM per_cap_GDP_test 
        GROUP BY year) gdp ON years.year = gdp.year
LEFT JOIN 
		(SELECT 
			year, COUNT(*) AS tert_ed 
		FROM tertiary_education 
        GROUP BY year) te ON years.year = te.year
LEFT JOIN 
		(SELECT 
			year, COUNT(*) AS world_lit_rates 
		FROM world_literacy_rates 
        GROUP BY year) w ON years.year = w.year
ORDER BY years.year ASC;

SELECT * FROM f_data_years;

/*
Next, we will create views to better conceptualize the data
*/

-- literacy rates & per capita GDP

USE education;
DROP VIEW IF EXISTS v_world_literacy_and_GDP;

CREATE OR REPLACE VIEW v_world_literacy_and_GDP AS
	SELECT
		w.country,
        w.year,
        g.per_cap_GDP,
        w.percent_literacy
	FROM
		world_literacy_rates w
			JOIN
		per_cap_GDP_test g ON w.country = g.country AND w.year = g.year
	GROUP BY w.country, w.year
    ORDER BY g.per_cap_GDP DESC
;

SELECT * FROM v_world_literacy_and_GDP;

-- youth literacy by gender & per capita GDP

USE education;
DROP VIEW IF EXISTS v_youth_literacy_and_GDP;

CREATE OR REPLACE VIEW v_youth_literacy_and_GDP AS
	SELECT
		mf.country,
        mf.year,
        g.per_cap_GDP,
        mf.male_youth_literacy,
        mf.female_youth_literacy
	FROM
		literacy_rates_male_female mf 
			JOIN
		per_cap_GDP_test g ON mf.country = g.country AND mf.year = g.year
	GROUP BY mf.country, mf.year, mf.male_youth_literacy, mf.female_youth_literacy
    ORDER BY g.per_cap_GDP DESC
;

SELECT * FROM v_youth_literacy_and_GDP;

-- tertiary education, literacy & per capita GDP

USE education;
DROP VIEW IF EXISTS v_tertiary_ed_and_GDP;

CREATE OR REPLACE VIEW v_tertiary_ed_and_GDP AS
	SELECT
		te.country,
        te.year,
        g.per_cap_GDP,
        te.tertiary_ed_percent,
        w.percent_literacy
	FROM
		tertiary_education te
			JOIN
		per_cap_GDP_test g ON te.country = g.country AND te.year = g.year
			JOIN
		world_literacy_rates w ON w.country = te.country AND w.year = te.year
	GROUP BY te.country, te.year, g.per_cap_GDP, te.tertiary_ed_percent, w.percent_literacy
    ORDER BY g.per_cap_GDP DESC
;

SELECT * FROM v_tertiary_ed_and_GDP;


-- average schooling, adjusted school years, tertiary education, & literacy

USE education;
DROP VIEW IF EXISTS v_total_education_and_literacy;

CREATE OR REPLACE VIEW v_total_education_and_literacy AS
	SELECT
		ls.country,
        ls.year,
        ls.est_literacy,
        ls.avg_ed_years,
        asy.years_of_school_adj,
        te.tertiary_ed_percent
	FROM
        literacy_vs_avg_schooling ls 
			JOIN
		adjusted_school_years asy ON asy.country = ls.country AND asy.year = ls.year
			JOIN 
		tertiary_education te ON te.country = ls.country AND te.year = ls.year
	ORDER BY est_literacy DESC
    ;
	
SELECT * FROM v_total_education_and_literacy;

/* 
Now let's create a function to get youth literacy data for a country & year
*/

-- function to call female/male youth literacy for a given country

USE education;

DROP FUNCTION IF EXISTS f_male_literacy_info;

DELIMITER $$
CREATE FUNCTION f_male_literacy_info(p_country VARCHAR(50), p_year YEAR(4)) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN

DECLARE male_literacy DECIMAL(5,2);

	SELECT
		male_youth_literacy
	INTO male_literacy
	FROM
		literacy_rates_male_female
	WHERE country = p_country AND year = p_year;
        
RETURN male_literacy;
END$$

DELIMITER ;

SELECT f_male_literacy_info('Russia',2010);

/*
Since output is rather limited for functions, let's instead use stored procedures
to get more data
*/

-- stored procudure for most recent youth literacy rates

USE eductation;

DROP PROCEDURE IF EXISTS p_youth_literacy_info;

DELIMITER $$
CREATE PROCEDURE p_youth_literacy_info (
	IN p_country VARCHAR(50),
    OUT p_year YEAR(4),
    OUT p_male_youth_literacy DECIMAL(5,2),
    OUT p_female_youth_literacy DECIMAL(5,2)
)
BEGIN
	SELECT 
		year,
        male_youth_literacy,
        female_youth_literacy
	INTO 
		p_year,
        p_male_youth_literacy,
        p_female_youth_literacy
	FROM
		literacy_rates_male_female
	WHERE 
		country = p_country
	ORDER BY year DESC
    LIMIT 1;
END$$

DELIMITER ;

CALL p_youth_literacy_info('Russia', @p_year, @p_male_youth_literacy, @p_female_youth_literacy);
SELECT @p_year, @p_male_youth_literacy, @p_female_youth_literacy;

-- stored procedure for most recent data in view: v_world_literacy_and_GDP

USE education;

DROP PROCEDURE IF EXISTS p_world_literacy_and_GDP;

DELIMITER $$
CREATE PROCEDURE p_world_literacy_and_GDP(
	IN p_country VARCHAR(50)
)
BEGIN
	SELECT
        year,
        per_cap_GDP,
        percent_literacy
	FROM
		v_world_literacy_and_GDP
	WHERE
		country = p_country
	ORDER BY year DESC
    LIMIT 1;
END$$

DELIMITER ;

CALL p_world_literacy_and_GDP('Armenia');

-- stored procedure for most recent data in view: v_tertiary_ed_and_GDP

USE education;

DROP PROCEDURE IF EXISTS p_tertiary_ed_and_GDP;

DELIMITER $$
CREATE PROCEDURE p_tertiary_ed_and_GDP (
	IN p_country VARCHAR(50)
)
BEGIN
	SELECT
        year
        per_cap_GDP,
        tertiary_ed_percent,
        percent_literacy
	FROM
		v_tertiary_ed_and_GDP
	WHERE
		country = p_country
	ORDER BY year DESC
    LIMIT 1;
END$$

DELIMITER ;

CALL p_tertiary_ed_and_GDP('Russia');

-- stored procedure for most recent data in view: v_total_education_and_literacy

USE education;

DROP PROCEDURE IF EXISTS p_total_education_and_literacy;

DELIMITER $$
CREATE PROCEDURE p_total_education_and_literacy (
	IN p_country VARCHAR(50)
)
BEGIN
	SELECT
        year,
        est_literacy,
        avg_ed_years,
        years_of_school_adj,
        tertiary_ed_percent
	FROM
       v_total_education_and_literacy
	WHERE country = p_country
    ORDER BY year DESC
    LIMIT 1
    ;
END$$

DELIMITER ;

CALL p_total_education_and_literacy('Armenia');

/*
Finally, let's generate rankings for the year with the 
greatest number of entries for each metric
*/

-- world literacy rates for 2015
	-- using (SELECT * FROM f_data_years), we can see that there were 170 entries for that year.
 
USE education;

SELECT * FROM f_data_years;

SELECT 
	country,
    year,
    DENSE_RANK() OVER w AS literacy_rank,
    percent_literacy
FROM
	world_literacy_rates
WHERE year = 2015 AND code != ' '
WINDOW w AS (ORDER BY percent_literacy DESC)
;
    
-- average youth literacy (average of male and female) for 2011
    -- number of average youth literacy entries for 2011: 60
	
USE education;

SELECT * FROM f_data_years;

SELECT 
	country,
    year,
    DENSE_RANK() OVER(ORDER BY (male_youth_literacy + female_youth_literacy)/2 DESC) AS avg_lit_rank,
	ROUND(((male_youth_literacy + female_youth_literacy)/2),2) AS avg_youth_literacy,
    DENSE_RANK() OVER(ORDER BY male_youth_literacy DESC) AS m_lit_rank,
	male_youth_literacy,
    DENSE_RANK() OVER(ORDER BY female_youth_literacy DESC) AS f_lit_rank,
    female_youth_literacy
FROM
	literacy_rates_male_female
WHERE year = 2011 AND code != ' ' AND country NOT LIKE ('%income%')
;
    
-- tertiary education, and adjusted school years for 2020
	-- number of adjusted school year entries for 2020: 174
    -- number of tertiary education entries for 2020: 153

    
USE education;

SELECT * FROM f_data_years;


SELECT 
	adj.country,       # this was done because the original query resulted in multiple repetitions for each country
    adj.year,
    DENSE_RANK() OVER(ORDER BY adj.years_of_school_adj DESC) AS adj_school_year_rank,
	adj.years_of_school_adj,
    DENSE_RANK() OVER(ORDER BY te.tertiary_ed_percent DESC) AS tert_ed_rank,
	te.tertiary_ed_percent
FROM
	adjusted_school_years adj
		JOIN
	(SELECT 
		DISTINCT (country),
        tertiary_ed_percent,
		year
	FROM	
		tertiary_education) te ON adj.country = te.country AND adj.year = te.year
WHERE adj.year = 2020 AND adj.code != ' '
;   

-- per capita GDP, and literacy test results for 2020
    -- number of entries for 2020: 172
    
USE employees;
    
SELECT * FROM f_data_years;

SELECT 
	country,
    year,
	DENSE_RANK() OVER(ORDER BY per_cap_GDP DESC) AS per_cap_GDP_rank,
    per_cap_GDP,
	DENSE_RANK() OVER(ORDER BY harmonized_test_scores DESC) AS lit_test_rank,
    harmonized_test_scores
FROM
	per_cap_GDP_test
WHERE year = 2020 AND code != ' '
;

-- Finally, average years of schooling for 2015
	-- number of entries for 2015: 119
    
USE education;
    
SELECT * FROM f_data_years;    

SELECT 
	country,
    year,
	DENSE_RANK() OVER(ORDER BY avg_ed_years DESC) AS ed_years_rank,
	avg_ed_years,
    DENSE_RANK() OVER(ORDER BY est_literacy DESC) AS est_literacy_rank,
    est_literacy
FROM	
	literacy_vs_avg_schooling
WHERE year = 2015 AND code != ' '
;
