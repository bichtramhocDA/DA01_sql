--ex1: hackerank-revising-the-select-query. 
SELECT NAME FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION >120000;
--ex2: hackerank-japanese-cities-attributes.
SELECT * FROM CITY 
WHERE COUNTRYCODE = 'JPN';
--ex3: hackerank-weather-observation-station-1.
SELECT CITY, STATE FROM STATION;
--ex4: hackerank-weather-observation-station-6.
SELECT DISTINCT CITY FROM STATION 
WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%';
--ex5: hackerank-weather-observation-station-7.
SELECT distinct CITY FROM STATION 
WHERE CITY LIKE '%a' or CITY LIKE '%e' or CITY LIKE '%o' or CITY LIKE '%i' or CITY LIKE '%u'
--ex6: hackerank-weather-observation-station-9.
select distinct city from station 
where city Not like 'A%' and city Not like 'E%' and city Not like 'I%' and city Not like 'o%' and city Not like 'U%';
--ex7: hackerank-name-of-employees.
SELECT NAME FROM EMPLOYEE
ORDER BY NAME ASC;
--ex8: hackerank-salary-of-employees.
SELECT NAME FROM  EMPLOYEE
WHERE MONTHS < 10 AND SALARY > 2000
ORDER BY EMPLOYEE_ID ASC;
--ex9: leetcode-recyclable-and-low-fat-products.
SELECT PRODUCT_ID FROM PRODUCTS
WHERE LOW_FATS ='Y' AND RECYCLABLE ='Y'
--ex10: leetcode-find-customer-referee.
SELECT NAME FROM CUSTOMER
WHERE REFEREE_ID <>2 OR referee_id IS NULL;
--ex11: leetcode-big-countries.
SELECT NAME, POPULATION, AREA FROM WORLD 
WHERE AREA >=3000000 OR POPULATION >25000000
--ex12: leetcode-article-views.
SELECT DISTINCT author_id AS id FROM Views 
where author_id = viewer_id 
ORDER BY id;
--ex13: datalemur-tesla-unfinished-part.
SELECT PART, ASSEMBLY_STEP FROM parts_assembly
WHERE FINISH_DATE IS NULL
--ex14: datalemur-lyft-driver-wages.
select * from lyft_drivers
where yearly_salary <= 30000 OR yearly_salary >=70000;
--ex15: datalemur-find-the-advertising-channel.
select advertising_channel from uber_advertising
where money_spent >100000 AND year ='2019';
