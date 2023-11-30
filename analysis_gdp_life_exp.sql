## view some data
SELECT *
FROM gapminder_data
LIMIT 5;

##  Exploratory Data Analysis

# is there missing value?
SELECT COUNT(*) AS missing_value
FROM gapminder_data
WHERE country IS NULL OR life_exp IS NULL OR gdp_cap IS NULL;

# continents that exist in the dataset
SELECT DISTINCT(continent)
FROM gapminder_data;

# average gdp per capita
SELECT ROUND(AVG(gdp_cap), 2) AS avg_gdp
FROM gapminder_data;

# average life expectancy
SELECT ROUND(AVG(life_exp), 2) AS avg_life_exp
FROM gapminder_data;

# average population
SELECT ROUND(AVG(population), 2) AS avg_pop
FROM gapminder_data;

## Data Analysis

# average gdp and life expectancy by continent
SELECT continent,
	   ROUND(AVG(gdp_cap), 2) AS avg_gdp,
       ROUND(AVG(life_exp), 2) AS avg_life_exp
FROM gapminder_data
GROUP BY continent
ORDER BY avg_gdp DESC;
/*
Oceania leads as the continent with the highest average GDP per capita and life expectancy, 
while Africa lags behind with the lowest standings in these measures.
*/

# the number of countries per continent exceeding the average GDP and life expectancy
SELECT continent,
	   ROUND(AVG(gdp_cap), 2) AS avg_gdp,
       ROUND(AVG(life_exp), 2) AS avg_life_exp
FROM gapminder.gapminder_data
GROUP BY continent
HAVING avg_gdp > (SELECT AVG(gdp_cap) FROM gapminder_data)
  AND avg_life_exp > (SELECT AVG(life_exp) FROM gapminder_data);
-- Asia, Europe, and Oceania stand out as continents with above-average total GDP per capita and life expectancy.

# view country based on population
SELECT country, population
FROM gapminder_data
ORDER BY population DESC
LIMIT 10;
-- China and India hold the top spots for the largest populations among all countries.
