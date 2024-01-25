EX1
WITH job_count_cte AS (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
  )
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count_cte
WHERE job_count > 1;

EX2
SELECT 
  category, 
  product, 
  TOTAL_SPEND
FROM (SELECT 
  category, 
  product, 
  SUM(SPEND) AS total_spend,
  RANK() OVER (
    PARTITION BY category
    ORDER BY SUM(SPEND) DESC) AS ranking
FROM product_spend 
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product) AS RANKING_SPENDING
WHERE RANKING <= 2
ORDER BY CATEGORY, RANKING;

EX3
SELECT COUNT(policy_holder_id) AS member_count
FROM (
  SELECT
    policy_holder_id,
    COUNT(case_id) as call_count
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3
) AS call_records;

EX4
SELECT pg.page_id
FROM pages pg
LEFT OUTER JOIN page_likes pl 
ON pg.page_id = pl.page_id
WHERE pl.page_id IS NULL;
  
EX5 
SELECT 
  EXTRACT(MONTH FROM curr_month.event_date) AS month,
  COUNT(DISTINCT curr_month.USER_ID) AS MONTHLY_ACTIVE_USERS   
FROM user_actions AS curr_month
WHERE EXISTS (
  SELECT last_month.user_id
  FROM user_actions AS last_month
  WHERE last_month.user_id = curr_month.user_id
    AND EXTRACT(MONTH FROM last_month.event_date) 
    = EXTRACT(MONTH FROM curr_month.event_date - interval '1 month')
)
AND EXTRACT(MONTH FROM curr_month.event_date) = 7
AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr_month.event_date);

EX6 
select
format('%s-%s',EXTRACT(YEAR from trans_date),lpad(EXTRACT(MONTH from trans_date)::text,2,'0')) as month ,
country ,
count(*) as trans_count ,
sum (
case when state = 'approved' then 1
else 0
end
) as approved_count,
sum(amount) as trans_total_amount ,
sum (
case when state = 'approved' then amount
else 0
end
) as approved_total_amount
from transactions group by month , country
  
EX7 
SELECT product_id, year as first_year, quantity,price
FROM Sales
WHERE (product_id,year) in (
SELECT product_id,MIN(year)
FROM Sales
GROUP BY product_id
)

EX8 
select customer_id from customer 
group by 
customer_id
having count(distinct product_key ) = (select count(product_key ) from product)

EX9 
select employee_id 
from Employees 
where salary <30000 and manager_id not in (select employee_id from Employees)
order by employee_id

EX10 
WITH job_count_cte AS (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
  )
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count_cte
WHERE job_count > 1;

EX11 
with num_movies as (
select user_id ,
rank() over (order by count(distinct movie_id) desc) as ranking
from MovieRating
group by user_id
)
, users_r as (
select name ,
-- min(name) as min_name ,
rank() over (order by min(name) asc) as name_ranking
from num_movies n
inner join Users u
on n.user_id = u.user_id
where ranking = 1
group by name
)
, avg_ratings as (
select movie_id ,
rank() over (order by avg(rating) desc) as ranking
from MovieRating
where created_at > '2020-01-31' and created_at < '2020-03-01'
group by movie_id
)
, movies_r as (
select title ,
rank() over (order by min(title) asc) as title_ranking
from avg_ratings a
inner join Movies m
on a.movie_id = m.movie_id
where ranking = 1
group by title
)
select name as results
from users_r
where name_ranking = 1
union all
select title
from movies_r
where title_ranking = 1

EX12 
WITH CTE AS(
SELECT requester_id , accepter_id
FROM RequestAccepted
UNION ALL
SELECT accepter_id , requester_id
FROM RequestAccepted
)
SELECT requester_id id, count(accepter_id) num
FROM CTE
group by 1
ORDER BY 2 DESC
LIMIT 1


