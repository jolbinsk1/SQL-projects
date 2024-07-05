# SQL Project Portfolio: Analyzing Global Trends in Measures of Progress

This repository contains SQL queries that aim to analyze several metrics of progress: 
  <p>
  1) the production and sale of electric cars,
  2) trends in literacy and education worldwide, and
  3) trends in income inequality.<br>
  </p>
While on the surface these seem unrelated, I believe they are each barometers for how well we are living up to our goal of having a greener, and more equal world. 

(Note: all of the data has been queried and analyzed using MySQL Workbench.)

## Project 1: Electric Car Data Analysis

My first project involves the analysis of electric vehicle (EV) manufacture, sale, and use across multiple countries from 2010 to 2022. Specifically, this project aims to analyze the following:

- Percentage share of battery-electric and hybrid vehicles.
- Total EV stocks (i.e., driveable cars) and annual sales data.
- EV sales and use rates relative to the total car market.
- Per capita analysis of EV stocks.
- Change in share of EVs over time.
- Rankings of the above data for the year 2022

### Data Sources

The data is sourced from Hannah Ritchie's 2024 publication "Tracking global data on electric vehicles,” which has been made available on OurWorldInData.org.

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
- `e_sales_stocks_shares`: Combines data on EV sales, stocks, and their shares relative to total car sales.
- `e_stock_per_capita`: Calculates EV stocks per capita for each country/region.

#### Stored Procedures

- `e_share_increase`: Computes the percentage increase in the share of EVs between two specified years.
- `e_stock_increase`: Calculates the percentage increase in EV stocks between two specified years.
- `e_cars_sold_increase`: Computes the percentage increase in EV sales between two specified years.
- `non_ecars_sold_increase`: Calculates the percentage increase in non-EV sales between two specified years.

### How to Use

```bash
# 1) Clone the repository
git clone https://github.com/jolbinsk1/SQL-projects.git
cd SQL-project/electric-car-project

# 2) Create Database
mysql -u your_username -p your password

  # using SQL query:
CREATE DATABASE electric_vehicle_db;

# 3) Navigate to the dump files directory
cd electric-car-project-dump

# 4) Import the database
mysql -u root -p electric_vehicle_db < electric-cars_battery_plugin_shares.sql
mysql -u root -p electric_vehicle_db < electric-cars_car_sales.sql
mysql -u root -p electric_vehicle_db < electric-cars_electric_car_stocks.sql
mysql -u root -p electric_vehicle_db < electric-cars_electric_sales_share.sql
mysql -u root -p electric_vehicle_db < electric-cars_electric_stock_share.sql
mysql -u root -p electric_vehicle_db < electric-cars_percent_battery_electric.sql
mysql -u root -p electric_vehicle_db < electric-cars_world_population.sql
mysql -u root -p electric_vehicle_db < electric-cars_routines.sql

```

### Results

Highlights from the SQL calculations:
- As of 2022, China is the current world leader in EV stocks (~14 million cars) and sales (~5.9 million cars), far outpacing the United States as runner up (~3 million and ~600,000, respectively) .
- China has also seen the greatest growth in EVs sold from 2018-2022, outpacing second place, which is held by Germany (change: ~5 million vs. ~800,000 respectively)
- The top 3 countries with the highest percent of EVs driven in 2022 are:
  <p>
     <blockquote>
      1) Norway (88%)<br>
      2) Iceland (70%)<br>
      3) Sweden (54%)<br>
     </blockquote>
  </p>
- As of 2022, the top 3 countries with respect to EVs per 100,000 people are:
  <p>
    <blockquote>
      1) Germany (224) <br>
      2) France (145)<br>
      3) the U.K. (140)<br>
    </blockquote>
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
- `per_cap_GDP_test`: Contains the combined harmonized test scores from the TIMSS (Trends in International Mathematics and Science Study) and PIRLS (Progress in International Reading Literacy Study) test for Countries in a given year.
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

```bash
# 1) Clone the repository
git clone https://github.com/jolbinsk1/SQL-projects.git
cd SQL-projects/inequality-project

# 2) Create Database (if not already done from Project 1)
mysql -u your_username -p your_password

  # using SQL query:
CREATE DATABASE electric_vehicle_db;

# 3) Navigate to the dump files directory
cd inequality_project_dump

# 4) Import the database
mysql -u root -p electric_vehicle_db < inequality_GDP_per_capita.sql
mysql -u root -p electric_vehicle_db < inequality_GDP_per_emp_person.sql
mysql -u root -p electric_vehicle_db < inequality_GDP_worldbank.sql
mysql -u root -p electric_vehicle_db < inequality_economic_inequality.sql
mysql -u root -p electric_vehicle_db < inequality_income_inequality.sql
mysql -u root -p electric_vehicle_db < inequality_Top_1.sql
mysql -u root -p electric_vehicle_db < inequality_Top_10.sql
mysql -u root -p electric_vehicle_db < inequality_routines.sql

```

### Results

The analysis reveals insights into global education and literacy trends, the highlights of which include:
- The reported tertiary education rates for 2020 (the year with the most available data) are: 
  <p> 
    <blockquote>
      1) Iceland: 85.60%<br>
      2) South Korea: 78.60%<br>
      3) Russia: 75.80%<br>
      …<br>
      122) Niger: <0.01% <br>
      123) Mali: <0.01% <br>
      124) Liberia: <0.01%<br>
    </blockquote>
  </p>
- The average years of adjusted education for 2015 (the year with the most available data) are:
  <p>
    <blockquote>
      1) Singapore: 12.54 years <br>
      2) Lithuania: 12.44 years<br>
      3) Estonia: 12.33 years<br>
      …<br>
      112) Mozambique: 3.31 years<br>
      113) Mali: 2.78 years<br>
      114) Niger: 2.44 years<br>
  </blockquote>
  </p>
- The  average percent of youth literacy 2011 (the year with the most available data) are:
  <p>
    <blockquote>
      1) Bahrain<br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Female: 100% <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Male: 100% <br>
      2) Estonia<br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Female: 99.96% <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Male: 99.94% <br>
      3) Azerbaijan<br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Female: 99.93% <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Male: 99.96% <br>
    …<br>
      55) Senegal <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Female: 58.54% <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Male: 73.73% <br>
      56) Afghanistan <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Female: 32.11%<br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Male: 61.88%<br>
      57) Mali <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Female: 29.70% <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Male: 56.52%<br>
    </blockquote>
  </p>
- Finally, the rankings of the counties present in the data in terms of per capita GDP in 2020 (the year with the most available data), including their percent literacy:
  <p>
    <blockquote>
      1) Singapore<br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Per capita GDP: $94,910<br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Literacy: 97.13%<br>
      2) Saudi Arabia <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Per capita GDP: $44,770 <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Literacy: 97.59%<br>
      3) Kuwait <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Per capita GDP: $43,922 <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Literacy: 96.46%<br>
      …<br>
      24) Mali<br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Per capita GDP: $2,123 <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Literacy: 30.76%<br>
      25) Mozambique <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Per capita GDP: $1,237 <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Literacy: 59.78%<br>
      26) Central African Republic <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Per capita GDP: $848 <br>
      &nbsp;&nbsp;&nbsp;&nbsp;- Literacy: 37.49%<br>
    </blockquote>
  </p>
  
(Note: many of the wealthiest countries -- e.g. France, U.K., and the United States -- were absent from much of the data. Also, there were numerous gaps present in the data -- e.g., some years with many entries in one data set had very few or none in another. Therefore, the rankings are not completely representative and strong conclusions should not be drawn from them.)

## Project 3: Comparative Analysis of Economic Inequality Metrics with GDP

The objective of this project is to examine worldwide economic inequality before the COVID-19 pandemic. This period was selected because of the widespread economic consequences of the pandemic.I analyzed various GDP metrics, as well as two measures of economic inequality: the **Gini coefficient** and the **Atkinson index**. Both calculate wealth distribution on a scale of 0 to 1 (with 0 being complete equality and 1 complete inequality), but the Atkinson index takes into account the level of inequality a given society deems "acceptable."

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

```bash
# 1) Clone the repository
git clone https://github.com/jolbinsk1/SQL-projects.git
cd SQL-projects/literacy-and-education-project

# 2) Create Database (if not already done from Project 1 or 2)
mysql -u your_username -p your_password

  # using SQL query:
CREATE DATABASE electric_vehicle_db;

# 3) Navigate to the dump files directory
cd literacy_and_education_project_dump

# 4) Import the database
mysql -u root -p electric_vehicle_db < education_world_literacy_rates.sql
mysql -u root -p electric_vehicle_db < education_per_cap_GDP_test.sql
mysql -u root -p electric_vehicle_db < education_literacy_vs_avg_schooling.sql
mysql -u root -p electric_vehicle_db < education_tertiary_education.sql
mysql -u root -p electric_vehicle_db < education_literacy_rates_male_female.sql
mysql -u root -p electric_vehicle_db < education_adjusted_school_years.sql
mysql -u root -p electric_vehicle_db < education_routines.sql

```

### Results

The analysis sheds light on the economic inequality trends across countries. Some of the key findings include:
- All analyzed countries (except Egypt) had a higher Gini coefficient than Atkinson index in 2019.
  - This could imply that the public perceive inequality to be higher than it should be (However, this must be taken lightly given the robustness of data that is needed to argue that claim)
- The rankings of the amount of total wealth owned by the 1% were:
  <p>
    <blockquote>
       1) Dominican Republic <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total wealth: 35.9%<br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total GDP rank: 66<br>
      2) Mexico <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total wealth: 29.5% <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total GDP rank: 12<br>
      3) Angola <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total wealth: 26.0% <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total GDP rank: 64<br>
      …<br>
      44) Albania <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total wealth: 9.3% <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total GDP rank: 116<br>
      45) Slovenia <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total wealth: 8.0% <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total GDP rank: 96<br>
      46) Slovakia <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total wealth: 7.9% <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- Total GDP rank: 76<br>
    </blockquote>
  </p>
- The associated GDP rankings of the largest economies in 2019 include:
  <p>
    <blockquote>
      1) China <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- per Capita GDP rank: 74 <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- per employee GDP rank: 102<br>
      2) United States <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- per Capita GDP rank: 9<br>
        &nbsp;&nbsp;&nbsp;&nbsp;- per employee GDP rank: 6<br>
      3) India <br>
        &nbsp;&nbsp;&nbsp;&nbsp;- per Capita GDP rank: 119<br>
        &nbsp;&nbsp;&nbsp;&nbsp;- per employee GDP rank: 119<br>
    </blockquote>
  </p>
