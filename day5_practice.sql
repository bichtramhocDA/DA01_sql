--ex1: hackerrank-weather-observation-station-3. 
SELECT DISTINCT CITY FROM STATION
WHERE ID%2 = 0
--ex2: hackerrank-weather-observation-station-4.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)  (tìm số lượng thành phố không bị trùng lặp)
FROM STATION 
--ex3: hackerrank-the-blunder.
--ex4: datalemur-alibaba-compressed-mean.
SELECT ROUND(CAST(SUM(ORDER_OCCURRENCES*ITEM_COUNT)/SUM(ORDER_OCCURRENCES) AS DECIMAL),1) AS MEAN
FROM items_per_order 
(số nguyên mặc định đã được làm tròn nên chỉ có thể làm tròn số thập phân -- chuyển đổi thêm hàm CAST..AS DECIMAL để chạy lệnh) 
--ex5: datalemur-matching-skills.
SELECT DISTINCT candidate_id FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY CANDIDATE_ID
HAVING COUNT(SKILL) = 3   --bao gồm cả 3 skills
ORDER BY candidate_id ASC 
--ex6: datalemur-verage-post-hiatus-1.
SELECT USER_ID,
DATE(MAX(POST_DATE)) - DATE(MIN(POST_DATE)) AS DAYS_BETWEEN
FROM posts
WHERE post_date BETWEEN '01/01/2021' AND '01/01/2022'
GROUP BY USER_ID
HAVING COUNT(POST_ID) >=2;
--ex7: datalemur-cards-issued-difference.
SELECT card_name,
MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference ASC;
--ex8: datalemur-non-profitable-drugs.
SELECT MANUFACTURER,
COUNT(DRUG) AS DRUG_COUNT,
ABS(SUM(cogs-total_sales)) AS TOTAL_LOSS
FROM pharmacy_sales
WHERE TOTAL_SALES < COGS
GROUP BY MANUFACTURER
--ex9: leetcode-not-boring-movies.
SELECT * from Cinema
WHERE ID%2 = 1 AND description<>'boring' 
ORDER BY RATING DESC;
--ex10: leetcode-number-of-unique-subject.
select teacher_id,
COUNT(DISTINCT SUBJECT_ID) AS CNT
FROM teacher
GROUP BY teacher_id
--ex11: leetcode-find-followers-count.
SELECT user_id,
COUNT(follower_id) AS FOLLOWERS_COUNT
FROM FOLLOWERS
GROUP BY user_id 
ORDER BY user_id ASC
--ex12:leetcode-classes-more-than-5-students.
SELECT CLASS FROM COURSES
GROUP BY CLASS
HAVING COUNT(STUDENT) >=5






