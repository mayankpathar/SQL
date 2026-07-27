
--Part – A:

--1. List all books with their authors.
SELECT *
FROM AUTHOR A JOIN BOOK B
ON A.AUTHORID=B.AUTHORID

--2. List all books with their publishers.
SELECT *
FROM publisher P JOIN BOOK B
ON P.publisherID=B.publisherID

--3. List all books with their authors and publishers.
SELECT *
FROM AUTHOR A JOIN BOOK B
ON A.AUTHORID=B.AUTHORID
JOIN publisher P
ON P.publisherID=B.publisherID

--4. List all books published after 2010 with their authors and publisher and price.
SELECT AUTHORNAME,PUBLISHERNAME,PRICE
FROM AUTHOR A JOIN BOOK B
ON A.AUTHORID=B.AUTHORID
JOIN publisher P
ON P.publisherID=B.publisherID
WHERE PUBLICATIONYEAR >2010

--5. List all authors and the number of books they have written.
SELECT AUTHORNAME,COUNT(A.AUTHORID)
FROM AUTHOR A JOIN BOOK B
ON A.AUTHORID=B.AUTHORID
GROUP BY AUTHORNAME

--6. List all publishers and the total price of books they have published.
SELECT PUBLISHERNAME,SUM(PRICE)
FROM publisher P JOIN BOOK B
ON P.publisherID=B.publisherID
GROUP BY PUBLISHERNAME

--7. List authors who have not written any books.
SELECT AUTHORNAME
FROM AUTHOR A LEFT JOIN BOOK B
ON A.AUTHORID=B.AUTHORID
WHERE B.AUTHORID IS NULL

--8. Display the total number of books written by each author along with the average price of their books.
SELECT AUTHORNAME,AVG(PRICE),COUNT(BOOKID)
FROM AUTHOR A LEFT JOIN BOOK B
ON A.AUTHORID=B.AUTHORID
GROUP BY AUTHORNAME


--9. lists each publisher along with the total number of books they have published, sorted from highest to
--lowest.
SELECT PUBLISHERNAME,COUNT(BOOKID)
FROM publisher P JOIN BOOK B
ON P.publisherID=B.publisherID
GROUP BY PUBLISHERNAME
ORDER BY COUNT(BOOKID) DESC

--10. Display number of books published each year.
SELECT PUBLICATIONYEAR,COUNT(BOOKID)
FROM publisher P JOIN BOOK B
ON P.publisherID=B.publisherID
GROUP BY PUBLICATIONYEAR

--Part – B:
CREATE TABLE EMPLOYEE_MASTER
(
EmployeeNo VARCHAR(10),
NAME VARCHAR(10),
ManagerNo VARCHAR(10)
)
INSERT INTO EMPLOYEE_MASTER
VALUES ('E01','Tarun' ,'NULL'),
('E02', 'Rohan','E02'),
('E03','Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04')

--11. List the publishers whose total book prices exceed 500, ordered by the total price.
SELECT PUBLISHERNAME,SUM(PRICE)
FROM publisher P JOIN BOOK B
ON P.publisherID=B.publisherID
GROUP BY PUBLISHERNAME
HAVING SUM(PRICE)>500
ORDER BY SUM(PRICE)

--12. List most expensive book for each author, sort it with the highest price.
SELECT AUTHORNAME,MAX(PRICE)
FROM AUTHOR A JOIN BOOK B
ON A.AUTHORID=B.AUTHORID
GROUP BY AUTHORNAME
ORDER BY MAX(PRICE) DESC

--13. Display publisher name and difference between maximum and minimum book price.
SELECT PUBLISHERNAME,MAX(PRICE)-MIN(PRICE)
FROM publisher P JOIN BOOK B
ON P.publisherID=B.publisherID
GROUP BY PUBLISHERNAME


--14. List publisher name and total price of books published each year.
SELECT PUBLISHERNAME,SUM(PRICE),PUBLICATIONYEAR
FROM publisher P JOIN BOOK B
ON P.publisherID=B.publisherID
GROUP BY PUBLICATIONYEAR,PUBLISHERNAME


--15. Display author name and total price of books sorted by highest total price.
SELECT AUTHORNAME,SUM(PRICE)
FROM AUTHOR A JOIN BOOK B
ON A.AUTHORID=B.AUTHORID
GROUP BY AUTHORNAME
ORDER BY SUM(PRICE) DESC

--Part – C:

--16. Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT E.NAME AS EMPLOYEENO,M.NAME AS MANAGERNO
FROM EMPLOYEE_MASTER E INNER JOIN EMPLOYEE_MASTER M
ON E.MANAGERNO =M.EMPLOYEENO

--17. Display employees who are managers.
SELECT E.NAME AS EMPLOYEENOANDMANAGER
FROM EMPLOYEE_MASTER E INNER JOIN EMPLOYEE_MASTER M
ON E.MANAGERNO =M.EMPLOYEENO
WHERE E.MANAGERNO =E.EMPLOYEENO

--18. Display number of employees working under each manager.
SELECT M.NAME AS MANAGERNO,COUNT(E.EmployeeNo)
FROM EMPLOYEE_MASTER E INNER JOIN EMPLOYEE_MASTER M
ON E.MANAGERNO =M.EMPLOYEENO
GROUP BY M.NAME


--19. Display the employee’s name along with their manager’s name and senior manager name.
SELECT E.NAME AS EMPLOYEENO,M.NAME AS MANAGERNO,SM.NAME AS SMANAGER
FROM EMPLOYEE_MASTER E LEFT JOIN EMPLOYEE_MASTER M
ON E.MANAGERNO =M.EMPLOYEENO
LEFT JOIN EMPLOYEE_MASTER SM
ON M.ManagerNo =SM.EmployeeNo


--20. Display managers and count of employees under them in descending order.
SELECT M.NAME AS MANAGERNO,COUNT(E.EmployeeNo)
FROM EMPLOYEE_MASTER E INNER JOIN EMPLOYEE_MASTER M
ON E.MANAGERNO =M.EMPLOYEENO
GROUP BY M.NAME
ORDER BY COUNT(E.EmployeeNo) DESC