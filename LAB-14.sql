--Part – A:

--1. Combine information from Person and Department table using cross join or Cartesian product.
select *
from PERSON P,DEPARTMENT D

--2. Find all persons with their department name
select PERSONNAME,DEPARTMENTNAME
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID

--3. Find all persons with their department name & code.
select PERSONNAME,DEPARTMENTNAME,DEPARTMENTCODE
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID

--4. Find all persons with their department code and location.
select PERSONNAME,DEPARTMENTCODE,LOCATION
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID

--5. Find the detail of the person who belongs to Mechanical department.
select PERSONID,PERSONNAME,P.DEPARTMENTID,SALARY,JOININGDATE,CITY
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE DEPARTMENTNAME='MECHANICAL'

--6. Final person’s name, department code and salary who lives in Ahmedabad city.
select PERSONNAME,DEPARTMENTCODE,SALARY
from PERSON P LEFT JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE CITY = 'Ahmedabad'

--7. Find the person's name whose department is in C-Block.
select PERSONNAME,DEPARTMENTNAME
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE LOCATION = 'C-Block'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
select PERSONNAME,DEPARTMENTNAME,SALARY
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE CITY = 'Jamnagar'

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
select PERSONID,PERSONNAME,P.DEPARTMENTID,SALARY,JOININGDATE,CITY
from PERSON P LEFT JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE DEPARTMENTNAME='Civil' OR JOININGDATE>'1-Aug-2001'

--10. Display all the person's name with the department whose joining date difference with the current date is more than 25 years.
select PERSONNAME
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE DATEDIFF(YEAR,JOININGDATE,GETDATE())>25


--11. Find department wise person counts.
select DEPARTMENTNAME,COUNT(PERSONID)
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY DEPARTMENTNAME

--12. Give department wise maximum & minimum salary with department name.
select DEPARTMENTNAME,MAX(SALARY),MIN(SALARY)
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY DEPARTMENTNAME

--13. Find city wise total, average, maximum and minimum salary.
select CITY,MAX(SALARY),MIN(SALARY),SUM(SALARY),AVG(SALARY)
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY CITY

--14. Find the average salary of a person who belongs to Ahmedabad city.
select AVG(SALARY)
from PERSON P LEFT JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE CITY = 'Ahmedabad'

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In
--single column)
select P.PERSONNAME+' lives in '+P.CITY+' and works in '+D.DEPARTMENTNAME
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID



--Part – B:

--16. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In
--single column)
select P.PERSONNAME+' earns '+CAST(SALARY AS VARCHAR(20))+' and works in '+D.DEPARTMENTNAME+'department monthly'
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID

--17. Find city & department wise total, average & maximum salaries.
select CITY,DEPARTMENTNAME,MAX(SALARY),SUM(SALARY),AVG(SALARY)
from PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY DEPARTMENTNAME,CITY

--18. Find all persons who do not belong to any department.
select PERSONNAME,DEPARTMENTNAME
from PERSON P LEFT JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE DEPARTMENTNAME IS NULL

--19. Find all departments whose total salary is exceeding 100000.
select DEPARTMENTNAME,SUM(SALARY)
from PERSON P LEFT JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY DEPARTMENTNAME 
HAVING SUM(SALARY)>100000

--Part – C:

--20. List all departments who have no person.
select DEPARTMENTNAME,SUM(SALARY)
from PERSON P RIGHT JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE PERSONNAME IS NULL
GROUP BY DEPARTMENTNAME


--21. List out department names in which more than two persons are working.
select DEPARTMENTNAME,COUNT(PERSONID)
from PERSON P RIGHT JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY DEPARTMENTNAME
HAVING COUNT(PERSONID)>2

--22. Give a 10% increment in the computer department employee’s salary. (Use Update)
UPDATE PERSON
SET SALARY=SALARY*1.1
WHERE DEPARTMENTID = (
SELECT DEPARTMENTID
FROM DEPARTMENT
WHERE DEPARTMENTNAME = 'computer'
)
