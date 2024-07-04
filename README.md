# SQL Project Portfolio: Analyzing Global Trends in Measures of Progress

This repository contains SQL queries that aim to analyze several metrics of progress: 1) the production and sale of electric cars, 2) trends in literacy and education worldwide, and 3) trends in income inequality. While on the surface these seem unrelated, I believe they are each barometers for how well we are living up to our goal of having a greener, and more equal world. 

* All of the data has been queried and analyzed using MySQL Workbench.

## Project 1: Electric Car Data Analysis

My first project involves the analysis of electric vehicle (EV) manufacture, sale, and use across multiple countries from 2010 to 2022. Specifically, this project aims to analyze the following:

- Percentage share of battery-electric and hybrid vehicles.
- Total electric car stocks (i.e., driveable cars) and annual sales data.
- Electric car sales and use rates relative to the total car market.
- Per capita analysis of electric car stocks.
- Change in share of EVs over time.
- Rankings of the above data for the year 2022

### Data Sources

The data is sourced primarily from Hannah Ritchie's 2024 publication "Tracking global data on electric vehicles,” which has been made available on OurWorldInData.org.

### Database Schema

The database comprises the following main tables:

- `battery_plugin_shares`: Contains data on the share (i.e., percentage) of battery-electric and hybrid vehicles.
- `car_sales`: Includes annual sales data of cars, both electric and non-electric.
- `electric_car_stocks`: Provides information on the total stocks of electric cars (i.e., number of driveable cars) per country/region.
- `electric_sales_share`: Tracks the percentage of electric car sales relative to total car sales.
- `percent_battery_electric`: Contains the percentage of battery-electric vehicles in the overall car market.
- `world_population`: Provides population data used for per capita calculations.

### Views and Procedures

#### Views

- `data_start_years`: Displays the start year for data collection across various categories.
- `battery_electric_comparison`: Compares the share of battery-electric and hybrid vehicles per country/region.
- `e_sales_stocks_shares`: Combines data on electric car sales, stocks, and their shares relative to total car sales.
- `e_stock_per_capita`: Calculates electric car stocks per capita for each country/region.

#### Stored Procedures

- `e_share_increase`: Computes the percentage increase in the share of electric cars between two specified years.
- `e_stock_increase`: Calculates the percentage increase in electric car stocks between two specified years.
- `e_cars_sold_increase`: Computes the percentage increase in electric car sales between two specified years.
- `non_ecars_sold_increase`: Calculates the percentage increase in non-electric car sales between two specified years.

### How to Use

#### Clone the repository:

```bash
git clone https://github.com/jolbinsk1/SQL-projects.git
cd electric-vehicle-project
```

#### Import the Database:

Import the provided SQL script to set up the database schema and populate the tables:
sql
Copy code
SOURCE path_to_sql_script.sql;

#### Use MySQL Workbench or any SQL client to run queries, create views, and execute     stored procedures as needed.

### Results

Highlights from the SQL calculations:
- As of 2022, China is the current world leader in EV stocks (~14 million cars) and sales (~5.9 million cars), far outpacing the United States as runner up (~3 million and ~600,000, respectively) .
- China has also seen the greatest growth in EVs sold from 2018-2022, outpacing second place, which is held by Germany (change: ~5 million vs. ~800,000 respectively)
- The top 3 countries with the highest percent of EVs driven in 2022 are:
  <p>
      1) Norway (88%)<br>
      2) Iceland (70%)<br>
      3) Sweden (54%)<br>
  </p>
- As of 2022, the top 3 countries with respect to EVs per 100,000 people are:
  <p>
      1) Germany (224) <br>
      2) France (145)<br>
      3) the U.K. (140)<br>
  </p>

## Project 2: Education and Literacy Worldwide Analysis

My next project aims to examine the differences in education and literacy worldwide. The following are calculated from the data:
- Literacy rates by country and year.
- Gender differences in youth literacy rates by year.
- Tertiary education (e.g., undergraduate degrees) enrollment percentages per year.
- GDP vs. the above statistics.
- The most recent data available for the above statistics.
- Miscellaneous rankings for the above statistics.

### Data Sources

The data used in this project came from the sources listed below:
- Patrinos and Angrist (2018) and UNESCO via World Bank
- World Bank (2023) via OurWorldInData.org/literacy
- Filmer et al. (2018) via World Bank
- Barro and Lee (2015) and Lee and Lee (2016)

### Database Schema

The database consists of the following tables:
- `world_literacy_rates`: Contains the percent literacy of a country per year that the data is available.
- `tertiary_education`: Includes percentage of the population of a given country and given year that has a tertiary education.
- `per_cap_GDP_test`: Contains the harmonized test scores from the TIMSS (Trends in International Mathematics and Science Study) and PIRLS (Progress in International Reading Literacy Study) test for Countries in a given year.
- `literacy_vs_avg_schooling`: Provides the estimated percent literacy and the average years of schooling per country per year.
- `literacy_rates_male_female`: Contains the estimated male/female youth (aged 16-24) literacy rates and the estimated population per country per year.
- `adjusted_school_years`: Includes estimates of the adjusted years of schooling per country per year.

### Views and Procedures

#### Views

- `v_world_literacy_and_GDP`: Combines literacy rates and GDP per capita.
- `v_youth_literacy_and_GDP`: Compares youth literacy rates (male and female) and GDP per capita.
- `v_tertiary_ed_and_GDP`: Compares tertiary education percentages, literacy rates, and GDP per capita.
- `v_total_education_and_literacy`: Displays average years of schooling, adjusted school years, tertiary education percentages, and literacy rates.

#### Procedures

- `p_youth_literacy_info`: Retrieves the most recent youth literacy data for a specified country.
- `p_world_literacy_and_GDP`: Displays the most recent data from v_world_literacy_and_GDP for a specified country.
- `p_tertiary_ed_and_GDP`: Retrieves the most recent data from v_tertiary_ed_and_GDP for a specified country.
- `p_total_education_and_literacy`: Computes the most recent data from v_total_education_and_literacy for a specified country.

### How to Use

#### Clone the Repository
```bash
Copy code
git clone https://github.com/jolbinsk1/SQL-projects.git
cd literacy-and-education-project
```

#### Import the Database

Import the provided SQL script to set up the database schema and populate the tables.
```bash
sql
Copy code
SOURCE path_to_sql_script.sql;
```

#### Run Queries

Use MySQL Workbench or any other SQL client to run queries, create views, and execute stored procedures as needed.

### Results

The analysis reveals insights into global education and literacy trends, the highlights of which include:
- The reported tertiary education rates for 2020 (the year with the most available data) are: 
  <p> 
    1) Iceland: 85.60%<br>
    2) South Korea: 78.60%<br>
    3) Russia: 75.80%<br>
    …<br>
    122) Niger: <0.01% <br>
    123) Mali: <0.01% <br>
    124) Liberia: <0.01%<br>
  </p>
- The average years of adjusted education for 2015 (the year with the most available data) are:
  1) Singapore <br>
  - 12.54 years
  2) Lithuania <br>
  - 12.44 years
  3) Estonia <br>
  - 12.33 years
  …
  112) Mozambique <br>
  - 3.31 years
  113) Mali <br>
  - 2.78 years
  114) Niger <br>
  - 2.44 years
- The  average percent of youth literacy 2011 (the year with the most available data) are:
  1) Bahrain 
  - Female: 100% 
  - Male: 100% 
  2) Estonia 
  - Female: 99.96% 
  - Male: 99.94%
  3) Azerbaijan 
  - Female: 99.93% 
  - Male: 99.96%
…
  55) Senegal 
  - Female: 58.54% 
  - Male: 73.73%
  56) Afghanistan 
  - Female: 32.11%
  - Male: 61.88%
  57) Mali 
  - Female: 29.70% 
  - Male: 56.52%
- Finally, the rankings of the counties present in the data in terms of per capita GDP in 2020 (the year with the most available data), including their percent literacy:
  1) Singapore 
  - GDP: $94,910
  - Literacy: 97.13%
  2) Saudi Arabia 
  - GDP: $44,770; 
  - Literacy: 97.59%
  3) Kuwait 
  - GDP: $43,922; 
  - Literacy: 96.46%
  …
  24) Mali
  - GDP: $2,123; 
  - Literacy: 30.76%
  25) Mozambique 
  - GDP: $1,237; 
  - Literacy: 59.78%
  26) Central African Republic 
  - GDP: $848; 
  - Literacy: 37.49%
  
*Note: many of the wealthiest countries (e.g. France, U.K., and the United States) were absent from much of the data. Also, there were numerous gaps present in the data (e.g., some years with many entries in one data set had very few or none in another). Therefore, the rankings are not completely representative and strong conclusions should not be drawn from them.

## Project 3: Comparative Analysis of Economic Inequality Metrics with GDP

The objective of this project is to examine worldwide economic inequality before the COVID-19 pandemic. This period was selected because of the widespread economic consequences of the pandemic.I analyzed various GDP metrics, as well as two measures of economic inequality: the Gini coefficient and the Atkinson index. Both calculate wealth distribution on a scale of 0 to 1 (with 0 being complete equality and 1 complete inequality), but the Atkinson index takes into account the level of inequality a given society deems "acceptable."

### Data Sources

The data used in this project was pulled from the following sources:
- World Bank Poverty and Inequality Platform (2023), processed by Our World in Data
- World Inequality Database (WID.world) (2023), processed by Our World in Data
- World Bank (2023), with minor processing by Our World in Data
- UNDP, Human Development Report (2021-22) (2022), with minor processing by Our World in Data

### Database Schema

The project used the following tables to store and analyze data:
- `economic_inequality`: Contains the data on the Gini coefficients per country and year.
- `income_inequality`: Provides the data on the Atkinson index per country and year.
- `GDP_worldbank`: Stores total GDP data per country per year.
- `GDP_per_capita`: Includes the GDP per capita data per country per year.
- `GDP_per_emp_person`: Stores the GDP per employed person data per country per year.
- `top_10`: Contains the share of total GDP held by the top 10% per country per year.
- `top_1`: Provides the share of total GDP held by the top 1% per country per year.
  
### Views and Procedures

#### Views

- `ineq_measure_discrepancy`: Compares the Gini coefficient and Atkinson index discrepancies for each country in 2019.
- `total_GDP_data`: Combines total GDP, GDP per capita, and GDP per employed person data for comprehensive GDP analysis.
- `GDP_rankings_2019`: Ranks countries by total GDP, GDP per capita, and GDP per employed person in 2019.

#### Procedures

- `ineq_diff`: Calculates the change in Gini coefficient and Atkinson index for a specified country between two given years.
  
### How to Use

#### Clone the Repository:
```bash
Copy code
git clone https://github.com/jolbinsk1/SQL-projects.git
cd world-inequality-project
```

#### Set Up the Database:

Import the provided SQL script into MySQL Workbench to create the database schema and populate tables.

#### Run Queries:

Use MySQL Workbench or any SQL client to execute queries, create views, and call stored procedures as needed.

### Results

The analysis sheds light on the economic inequality trends across countries. Some of the key findings include:
- All analyzed countries (except Egypt) had a higher Gini coefficient than Atkinson index in 2019.
  - This could imply that the public perceive inequality to be higher than it should be (However, this must be taken lightly given the robustness of data that is needed to argue that claim)
- The rankings of the amount of total wealth owned by the 1% were:
  1) Dominican Republic 
    35.9% total wealth
    Total GDP: 66
  2) Mexico 
    29.5% total wealth
    Total GDP: 12
  3) Angola 
    26.0% total wealth 
    Total GDP: 64
  …
  44) Albania 
    9.3% total wealth 
    Total GDP: 116
  45) Slovenia 
    8.0% total wealth
    95th in total GDP
  46) Slovakia 
    7.9% total wealth 
    70th in total GDP
- The associated GDP rankings of the largest economies in 2019 include:
  1) China 
    per Capita GDP: 74 
    per employee GDP: 102
  2) United States 
    per Capita GDP: 9
    per employee GDP: 6
  3) India 
    per Capita GDP: 119
    per employee GDP: 119

