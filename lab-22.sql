CREATE TABLE CUSTOMER_ALL
(
    ORDERID INT PRIMARY KEY,
    CNAME VARCHAR(50),
    PRODUCT VARCHAR(50),
    CATEGORY VARCHAR(50),
    AMOUNT INT,
    ORDERYEAR INT,
    CITY VARCHAR(50)
);

INSERT INTO CUSTOMER_ALL VALUES
(101, 'RAHUL', 'LAPTOP', 'ELECTRONICS', 65000, 2024, 'RAJKOT'),
(102, 'RIYA', 'MOBILE', 'ELECTRONICS', 25000, 2023, 'SURAT'),
(103, 'AMIT', 'TABLE', 'FURNITURE', 12000, 2022, 'AHMEDABAD'),
(104, 'NEHA', 'CHAIR', 'FURNITURE', 8000, 2024, 'BARODA'),
(105, 'VISHAL', 'TV', 'ELECTRONICS', 45000, 2025, 'MORBI'),
(106, 'RIYA', 'SOFA', 'FURNITURE', 30000, 2023, 'SURAT'),
(107, 'RAHUL', 'AC', 'ELECTRONICS', 40000, 2022, 'RAJKOT'),
(108, 'KRUNAL', 'BED', 'FURNITURE', 40000, 2025, 'JAMNAGAR')
--Part – A:
SELECT * FROM CUSTOMER_ALL;


--1. Display top 3 highest amount orders.
WITH TOP_3 AS
(
    SELECT TOP 3 *
    FROM CUSTOMER_ALL
    ORDER BY AMOUNT DESC
)
SELECT * FROM TOP_3;
--2. Display second highest order amount.

WITH SECOND_HIGHEST AS
(
    SELECT AMOUNT,
           DENSE_RANK() OVER (ORDER BY AMOUNT DESC) AS RNK
    FROM CUSTOMER_ALL
)
SELECT AMOUNT
FROM SECOND_HIGHEST
WHERE RNK = 2;

--3. Display customers whose order amount is greater than category average amount.
WITH CATEGORY_AVG AS
(
    SELECT CATEGORY, AVG(AMOUNT) AS AVG_AMOUNT
    FROM CUSTOMER_ALL
    GROUP BY CATEGORY
)
SELECT *
FROM CUSTOMER_ALL C
JOIN CATEGORY_AVG CA
ON C.CATEGORY = CA.CATEGORY
WHERE AMOUNT > AVG_AMOUNT

--4. Display categories having average amount greater than 30000.

WITH CATEGORY_AVG AS
(
    SELECT CATEGORY, AVG(AMOUNT) AS AVG_AMOUNT
    FROM CUSTOMER_ALL
    GROUP BY CATEGORY
)
SELECT *
FROM CATEGORY_AVG
WHERE AVG_AMOUNT > 30000;
--5. Display highest amount order from each category.
WITH CATEGORY_RANK AS
(
    SELECT *,
           RANK() OVER(PARTITION BY CATEGORY ORDER BY AMOUNT DESC) AS RNK
    FROM CUSTOMER_ALL
)
SELECT *
FROM CATEGORY_RANK
WHERE RNK = 1;

--6. Display lowest amount order from each category.
WITH CATEGORY_RANK AS
(
    SELECT *,
    RANK() OVER(PARTITION BY CATEGORY ORDER BY AMOUNT ASC) AS RNK
    FROM CUSTOMER_ALL
)
SELECT *
FROM CATEGORY_RANK
WHERE RNK = 1;

--7. Display categories having more than 3 orders.
WITH CATEGORY_COUNT AS
(
    SELECT CATEGORY,
           COUNT(*) AS TOTAL_ORDERS
    FROM CUSTOMER_ALL
    GROUP BY CATEGORY
)
SELECT *
FROM CATEGORY_COUNT
WHERE TOTAL_ORDERS > 3;

--8. Display city-wise total order amount.
WITH CITY_TOTAL AS
(
    SELECT CITY,
           COUNT(ORDERID) AS TOTAL_AMOUNT
    FROM CUSTOMER_ALL
    GROUP BY CITY
)
SELECT *
FROM CITY_TOTAL;

--9. Display category having highest average order amount.
WITH CATEGORY_AVG AS
(
    SELECT CATEGORY,
           AVG(AMOUNT) AS AVG_AMOUNT
    FROM CUSTOMER_ALL
    GROUP BY CATEGORY
),
CATEGORY_RANK AS
(
    SELECT *,
           RANK() OVER
           (ORDER BY AVG_AMOUNT DESC ) AS RNK
    FROM CATEGORY_AVG
)
SELECT *
FROM CATEGORY_RANK
WHERE RNK = 1;
--10. Display cumulative order amount in ascending order of amount.
WITH CUMULATIVE_AMOUNT AS
(
    SELECT *,
           SUM(AMOUNT) OVER
           (
               ORDER BY AMOUNT ASC
           ) AS CUMULATIVE_TOTAL
    FROM CUSTOMER_ALL
)
SELECT *
FROM CUMULATIVE_AMOUNT;

--Part – B:
--11. Display category-wise top 2 highest amount orders.

WITH CATEGORY_TOP_2 AS
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY CATEGORY
               ORDER BY AMOUNT DESC
           ) AS RN
    FROM CUSTOMER_ALL
)
SELECT *
FROM CATEGORY_TOP_2
WHERE RN <= 2;
--12. Display customers whose amount is closest to category average amount.

WITH CATEGORY_AVG AS
(
    SELECT CATEGORY,
           AVG(AMOUNT) AS AVG_AMOUNT
    FROM CUSTOMER_ALL
    GROUP BY CATEGORY
),
DIFFERENCE_DATA AS
(
    SELECT C.*,
           CA.AVG_AMOUNT,
           ABS(C.AMOUNT - CA.AVG_AMOUNT) AS DIFFERENCE
    FROM CUSTOMER_ALL C
    JOIN CATEGORY_AVG CA
    ON C.CATEGORY = CA.CATEGORY
),
RANK_DATA AS
(
    SELECT *,
           RANK() OVER
           (
               PARTITION BY CATEGORY
               ORDER BY DIFFERENCE ASC
           ) AS RNK
    FROM DIFFERENCE_DATA
)
SELECT *
FROM RANK_DATA
WHERE RNK = 1;
--13. Display previous, current and next order amount together.
WITH ORDER_DATA AS
(
    SELECT ORDERID,
           CNAME,
           AMOUNT AS CURRENT_AMOUNT,

           LAG(AMOUNT) OVER
           (
               ORDER BY ORDERID
           ) AS PREVIOUS_AMOUNT,

           LEAD(AMOUNT) OVER
           (
               ORDER BY ORDERID
           ) AS NEXT_AMOUNT

    FROM CUSTOMER_ALL
)
SELECT *
FROM ORDER_DATA;
--14. Display customers whose amount is greater than previous customer's amount.
WITH PREVIOUS_AMOUNT AS
(
    SELECT *,
           LAG(AMOUNT) OVER
           (
               ORDER BY ORDERID
           ) AS PREV_AMOUNT
    FROM CUSTOMER_ALL
)
SELECT *
FROM PREVIOUS_AMOUNT
WHERE AMOUNT > PREV_AMOUNT;
--15. Display customers whose rank and dense rank are different.
WITH RANK_DATA AS
(
    SELECT *,
           RANK() OVER
           (
               ORDER BY AMOUNT DESC
           ) AS RNK,

           DENSE_RANK() OVER
           (
               ORDER BY AMOUNT DESC
           ) AS DENSE_RNK
    FROM CUSTOMER_ALL
)
SELECT *
FROM RANK_DATA
WHERE RNK <> DENSE_RNK;

--Part – C:
--16. Display orders whose amount is neither highest nor lowest in their category.

WITH CATEGORY_RANK AS
(
    SELECT *,
           RANK() OVER
           (
               PARTITION BY CATEGORY
               ORDER BY AMOUNT DESC
           ) AS HIGH_RANK,

           RANK() OVER
           (
               PARTITION BY CATEGORY
               ORDER BY AMOUNT ASC
           ) AS LOW_RANK

    FROM CUSTOMER_ALL
)
SELECT *
FROM CATEGORY_RANK
WHERE HIGH_RANK <> 1
AND LOW_RANK <> 1;

--17. Display category-wise difference between highest and lowest amount.
WITH CATEGORY_AMOUNT AS
(
    SELECT CATEGORY,
           MAX(AMOUNT) AS HIGHEST_AMOUNT,
           MIN(AMOUNT) AS LOWEST_AMOUNT
    FROM CUSTOMER_ALL
    GROUP BY CATEGORY
)
SELECT CATEGORY,
       HIGHEST_AMOUNT,
       LOWEST_AMOUNT,
       HIGHEST_AMOUNT - LOWEST_AMOUNT AS DIFFERENCE
FROM CATEGORY_AMOUNT;

--18. Display customers whose amount is greater than all FURNITURE category orders.
WITH FURNITURE_MAX AS
(
    SELECT MAX(AMOUNT) AS MAX_AMOUNT
    FROM CUSTOMER_ALL
    WHERE CATEGORY = 'FURNITURE'
)
SELECT *
FROM CUSTOMER_ALL
WHERE AMOUNT > 
(
    SELECT MAX_AMOUNT
    FROM FURNITURE_MAX
);
--19. Display categories where all orders are above 10000.

WITH CATEGORY_MIN AS
(
    SELECT CATEGORY,
           MIN(AMOUNT) AS MIN_AMOUNT
    FROM CUSTOMER_ALL
    GROUP BY CATEGORY
)
SELECT *
FROM CATEGORY_MIN
WHERE MIN_AMOUNT > 10000;
--20. Display customers whose amount difference from category topper is minimum.
WITH CATEGORY_MAX AS
(
    SELECT CATEGORY,
           MAX(AMOUNT) AS TOP_AMOUNT
    FROM CUSTOMER_ALL
    GROUP BY CATEGORY
),
DIFFERENCE_DATA AS
(
    SELECT C.*,
           CM.TOP_AMOUNT,
           CM.TOP_AMOUNT - C.AMOUNT AS DIFFERENCE
    FROM CUSTOMER_ALL C
    JOIN CATEGORY_MAX CM
    ON C.CATEGORY = CM.CATEGORY
),
RANK_DATA AS
(
    SELECT *,
           RANK() OVER
           (
               PARTITION BY CATEGORY
               ORDER BY DIFFERENCE ASC
           ) AS RNK
    FROM DIFFERENCE_DATA
)
SELECT *
FROM RANK_DATA
WHERE RNK = 1;