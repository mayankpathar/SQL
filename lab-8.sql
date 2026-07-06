-- Part – A:

-- 1. Display the Highest, Lowest Salary and Label the columns Maximum, Minimum respectively.
SELECT MAX(Salary) AS Maximum, MIN(Salary) AS Minimum FROM EMPLOYEE


-- 2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
-- respectively.
SELECT SUM(Salary) AS Total_Sal, AVG(Salary) AS Average_Sal FROM EMPLOYEE


-- 3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(*) AS Total_Employees FROM EMPLOYEE

-- 4. Find highest salary from Rajkot city.
SELECT MAX(Salary) AS Highest_Salary FROM EMPLOYEE 
WHERE CITY = 'Rajkot'

-- 5. Give maximum salary from IT department.
SELECT MAX(Salary) AS Maximum_Salary FROM EMPLOYEE 
WHERE DEPARTMENT = 'IT'

-- 6. Count employee department is HR.
SELECT COUNT(*) AS HR_Employee_Count FROM EMPLOYEE 
WHERE DEPARTMENT = 'HR'

-- 7. Display average salary of Admin department.
SELECT AVG(Salary) AS Average_Salary FROM EMPLOYEE 
WHERE DEPARTMENT = 'Admin'

-- 8. Display total salary of HR department.
SELECT SUM(Salary) AS Total_Salary FROM EMPLOYEE 
WHERE DEPARTMENT = 'HR'

-- 9. Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT CITY) AS Unique_Cities FROM EMPLOYEE

-- 10. Count unique departments.
SELECT COUNT(DISTINCT DEPARTMENT) AS Unique_Departments FROM EMPLOYEE

-- 11. Display minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(Salary) AS Minimum_Salary FROM EMPLOYEE 
WHERE CITY = 'Ahmedabad'

-- 12. Find city wise highest salary.
SELECT CITY, MAX(Salary) AS Highest_Salary FROM EMPLOYEE

-- 13. Find department wise lowest salary.
SELECT DEPARTMENT, MIN(Salary) AS Lowest_Salary FROM EMPLOYEE

-- 14. Display minimum salary in each city.
SELECT CITY, MIN(Salary) AS Minimum_Salary FROM EMPLOYEE
GROUP BY CITY

-- 15. Display average salary of employees from Surat.
SELECT AVG(Salary) AS Average_Salary FROM EMPLOYEE 
WHERE CITY = 'Surat'

-- 16. Display total salary of female employees.
SELECT SUM(Salary) AS Total_Salary FROM EMPLOYEE 
WHERE GENDER ='FAMALE'

-- 17. Count number of male employees.	
SELECT COUNT(EID) AS Male_ FROM EMPLOYEE
WHERE GENDER='MALE'

-- 18. Display city with the total number of employees belonging to each city.
SELECT CITY, COUNT(EID) AS Total_Employees FROM EMPLOYEE
where CITY IS NOT NULL
GROUP BY CITY

-- 19. Count number of employees in each city where gender is MALE.
SELECT COUNT(EID) AS Male_ FROM EMPLOYEE
WHERE GENDER ='MALE'

-- 20. Display maximum salary in each department where city is not Ahmedabad.
SELECT DEPARTMENT, MAX(Salary) AS Maximum_Salary FROM EMPLOYEE
WHERE CITY != 'Ahmedabad'

-- Part – B:

-- 21. Display minimum salary in each city where gender is FEMALE.
SELECT CITY, MIN(Salary) AS Minimum_Salary FROM EMPLOYEE
WHERE GENDER ='FEMALE'
GROUP BY CITY

-- 22. Give total salary of each department of EMPLOYEE table.
SELECT DEPARTMENT, SUM(Salary) AS Total_Salary FROM EMPLOYEE
GROUP BY DEPARTMENT

-- 23. Give average salary of each department of EMPLOYEE table without displaying the respective
-- department name.
SELECT AVG(Salary) AS Average_Salary FROM EMPLOYEE
GROUP BY DEPARTMENT

-- 24. Count the number of employees for each department in every city.
SELECT DEPARTMENT,CITY, COUNT(EID) AS Total_Employees FROM EMPLOYEE
GROUP BY DEPARTMENT, CITY

-- 25. Calculate the total salary distributed to male and female employees.
SELECT COUNT(EID) FROM EMPLOYEE
GROUP BY GENDER

-- Part – C:

-- 26. Give city wise maximum and minimum salary of female employees.
SELECT CITY,GENDER, MAX(Salary) AS Maximum_Salary, MIN(Salary) AS Minimum_Salary FROM EMPLOYEE
GROUP BY CITY,GENDER

-- 27. Calculate department, city, and gender wise average salary.
SELECT DEPARTMENT , CITY, GENDER, AVG(Salary) AS Average_Salary FROM EMPLOYEE
GROUP BY DEPARTMENT, CITY , GENDER

-- 28. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT (MAX(Salary) - MIN(Salary)) AS DIFFERENCE FROM EMPLOYEE


-- 29. Display sum of salaries of department wise where department name consist 5 letter.
SELECT DEPARTMENT, SUM(Salary) AS Total_Salary FROM EMPLOYEE
WHERE DEPARTMENT LIKE '_____'

-- 30. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT DEPARTMENT, CITY, MAX(Salary) AS Maximum_Salary FROM EMPLOYEE
WHERE CITY LIKE 'R%'

-- Part – D:

--I.Display the total fine amount collected for each book genre.
SELECT BookGenre, SUM(FineAmount) AS Total_Fine_Amount FROM LIBRARYBORROWING
GROUP BY BookGenre

--II.Find the average number of days borrowed for each book genre.
SELECT BookGenre, AVG(DaysBorrowed) AS Average_Days_Borrowed FROM LIBRARYBORROWING
GROUP BY BookGenre

--III.Display the number of borrowing records for each member.
SELECT MemberName, COUNT(BorrowID) AS Borrowing_Records FROM LIBRARYBORROWING
GROUP BY MemberName

--IV.Find the maximum fine amount paid in each book genre.
SELECT BookGenre, MAX(FineAmount) AS Maximum_Fine_Amount FROM LIBRARYBORROWING
GROUP BY BookGenre

--V.Display the minimum days borrowed for each book genre.
SELECT BookGenre, MIN(DaysBorrowed) AS Minimum_Days_Borrowed FROM LIBRARYBORROWING
GROUP BY BookGenre

--VI.Find the total number of days books were borrowed by each member.
SELECT MemberName, SUM(DaysBorrowed) AS Total_Days_Borrowed FROM LIBRARYBORROWING
GROUP BY MemberName

--VII.Display the average fine amount paid by each member.
SELECT MemberName, AVG(FineAmount) AS Average_Fine_Amount FROM LIBRARYBORROWING
GROUP BY MemberName

--VIII.Find the highest number of days borrowed by each member.
SELECT MemberName, MAX(DaysBorrowed) AS Highest_Days_Borrowed FROM LIBRARYBORROWING
GROUP BY MemberName

--IX.Find the difference between the highest and lowest fine for each genre.
SELECT BookGenre, (MAX(FineAmount) - MIN(FineAmount)) AS Fine_Difference FROM LIBRARYBORROWING
GROUP BY BookGenre

--X.Find how many times has each member borrowed a book.
SELECT MemberName, COUNT(BorrowID) AS Times_Borrowed FROM LIBRARYBORROWING
GROUP BY MemberName