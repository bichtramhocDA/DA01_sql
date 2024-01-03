EX1 
SELECT Country.Continent, FLOOR(AVG(City.Population))
FROM Country, City 
WHERE Country.Code = City.CountryCode 
GROUP BY Country.Continent ;

EX2 
SELECT 
  ROUND(COUNT(texts.email_id)::DECIMAL
    /COUNT(DISTINCT emails.email_id),2) AS activation_rate
FROM emails
LEFT JOIN texts
ON emails.email_id = texts.email_id
AND texts.signup_action = 'Confirmed';

EX3 
with snap as 
(SELECT ab.age_bucket,
        sum(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS t_open,
        sum(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS t_send
FROM activities act
LEFT JOIN age_breakdown ab 
ON act.user_id = ab.user_id
GROUP BY ab.age_bucket)

SELECT age_bucket, 
       round(t_send/(t_send + t_open)*100.0,2) AS send_perc,
       round(t_open/(t_open + t_send)*100.0,2) AS open_perc
FROM snap;    

EX4 
SELECT cc.customer_id FROM customer_contracts AS cc 
LEFT JOIN products AS p  
ON cc.product_id = p.product_id
GROUP BY cc.customer_id
HAVING COUNT(DISTINCT(p.product_category)) = (SELECT COUNT(DISTINCT(product_category)) FROM products)
  
EX5 
SELECT
e.employee_id, e.name,
COUNT(e2.reports_to) AS reports_count, 
ROUND(AVG(e2.age*1.0),0) AS average_age
FROM employees e INNER JOIN
employees e2 ON e.employee_id=e2.reports_to
WHERE e2.reports_to IS NOT NULL
GROUP BY
e.employee_id, e.name
ORDER BY e.employee_id

EX6
SELECT product_name,sum (unit) AS unit
FROM Products p
INNER JOIN Orders o
ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY product_name
HAVING sum (unit)>= 100

EX7 
SELECT pg.page_id
FROM pages pg
LEFT OUTER JOIN page_likes pl 
ON pg.page_id = pl.page_id
WHERE pl.page_id IS NULL;
