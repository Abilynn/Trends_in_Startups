--viewing the startup_trends table
SELECT *
FROM startup_trends

--total number of companies in the table.
SELECT count(DISTINCT(name)) AS no_of_companies
FROM startup_trends

--total value of all companies in this table
SELECT CONCAT('$', SUM(valuation)) total_value_of_companies
FROM startup_trends

--highest amount raised by a startup?
SELECT CONCAT('$',MAX(raised)) highest_raised
FROM startup_trends

--maximum amount of money raised, during ‘Seed’ stage
SELECT CONCAT('$', MAX(raised)) max_amount_seed
FROM startup_trends
WHERE stage = 'Seed'

--In what year was the oldest company on the list founded?
SELECT MIN(founded) AS year
FROM startup_trends

--Return the average valuation
SELECT CONCAT('$',AVG(valuation)) avg_valuation
FROM startup_trends

--Return the average valuation, in each category
SELECT category, AVG(valuation) avg_val_cat
FROM startup_trends
GROUP BY category

--Return the name of each category with the total number of companies that belong to it
SELECT category, COUNT(DISTINCT(name))
FROM startup_trends
GROUP BY category

--Filter the result to only include categories that have more than three companies in them. What are the most competitive markets?
SELECT category, COUNT(DISTINCT(name)) no_of_comp
FROM startup_trends
GROUP BY category
HAVING COUNT(DISTINCT(name)) > 3

--average size of a startup in each location?
SELECT location, ROUND(AVG(employees), 2) avg_startup_size
FROM startup_trends
GROUP BY location

--average size of a startup in each location, with average sizes above 500?*/
SELECT location, ROUND(AVG(employees), 2) avg_startup_size
FROM startup_trends
GROUP BY location
HAVING ROUND(AVG(employees), 2) > 500
