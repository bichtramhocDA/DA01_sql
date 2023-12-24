--EX1 
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;

--EX2
select x, y, z,
case 
  when x + y > z and x + z > y and y + z > x then 'Yes'
  else 'No'
  end as Triangle
from Triangle;

--EX3
select 
(sum(case 
  when call_category is null or call_category = 'n/a' then 1 end)/count(call_category)*100.0) as percentage_value
from callers;

--EX4
select name 
from customer 
where referee_id !=2 or referee_id is null;

--EX5
select survived, 
sum(case 
  when pclass = 1 then 1 else 0 
end) as first_class
sum(case 
  when pclass = 1 then 1 else 0 
end) as second_class
sum(case 
  when pclass = 1 then 1 else 0 
end) as third_class
from titanic
group by survived
