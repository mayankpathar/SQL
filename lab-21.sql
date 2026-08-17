--Part – A:

--1. Display all students whose SPI is greater than 8.
 WITH SPI_GREATER_THAN AS(
 SELECT * FROM student 
 WHERE SPI > 8
 )
 SELECT * FROM SPI_GREATER_THAN
 
 
--2. Display average SPI of all students.
 WITH SPI_AVERAGE AS(
 SELECT STDID,SNAME,AVG(SPI) AS AVGSPI FROM student
 GROUP BY STDID,SNAME
 )
 SELECT * FROM SPI_AVERAGE


--3. Display total number of students in each branch.
 WITH EACH_BRANCH AS(
 SELECT BRANCH,COUNT(BRANCH) AS AVGSPI FROM student
 GROUP BY BRANCH
 )
 SELECT * FROM EACH_BRANCH

--4. Display students who belong to RAJKOT city.
 WITH Display_RAJKOT AS(
 SELECT * FROM student
 WHERE CITY='RAJKOT'
 )
 SELECT * FROM Display_RAJKOT

--5. Find branch names that appear more than once.
 WITH APPER_MORE_THAN_ONE AS(
 SELECT BRANCH,COUNT(STDID) AS COUNT_BRANCH FROM student
 GROUP BY BRANCH
 )
 SELECT * FROM APPER_MORE_THAN_ONE
 WHERE COUNT_BRANCH>1

--6. Display row number for each student.
WITH Display_row_number AS(
 SELECT SNAME,
 ROW_NUMBER() OVER(ORDER BY STDID DESC) AS ROWNUMBER
 FROM student
 
 )
 SELECT * FROM Display_row_number

--7. Display top 3 students based on SPI.
WITH SPI_TOP_3 AS(
 SELECT STDID,SNAME,CITY,SPI,BRANCH,
 DENSE_RANK() OVER(ORDER BY STDID DESC) AS ROWNUMBER
 FROM student
 )
 SELECT TOP 3 * FROM SPI_TOP_3

--8. Display students having maximum SPI.


--9. Display students having minimum SPI.


--10. Display branch -wise rank of students.

--Part – B:

-- 11. Display students SPI average belonging to Computer branch.
WITH COMPUTER_AVERAGE AS
(
    SELECT AVG(SPI) AS AVG_SPI
    FROM student
    WHERE BRANCH = 'COMPUTER'
)
SELECT * FROM COMPUTER_AVERAGE;


-- 12. Display students whose SPI is greater than average SPI of his/her branch.
WITH BRANCH_AVERAGE AS
(
    SELECT STDID, SNAME, BRANCH, SPI,
           AVG(SPI) OVER
           (
               PARTITION BY BRANCH
           ) AS AVG_BRANCH_SPI
    FROM student
)
SELECT *
FROM BRANCH_AVERAGE
WHERE SPI > AVG_BRANCH_SPI;


-- 13. Display branch having more than 2 students.
WITH BRANCH_COUNT AS
(
    SELECT BRANCH, COUNT(*) AS TOTAL_STUDENTS
    FROM student
    GROUP BY BRANCH
)
SELECT *
FROM BRANCH_COUNT
WHERE TOTAL_STUDENTS > 2;


-- 14. Display branches having average SPI between 7 and 9.
WITH BRANCH_AVERAGE AS
(
    SELECT BRANCH, AVG(SPI) AS AVG_SPI
    FROM student
    GROUP BY BRANCH
)
SELECT *
FROM BRANCH_AVERAGE
WHERE AVG_SPI BETWEEN 7 AND 9;


-- 15. Display students whose SPI is lower than overall average SPI.
WITH OVERALL_AVERAGE AS
(
    SELECT AVG(SPI) AS AVG_SPI
    FROM student
)
SELECT s.*
FROM student s
, OVERALL_AVERAGE a
WHERE s.SPI < a.AVG_SPI;

--Part – C:

--16. Display branches having exactly one student.


--17. Display branch having highest average SPI.

--18. Display branch having lowest average SPI.

--19. Display students whose SPI is lower than branch average SPI.

--20. Display branches having maximum number of students.
