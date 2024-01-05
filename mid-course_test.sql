--EX1 
SELECT DISTINCT REPLACEMENT_COST, 
MIN(REPLACEMENT_COST) AS MIN_RC
FROM FILM 
GROUP BY REPLACEMENT_COST

--EX2
SELECT
CASE
WHEN REPLACEMENT_COST BETWEEN 9.99 AND 19.99 THEN 'low'
WHEN REPLACEMENT_COST BETWEEN 20.00 AND 24.99 THEN 'medium'
WHEN REPLACEMENT_COST BETWEEN 25.00 AND 29.99 THEN 'high'
END category,
COUNT(*) AS so_luong
FROM FILM
GROUP BY category

--EX3 
SELECT A.TITLE, A.LENGTH, C.NAME 
FROM FILM AS A 
INNER JOIN FILM_CATEGORY AS B 
ON A.FILM_ID = B.FILM_ID 
INNER JOIN CATEGORY AS C
ON B.CATEGORY_ID = C.CATEGORY_ID
GROUP BY A.TITLE, A.LENGTH, C.NAME
ORDER BY A.LENGTH DESC

--EX4 
SELECT B.NAME,
COUNT(NAME) AS FILM_TITLE
FROM FILM_CATEGORY as A
INNER JOIN CATEGORY as B 
ON A.CATEGORY_ID = B.CATEGORY_ID
GROUP BY B.NAME
ORDER BY B.NAME DESC

--EX5  [KHÔNG RA KẾT QUẢ ĐÚNG]
SELECT B.FIRST_NAME, B.LAST_NAME, A.ACTOR_ID, 
COUNT(FILM_ID) AS SO_LUONG_PHIM 
FROM FILM_ACTOR AS A
INNER JOIN ACTOR AS B 
ON A.ACTOR_ID = B.ACTOR_ID 
GROUP BY B.FIRST_NAME, B.LAST_NAME, A.ACTOR_ID
ORDER BY COUNT(FILM_ID) DESC 

--EX6 
SELECT A.ADDRESS, B.FIRST_NAME,
FROM ADDRESS AS A
LEFT JOIN CUSTOMER AS B
ON A.ADDRESS_ID = B.ADDRESS_ID 
WHERE A.ADDRESS2 IS NULL
GROUP BY A.ADDRESS, B.FIRST_NAME
  
--EX7
SELECT A.CITY,
SUM (D.AMOUNT) AS TOTAL_AMOUNT 
FROM CITY AS A
JOIN ADDRESS AS B 
ON A.CITY_ID = B.CITY_ID 
JOIN CUSTOMER AS C
ON B.ADDRESS_ID = C.ADDRESS_ID
JOIN PAYMENT AS D 
ON C.CUSTOMER_ID = D.CUSTOMER_ID
GROUP BY A.CITY
ORDER BY SUM (D.AMOUNT) DESC  

--EX8
SELECT DISTINCT A.COUNTRY, B.CITY, 
SUM (E.AMOUNT) AS TOTAL_AMOUNT 
FROM COUNTRY AS A 
JOIN CITY AS B
ON A.COUNTRY_ID = B.COUNTRY_ID 
JOIN ADDRESS AS C
ON B.CITY_ID = C.CITY_ID 
JOIN CUSTOMER AS D
ON C.ADDRESS_ID = D.ADDRESS_ID 
JOIN PAYMENT AS E
ON D.CUSTOMER_ID = E.CUSTOMER_ID 
GROUP BY A.COUNTRY, B.CITY
ORDER BY SUM(E.AMOUNT) ASC  




